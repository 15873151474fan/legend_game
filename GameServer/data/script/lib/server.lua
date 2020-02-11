--//////////////////////////////////////////////////////
--/////服务器端杂项功能函数的封装
--///////////////////////////////////////////////////////

--提供一个回调类
Call = { param = nil, param_ext = nil, call = nil, uid = 0, space = nil}
function Call:New(uid,space,call,paramlist)
	if call == nil or type(call) ~= "function" then
		s_debug("Call:New 创建新对象，函数不能为空，或者非function对象")
		return nil
	end
	if paramlist ~= nil and type(paramlist) ~= "table" then
		s_debug("Call:New 创建新对象，参数列表必须是table")
		return nil
	end
	ob = {}
	setmetatable(ob,self)
	self.__index = self
	ob.param = paramlist
	ob.call = call
	ob.uid = uid
	ob.space = space
	ob.param_ext = {}
	return ob
end
function Call:Exec()
	if self.call == nil then
		return VALUE_FAIL
	end
	if self.space ~= nil then
		self.call(self.space,self.uid,self.param,self.param_ext)
	else
		self.call(self.uid,self.param,self.param_ext)
	end
	return VALUE_OK
end

-----------------------------------------------------------------------
USER_EVENT_FRESH_COLOR = 1	--摇颜色
-- 注册玩家回调,对于互斥事件尽量共用--------------------------------
function RegisterUserCall(eventid,call)
	if UserCalls == nil then
		UserCalls = {}
	end
	if call.uid == nil then
		s_debug("RegisterUserCall,回调中玩家ID无效")
		return VALUE_FAIL
	end
	if UserCalls[call.uid] == nil then
		UserCalls[call.uid] = {}
	end
	UserCalls[call.uid].eventid = eventid
	UserCalls[call.uid].call = call
	return VALUE_OK
end

--打印当前堆栈------------------------------------------------------
function Trace()
	s_debug(debug.traceback())
end

--把所有参数打包返回------------------------------------------------------
function pack(...)
	return {...}
end

--去掉字符串头尾的指定字符--------------------------------------------
function trim(str,char)
	if char == nil then char = '"' end
	local s = string.gsub(str,"^%s*"..char.."*","")
	s = string.gsub(s,char.."*%s*$","")
	return s
end

--读取文件------------------------------------------------------------
function readFileToParam( filename )
	local ret = nil
	local handle = io.open( ROOT_DIR .. filename, "r")
	if handle ~= nil then
		handle:seek("set")
		ret = handle:read("*a")
		handle:close()
	end
	if ret ~= nil then
		ret = string.gsub(ret,"\n","")
	end
	return ret
end

--格式化字符串------------------------------------------------------------
function FormatString(str,...)
	if str == nil then
		return ""
	end
	local arg = {...}
	for i = 1, #arg do
		str = string.gsub(str,"$"..i,arg[i])
	end
	return str
end

--动态注册函数----------------------------------------------------
function RegistetFunction(str)
	chunk = loadstring(str)
	if chunk ~= nil then
		chunk()
	end
end

--格式化文本颜色----------------------------------------------------
function TEXT(text)
	return '<p><n>' .. text .. '</n></p>'
end

--检查某个对象是否在表中存在----------------------------------------------------
function FindInTable(checkTable,value)
	for i,v in ipairs(checkTable) do
		if v == value then
			return VALUE_OK
		end
	end
	return VALUE_FAIL
end

--格式化函数字符串------------------------------------------------------
function FormatFunctionString(space,fun,...)
	if space == nil then
		space = ""
	end
	if fun == nil then
		fun = ""
	end
	local str = space .. ":" .. fun .. "("
	
	local arg = {...}
	for i= 1, #arg do
		if i ~= #arg then
			str = str .. arg[i] .. ","
		else
			str = str .. arg[i]
		end
	end
	str = str .. ")"
	return str
end

--将字符串进行分割成数组---------------------------------------------------------
function SplitString(str,separator)
	if separator == nil then
		separator = ","
	end
	local ret = {}
	local i = 0
	local j = 1
	while true do
		i = string.find(str,separator,i+1)
		if i == nil then
			table.insert(ret,string.sub(str,j))
			break
		end
		table.insert(ret,string.sub(str,j,i-1))
		j = i+1
	end
	return ret
end

--字符串分割成数组
function splitstring(str,separator)
    if separator == nil then
        separator = ","
    end
    t={}
    for w in string.gmatch(str,"([^'"..separator.."']+)") do     --按照“,”分割字符串
        table.insert(t,w) 
    end
    return t;
end

--函数参数字串进行分割成数组---------------------------------------------------------
function SplitFunctionParam(str)
	local ret = {}
	local indexQuote = 0
	local indexComma = 0
	local indexLast = 1
	while true do
		indexQuote = string.find(str, "\"", indexLast)
		indexComma = string.find(str, ",", indexLast)

		if indexQuote ~= nil and (indexComma == nil or indexQuote < indexComma) then
			--先找到"\""
			local indexQuote2 = string.find(str, "\"", indexQuote+1)
			if indexQuote2 == nil then
				break
			end

			if indexQuote2 == indexQuote+1 then
				table.insert(ret, {true, ""})
			else
				table.insert(ret, {true, str.sub(str, indexQuote+1, indexQuote2-1)})
			end

			indexComma = string.find(str, ",", indexQuote2+1)
			if indexComma == nil then
				break
			end
			indexLast = indexComma + 1
		else
			--先找到","
			if indexComma == nil then
				table.insert(ret, {false, string.sub(str, indexLast)})
				break
			end

			table.insert(ret, {false, string.sub(str, indexLast, indexComma-1)})
			indexLast = indexComma + 1
		end
	end
	return ret
end


--判断一个字符串是否是数字--------------------------------------------------------
function IsNumber(str)
	for i = 1, string.len(str) do
		if string.byte(str,i) < 48 or string.byte(str,i) > 57 then
			return VALUE_FAIL
		end
	end
	return VALUE_OK
end


--将字符串转换为函数表, 参数为数字or字串,字符串格式:str = 'TestTable:test1(p1,"p2",p3....)'
function StringToFunction(str)
	local ori_str = str
	local space,fun
	if string.find(str,":") ~= nil then
		space = string.match(str,"^[^:]*")
	end
	str = string.gsub(str,"^.*:","")
	fun = string.match(str,"^[^(]*")
	local param = {}
	str = str.match(str,"%(.*%)")
	if str ~= nil and str ~= "" then
		str = string.sub(str,2)
		str = string.sub(str,1,-2)
		param = SplitFunctionParam(str)
	end
	if space ~= nil then
		space = rawget(_G,space)
		if space ~= nil then
			fun= rawget(space,fun)
		end
	else
		fun= rawget(_G,fun)
	end
	if fun == nil then
		s_debug("无法将字符串转换为函数:%s",ori_str)
		return
	end
	if type(fun) ~= "function" then
		return
	end
	return function(...)
		paramlist = {}
		local arg = {...}
		for i,v in ipairs(param) do
			if v[1] == true then
				table.insert(paramlist, v[2])
			else
				local p = string.gsub(v[2],"%$","")
				if p ~= nil and p ~= v[2] then
					local index = tonumber(p)
					v[2] = arg[index]
				end
				table.insert(paramlist, tonumber(v[2]))
			end
		end
		if space ~= nil then
			return fun(space,unpack(paramlist))
		else
			return fun(unpack(paramlist))
		end
	end
end


--检查是否在某个位置附近
function CheckNearPos(userid,mapid,posx,posy,range)
	local map = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_CURRENT_MAP)
	local x = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_POSX)
	local y = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_POSY)
	if map ~= mapid then
		s_sysInfo(userid,"距离目标点太远")
		return VALUE_FAIL
	end
	if math.abs(posx-x) > range or math.abs(posy-y) > range then
		s_sysInfo(userid,"距离目标点太远")
		return VALUE_FAIL
	end
	return VALUE_OK
end
--显示国家列表界面，屏蔽本国、盟国、以及中立区
function ShowCountryList(uid,msg,callback,filtlist)
	local countrylist = pack(s_getCountryList())
	if countrylist == nil then
		return
	end
	local info = {}
	info.talk = {msg}
	info.button = {}
	local num = 1
	for i=1, table.getn(countrylist) do
		if FindInTable(filtlist,countrylist[i]) == VALUE_FAIL then
			if filtlist[2] == nil or s_isFriendCountry(filtlist[2], countrylist[i]) == VALUE_FAIL then
				info.button[num] = {}
				info.button[num][1] = s_getCountryName(countrylist[i]).."(3)"
				info.button[num][2] = callback .."($1,"..countrylist[i]..")"
				num = num +1
			end
		end
	end
	ShowNpcMenuByTable(uid,info)
end
--检查一个道具是否是装备
function checkEquip(userid,itemid)
	local itemtype = s_getItemValue(userid,itemid,Item_Base_Type)
	--local itemtype = s_getItemBaseValue(itemid,1)
	if itemtype == nil then
		return VALUE_FAIL
	end
	if itemtype > 0 and itemtype <= 19 then
		return VALUE_OK
	end
	return VALUE_FAIL
end
function checkEquipByBaseID(itemid)
	local itemtype = s_getItemBaseValue(itemid,1)
	if itemtype == nil then
		return VALUE_FAIL
	end
	if itemtype > 0 and itemtype <= 19 then
		return VALUE_OK
	end
	return VALUE_FAIL
end
--扣除传送费用
function GetTrasportFee(uid,feerate)
	--ROUND(0.04*人物等级^1.8/5,0)*5
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local moneylist = {2,3,4,5,6,7,8,9,10,11,12,13,14,15,16}
	local money = moneylist[GetIntPart((level-1)/10)+1]
	if s_getbufflevel(SCENE_ENTRY_PLAYER,uid,53) ~= 0 then
		money = GetIntPart(money/2)
	end
	return math.floor(money * feerate)
end
--付费传送
function GoMapWithFee(uid,feerate,country,map,x,y,notip)
	if x == nil then x = 0 end
	if y == nil then y = 0 end
	if notip == nil then notip = 0 end
	if country == 0 then
		country = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_CURRENT_COUNTRY)
	end
	s_gomap(uid,country,map,x,y)
	return VALUE_OK
end
--货币字符串
function GetMoneyString(num)
	local str = ""
	if num == nil or num <= 0 then
		return "0"
	end
	local ding = 0
	local liang = 0
	local wen = 0
	ding = math.floor(num/1000000)
	num = num % 1000000
	liang = math.floor(num/1000)
	wen = num % 1000
	if ding > 0 then
		str = str .. ding .. "M"
	end
	if liang > 0 then
		str = str .. liang .. "K"
	end
	if wen > 0 then
		str = str .. wen
	end
	return str
end
--获得玩家的国家官职名字
function GetCountryOfficalName(uid)
	local fun = s_getFunction(uid,Relation_Country)
	if fun == FunctionType_Marshal then
		return "国王"
	elseif fun == FunctionType_ViceMarshal then
		return "元帅"
	elseif fun == FunctionType_Interior then
		return "内务卿"
	elseif fun == FunctionType_Treasury then
		return "财务卿"
	elseif fun == FunctionType_Defense then
		return "军务卿"
	elseif fun == FunctionType_Police then
		return "警务卿"
	elseif fun == FunctionType_VicePolice then
		return "警务卿"
	elseif fun == FunctionType_RoseKnight then
		return "花骑士"
	elseif fun == FunctionType_Commander then
		return "指挥官"
	end
	return ""
end
--复制一个table
function CopyTable(tt)
	if type(tt) ~= "table" then
		return
	end
	local t = {}
	for i = 1, table.getn(tt) do
		table.insert(t,tt[i])
	end
	return t
end

--返回地图名称
function GetMapName(mapid)
	--[[	local mapname =
	{[1]="星之城",[2]="迷雾废墟",[3]="光明城",[4]="燃烧平原",[5]="军乐城",[6]="隐匿者丛林",[7]="遗忘沙漠"}
	if mapname[mapid] == nil then
	return "未知场景"
	else
	return mapname[mapid]
	end
	]]
	return s_getMapName(mapid)
end

--获得一个坐标相对另一坐标的方向
function GetDirect(x1,y1,x2,y2)
	if x1 == x2 and y1 > y2 then
		return DIR_UP
	elseif x1 < x2 and y1 > y2 then
		return DIR_UPRIGHT
	elseif  x1 < x2 and y1 == y2 then
		return DIR_RIGHT
	elseif x1 < x2 and y1 < y2 then
		return DIR_RIGHTDOWN
	elseif x1 == x2 and y1 < y2 then
		return DIR_DOWN
	elseif x1 > x2 and y1 < y2 then
		return DIR_DOWNLEFT
	elseif x1 > x2 and y1 == y2 then
		return DIR_LEFT
	elseif x1 > x2 and y1 > y2 then
		return DIR_LEFTUP
	end
end

--获得一个坐标指定方向,指定距离的坐标
function GetPosByDirect(x,y,direct,step)
	local xx = x + WALK_ADJUST[direct+1][1] * step
	local yy = y + WALK_ADJUST[direct+1][2] * step
	return xx,yy
end

--hash场景ID
function HashSceneID(country, map)
	return 256*country + map
end

--检查玩家等级是否满足任务等级需求
function CheckTaskLevel(uid,taskid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local minlevel = s_getTaskValue(uid,taskid,TaskValue_MinLevel)
	local maxlevel = s_getTaskValue(uid,taskid,TaskValue_MaxLevel)
	if level >= minlevel and level <= maxlevel then
		return VALUE_OK
	end
	return VALUE_FAIL
end

--检查玩家等级是否满足道具需求
function CheckItemLevel(uid,itemid,info)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local minlevel = s_getItemValue(uid,itemid,Item_Base_NeedLevel)
	local maxlevel = s_getItemValue(uid,itemid,Item_Base_MaxLevel)
	if level >= minlevel and level < maxlevel then
		return VALUE_OK
	end
	if info ~= nil then
		s_sysInfo(uid,info)
	end
	return VALUE_FAIL
end

--开始摇颜色
--fctype 默认0
--ratelist {white,blue,yellow,green,purpple} 和共一万
--result 最低颜色
function StartFreshColor(uid,fctype,ratelist,result,func_space,func,paramlist)
	local color = 0
	local rand = math.random(1,10000)
	if rand <= ratelist[1] then
		color = 0
	elseif rand <= (ratelist[1] + ratelist[2]) then
		color = 1
	elseif rand <= (ratelist[1] + ratelist[2] + ratelist[3]) then
		color = 2
	elseif rand <= (ratelist[1] + ratelist[2] + ratelist[3] + ratelist[4]) then
		color = 3
	else
		color = 4
	end
	if color < result then
		color = result
	end
	local call = Call:New(uid,func_space,func,paramlist)
	call.param_ext[1] = color
	-- param_ext[2] 客户端强制关闭标记 非0即强制关闭
	if RegisterUserCall(USER_EVENT_FRESH_COLOR,call) ~= VALUE_OK then
		return VALUE_FAIL
	end
	s_freshColor(uid,fctype,color)
	s_setOperate(uid,OperateType_FreshColor)
	return VALUE_OK
end

--给任务增加攻装时会根据职业从一组中选一个
--非武器装备列表(equiplist)
function GetProAttEquip(uid,equiplist)
	if equiplist == nil then
		return
	end
	local target = 0
	if #equiplist == 1 then
		return equiplist[1]
	end
	local atttype = 2
	local pro = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_PROFESSION)
	if pro == Profession_Soldier or pro == Profession_Gunman then
		atttype = 1
	end
	if target == 0 then
		for i = 1, #equiplist do
			local at = math.floor(equiplist[i]/100)%10
			if at == atttype then
				return equiplist[i]
			end
		end
	end
	return 0
end

--截取整数部分
function GetIntPart(x)
	if x <= 0 then
		return math.ceil(x)
	end

	if math.ceil(x) == x then
		x = math.ceil(x)
	else
		x = math.ceil(x)-1
	end
	return x
end

--根据团空间等级获取团空间的大小
function GetCorpSpaceCapacity(level)
	if level == 1 then return 25
	elseif level == 2 then return 45
	elseif level == 3 then return 65
	elseif level == 4 then return 85
	elseif level == 5 then return 105
	elseif level == 6 then return 125
	elseif level == 7 then return 145
	elseif level == 8 then return 165
	elseif level == 9 then return 185
	elseif level == 10 then return 205
	end
	return 0
end

--根据团空间等级获取升级所需要的成长值
function GetCorpSpaceGrow(level)
	if level == 1 then return 30
	elseif level == 2 then return 90
	elseif level == 3 then return 250
	elseif level == 4 then return 750
	elseif level == 5 then return 1800
	elseif level == 6 then return 4000
	elseif level == 7 then return 7500
	elseif level == 8 then return 12000
	elseif level == 9 then return 18000
	elseif level == 10 then return 30000
	end
	return 0
end

--获取团空间已使用大小
function GetCorpSpaceUsedCapacity(corp)
	local level = s_getCorpsVar(corp,110,1)
	--	local capacity = GetCorpSpaceCapacity(level)
	local num = s_getCorpsVar(corp,110,3)
	local capacity = 0
	for i=1,num do
		if s_getCorpsVar(corp,109,1+(i-1)*100) == 0 then
			break
		end
		capacity = capacity+GetCorpSpaceItemCapacity(s_getCorpsVar(corp,109,1+(i-1)*100))
	end
	return capacity
end

--获取空间道具大小
function GetCorpSpaceItemCapacity(itemid)
	if itemid == 63000 then return 1
	elseif itemid == 63001 then return 2
	elseif itemid == 63002 then return 2
	elseif itemid == 63003 then return 4
	elseif itemid == 63004 then return 4
	elseif itemid == 63005 then return 4
	elseif itemid == 63006 then return 8
	elseif itemid == 63007 then return 8
	elseif itemid == 63008 then return 8
	elseif itemid == 63009 then return 16
	elseif itemid == 63010 then return 16
	elseif itemid == 63011 then return 16
	elseif itemid == 63012 then return 32
	elseif itemid == 63013 then return 32
	elseif itemid == 63014 then return 32
	elseif itemid == 63015 then return 30
	elseif itemid == 63016 then return 30
	elseif itemid == 63017 then return 30
	elseif itemid == 63018 then return 30
	elseif itemid == 63019 then return 30
	end
	return 0
end

--获取空间道具成长值
function GetCorpSpaceItemGrowth(itemid)
	if itemid == 63000 then return 0
	elseif itemid == 63001 then return 2
	elseif itemid == 63002 then return 2
	elseif itemid == 63003 then return 4
	elseif itemid == 63004 then return 4
	elseif itemid == 63005 then return 4
	elseif itemid == 63006 then return 8
	elseif itemid == 63007 then return 8
	elseif itemid == 63008 then return 8
	elseif itemid == 63009 then return 16
	elseif itemid == 63010 then return 16
	elseif itemid == 63011 then return 16
	elseif itemid == 63012 then return 32
	elseif itemid == 63013 then return 32
	elseif itemid == 63014 then return 32
	elseif itemid == 63015 then return 5
	elseif itemid == 63016 then return 5
	elseif itemid == 63017 then return 5
	elseif itemid == 63018 then return 5
	elseif itemid == 63019 then return 5
	end
	return 0
end

--获取两个时间戳相差的天数(只用于同一年份）
function GetDiffDayByTimeStamp(timestamp1, timestamp2)
	if timestamp1 == 0 or timestamp2 == 0 then
		return 1
	end
	local year1 = tonumber(os.date("%Y",timestamp1))
	local year2 = tonumber(os.date("%Y",timestamp1))
	if year1 == nil or year2 == nil then
		s_debug("传入参数为非有效时间戳！")
		return 0
	end
	if year1 ~= year2 then
		return 1
	end
	local day1 = tonumber(os.date("%j",timestamp1))
	local day2 = tonumber(os.date("%j",timestamp2))
	return math.abs(day2 - day1)
end

--获取两个时间戳相差的周数(只用于同一年份）
function GetDiffWeekByTimeStamp(timestamp1, timestamp2)
	if timestamp1 == 0 or timestamp2 == 0 then
		return 1
	end
	local year1 = tonumber(os.date("%Y",timestamp1))
	local year2 = tonumber(os.date("%Y",timestamp1))
	if year1 == nil or year2 == nil then
		s_debug("传入参数为非有效时间戳！")
		return 0
	end
	if year1 ~= year2 then
		return 1
	end
	local week1 = tonumber(os.date("%W",timestamp1))
	local week2 = tonumber(os.date("%W",timestamp2))
	return math.abs(week2 - week1)
end

--获取指定时间戳是一星期中的第几天(只用于同一年份）
function GetDayInWeekByTimeStamp(timestamp)
	if timestamp == 0 then
		return 0
	end
	local year = tonumber(os.date("%Y",timestamp))
	if year == nil then
		s_debug("传入参数为非有效时间戳！")
		return 1
	end
	local day = tonumber(os.date("%w",timestamp))
	return day
end

--获取两个时间戳相差的月份数(只用于同一年份）
function GetDiffMonthByTimeStamp(timestamp1, timestamp2)
	if timestamp1 == 0 or timestamp2 == 0 then
		return 1
	end
	local year1 = tonumber(os.date("%Y",timestamp1))
	local year2 = tonumber(os.date("%Y",timestamp1))
	if year1 == nil or year2 == nil then
		s_debug("传入参数为非有效时间戳！")
		return 0
	end
	local month1 = tonumber(os.date("%m",timestamp1))
	local month2 = tonumber(os.date("%m",timestamp2))
	return math.abs(month2 - month1)
end

--获取指定时间戳距下个月份的秒数(只用于同一年份）
function GetTimeInteralFromNextMonthByTimeStamp(timestamp)
	if timestamp == 0 then
		return 0
	end
	local year = tonumber(os.date("%Y",timestamp))
	if year == nil then
		s_debug("传入参数为非有效时间戳！")
		return 1
	end
	local currentmonth = tonumber(os.date("%m",timestamp))
	local day = 0
	while tonumber(os.date("%m",timestamp + ((day + 1) * 24 * 60 * 60))) <= currentmonth do
		day = day + 1
	end
	local hour = 23 - tonumber(os.date("%I",timestamp))
	local minute = 59 - tonumber(os.date("%M",timestamp))
	local second = 59 - tonumber(os.date("%S",timestamp))
	local timeinteral = hour * 60 * 60 + minute * 60 + second
	timeinteral = timeinteral + day * 24 * 60 * 60
	return timeinteral
end

--是否有恋人关系
function hasLover(uid)
	local mylover = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LOVER)
	local myspouse = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SPOUSE)
	return mylover ~= 0 or myspouse ~= 0
end

--是否是团长
function isCorpsLeader(uid)
	local corps = s_getCorpsId(uid)
	if corps == 0 then
		return false 
	end
	local fun = s_getFunction(uid,Relation_Corps)
	return fun == FunctionType_CLeader
end


function print_table ( t )  
    local print_r_cache={}
    local function sub_print_r(t,indent)
        if (print_r_cache[tostring(t)]) then
            print(indent.."*"..tostring(t))
        else
            print_r_cache[tostring(t)]=true
            if (type(t)=="table") then
                for pos,val in pairs(t) do
                    if (type(val)=="table") then
                        print(indent.."["..pos.."] => "..tostring(t).." {")
                        sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                        print(indent..string.rep(" ",string.len(pos)+6).."}")
                    elseif (type(val)=="string") then
                        print(indent.."["..pos..'] => "'..val..'"')
                    else
                        print(indent.."["..pos.."] => "..tostring(val))
                    end
                end
            else
                print(indent..tostring(t))
            end
        end
    end
    if (type(t)=="table") then
        print(tostring(t).." {")
        sub_print_r(t,"  ")
        print("}")
    else
        sub_print_r(t,"  ")
    end
    print()
end
