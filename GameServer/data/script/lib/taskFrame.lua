--任务框架

--////////////////////////////////////////////////////////
--//////任务函数的封装
--////////////////////////////////////////////////////////

--任务相关图片定义字符串-----------------------------------------------
--exp
TASK_EXP_ICON1 = [[<button packid="0" group="5" frame="40" id="-1">]]
TASK_EXP_ICON2 = [[<button packid=\"0\" group=\"5\" frame=\"40\" id=\"-1\">]]
--团勋章
TASK_CONTRI_ICON1 = [[<button packid="0" group="5" frame="42" id="-1">]]
TASK_CONTRI_ICON2 = [[<button packid=\"0\" group=\"5\" frame=\"42\" id=\"-1\">]]
--团资金
TASK_CORP_MONEY_ICON1 = [[<button packid="0" group="5" frame="44" id="-1">]]
TASK_CORP_MONEY_ICON2 = [[<button packid=\"0\" group=\"5\" frame=\"44\" id=\"-1\">]]
--团繁荣度
TASK_CORP_GLORY_ICON1 = [[<button packid="0" group="5" frame="41" id="-1">]]
TASK_CORP_GLORY_ICON2 = [[<button packid=\"0\" group=\"5\" frame=\"41\" id=\"-1\">]]
--团营养指数
TASK_CORP_HEALTH_ICON1 = [[<button packid="0" group="5" frame="43" id="-1">]]
TASK_CORP_HEALTH_ICON2 = [[<button packid=\"0\" group=\"5\" frame=\"43\" id=\"-1\">]]
--声望
TASK_PRESTIGE_ICON1 = [[<button packid="0" group="5" frame="49" id="-1">]]
TASK_PRESTIGE_ICON2 = [[<button packid=\"0\" group=\"5\" frame=\"49\" id=\"-1\">]]
--绑银
TASK_MONEYTICKET_ICON1 = [[<button packid="0" group="5" frame="35" id="-1">]]
TASK_MONEYTICKET_ICON2 = [[<button packid=\"0\" group=\"5\" frame=\"35\" id=\"-1\">]]
--赠点(目前同绑银，没有给新图片)
TASK_GOLDTICKET_ICON1 = [[<button packid="0" group="5" frame="36" id="-1">]]
TASK_GOLDTICKET_ICON2 = [[<button packid=\"0\" group=\"5\" frame=\"36\" id=\"-1\">]]
--银币
TASK_MONEY_ICON1 = [[<button packid="0" group="5" frame="38" id="-1">]]
TASK_MONEY_ICON2 = [[<button packid=\"0\" group=\"5\" frame=\"38\" id=\"-1\">]]
--成长勋章
TASK_GROWTH_MEDAL_ICON1 = [[<button packid="0" group="5" frame="53" id="-1">]]
TASK_GROWTH_MEDAL_ICON2 = [[<button packid=\"0\" group=\"5\" frame=\"53\" id=\"-1\">]]
--历练勋章
TASK_EXP_MEDAL_ICON1 = [[<button packid="0" group="5" frame="54" id="-1">]]
TASK_EXP_MEDAL_ICON2 = [[<button packid=\"0\" group=\"5\" frame=\"54\"  id=\"-1\">]]
--战争勋章
TASK_WAR_MEDAL_ICON1 = [[<button packid="0" group="5" frame="55" id="-1">]]
TASK_WAR_MEDAL_ICON2 = [[<button packid=\"0\" group=\"5\" frame=\"55\" id=\"-1\">]]
--横线(只有任务描述中有)
TASK_HL_ICON1 = [[<image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P">]]



--组合一个菜单按钮------------------------------------------------------
function Button(name,index,style)
	if name == nil then
		return
	end
	if index == nil then
		index = 0
	end
	if style == nil then
		style = 0
	end
	if style == 1 then
		return 'this:AddTaskChoseButton' .. '(' .. '"' .. name..'"'..','.. index ..')'
	end
	return 'this:AddChoseButton' .. '(' .. '"' .. name..'"'..','.. index ..')'
end

--弹出一个菜单----------------------------------------------------
function ShowNpcMenu(uid,msg,...)	--按钮格式:文字,回调函数...
	if msg == nil or msg == "" then
		msg = " "
	end
	local info = {}
	info.talk = {msg}
	info.button = {}
	local arg = {...}
	for i = 1,(#arg+1)/2 do
		if arg[i*2-1] ~= nil and type(arg[i*2-1]) ~= "string" then
			s_debug("传递给ShowNpcMenu函数的参数不是字符串")
			return
		end
		if arg[i*2] ~= nil and type(arg[i*2]) ~= "string"then
			s_debug("传递给ShowNpcMenu函数的参数不是字符串")
			return
		end
		info.button[i] = {}
		info.button[i][1] = arg[i*2-1]
		info.button[i][2] = arg[i*2]
	end
	ShowNpcMenuByTable(uid,info)
end

--弹出一个菜单按钮在菜单最下面----------------------------------------------------
function ShowNpcMenuBottomStyle(uid,msg,...)		--参数定义参考ShowNpcMenu
	if msg == nil then
		msg = ""
	end
	s_clearCallBack(uid)
	local buttons = ""
	local index = 0
	local btnum = 0
	local arg = {...}
	for i = 1,(#arg+1)/2 do
		index = index + 1
		if arg[i*2-1] ~= nil and type(arg[i*2-1]) ~= "string" then
			s_debug("传递给ShowNpcMenuBottomStyle函数的参数不是字符串")
			return
		end
		if arg[i*2-1] ~= nil then
			buttons = buttons .. Button(arg[i*2-1],index,1)
			btnum = btnum + 1
		end
		if arg[i*2] ~= nil and type(arg[i*2]) ~= "string"then
			s_debug("传递给ShowNpcMenuBottomStyle函数的参数不是字符串")
			return
		end
		if arg[i*2] ~= nil and arg[i*2] ~= "" then
			s_setCallBack(uid,index,arg[i*2])
		end
	end
	local begin = 'function MainDialog() this:AddTalk("'.. msg .. '")  this:SetStep(85) this:SetButtonNum("' ..btnum..'")'
		local finish = 'this:ShowWarShit() end this:AddDialog("MainDialog")'
		--s_setMessage(uid,"2008",begin .. buttons .. finish ,1)
		s_setMessage(uid,"2008","{"..msg.."}" ,1)
end

--随机任务弹出一个菜单按钮在菜单最下面----------------------------------------------------
function ShowRandomTask(uid,msg,fortune,color,randomtaskid,exp)
	if msg == nil then
		msg = ""
	end
	s_setRandomMessage(uid,msg,fortune,color,randomtaskid,exp)
end

--通过表定义显示菜单----------------------------------------------------
function ShowNpcMenuByTable(uid,info,moveNotClose)
	if info == nil then
		return
	end
	s_clearCallBack(uid)
	local msg = ""
	if info.talk ~= nil then
		if type(info.talk) == "string" then
			msg = msg .. info.talk
		elseif type(info.talk) == "table" then
			msg = msg .. info.talk[math.random(table.getn(info.talk))]
		end
	end
	msg = trim(msg)
	local buttons = ""
	local btnum = 0
	local index = 0
	local firstIndex = 0
	local firstButton = ""
	local task_process = TaskProcess_Max
	--s_debug("ShowNpcMenuByTable111111111111 taskid=")
	if info.button ~= nil then
		--s_debug("ShowNpcMenuByTable22222222222222221 taskid=")
		for i = 1,table.getn(info.button) do
			local show = VALUE_FAIL
			if info.button[i][3] == nil or info.button[i][3] == VALUE_OK then
				--s_debug("ShowNpcMenuByTable22221111111111111 taskid=")
				show = VALUE_OK
			else
				--s_debug("ShowNpcMenuByTable222211111111111112222222222 taskid=[info.but=%s]", info.button[i][3])
				local fun = StringToFunction(info.button[i][3])
				if fun ~= nil then
					show = fun(uid)
					--s_debug("ShowNpcMenuByTable2 taskid=   show=%d",show)
				else
					show = VALUE_FAIL
				end
				--s_debug("ShowNpcMenuByTable3333333333333333333 taskid=")
			end
			if show == VALUE_OK then
				--修改带任务（%ID）的菜单名字
				local buttonname = info.button[i][1]
				local suffix = string.match(buttonname,"%%%d+")
				local taskid = 0
				if suffix ~= nil and suffix ~= "" then
					taskid = tonumber(string.match(suffix,"%d+"))
					--s_debug("new taskid=%d, suffix=%s",taskid,suffix)
					if taskid ~= 0 then
						local process = s_getTaskValue(uid,taskid,TaskValue_Process)
						if process == TaskProcess_None then
							task_process = TaskProcess_None
							suffix = "(4)"
						elseif process == TaskProcess_Doing then
							task_process = TaskProcess_Doing
							suffix = "(5)"
						elseif process == TaskProcess_CanDone then
							task_process = TaskProcess_CanDone
							suffix = "(6)"
						else
							suffix = "(3)"
						end
						--s_debug("ShowNpcMenuByTable suffix=%s", suffix)
					end
					if taskid ~= 0 then
						buttonname = string.gsub(buttonname,"%(3%)%%%d+",suffix)
					end
				end
				index = index + 1
				if info.button[i][2] == nil then
					info.button[i][2] = ""
				end
				if info.button[i][2] ~= nil and info.button[i][2] ~= "" then
					s_setCallBack(uid,index,info.button[i][2])
					if index == 1 then
						firstIndex = i
						firstButton = info.button[i][2]
					end
				end
				buttons = buttons .. Button(buttonname,index)
				btnum = btnum + 1
			end
		end
	end
	if index == 1 and info.button[firstIndex][4] == VALUE_OK then
		local fun = StringToFunction(firstButton)
		if fun ~= nil then
			fun(uid)
			return
		end
	end
	if task_process ~= TaskProcess_Max and btnum == 1 then
		s_checkAutoLevelup(uid)
		OnChooseMenuEvent("2008",uid,1,0)
		return
	end
	--if msg ~= "" and string.find(msg,"<p>") ~= nil then
		--msg = msg ..[[<p><newline></newline><image pack=\"IMAGE_PACK\" infoname=\"IMAGE_18_2\"/></p>]]
	--end
	--local begin = 'function MainDialog()  this:AddTalk("'..msg..'")  this:SetStep(85) this:SetButtonNum("' ..btnum..'")'
	--if moveNotClose == 1 then
		--begin = begin.." this:SetCloseStyle(true,false) "
	--end
	--local finish = 'end this:AddDialog("MainDialog")'
	--s_setMessage(uid,"2008",begin .. buttons .. finish ,moveNotClose)
    msg = "{".."text=".."'"..msg.."'".."}"
    s_setMessage(uid,"2008",msg ,moveNotClose)
end

--是否为剧情任务
function IsMainNormalTask(taskid)
	local tasktype = s_getTaskValue(0,taskid,TaskValue_Type)
	if tasktype == TaskType_Normal then
		return VALUE_OK
	end
	return VALUE_FAIL
end

--是否为支线任务
function IsBranchTask(taskid)
	local tasktype = s_getTaskValue(0,taskid,TaskValue_Type)
	if tasktype == TaskType_Sub then
		return VALUE_OK
	end
	return VALUE_FAIL
end

--根据任务类别加前缀
function GetSuffixToTaskName(taskid, name)
	local tasktype = s_getTaskValue(0,taskid,TaskValue_Type)
	if tasktype == TaskType_Normal then
		return " [剧情]"
	elseif tasktype == TaskType_Sub then
		return " [支线]"
	end
	return ""
end

--注册NPC对话，脚本加载时调用
function RegisterNpcTalkEvent(npcid,text)
	local info = rawget(_G,"NpcMenuInfo"..npcid)
	if info == nil then
		info = {}
		rawset(_G,"NpcMenuInfo" .. npcid, info)
		return
	end
	if text == "" or text == nil then
		return
	end
	if type(info.talk) ~= "table" then
		info.talk = {}
	end
	table.insert(info.talk,text)
end

--手动挂载菜单函数------------------------------------------------------------
function AppendMenuToNpc(npcid,label,dealFun,showFun)
	local menuInfo = rawget(_G,"NpcMenuInfo" .. npcid)
	if menuInfo == nil then
		menuInfo = {}
		rawset(_G,"NpcMenuInfo" .. npcid,menuInfo)
	end
	if menuInfo.talk == nil then
		local talkInfo = rawget(_G,"NPC_TALK_CONTENT_" .. npcid)
		if talkInfo ~= nil then
			menuInfo.talk = talkInfo
		end
	end
	if menuInfo.button == nil then
		menuInfo.button = {}
	end

	local button = {label,dealFun,showFun}
	local find = false
	if table.getn(menuInfo.button) > 0 then
		for i=1, table.getn(menuInfo.button), 1 do
			if menuInfo.button[i][1] == button[1] and menuInfo.button[i][2] == button[2] and menuInfo.button[i][3] == button[3] then
				find = true
				break
			end
		end
	end

	if find == false then
		table.insert(menuInfo.button,button)
	end
end


--注册升级事件
function RegisterLevelUpEvent(level,callback)
	if callback == nil then
		return VALUE_FAIL
	end
	if LevelUpEvent == nil then
		LevelUpEvent = {}
	end
	if LevelUpEvent[level] == nil then
		LevelUpEvent[level] = {}
	end

	local find = false
	if table.getn(LevelUpEvent[level]) > 0 then
		for i=1, table.getn(LevelUpEvent[level]), 1 do
			if LevelUpEvent[level][i] == callback then
				find = true
				break
			end
		end
	end

	if find == false then
		table.insert(LevelUpEvent[level],callback)
	end

	return VALUE_OK
end

--注册npc死亡事件,组队成员全部会被回调
function RegisterNpcDeadEvent(npcid,callback)

	if callback == nil then
		s_debug("注册NPC死亡事件的回调函数无效("..npcid..")")
		return VALUE_FAIL
	end
	if NpcDeadEventTable == nil then
		NpcDeadEventTable = {}
	end
	if NpcDeadEventTable[npcid] == nil then
		NpcDeadEventTable[npcid] = {}
	end

	local find = false
	if table.getn(NpcDeadEventTable[npcid]) > 0 then
		for i=1, table.getn(NpcDeadEventTable[npcid]), 1 do
			if NpcDeadEventTable[npcid][i] == callback then
				find = true
				break
			end
		end
	end

	if find == false then
		table.insert(NpcDeadEventTable[npcid],callback)
	end
	s_setNpcDeadEvent(npcid)
	return VALUE_OK
end

function RegisterNpcDeadLevelEvent(callback)
	if callback == nil then
		return VALUE_FAIL
	end
	if NpcDeadLevelEventTable == nil then
		NpcDeadLevelEventTable = {}
	end

	local find = false
	if table.getn(NpcDeadLevelEventTable) > 0 then
		for i=1, table.getn(NpcDeadLevelEventTable), 1 do
			if NpcDeadLevelEventTable[i] == callback then
				find = true
				break
			end
		end
	end

	if find == false then
		table.insert(NpcDeadLevelEventTable,callback)
	end
	--s_setNpcDeadEvent(npcid)
	return VALUE_OK
end


--注册升级事件
function RegisterUseItemEvent(itemid,callback)
	if callback == nil then
		return VALUE_FAIL
	end
	if UseItemEvent == nil then
		UseItemEvent = {}
	end
	if UseItemEvent[itemid] == nil then
		UseItemEvent[itemid] = {}
	end

	local find = false
	if table.getn(UseItemEvent[itemid]) > 0 then
		for i=1, table.getn(UseItemEvent[itemid]), 1 do
			if UseItemEvent[itemid][i] == callback then
				find = true
				break
			end
		end
	end

	if find == false then
		table.insert(UseItemEvent[itemid],callback)
	end

	return VALUE_OK
end


--注册Npc访问事件
function RegisterClickNpcEvent(npcid,callback)
	if callback == nil then
		return VALUE_FAIL
	end
	if ClickNpcEvent == nil then
		ClickNpcEvent = {}
	end
	if ClickNpcEvent[npcid] == nil then
		ClickNpcEvent[npcid] = {}
	end

	local find = false
	if table.getn(ClickNpcEvent[npcid]) > 0 then
		for i=1, table.getn(ClickNpcEvent[npcid]), 1 do
			if ClickNpcEvent[npcid][i] == callback then
				find = true
				break
			end
		end
	end

	if find == false then
		table.insert(ClickNpcEvent[npcid],callback)
	end

	return VALUE_OK
end

--注册传送NPC
function RegisterMoneyTransmissionNpc(npcid)
	local fun = [[
		function OnClickNpc_$1(uid)
			local button = NpcMenuInfo$1.button
			local info = {}
			info.talk = NpcMenuInfo$1.talk
			info.button = {}
			for i = 1, table.getn(button) do
				local rate = string.match(button[i][1],"%d+")
				rate = tonumber(rate)
				local money = GetTrasportFee(uid,rate)
				local moneystr = string.format("绑银%d文",money)
				info.button[i] = {}
				info.button[i][1] = string.gsub(button[i][1],"$MONEY%(%d+%)",moneystr.."(2)")
				info.button[i][2] = button[i][2]
				if button[i][3] ~= nil then
					info.button[i][3] = button[i][3]
				end
				if button[i][4] ~= nil then
					info.button[i][4] = button[i][4]
				end
			end
			ShowNpcMenuByTable(uid,info)
		end]]
	fun = FormatString(fun,npcid)
	RegistetFunction(fun)
end


--注册驯化宠物事件
function RegisterGetDemonEvent(callback)
	if callback == nil then
		return VALUE_FAIL
	end
	if GetDemonEvent == nil then
		GetDemonEvent = {}
	end
	table.insert(GetDemonEvent,callback)
	return VALUE_OK
end

--注册npc死亡事件,只对杀死npc的玩家有效
function RegisterMyNpcDeadEvent(npcid,callback)
	if callback == nil then
		s_debug("注册NPC死亡事件的回调函数无效("..npcid..")")
		return VALUE_FAIL
	end
	if MyNpcDeadEventTable == nil then
		MyNpcDeadEventTable = {}
	end
	if MyNpcDeadEventTable[npcid] == nil then
		MyNpcDeadEventTable[npcid] = {}
	end

	local find = false
	if table.getn(MyNpcDeadEventTable[npcid]) > 0 then
		for i=1, table.getn(MyNpcDeadEventTable[npcid]), 1 do
			if MyNpcDeadEventTable[npcid][i] == callback then
				find = true
				break
			end
		end
	end

	if find == false then
		table.insert(MyNpcDeadEventTable[npcid],callback)
	end

	s_setNpcDeadEvent(npcid)
	return VALUE_OK
end


--注册节日活动
function RegisterHolidayActivityEvent(hour,minute,callback)
	s_addHoliday(hour,minute,callback)
end

--注册Lua定时器回调函数
--howlong 时间间隔
--func 回调函数
function RegisterTimeTriggerCallBack(howlong, func,param)
	if param == nil then
		return s_registerEventLuaCallback(howlong, func,0)
	else
		return s_registerEventLuaCallback(howlong, func,param)
	end
end

--删除Lua定时器回调函数
function DeleteTimeTriggerCallBack(triggerid)
	s_deleteEventLuaCallback(triggerid)
end


--////////////////////////////////////////////////////////////////
--////任务文本的解析,转换成客户端xml格式
--///////////////////////////////////////////////////////////////
--解析成任务描述格式
function parseToDesc(text)
	text = string.gsub(text,"\n","")
	local s = string.gsub(text,"(%a+_*%d*)(%b())",
		function(tag,body)
			body = string.sub(body,2,-2)
			body = parseToDesc(body)
			return FormatDesc(tag,body)
		end)
	return s
end
function FormatDesc(tag,body)
	if tag == "title" then    --黄色任务
		return string.format("%s%s%s",[[<p><n color="GXColorYellow" font="3">]],body,[[</n></p><p>]]..TASK_HL_ICON1..[[</image></p>]])
	elseif tag == "title1" then   --白色任务
		return string.format("%s%s%s",[[<p><n color="GXColorWhite" font="3">]],body,[[</n></p><p>]]..TASK_HL_ICON1..[[</image></p>]])
	elseif tag == "title2" then    --蓝色任务
		return string.format("%s%s%s",[[<p><n color="GXColorBlueLight" font="3">]],body,[[</n></p><p>]]..TASK_HL_ICON1..[[</image></p>]])
	elseif tag == "title3" then    --绿色任务
		return string.format("%s%s%s",[[<p><n color="GXColorGreen" font="3">]],body,[[</n></p><p>]]..TASK_HL_ICON1..[[</image></p>]])
	elseif tag == "title4" then    --紫色任务
		return string.format("%s%s%s",[[<p><n color="GXColorTurp" font="3">]],body,[[</n></p><p>]]..TASK_HL_ICON1..[[</image></p>]])
	elseif tag == "body" then
		return string.format("%s%s%s","<p><n>",body,[[</n></p>]])
	elseif tag == "goto" then
		local npcid,mapid = string.match(body,"(%d+),(%d+)")
		local msg = string.gsub([[<goto id="$1" mapid="$2"/>]],"$1",npcid)
		msg = string.gsub(msg,"$2",mapid)
		return string.format("%s%s%s","</n>",msg,"<n>")
	elseif tag == "pos" then
		local x,y,mapid = string.match(body,"(%d+),(%d+),(%d+)")
		local t = { v1=x,v2=y,v3=mapid}
		local msg = string.gsub([[<goto pos="v1,v2" mapid="v3"/>]],"(v%d+)",t)
		return string.format("%s%s%s","</n>",msg,"<n>")
	elseif tag == "gotopos" then
		local npcid,mapid,x,y,f1,f2 = string.match(body,"(%d+),(%d+),(%d+),(%d+),(%d+),(%d+)")
		local t = {v1=npcid,v2=mapid,v3=x,v4=y,v5=f1,v6=f2}
		local msg = string.gsub([[<goto id="v1" mapid="v2" pos="v3,v4" shownpcname="v5" flagpoint="v6"/>]],"(v%d+)",t)
		return string.format("%s%s%s","</n>",msg,"<n>")
	elseif tag == "blankline" then
		return string.format("%s%s%s","</n></p>","<p><newline/></p>","<p><n>")
	elseif tag == "newline" then
		return "</n></p><p><n>"
	elseif tag == "player" then
		return [[</n><user color="GXColorGreen" /><n>]]
	elseif tag == "hot" then	--绿色加亮
		return string.format("%s%s%s",[[</n><n color="GXColorGreen">]],body,[[</n><n>]])
	elseif tag == "hot2" then	--黄色加亮
		return string.format("%s%s%s",[[</n><n color="GXColorYellow">]],body,[[</n><n>]])
	elseif tag == "hotyellow_3" then
		return string.format("%s%s%s",[[</n><n color="GXColorYellow" font="3">]],body,[[</n><n>]])
	elseif tag == "hot3" then	--蓝色加亮
		return string.format("%s%s%s",[[</n><n color="GXColorBlueLight">]],body,[[</n><n>]])
	elseif tag == "hot4" then   --红色加亮
		return string.format("%s%s%s",[[</n><n color="GXColorRed">]],body,[[</n><n>]])
	elseif tag == "hot5" then   --紫色加亮
		return string.format("%s%s%s",[[</n><n color="GXColorTurp">]],body,[[</n><n>]])
	elseif tag == "var" then --任务变量
		local taskid,varid = string.match(body,"(%d+),(%d+)")
		local msg = [[<n color="GXColorGreen" task="$1" var="$2"></n>]]
		msg = string.gsub(msg,"$1",taskid)
		msg = string.gsub(msg,"$2",varid)
		return string.format("%s%s%s","</n>",msg,"<n>")
	elseif tag == "space" then --空格
		return 	[[</n><space></space><n>]]
	elseif tag == "exp" then
		return string.format("%s%s%s",[[</n></p><p>]]..TASK_EXP_ICON1 ,body,[[经验</button><n>]])
	elseif tag == "item" then
		local itemid,itemnum,itemquality = string.match(body,"(%d+),(%d+),(%d+)")
		local msg = string.format([[<p><object id="%u" $attr quality="%u"/></p>]],itemid,itemquality)
		local attr = ""
		if tonumber(itemnum) > 0 then
			attr =  string.format("%s%s%u ",attr,"num=",itemnum)
		end
		msg = string.gsub(msg,"$attr",attr)
		return string.format("%s%s%s","</n></p>",msg,"<p><n>")
	elseif tag == "moneyticket" then
		return string.format("%s%s%s",[[</n></p><p>]]..TASK_MONEYTICKET_ICON1 ,body,[[绑银</button><n>]])
	elseif tag == "goldticket" then
		return string.format("%s%s%s",[[</n></p><p>]]..TASK_GOLDTICKET_ICON1 ,body,[[赠点</button><n>]])
	elseif tag == "money" then
		return string.format("%s%s%s",[[</n></p><p>]].. TASK_MONEYTICKET_ICON1 ,body,[[银币</button><n>]])
	elseif tag == "cglory" then --繁荣度
		return string.format("%s%s%s",[[</n></p><p>]].. TASK_CORP_HEALTH_ICON1 ,body,[[繁荣度</button><n>]])
	elseif tag == "offer" then  --团勋章
		return string.format("%s%s%s",[[</n></p><p>]].. TASK_CONTRI_ICON1 ,body,[[团勋章</button><n>]])
	elseif tag == "chealth" then --营养指数
		return string.format("%s%s%s",[[</n></p><p>]].. TASK_CORP_GLORY_ICON1 ,body,[[营养指数</button><n>]])
	end
	return ""
end

--解析成任务对话格式
function parseToTalk(text)
	text = string.gsub(text,"\n","")
	local s = string.gsub(text,"(%a+%d*)(%b())",
		function(tag,body)
			body = string.sub(body,2,-2)
			body = parseToTalk(body)
			return FormatTalk(tag,body)
		end)
	return s
end
function FormatTalk(tag,body)
	if tag == "title" then
		return string.format("%s%s%s",[[<p><n color=\"GXColorYellow\" font=\"3\">]],body,[[</n></p>]])
	elseif tag == "body" then
		return string.format("%s%s%s","<p><n>",body,"</n></p>")
	elseif tag == "blankline" then
		return string.format("%s%s%s","</n></p>","<p><newline/></p>","<p><n>")
	elseif tag == "newline" then
		return "</n></p><p><n>"
	elseif tag == "player" then
		return [[</n><user color=\"GXColorGreen\" /><n>]]
	elseif tag == "hot" then
		return string.format("%s%s%s",[[</n><n color=\"GXColorGreen\">]],body,[[</n><n>]])
	elseif tag == "hot2" then
		return string.format("%s%s%s",[[</n><n color=\"GXColorYellow\">]],body,[[</n><n>]])
	elseif tag == "hotyellow_3" then
		return string.format("%s%s%s",[[</n><n color=\"GXColorYellow\" font=\"3\">]],body,[[</n><n>]])
	elseif tag == "hot3" then
		return string.format("%s%s%s",[[</n><n color=\"GXColorBlueLight\">]],body,[[</n><n>]])
	elseif tag == "hot4" then   --红色加亮
		return string.format("%s%s%s",[[</n><n color=\"GXColorRed\">]],body,[[</n><n>]])
	elseif tag == "hot5" then   --紫色加亮
		return string.format("%s%s%s",[[</n><n color=\"GXColorTurp\">]],body,[[</n><n>]])
	elseif tag == "space" then --空格
		return  [[</n><space></space><n>]]
	elseif tag == "goto" then
		local npcid,mapid = string.match(body,"(%d+),(%d+)")
		local msg = string.gsub([[<goto id=\"$1\" mapid=\"$2\"/>]],"$1",npcid)
		msg = string.gsub(msg,"$2",mapid)
		return string.format("%s%s%s","</n>",msg,"<n>")
	end
	return ""
end




--返回任务的描述
function GetTaskInfo(taskid)
	local info = rawget(_G,"RoleTaskInfo"..taskid)
	if info == nil then
		s_debug("获取任务信息出错:taskid:%d",taskid)
	end
	return info
end

--返回子任务描述
function GetSubTaskInfo(taskid, subtaskid)
	local info = rawget(_G,"RoleTaskInfo"..taskid)
	if info == nil then
		s_debug("获取子任务信息出错info:taskid:%d,subtaskid:%d",taskid, subtaskid)
		return nil
	end
	local subinfo = rawget(info,"subtask"..subtaskid)
	if subinfo == nil then
		s_debug("获取子任务信息出错subinfo:taskid:%d,subtaskid:%d",taskid, subtaskid)
	end
	return subinfo
end


--执行检查列表
function RunCheckList(uid, taskid, subtaskid, checklist, tips)
	if checklist == nil or type(checklist) ~= "table" or table.getn(checklist) == 0 then
		return VALUE_OK
	end

	for i = 1, table.getn(checklist), 1 do
		if checklist[i][1](uid, taskid, subtaskid, checklist[i][2], tips) == VALUE_FAIL then
			return VALUE_FAIL
		end
	end
	return VALUE_OK
end


--执行事件表
function RunActionList(uid, taskid, subtaskid, actionlist)
	if actionlist == nil or type(actionlist) ~= "table" or table.getn(actionlist) == 0 then
		return
	end

	for i = 1, table.getn(actionlist), 1 do
		if actionlist[i][3] == nil then
			actionlist[i][1](uid, taskid, subtaskid, actionlist[i][2])
		else
			actionlist[i][3].actionlist[i][1](actionlist[i][3], uid, taskid, subtaskid, actionlist[i][2])
		end
	end
end


--返回任务当前的轮数和环数，不考虑跨天，不修改实际数据
--非环任务，返回0,0
function GetTaskCurRoundAndRing(uid, taskid)
	local info = GetTaskInfo(taskid)
	if info == nil then return 0,0 end

	if info.ring == nil or info.ring == 0 then return 0,0 end

	local curRound = s_getVar(uid, taskid, TvarIndex_CurRound)
	local curRing = s_getVar(uid, taskid, TvarIndex_CurRing)
	if curRound == 0 then curRound = 1 end
	if curRing == 0 then curRing = 1 end

	--老任务模式兼容加上的判断，老任务模式的环数会到info.ring+1
	if curRing > info.ring then curRing = 1 end
	return curRound, curRing
end


--返回任务当天做的次数，用于活动界面统计，考虑跨天，但是不修改实际数据
--非环任务，返回0
function GetTaskDayDoneNum(uid, taskid)
	local info = GetTaskInfo(taskid)
	if info == nil then return 0 end

	local curRound,curRing = GetTaskCurRoundAndRing(uid, taskid)
	if curRound == 0 and curRing == 0 then return 0 end

	--检查是否有跨天
	local nowDay = s_getCurTime(TIME_ALLDAYS)
	local lastDay = s_getVar(uid,taskid,TvarIndex_Day)
	if lastDay == 0 or lastDay ~= nowDay then return 0 end

	return (curRound-1)*info.ring + curRing - 1
end

--检查环任务的次数是否满足条件，考虑跨天影响，若跨天，会修改实际数据
function CheckRoundAndRing(uid, taskid)
	local info = GetTaskInfo(taskid)
	if info == nil then return VALUE_FAIL end

	if info.ring == nil or info.ring == 0 then return VALUE_OK end

	--任务接取状态，返回失败
	local process = s_getTaskValue(uid,taskid,TaskValue_Process)
	if process ~= TaskProcess_None then
		return VALUE_FAIL
	end

	--检查是否有跨天
	local nowDay = s_getCurTime(TIME_ALLDAYS)
	local lastDay = s_getVar(uid,taskid,TvarIndex_Day)
	local curRound = 1
	local curRing = 1

	if lastDay == 0 or lastDay ~= nowDay then
		s_addVar(uid, taskid, TvarIndex_Day, nowDay)
		s_addVar(uid, taskid, TvarIndex_CurRound, curRound)
		s_addVar(uid, taskid, TvarIndex_CurRing, curRing)
	else
		curRound = s_getVar(uid, taskid, TvarIndex_CurRound)
		curRing = s_getVar(uid, taskid, TvarIndex_CurRing)

		if curRound == 0 then
			curRound = 1
			s_addVar(uid, taskid, TvarIndex_CurRound, curRound)
		end

		if curRing == 0 then
			curRing = 1
			s_addVar(uid, taskid, TvarIndex_CurRing, curRing)
		end
	end

	if curRound > info.round then return VALUE_FAIL end
	return VALUE_OK
end


--环任务计数加1，若跨天，则不增加当天次数；若没跨天，增加当天次数
function AddRoundAndRing(uid, taskid)
	local info = GetTaskInfo(taskid)
	if info == nil or info.ring == nil or info.ring == 0 then return end

	local nowDay = s_getCurTime(TIME_ALLDAYS)
	local lastDay = s_getVar(uid,taskid,TvarIndex_Day)
	local curRound = s_getVar(uid, taskid, TvarIndex_CurRound)
	local curRing = s_getVar(uid, taskid, TvarIndex_CurRing)

	if lastDay == 0 or lastDay ~= nowDay then
		curRound = 1
		curRing = 1
	else
		if curRound == 0 then curRound = 1 end
		if curRing == 0 then curRing = 1 end

		curRing = curRing + 1
		if curRing > info.ring then
			curRound = curRound + 1
			curRing = 1
		end
	end

	s_addVar(uid, taskid, TvarIndex_Day, nowDay)
	s_addVar(uid, taskid, TvarIndex_CurRound, curRound)
	s_addVar(uid, taskid, TvarIndex_CurRing, curRing)
	s_refreshDayTaskNum(uid,taskid,(curRound-1)*info.ring + curRing-1)

	if info.OnTaskDailyChanged ~= nil then
		info.OnTaskDailyChanged(info, uid)
	end
end

--环任务计数减1，减当天次数
function SubRoundAndRing(uid, taskid)
	local info = GetTaskInfo(taskid)
	if info == nil or info.ring == nil or info.ring == 0 then return end

	local nowDay = s_getCurTime(TIME_ALLDAYS)
	local lastDay = s_getVar(uid,taskid,TvarIndex_Day)
	local curRound = s_getVar(uid, taskid, TvarIndex_CurRound)
	local curRing = s_getVar(uid, taskid, TvarIndex_CurRing)

	if lastDay == 0 or lastDay ~= nowDay then
		curRound = 0
		curRing = 0
	else
		curRing = curRing - 1
		if curRing == 0 then
			curRound = curRound - 1

			if curRound == 0 then
				curRing = 0
			else
				curRing = info.ring
			end
		end
	end

	s_addVar(uid, taskid, TvarIndex_Day, nowDay)
	s_addVar(uid, taskid, TvarIndex_CurRound, curRound)
	s_addVar(uid, taskid, TvarIndex_CurRing, curRing)

	if curRing == 0 or curRound == 0 then
		s_refreshDayTaskNum(uid,taskid,0)
	else
		s_refreshDayTaskNum(uid,taskid,(curRound-1)*info.ring + curRing-1)
	end

	if info.OnTaskDailyChanged ~= nil then
		info.OnTaskDailyChanged(info, uid)
	end
end


--检查子任务是否可以接受
function CheckSubTaskAcceptShower(uid, taskid, subtaskid)
	local info = GetTaskInfo(taskid)
	if info == nil then return VALUE_FAIL end

	--s_debug("--------CheckSubTaskAcceptShower--1--%d---%d", taskid, subtaskid)
	--还未接任务
	local taskProcess = s_getTaskValue(uid,taskid,TaskValue_Process)
	--s_debug("--------CheckSubTaskAcceptShower--4--%d---%d", taskid, subtaskid)
	if info.ring == nil then
		if taskProcess ~= TaskProcess_None then
	--s_debug("--------CheckSubTaskAcceptShower--5--%d---%d", taskid, subtaskid)
			return VALUE_FAIL
		end
	else
		if taskProcess ~= TaskProcess_None and taskProcess ~= TaskProcess_Done then
	--s_debug("--------CheckSubTaskAcceptShower--501--%d---%d", taskid, subtaskid)
			return VALUE_FAIL
		end
	end

	--环任务次数检查
	if CheckRoundAndRing(uid, taskid) == VALUE_FAIL then
	--s_debug("--------CheckSubTaskAcceptShower--6--%d---%d", taskid, subtaskid)
		return VALUE_FAIL
	end

	--检查其他条件
	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	if subinfo == nil then return VALUE_OK end
	if RunCheckList(uid, taskid, subtaskid, subinfo.onacceptcheck) == VALUE_FAIL then
	--s_debug("--------CheckSubTaskAcceptShower--7--%d---%d", taskid, subtaskid)
		return VALUE_FAIL
	end

	--s_debug("--------CheckSubTaskAcceptShower--8--%d---%d", taskid, subtaskid)
	if info.OnAcceptCheck ~= nil then
		if info.OnAcceptCheck(info, uid, taskid, subtaskid) == VALUE_FAIL then
	--s_debug("--------CheckSubTaskAcceptShower--9--%d---%d", taskid, subtaskid)
			return VALUE_FAIL
		end
	end
	return VALUE_OK
end

--得到任务历练值
function GetTaskLilian(uid, taskid)
	--有父任务，从父任务获取
	local parent = s_getTaskVar(uid, taskid, MvarIndex_Parent)
	if parent ~= nil and parent ~= 0 then
		return GetTaskLilian(uid, parent)
	end

	local var = s_getTaskVar(uid,taskid,TvarIndex_Lilian)
	if var ~= 0 then
		return var
	end

	--检查自定义函数
	local info = GetTaskInfo(taskid)
	if info ~= nil and info.GetTaskLilian ~= nil then
		local exp = info.GetTaskLilian(info, uid)
		s_addTaskVar(uid,taskid,TvarIndex_Lilian,tonumber(exp))
		return exp
	end

	--检查表格
	local expstr = s_getTaskValue(uid,taskid,TaskValue_LiLian)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的历练
		local child = s_getTaskVar(uid, taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_LiLian)
		end
	end

	local exp = tonumber(expstr)
	s_addTaskVar(uid,taskid,TvarIndex_Lilian,exp)
	return exp
end
--得到任务经验
function GetTaskExp(uid, taskid)
	--有父任务，从父任务获取
	local parent = s_getTaskVar(uid, taskid, MvarIndex_Parent)
	if parent ~= nil and parent ~= 0 then
		return GetTaskExp(uid, parent)
	end

	--local var = s_getTaskVar(uid,taskid,MvarIndex_Exp)
	--if var ~= 0 then
		--return var
	--end

	--检查自定义函数
	local info = GetTaskInfo(taskid)
	if info ~= nil and info.GetTaskExp ~= nil then
		local exp = info.GetTaskExp(info, uid)
		s_addTaskVar(uid,taskid,MvarIndex_Exp,tonumber(exp))
		return exp
	end

	--检查表格
	local expstr = s_getTaskValue(uid,taskid,TaskValue_Exp)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的经验
		local child = s_getTaskVar(uid, taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_Exp)
		end
	end

	local exp = tonumber(expstr)
	s_addTaskVar(uid,taskid,MvarIndex_Exp,tonumber(exp))
	return exp
end

--得到任务元宝
function GetTaskGoldMoney(uid, taskid)
	--有父任务，从父任务获取
	local parent = s_getTaskVar(uid, taskid, MvarIndex_Parent)
	if parent ~= nil and parent ~= 0 then
		return GetTaskGoldMoney(uid, parent)
	end


	--检查自定义函数
	local info = GetTaskInfo(taskid)
	if info ~= nil and info.GetTaskGoldMoney ~= nil then
		local exp = info.GetTaskGoldMoney(info, uid)
		return exp
	end

	--检查表格
	local expstr = s_getTaskValue(uid,taskid,TaskValue_MoneyGold)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的经验
		local child = s_getTaskVar(uid, taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_MoneyGold)
		end
	end

	local exp = tonumber(expstr)
	return exp
end

--得到任务绑定元宝
function GetTaskBindGoldMoney(uid, taskid)
	--有父任务，从父任务获取
	local parent = s_getTaskVar(uid, taskid, MvarIndex_Parent)
	if parent ~= nil and parent ~= 0 then
		return GetTaskBindGoldMoney(uid, parent)
	end


	--检查自定义函数
	local info = GetTaskInfo(taskid)
	if info ~= nil and info.GetTaskBindGoldMoney ~= nil then
		local exp = info.GetTaskBindGoldMoney(info, uid)
		return exp
	end

	--检查表格
	local expstr = s_getTaskValue(uid,taskid,TaskValue_BindMoneyGold)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的经验
		local child = s_getTaskVar(uid, taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_BindMoneyGold)
		end
	end

	local exp = tonumber(expstr)
	return exp
end

--得到任务魔神秘典碎片
function GetTaskJadeFrament(uid, taskid)
	--有父任务，从父任务获取
	local parent = s_getTaskVar(uid, taskid, MvarIndex_Parent)
	if parent ~= nil and parent ~= 0 then
		return GetTaskJadeFrament(uid, parent)
	end


	--检查自定义函数
	local info = GetTaskInfo(taskid)
	if info ~= nil and info.GetTaskJadeFrament ~= nil then
		local exp = info.GetTaskJadeFrament(info, uid)
		return exp
	end

	--检查表格
	local expstr = s_getTaskValue(uid,taskid,TaskValue_JadeFrament)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的经验
		local child = s_getTaskVar(uid, taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_JadeFrament)
		end
	end

	local exp = tonumber(expstr)
	return exp
end

--得到任务护盾碎片
function GetTaskShieldFrament(uid, taskid)
	--有父任务，从父任务获取
	local parent = s_getTaskVar(uid, taskid, MvarIndex_Parent)
	if parent ~= nil and parent ~= 0 then
		return GetTaskShieldFrament(uid, parent)
	end


	--检查自定义函数
	local info = GetTaskInfo(taskid)
	if info ~= nil and info.GetTaskShieldFrament ~= nil then
		local exp = info.GetTaskShieldFrament(info, uid)
		return exp
	end

	--检查表格
	local expstr = s_getTaskValue(uid,taskid,TaskValue_ShieldFrament)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的经验
		local child = s_getTaskVar(uid, taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_ShieldFrament)
		end
	end

	local exp = tonumber(expstr)
	return exp
end

--得到任务宝石碎片
function GetTaskDiamondFrament(uid, taskid)
	--有父任务，从父任务获取
	local parent = s_getTaskVar(uid, taskid, MvarIndex_Parent)
	if parent ~= nil and parent ~= 0 then
		return GetTaskDiamondFrament(uid, parent)
	end


	--检查自定义函数
	local info = GetTaskInfo(taskid)
	if info ~= nil and info.GetTaskDiamondFrament ~= nil then
		local exp = info.GetTaskDiamondFrament(info, uid)
		return exp
	end

	--检查表格
	local expstr = s_getTaskValue(uid,taskid,TaskValue_DiamondFrament)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的经验
		local child = s_getTaskVar(uid, taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_DiamondFrament)
		end
	end

	local exp = tonumber(expstr)
	return exp
end

--得到任务玄印碎片
function GetTaskPearlFrament(uid, taskid)
	--有父任务，从父任务获取
	local parent = s_getTaskVar(uid, taskid, MvarIndex_Parent)
	if parent ~= nil and parent ~= 0 then
		return GetTaskPearlFrament(uid, parent)
	end


	--检查自定义函数
	local info = GetTaskInfo(taskid)
	if info ~= nil and info.GetTaskPearlFrament ~= nil then
		local exp = info.GetTaskPearlFrament(info, uid)
		return exp
	end

	--检查表格
	local expstr = s_getTaskValue(uid,taskid,TaskValue_PearlFrament)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的经验
		local child = s_getTaskVar(uid, taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_PearlFrament)
		end
	end

	local exp = tonumber(expstr)
	return exp
end

--得到任务灵戒碎片
function GetTaskRingFrament(uid, taskid)
	--有父任务，从父任务获取
	local parent = s_getTaskVar(uid, taskid, MvarIndex_Parent)
	if parent ~= nil and parent ~= 0 then
		return GetTaskRingFrament(uid, parent)
	end


	--检查自定义函数
	local info = GetTaskInfo(taskid)
	if info ~= nil and info.GetTaskRingFrament ~= nil then
		local exp = info.GetTaskRingFrament(info, uid)
		return exp
	end

	--检查表格
	local expstr = s_getTaskValue(uid,taskid,TaskValue_RingFrament)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的经验
		local child = s_getTaskVar(uid, taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_RingFrament)
		end
	end

	local exp = tonumber(expstr)
	return exp
end

--得到任务勋章碎片
function GetTaskMedalFrament(uid, taskid)
	--有父任务，从父任务获取
	local parent = s_getTaskVar(uid, taskid, MvarIndex_Parent)
	if parent ~= nil and parent ~= 0 then
		return GetTaskMedalFrament(uid, parent)
	end


	--检查自定义函数
	local info = GetTaskInfo(taskid)
	if info ~= nil and info.GetTaskMedalFrament ~= nil then
		local exp = info.GetTaskMedalFrament(info, uid)
		return exp
	end

	--检查表格
	local expstr = s_getTaskValue(uid,taskid,TaskValue_MedalFrament)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的经验
		local child = s_getTaskVar(uid, taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_MedalFrament)
		end
	end

	local exp = tonumber(expstr)
	return exp
end

--得到称号碎片
function GetTaskTitleFrament(uid, taskid)
	--有父任务，从父任务获取
	local parent = s_getTaskVar(uid, taskid, MvarIndex_Parent)
	if parent ~= nil and parent ~= 0 then
		return GetTaskTitleFrament(uid, parent)
	end


	--检查自定义函数
	local info = GetTaskInfo(taskid)
	if info ~= nil and info.GetTaskTitleFrament ~= nil then
		local exp = info.GetTaskTitleFrament(info, uid)
		return exp
	end

	--检查表格
	local expstr = s_getTaskValue(uid,taskid,TaskValue_TitleFrament)
	if expstr == nil or expstr == "" then
		expstr = "0"

		--自身经验为0，则检查随机子任务的经验
		local child = s_getTaskVar(uid, taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expstr = s_getTaskValue(uid, child, TaskValue_TitleFrament)
		end
	end

	local exp = tonumber(expstr)
	return exp
end

--得到任务经验描述
function GetTaskExpText(uid, taskid, isdesc)
	local exp = GetTaskExp(uid, taskid)

	local text1 = ""
    text1 = "exp=" .. exp .. ",";
    return text1;
	--if exp > 0 then
		--if isdesc ~= nil then
			--text1 = text1 ..[[<p>]]..TASK_EXP_ICON1 .. exp ..[[ 经验</button></p>]]
		--else
			--text1 = text1 ..[[<p>]]..TASK_EXP_ICON2 .. exp ..[[ 经验</button></p>]]
		--end
	--end

	--return text1
end


--得到道具列表的文本描述,道具格式：{{item1},{item2},}
function GetItemListText(itemlist,isdesc)
	local op = [[\]]
	if isdesc ~= nil then
		op = [[]]
	end
	if itemlist == nil or table.getn(itemlist) == 0 then
		return ""
	end
	--local text = [[<p><n color=]] .. op ..[["GXColorYellow]] .. op .. [[">固定奖励：</n></p>]]
	local text = ""
	for i = 1, table.getn(itemlist) do
		local attrs = itemlist[i][5]
		local quality = tonumber(string.match(attrs,"7%-(%d+)"))
		if quality == nil then quality = 0 end
		--text = text .. [[<p><object id=]]..op..[["]] .. itemlist[i][1] .. op ..[[" num=]]..op..[["]] ..itemlist[i][3]..op..[[" quality=]]..op..[["]]..quality..op..[[" /></p>]]
        text = text .. "{".. itemlist[i][1]..","..itemlist[i][3]..","..quality.."},"
	end
    text = "item=" .."{".. text .."}";
	return text
end

--得到可选道具列表的文本描述
function GetSelectItemListText(itemlist,isdesc)
	local op = [[\]]
	if isdesc ~= nil then
		op = [[]]
	end
	if itemlist == nil or table.getn(itemlist) == 0 then
		return ""
	end
	local text = [[<p><n font=]]..op..[["3]]..op..[[" color=]] .. op ..[["GXColorYellow]] .. op .. [[">可选奖励：</n></p>]]
	for i = 1, table.getn(itemlist) do
		local attrs = itemlist[i][5]
		local quality = string.match(attrs,",7%-(%d+)")
		if quality == nil then quality = 0 end
		text = text .. [[<p><selectobject id=]]..op..[["]] .. itemlist[i][1] .. op ..[[" num=]]..op..[["]] ..itemlist[i][3]..op..[[" quality=]] ..op..[["]]..quality..op..[[" /></p>]]
	end
    --没有可选物品，直接返回空
	return ""
end


--得到Money
function GetTaskMoney(uid, taskid)
	local parent = s_getTaskVar(uid, taskid, MvarIndex_Parent)
	if parent ~= nil and parent ~= 0 then
		return GetTaskMoney(uid, parent)
	end

	local money = s_getTaskVar(uid,taskid,MvarIndex_Money)
	if money == nil or money == 0 then
		money = s_getTaskValue(uid,taskid,TaskValue_Money)
		if money == nil or money == 0 then
			local child = s_getTaskVar(uid, taskid, MvarIndex_Child)
			if child ~= nil and child ~= 0 then
				money = s_getTaskValue(uid, child, TaskValue_Money)
			end
		end
	end

	return money
end

--得到MoneyTicket
function GetTaskMoneyTicket(uid, taskid)
	local parent = s_getTaskVar(uid, taskid, MvarIndex_Parent)
	if parent ~= nil and parent ~= 0 then
		return GetTaskMoneyTicket(uid, parent)
	end

	local moneyticket = s_getTaskValue(uid,taskid,TaskValue_MoneyTicket)
	if moneyticket == nil or moneyticket == 0 then
		local child = s_getTaskVar(uid, taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			moneyticket = s_getTaskValue(uid, child, TaskValue_MoneyTicket)
		end
	end

	return moneyticket
end

--得到GoldTicket
function GetTaskGoldTicket(uid, taskid)
	local parent = s_getTaskVar(uid, taskid, MvarIndex_Parent)
	if parent ~= nil and parent ~= 0 then
		return GetTaskGoldTicket(uid, parent)
	end

	local goldticket = s_getTaskValue(uid,taskid,TaskValue_GoldTicket)
	if goldticket == nil or goldticket == 0 then
		local child = s_getTaskVar(uid, taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			goldtickett = s_getTaskValue(uid, child, TaskValue_GoldTicket)
		end
	end

	return goldticket
end


--得到钱币字符串
function GetTaskMoneyText(uid,taskid,isdesc)
	local money = GetTaskMoney(uid, taskid)
	local moneyticket = GetTaskMoneyTicket(uid, taskid)
	local goldticket = GetTaskGoldTicket(uid, taskid)

	local text = ""
	--text = text ..[[<p>]]
	if isdesc ~= nil then
		if money ~= nil and money ~= 0 then
			--text = text .."<p>".. TASK_MONEY_ICON1 ..money..[[ 银币</button></p>]]
            text = text .. "money=" ..money .. ","
		end
		if moneyticket ~= nil and moneyticket ~= 0 then
			--text = text .."<p>".. TASK_MONEYTICKET_ICON1 ..moneyticket..[[ 绑银</button></p>]]
            text = text .. "moneyticket="..moneyticket..","
		end
		if goldticket ~= nil and goldticket ~= 0 then
			--text = text .."<p>".. TASK_GOLDTICKET_ICON1 .. goldticket..[[ 赠点</button></p>]]
            text = text .."goldticket="..goldticket..","
		end
	else
		if money ~= nil and money ~= 0 then
			--text = text .."<p>".. TASK_MONEY_ICON2 ..money..[[ 银币</button></p>]]
            text = text .. "money=" ..money .. ","
		end
		if moneyticket ~= nil and moneyticket ~= 0 then
			--text = text .."<p>".. TASK_MONEYTICKET_ICON2 ..moneyticket..[[ 绑银</button></p>]]
            text = text .. "moneyticket="..moneyticket..","
		end
		if goldticket ~= nil and goldticket ~= 0 then
			--text = text .."<p>".. TASK_GOLDTICKET_ICON2 .. goldticket..[[ 赠点</button></p>]]
            text = text .."goldticket="..goldticket..","
		end
	end
	--text = text..[[</p>]]
	return text
end

--得到成长勋章
function GetTaskGrowthMedal(uid, taskid)
	local parent = s_getTaskVar(uid, taskid, MvarIndex_Parent)
	if parent ~= nil and parent ~= 0 then
		return GetTaskGrowthMedal(uid, parent)
	end

	local growthmedal = s_getTaskVar(uid, taskid, MvarIndex_GrowthMedal)
	if growthmedal == nil or growthmedal == 0 then
		growthmedal = s_getTaskValue(uid,taskid,TaskValue_GrowthMedal)
		if growthmedal == nil or growthmedal == 0 then
			local child = s_getTaskVar(uid, taskid, MvarIndex_Child)
			if child ~= nil and child ~= 0 then
				growthmedal = s_getTaskValue(uid, child, TaskValue_GrowthMedal)
			end
		end
	end

	return growthmedal
end

--得到历练勋章
function GetTaskExpMedal(uid, taskid)
	local parent = s_getTaskVar(uid, taskid, MvarIndex_Parent)
	if parent ~= nil and parent ~= 0 then
		return GetTaskExpMedal(uid, parent)
	end

	local expmedal = s_getTaskValue(uid,taskid,TaskValue_ExpMedal)
	if expmedal == nil or expmedal == 0 then
		local child = s_getTaskVar(uid, taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			expmedal = s_getTaskValue(uid, child, TaskValue_ExpMedal)
		end
	end

	return expmedal
end


--得到战争勋章
function GetTaskWarMedal(uid, taskid)
	local parent = s_getTaskVar(uid, taskid, MvarIndex_Parent)
	if parent ~= nil and parent ~= 0 then
		return GetTaskWarMedal(uid, parent)
	end

	local warmedal = s_getTaskValue(uid,taskid,TaskValue_WarMedal)
	if warmedal == nil or warmedal == 0 then
		local child = s_getTaskVar(uid, taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			warmedal = s_getTaskValue(uid, child, TaskValue_WarMedal)
		end
	end

	return warmedal
end



--得到玩家属性字符串
function GetAttrTaskText(uid,taskid,isdesc)
	local growthmedal = GetTaskGrowthMedal(uid, taskid)
	local expmedal = GetTaskExpMedal(uid, taskid)
	local warmedal = GetTaskWarMedal(uid, taskid)

	local text = ""
	if isdesc ~= nil then
		if growthmedal ~= nil and growthmedal > 0 then
			text = text ..TASK_GROWTH_MEDAL_ICON1 ..growthmedal..[[ 成长勋章</button>]]
		end
		if expmedal ~= nil and expmedal > 0 then
			text = text ..TASK_EXP_MEDAL_ICON1 ..expmedal..[[ 历练勋章</button>]]
		end
		if warmedal ~= nil and warmedal > 0 then
			text = text .. TASK_WAR_MEDAL_ICON1 ..warmedal..[[ 战争勋章</button>]]
		end
	else
		if growthmedal ~= nil and growthmedal > 0 then
			text = text ..TASK_GROWTH_MEDAL_ICON2 ..growthmedal..[[ 成长勋章</button>]]
		end
		if expmedal ~= nil and expmedal > 0 then
			text = text ..TASK_EXP_MEDAL_ICON2 ..expmedal..[[ 历练勋章</button>]]
		end
		if warmedal ~= nil and warmedal > 0 then
			text = text .. TASK_WAR_MEDAL_ICON2 ..warmedal..[[ 战争勋章</button>]]
		end
	end
	if text ~= "" then
		text = [[<p>]] .. text ..[[</p>]]
	end
	return text
end

--得到团勋章
function GetTaskOffer(uid, taskid)
	local parent = s_getTaskVar(uid, taskid, MvarIndex_Parent)
	if parent ~= nil and parent ~= 0 then
		return GetTaskOffer(uid, parent)
	end

	local offer = s_getTaskVar(uid,taskid,MvarIndex_Offer)
	if offer == nil or offer == 0 then
		local child = s_getTaskVar(uid, taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			offer = s_getTaskVar(uid,child,MvarIndex_Offer)
		end
	end

	return offer
end

--得到团资金
function GetTaskCmoney(uid, taskid)
	local parent = s_getTaskVar(uid, taskid, MvarIndex_Parent)
	if parent ~= nil and parent ~= 0 then
		return GetTaskCmoney(uid, parent)
	end

	local cmoney = s_getTaskVar(uid,taskid,MvarIndex_Cmoney)
	if cmoney == nil or cmoney == 0 then
		local child = s_getTaskVar(uid, taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			cmoney = s_getTaskVar(uid,child,MvarIndex_Cmoney)
		end
	end

	return cmoney
end


--得到团繁荣度
function GetTaskCglory(uid, taskid)
	local parent = s_getTaskVar(uid, taskid, MvarIndex_Parent)
	if parent ~= nil and parent ~= 0 then
		return GetTaskCglory(uid, parent)
	end

	local cglory = s_getTaskVar(uid,taskid,MvarIndex_Cglory)
	if cglory == nil or cglory == 0 then
		local child = s_getTaskVar(uid, taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			cglory = s_getTaskVar(uid,child,MvarIndex_Cglory)
		end
	end

	return cglory
end

--得到团营养指数
function GetTaskChealth(uid, taskid)
	local parent = s_getTaskVar(uid, taskid, MvarIndex_Parent)
	if parent ~= nil and parent ~= 0 then
		return GetTaskChealth(uid, parent)
	end

	local chealth = s_getTaskVar(uid,taskid,MvarIndex_Chealth)
	if chealth == nil or chealth == 0 then
		local child = s_getTaskVar(uid, taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			chealth = s_getTaskVar(uid,child,MvarIndex_Chealth)
		end
	end

	return chealth
end

--得到繁荣度贡献
function GetTaskAllGlory(uid, taskid)
	local parent = s_getTaskVar(uid, taskid, MvarIndex_Parent)
	if parent ~= nil and parent ~= 0 then
		return GetTaskAllGlory(uid, parent)
	end

	local allglory = s_getTaskVar(uid,taskid,MvarIndex_AllGlory)
	if allglory == nil or allglory == 0 then
		local child = s_getTaskVar(uid, taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			allglory = s_getTaskVar(uid,child,MvarIndex_AllGlory)
		end
	end

	return allglory
end

--得到声望
function GetTaskPrestige(uid, taskid)
	local parent = s_getTaskVar(uid, taskid, MvarIndex_Parent)
	if parent ~= nil and parent ~= 0 then
		return GetTaskPrestige(uid, parent)
	end

	local prestige = s_getTaskVar(uid,taskid,MvarIndex_Prestige)
	if prestige == nil or prestige == 0 then
		local child = s_getTaskVar(uid, taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			prestige = s_getTaskVar(uid,child,MvarIndex_Prestige)
		end
	end

	return prestige
end


--返回团奖励文本
function GetTaskCorpsAwardText(uid, taskid, isdesc)
	local offer = GetTaskOffer(uid, taskid)
	local cmoney = GetTaskCmoney(uid, taskid)
	local cglory = GetTaskCglory(uid, taskid)
	local chealth = GetTaskChealth(uid, taskid)
	local prestige = GetTaskPrestige(uid, taskid)

	local text1 = ""
	if isdesc ~= nil then
		if offer > 0 then
			text1 = text1 ..[[<p> ]].. TASK_CONTRI_ICON1 .. offer ..[[ 团勋章</button></p>]]
		end
		if cmoney > 0 then
			text1 = text1 ..[[<p> ]].. TASK_CORP_MONEY_ICON1 .. cmoney ..[[ 资金</button></p>]]
		end
		if cglory > 0 then
			text1 = text1 ..[[<p>]].. TASK_CORP_GLORY_ICON1 .. cglory ..[[ 繁荣度</button></p>]]
		end
		if chealth > 0 then
			text1 = text1 ..[[<p>]].. TASK_CORP_HEALTH_ICON1 .. chealth ..[[ 营养指数</button></p>]]
		end
		if prestige > 0 then
			text1 = text1 ..[[<p>]].. TASK_PRESTIGE_ICON1 .. prestige ..[[ 声望</button></p>]]
		end
	else
		if offer > 0 then
			text1 = text1 ..[[<p> ]].. TASK_CONTRI_ICON2 .. offer ..[[ 团勋章</button></p>]]
		end
		if cmoney > 0 then
			text1 = text1 ..[[<p> ]].. TASK_CORP_MONEY_ICON2 .. cmoney ..[[ 资金</button></p>]]
		end
		if cglory > 0 then
			text1 = text1 ..[[<p>]].. TASK_CORP_GLORY_ICON2 .. cglory ..[[ 繁荣度</button></p>]]
		end
		if chealth > 0 then
			text1 = text1 ..[[<p>]].. TASK_CORP_HEALTH_ICON2 .. chealth ..[[ 营养指数</button></p>]]
		end
		if prestige > 0 then
			text1 = text1 ..[[<p>]].. TASK_PRESTIGE_ICON2 .. prestige ..[[ 声望</button></p>]]
		end
	end
	return text1
end

--返回固定奖励道具列表
function GetTaskAwardItem(uid, taskid)
	local parent = s_getTaskVar(uid, taskid, MvarIndex_Parent)
	if parent ~= nil and parent ~= 0 then
		return GetTaskAwardItem(uid, parent)
	end

	local awarditem = nil
	local info = GetTaskInfo(taskid)
	if info ~= nil and info.awarditem ~= nil and table.getn(info.awarditem) ~= 0 then
		awarditem = info.awarditem
	else
		local child = s_getTaskVar(uid, taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			local childinfo = GetTaskInfo(child)
			if childinfo ~= nil and childinfo.awarditem ~= nil and table.getn(childinfo.awarditem) ~= 0 then
				awarditem = childinfo.awarditem
			end
		end
	end

	return awarditem
end


--返回选择奖励道具列表
function GetTaskSelectItem(uid, taskid)
	local parent = s_getTaskVar(uid, taskid, MvarIndex_Parent)
	if parent ~= nil and parent ~= 0 then
		return GetTaskSelectItem(uid, parent)
	end

	local selectitem = nil
	local info = GetTaskInfo(taskid)
	if info ~= nil and info.selectitem ~= nil and table.getn(info.selectitem) ~= 0 then
		selectitem = info.selectitem
	else
		local child = s_getTaskVar(uid, taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			local childinfo = GetTaskInfo(child)
			if childinfo ~= nil and childinfo.selectitem ~= nil and table.getn(childinfo.selectitem) ~= 0 then
				selectitem = childinfo.selectitem
			end
		end
	end

	return selectitem
end

--返回奖励文本描述
function GetTaskAwardText(uid, taskid, isdesc)
	local text1 = ""
	--if isdesc ~= nil then
		--text1 = [[<p><n color="GXColorYellow" font="3">任务奖励</n></p>]]
	--else
		--text1 = [[<p><n color=\"GXColorYellow\" font=\"3\">任务奖励</n></p>]]
	--end
	text1 = text1 ..GetTaskExpText(uid, taskid, isdesc)
	text1 = text1 ..GetTaskMoneyText(uid,taskid, isdesc)
	--text1 = text1 ..GetAttrTaskText(uid,taskid, isdesc)
	--text1 = text1 ..GetTaskCorpsAwardText(uid,taskid, isdesc)

	local awarditem = GetTaskAwardItem(uid, taskid)
	local selectitem = GetTaskSelectItem(uid, taskid)
	text1 = text1 .. GetItemListText(awarditem, isdesc) .. GetSelectItemListText(selectitem, isdesc)
	return text1
end

--返回子任务的名字
function GetTaskName(taskid)
	--表格中定义
	local info = GetTaskInfo(taskid)
	if info ~= nil then
		return info.name
	end

	return ""
end

--刷新任务追踪
function RefreshTaskTrace(uid, taskid)
	local taskProcess = s_getTaskValue(uid, taskid, TaskValue_Process)
	if taskProcess ~= TaskProcess_Doing and taskProcess ~= TaskProcess_CanDone then return end

	local info = GetTaskInfo(taskid)
	if info == nil then return end

	if info.GetTaskTraceText ~= nil then
		local text = info.GetTaskTraceText(info, uid)
		if text ~= nil and text ~= "" then
			s_refreshTaskTrace(uid, taskid, text)
		end
		return
	end

	local subtaskid = s_getTaskVar(uid, taskid, MvarIndex_SubTask)
	if subtaskid > info.subtasknum then subtaskid = info.subtasknum end
	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	if subinfo == nil then return end

	if taskProcess == TaskProcess_Doing and subinfo.tracebegin ~= nil and subinfo.tracebegin ~= "" then
		s_refreshTaskTrace(uid,taskid,subinfo.tracebegin)
	end

	if taskProcess == TaskProcess_CanDone and subinfo.traceend ~= nil and traceend ~= "" then
		s_refreshTaskTrace(uid,taskid,subinfo.traceend)
	end
end

--返回子任务接受时的文本描述
function GetSubTaskAcceptText(uid, taskid, subtaskid)
	local text1 = nil

	--自定义函数
	local info = GetTaskInfo(taskid)
	if info ~= nil and info.GetSubTaskAcceptText ~= nil then
		text1 = info.GetSubTaskAcceptText(info, uid, taskid, subtaskid)
	end

	--脚本中或者表格中定义
	if text1 == nil or text1 == "" then
		local subinfo = GetSubTaskInfo(taskid, subtaskid)
		if subinfo ~= nil and subinfo.accepttext ~= "" then
			text1 = subinfo.accepttext
		end
	end

	if text1 == nil then return "" end
	text1 = "text=".."'"..taskid.."'"..","
	--text1 = text1 ..[[<p><newline></newline></p>]]

	--奖励
	text1 =  text1 ..GetTaskAwardText(uid, taskid)..GetSubTaskCustomeText(uid,taskid)
	return text1
end

--返回自定义信息
function GetSubTaskCustomeText(uid,taskid)
    if IsMainNormalTask(taskid) == VALUE_OK then
        return ""
    end
	--自定义函数
    local info = GetTaskInfo(taskid)
    if info ~= nil and info.GetSubTaskCustomeText ~= nil then
        return info.GetSubTaskCustomeText(info,uid,taskid)
    end
    return ""
end

--返回子任务文本描述
function GetSubTaskDescText(uid, taskid, subtaskid)
	local text1 = nil

	--自定义函数
	local info = GetTaskInfo(taskid)
	if info ~= nil and info.GetSubTaskDescText ~= nil then
		text1 = info.GetSubTaskDescText(info, uid, taskid, subtaskid)
	end

	--脚本中或者表格中定义
	if text1 == nil or text1 == "" then
		local subinfo = GetSubTaskInfo(taskid, subtaskid)
		if subinfo ~= nil and subinfo.desctext ~= "" then
			text1 = subinfo.desctext
		end
	end

	if text1 == nil then return "" end
	text1 = trim(text1)
	text1 = text1 ..[[<p><newline></newline></p>]]

	--奖励
	text1 = text1 ..GetTaskAwardText(uid, taskid, VALUE_OK)

	--因为是经常调用的函数，所以把一些必须做的事情放这，以后有好的想法再调整
	--添加收集物件到RoleTask中
	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	if subinfo ~= nil and subinfo.collectitem ~= nil then
		s_addTaskMaterial(uid, taskid, subinfo.collectitem)
	end

	return text1
end

--返回子任务没有完成时的文本描述
function GetSubTaskPromptText(uid, taskid, subtaskid)
	local text1 = nil

	--自定义函数
	local info = GetTaskInfo(taskid)
	if info ~= nil and info.GetSubTaskPromptText ~= nil then
		text1 = info.GetSubTaskPromptText(info, uid, taskid, subtaskid)
	end

	--脚本中或者表格中定义
	if text1 == nil or text1 == "" then
		local subinfo = GetSubTaskInfo(taskid, subtaskid)
		if subinfo ~= nil and subinfo.prompttext ~= "" then
			text1 = subinfo.prompttext
		end
	end

	if text1 == nil then return "" end
	text1 = "text=".."'"..taskid.."'"..","
	--text1 = text1 ..[[<p><newline></newline></p>]]
	--奖励
    if IsMainNormalTask(taskid) == VALUE_FAIL then
        text1 = text1 ..GetTaskAwardText(uid, taskid)..GetSubTaskCustomeText(uid,taskid)
    end

	return text1
end

--返回子任务完成时的文本描述
function GetSubTaskFinishText(uid, taskid, subtaskid)
	local text1 = nil

	--自定义函数
	local info = GetTaskInfo(taskid)
	if info ~= nil and info.GetSubTaskFinishText ~= nil then
		text1 = info.GetSubTaskFinishText(info, uid, taskid, subtaskid)
	end

	--脚本中或者表格中定义
	if text1 == nil or text1 == "" then
		local subinfo = GetSubTaskInfo(taskid, subtaskid)
		if subinfo ~= nil and subinfo.finishtext ~= "" then
			text1 = subinfo.finishtext
		end
	end

	if text1 == nil then return "" end
	text1 = "text=".."'"..taskid.."'"..","
	--text1 = text1 ..[[<p><newline></newline></p>]]

	--奖励
	text1 = text1 ..GetTaskAwardText(uid, taskid)..GetSubTaskCustomeText(uid,taskid)
	return text1
end


--返回子任务的提示
function GetSubTaskTip(uid, taskid, subtaskid)
	local text1 = nil

	--自定义函数
	local info = GetTaskInfo(taskid)
	if info ~= nil and info.GetSubTaskTip ~= nil then
		text1 = info.GetSubTaskTip(info, uid, taskid, subtaskid)
	end

	--脚本中或者表格中定义
	if text1 == nil or text1 == "" then
		local subinfo = GetSubTaskInfo(taskid, subtaskid)
		if subinfo ~= nil and subinfo.tip ~= nil and subinfo.tip ~= "" then
			text1 = subinfo.tip
		end
	end

	if text1 == nil then return "" end
	text1 = trim(text1)
	return text1
end


--获得任务检索（可接任务）中任务简介
function GetTaskIntroText(uid,taskid)
	local text1 = nil

	--自定义函数
	local info = GetTaskInfo(taskid)
	if info ~= nil and info.GetTaskIntroText ~= nil then
		text1 = info.GetTaskIntroText(info, uid, taskid)
		text1 = trim(text1)
		text1 = text1 ..[[<p><newline></newline></p>]]
	else
		local name = GetTaskName(taskid) or "#" .. tostring(task)
		text1 = string.format([[<p><n color="GXColorYellow" font="3">%s</n></p><p><newline></newline></p>]],name)

		--奖励
		text1 = text1 ..GetTaskAwardText(uid, taskid, VALUE_OK)
	end
	return text1
end

--增加一个子任务
function AddRoleSubTask(uid, taskid, subtaskid, state, operate, color, child, endnpcid)
	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	if subinfo == nil then
		return VALUE_FAIL
	end
	local info = GetTaskInfo(taskid)
	if info == nil then return end

	if color == nil or color == TaskColor_White then
		if subinfo.color ~= nil then
			color = subinfo.color
		else
			color = TaskColor_White
		end
	end

	--检查是否满足条件
	if RunCheckList(uid, taskid, subtaskid, subinfo.onacceptcheck, 1) == VALUE_FAIL then
		return VALUE_FAIL
	end
	if RunCheckList(uid, taskid, subtaskid, subinfo.onacceptcheck1, 1) == VALUE_FAIL then
		return VALUE_FAIL
	end
	if info.OnAcceptCheck ~= nil then
		if info.OnAcceptCheck(info, uid, taskid, subtaskid) == VALUE_FAIL then
			return VALUE_FAIL
		end
	end

	--若是第一个子任务，则先增加总任务
	local taskProcess = s_getTaskValue(uid,taskid,TaskValue_Process)
	if subtaskid == 1 then
		if taskProcess ~= TaskProcess_Done and taskProcess ~= TaskProcess_None then
			return VALUE_FAIL
		end

		--检查环任务次数
		if CheckRoundAndRing(uid, taskid) == VALUE_FAIL then
			return VALUE_FAIL
		end

		local log = 1
		if child ~= nil and child ~= 0 then log = 0 end
		s_addTask(uid, taskid, color, state, operate, log)

		--加任务后
		--环任务，初始化轮数和环数，任务完成时再加1
		if info.ring ~= nil then
			--检查是否有跨天
			local nowDay = s_getCurTime(TIME_ALLDAYS)
			local lastDay = s_getVar(uid,taskid,TvarIndex_Day)
			local curRound = 1
			local curRing = 1

			if lastDay == 0 or lastDay ~= nowDay then
				curRound = 1
				curRing = 1
			else
				curRound = s_getVar(uid, taskid, TvarIndex_CurRound)
				curRing = s_getVar(uid, taskid, TvarIndex_CurRing)
				if curRound == 0 then curRound = 1 end
				if curRing == 0 then curRing = 1 end
			end

			s_addVar(uid, taskid, TvarIndex_Day, nowDay)
			s_addVar(uid, taskid, TvarIndex_CurRound, curRound)
			s_addVar(uid, taskid, TvarIndex_CurRing, curRing)
			s_refreshDayTaskNum(uid,taskid,(curRound-1)*info.ring + curRing-1)
		end

		--记录任务步骤数，只记录 >1 的情况
		if info.subtasknum ~= nil and info.subtasknum > 1 then
			s_addTaskVar(uid, taskid, MvarIndex_SubTaskNum, info.subtasknum)
		end

		--记录父任务变量
		if info.parent ~= nil and info.parent ~= 0 then
			s_addTaskVar(uid,taskid,MvarIndex_Parent,info.parent)
		end

		--记录子任务变量
		if child ~= nil and child ~= 0 then
			s_addTaskVar(uid, taskid, MvarIndex_Child, child)
		end

		--处理接收任务时的操作
		if info.OnAcceptTask ~= nil then
			info.OnAcceptTask(info, uid)
		end
	else
		if taskProcess == TaskProcess_None then
			return VALUE_FAIL
		end
	end

	--记录当前任务步骤
	s_addTaskVar(uid, taskid, MvarIndex_SubTask, subtaskid)

	--记录EndNpcID
	if endnpcid == nil or endnpcid == 0 then
		endnpcid = s_getTaskValue(uid, taskid, TaskValue_EndNpc)
	end
	s_addTaskVar(uid, taskid, MvarIndex_EndNpcID, endnpcid)

	--任务需求道具添加
	if subinfo.needitem ~= nil and table.getn(subinfo.needitem) ~= 0 then
		local reason = string.format("任务(%d-%d)需求道具",taskid, subtaskid)
		for i = 1,table.getn(subinfo.needitem) do
			local item = subinfo.needitem[i]
			s_addItem(uid,item[1],item[2],item[3],item[4],item[5],reason)
		end
	end

	--任务属性
	if subtaskid ~= 1 then
		s_setTaskValue(uid, taskid, TaskValue_State, state)
		s_setTaskValue(uid, taskid, TaskValue_Operate, operate)
		s_setTaskValue(uid, taskid, TaskValue_Color, color)
	end

	--任务描述
	desc = GetSubTaskDescText(uid, taskid, subtaskid)
	if desc ~= nil then
		s_setTaskValue(uid,taskid,TaskValue_Desc,desc,1)
	end

	--刷新任务追踪
	RefreshTaskTrace(uid, taskid)

	--客户端系统消息:父任务不显示
	if child == nil or child == 0 then
		--s_sysInfo(uid,"您接受了 "..GetTaskName(taskid).." 任务",ChatPos_Tips)
		local textTip = GetSubTaskTip(uid, taskid, subtaskid)
		if textTip ~= nil and textTip ~= "" then
			--s_sysInfo(uid,textTip,ChatPos_Tips)
		end
	end

	--处理接收子任务时事件
	RunActionList(uid, taskid, subtaskid, subinfo.onaccept)

	--如果是自动完成的子任务，就自动完成
	taskProcess = s_getTaskValue(uid,taskid,TaskValue_Process)
	if taskProcess == TaskProcess_CanDone then
		if subinfo.autofinish ~= nil and subinfo.autofinish == true then
			FinishRoleSubTask(uid, taskid, subtaskid)
		end
	end

	return VALUE_OK
end

--增加一个子任务进程
function AddRoleTaskOperate(uid,taskid,tip,addop)
	local taskProcess = s_getTaskValue(uid,taskid,TaskValue_Process)
	if taskProcess == nil or taskProcess ~= TaskProcess_Doing then
		return VALUE_FAIL
	end
	if addop == nil then addop = 1 end
	local op = s_getTaskValue(uid,taskid,TaskValue_Operate)
	s_setTaskValue(uid,taskid,TaskValue_Operate,op+addop)

	--执行当前进程事件
	local subtaskid = s_getTaskVar(uid, taskid, MvarIndex_SubTask)
	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	if subinfo ~= nil then
		onoperate = rawget(subinfo, "onoperate_" .. (op+addop))
		if onoperate ~= nil then
			RunActionList(uid, taskid, subtaskid, onoperate)
		end
	end

	--客户端提示进度
	local process = s_getTaskValue(uid,taskid,TaskValue_Process)
	local name = GetTaskName(taskid)
	local state = s_getTaskValue(uid,taskid,TaskValue_State)
	if name ~= nil and state ~= nil and state > 1 then
		local msg = ""
		if tip == nil or tip == "" then
			if op+addop > state then
				msg = name.." ".."完成度 ".. state .."/"..state
			else
				msg = name.." ".."完成度 ".. op+addop .."/"..state
			end
		else
			msg = name.." "..tip
		end
		--s_sysInfo(uid,msg,ChatPos_Tips)
	end

	local info = GetTaskInfo(taskid)
	if process == TaskProcess_CanDone then
		if info ~= nil and subtaskid ~= nil and name ~= nil and state >= 1 and info.subtasknum <= subtaskid then
			local msg = "任务 " .. name .. " 已经完成"
			--s_sysInfo(uid,msg,ChatPos_Tips)
		end

		--刷新任务追踪
		RefreshTaskTrace(uid, taskid)

		--如果是自动完成的子任务，就自动完成
		if subinfo ~= nil and subinfo.autofinish ~= nil and subinfo.autofinish == true then
			FinishRoleSubTask(uid, taskid, subtaskid)
		end
	end

	return VALUE_OK
end


--检查子任务是否可完成
function CheckSubTaskFinishShower(uid, taskid, subtaskid)
	local process = s_getTaskValue(uid,taskid,TaskValue_Process)
	if process == TaskProcess_None then
		return VALUE_FAIL
	end

	--当前子任务ID检查
	local subid = s_getTaskVar(uid, taskid, MvarIndex_SubTask )
	if subid == nil or subid ~= subtaskid then
		return VALUE_FAIL
	end

	if process ~= TaskProcess_CanDone and process ~= TaskProcess_Doing then
		return VALUE_FAIL
	end

	--自定义完成检查
	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	if subinfo == nil then return VALUE_OK end
	if RunCheckList(uid, taskid, subtaskid, subinfo.onfinishcheck) == VALUE_FAIL then
		return VALUE_FAIL
	end

	local info = GetTaskInfo(taskid)
	if info ~= nil and info.OnFinishCheck ~= nil then
		if info.OnFinishCheck(info, uid, taskid, subtaskid) == VALUE_FAIL then
			return VALUE_FAIL
		end
	end
	return VALUE_OK
end


--子任务完成，根据情况启动下一个子任务或者结束总任务
function FinishRoleSubTask(uid, taskid, subtaskid)
	local info = GetTaskInfo(taskid)
	if info == nil then return end

	local awarditem = GetTaskAwardItem(uid, taskid)
    if awarditem ~= nil and s_getAutoPackSpace(uid) < table.getn(awarditem) then
        s_sysInfo(uid,"您的背包已满,请清理背包!",ChatPos_Tips)
        s_sendCustomNotice(uid,1);
        return;
    end
	--当前子任务ID检查，有可能子任务中有跳转到其他子任务，信任数据库中子任务
	local subid = s_getTaskVar(uid, taskid, MvarIndex_SubTask)
	if subid == nil then return end
	if subtaskid ~= subid then subtaskid = subid end

	--完成条件再次检查
	subinfo = GetSubTaskInfo(taskid, subtaskid)
	if subinfo == nil then return end
	if RunCheckList(uid, taskid, subtaskid, subinfo.onfinishcheck, 1) == VALUE_FAIL then return end
	if RunCheckList(uid, taskid, subtaskid, subinfo.onfinishcheck1, 1) == VALUE_FAIL then return end
	if info.OnFinishCheck ~= nil then
		if info.OnFinishCheck(info, uid, taskid, subtaskid) == VALUE_FAIL then return end
	end

	--检查下个子任务的可接取情况，比如taskGuard是否在拉车状态
	if subtaskid < info.subtasknum then
		local nextsubinfo = GetSubTaskInfo(taskid, subtaskid+1)
		if nextsubinfo ~= nil then
			if nextsubinfo.onacceptcheck ~= nil or nextsubinfo.onacceptcheck1 ~= nil then
				if RunCheckList(uid, taskid, subtaskid+1, nextsubinfo.onacceptcheck, 1) == VALUE_FAIL then return end
				if RunCheckList(uid, taskid, subtaskid+1, nextsubinfo.onacceptcheck1, 1) == VALUE_FAIL then return end
			end
		end
	end

	--处理完成子任务时操作，最后一个步骤的完成操作放到整个任务的完成操作中，避免最后交任务出现异常
	if subtaskid < info.subtasknum then
		RunActionList(uid, taskid, subtaskid, subinfo.onfinish)

		--如果有收集道具，则删除道具收集列表
		if subinfo.collectitem ~= nil then
			s_removeAllTaskMaterial(uid, taskid)
		end
		if subinfo.dropitem ~= nil then
			s_removeAllTaskDropItem(uid,subinfo.dropitem)
		end

	end

	if subtaskid >= info.subtasknum then
		--最后一个子任务，直接完成总任务
		FinishRoleTask(uid, taskid)
	else
		-- 自动接下一个子任务
		subtaskid = subtaskid + 1
		local subinfo = GetSubTaskInfo(taskid, subtaskid)
		if subinfo == nil or subinfo.task == nil or table.getn(subinfo.task) == 0  then
			FinishRoleTask(uid, taskid)
			return
		end

		--清空父子关系，并删除子任务，以免麻烦
		local child = s_getTaskVar(uid, taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			s_addTaskVar(uid, taskid, MvarIndex_Child, 0)
			s_addTaskVar(uid, child, MvarIndex_Parent, 0)
			s_delTask(uid, child)
		end

		--由接收函数中执行添加子任务(AddRoleSubTask)的操作
		subinfo.task[1](taskid, subtaskid, subinfo.task[2], uid)
	end
end


--通用的任务奖励
function CommonTaskReward(uid, taskid)
	--可选奖励处理

	local info = GetTaskInfo(taskid)
	local item_list = {}
	local awarditem = GetTaskAwardItem(uid, taskid)
	if awarditem ~= nil and table.getn(awarditem) > 0 then
		for i = 1, table.getn(awarditem) do
			table.insert(item_list,awarditem[i])
		end
	end

	local selectitem = GetTaskSelectItem(uid, taskid)
	if selectitem ~= nil and table.getn(selectitem) > 0 then
		local option = s_getVar(uid,1,2)
		if option == 0 then
			s_sysInfo(uid,"还没有选择奖励",ChatPos_MsgBox)
			local finish = GetSubTaskFinishText(uid, taskid, info.subtasknum)
			if finish ~= nil then
				local str = "FinishRoleTask($1," .. taskid .. ")"
				ShowNpcMenuBottomStyle(uid,finish,"完成(5)",str,"离开(5)")
				return
			end
		else
			if selectitem[option] ~= nil then
				table.insert(item_list,selectitem[option])
			end
		end
	end
	if item_list ~= nil and table.getn(item_list) > 0 then
		local reason = string.format("完成任务(%d)奖励",taskid)
		for i = 1,table.getn(item_list) do
			local item = item_list[i]
			s_addItem(uid,item[1],item[2],item[3],item[4],item[5],reason,0,AddItemAction_Task)
		end
		s_getItemLimitState(uid)
	end

	local exp = GetTaskExp(uid,taskid)
	if exp ~= nil then
		local tasktype = s_getTaskValue(uid,taskid,TaskValue_Type)
		if tasktype == TaskType_Normal or tasktype == TaskType_Sub then
			s_refreshExp(uid,exp,ExpType_MainTask,taskid)
		else
			s_refreshExp(uid,exp,ExpType_OptionalTask,taskid)
		end
	end

	--佣兵（称号）积分
    local lilian = GetTaskLilian(uid,taskid)
    if lilian ~= nil  and lilian ~= 0 then
        s_setVar(uid,140,5,lilian + s_getVar(uid,140,5))
		s_sendNewSpecialItemTips(uid,ItemID_Special_TitleFragment,lilian)
    end

    --元宝奖励
    local goldmoney = GetTaskGoldMoney(uid,taskid)
    if goldmoney ~= nil and goldmoney ~= 0 then
		s_addMoney(uid,MoneyType_Gold,goldmoney,"任务"..taskid.."奖励",AddItemAction_Task)
    end

    --绑定元宝奖励
    local bindgoldmoney = GetTaskBindGoldMoney(uid,taskid)
    if bindgoldmoney ~= nil and bindgoldmoney ~= 0 then
		s_addMoney(uid,MoneyType_Gold,bindgoldmoney,"任务"..taskid.."奖励",AddItemAction_Task)
    end

    --魔神秘典碎片
    local jadeFrament = GetTaskJadeFrament(uid,taskid)
    if jadeFrament ~= nil and jadeFrament ~= 0 then
        s_setVar(uid,140,3,jadeFrament + s_getVar(uid,140,3))
		s_sendNewSpecialItemTips(uid,ItemID_Special_JadeFragment,jadeFrament)
    end

    --宝石碎片
    local dimaondFrament = GetTaskDiamondFrament(uid,taskid)
    if dimaondFrament ~= nil and dimaondFrament ~= 0 then
        s_setVar(uid,140,1,dimaondFrament + s_getVar(uid,140,1))
		s_sendNewSpecialItemTips(uid,ItemID_Special_DiamondFragment,dimaondFrament)
    end

    --玄印碎片
    local pearlFrament = GetTaskPearlFrament(uid,taskid)
    if pearlFrament ~= nil and pearlFrament ~= 0 then
        s_setVar(uid,140,2,pearlFrament + s_getVar(uid,140,2))
		s_sendNewSpecialItemTips(uid,ItemID_Special_PearlFragment,pearlFrament)
    end

    --护盾碎片
    local shieldFrament = GetTaskShieldFrament(uid,taskid)
    if pearlFrament ~= nil and pearlFrament ~= 0 then
        s_setVar(uid,140,61,shieldFrament + s_getVar(uid,140,61))
		s_sendNewSpecialItemTips(uid,ItemID_Special_ShieldFragment,shieldFrament)
    end

    --灵戒碎片
    local ringFrament = GetTaskRingFrament(uid,taskid)
    if ringFrament ~= nil and ringFrament ~= 0 then
        s_setVar(uid,140,9,ringFrament + s_getVar(uid,140,9))
		s_sendNewSpecialItemTips(uid,ItemID_Special_RingFragment,ringFrament)
    end

    --勋章碎片
    local medalFrament = GetTaskMedalFrament(uid,taskid)
    if medalFrament ~= nil and medalFrament ~= 0 then
        s_setVar(uid,140,4,medalFrament + s_getVar(uid,140,4))
		s_sendNewSpecialItemTips(uid,ItemID_Special_AchievementPoint,medalFrament)
    end

    --称号碎片
    local titleFrament = GetTaskTitleFrament(uid,taskid)
    if titleFrament ~= nil and titleFrament ~= 0 then
        s_setVar(uid,140,5,titleFrament + s_getVar(uid,140,5))
		s_sendNewSpecialItemTips(uid,ItemID_Special_TitleFragment,titleFrament)
    end

	local money = GetTaskMoney(uid, taskid)
    --s_debug("money="..money)
	if money ~= nil and money ~= 0 then
		s_addMoney(uid,	MoneyType_MoneyTicket,money,"任务"..taskid.."奖励",AddItemAction_Task)
	end
	--local moneyticket = GetTaskMoneyTicket(uid, taskid)
	--if moneyticket ~= nil and moneyticket ~= 0 then
		--s_addMoney(uid,MoneyType_MoneyTicket,moneyticket,"任务"..taskid.."奖励",AddItemAction_Task)
	--end
	--local goldticket = GetTaskGoldTicket(uid, taskid)
	--if goldticket ~= nil and goldticket ~= 0 then
		--s_addMoney(uid,MoneyType_GoldTicket,goldticket,"任务"..taskid.."奖励",AddItemAction_Task)
	--end
	local growthmedal = GetTaskGrowthMedal(uid, taskid)
	if growthmedal ~= nil and growthmedal ~= 0 then
		s_addValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_GROWTH_MEDAL,growthmedal)
	end
	local expmedal = GetTaskExpMedal(uid, taskid)
	if expmedal ~= nil and expmedal ~= 0 then
		s_addValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_EXP_MEDAL,expmedal)
	end
	local warmedal = GetTaskWarMedal(uid, taskid)
	if warmedal ~= nil and warmedal ~= 0 then
		s_addValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_WAR_MEDAL,warmedal)
	end

	--团勋章
	local offer = GetTaskOffer(uid, taskid)
	if offer ~= nil and offer ~= 0 then
		s_addField(uid,UserVar_Offer,offer)
	end

	--团资金
	local cmoney = GetTaskCmoney(uid, taskid)
	if cmoney ~= nil and cmoney ~= 0 then
	end

	--团繁荣度
	local cglory = GetTaskCglory(uid, taskid)
	if cglory ~= nil and cglory ~= 0 then
		local corps = s_getCorpsId(uid)
		if corps ~= 0 then
			s_addCorpsField(corps,CorpVar_Glory,1)
		end
	end

	--营养指数
	local chealth = GetTaskChealth(uid, taskid)
	if chealth ~= nil and chealth ~= 0 then
	end

	--声望
	local prestige = GetTaskPrestige(uid, taskid)
	if prestige ~= nil and prestige ~= 0 then
		s_addValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_ALL_PRESTIGE,prestige)
	end

	--繁荣度贡献
	local allglory = GetTaskAllGlory(uid, taskid)
	if allglory ~= nil and allglory ~= 0 then
		s_addField(uid,UserVar_AllGlory,allglory)
	end
end

--完成总任务
function FinishRoleTask(uid, taskid, typeid)

	if taskid >= 10001 and taskid <= 10020 then
		if typeid == 2 then
		else
			return 
		end
	end


	local taskProcess = s_getTaskValue(uid,taskid,TaskValue_Process)
	--暂时不用检查，走到这步一定是完成了
	--	if taskProcess ~= TaskProcess_CanDone then
	--		return VALUE_FAIL
	--	end

	local info = GetTaskInfo(taskid)
	if info == nil then return VALUE_FAIL end

	local selectitem = GetTaskSelectItem(uid, taskid)
	if selectitem ~= nil and table.getn(selectitem) > 0 then
		local option = s_getVar(uid,1,2)
		if option == 0 then
			s_messageBox(uid,"还没有选择奖励")
			local finish = GetSubTaskFinishText(uid, taskid, info.subtasknum)
			if finish ~= nil then
				local str = "FinishRoleTask($1," .. taskid .. ")"
				ShowNpcMenuBottomStyle(uid,finish,"完成(5)",str,"离开(5)")
				return
			end
		end
	end

    --奖励：如果是父子子任务，则不给奖励，由父任务给予
	local parent = s_getTaskVar(uid, taskid, MvarIndex_Parent)
	if parent == nil or parent == 0 then
        if info.TaskReward ~= nil then
            local subtaskid = s_getTaskVar(uid, taskid, MvarIndex_SubTask)
            info.TaskReward(info, uid, taskid, subtaskid)
        else
            CommonTaskReward(uid, taskid)
        end
    end

	--结束任务
	local log = 1
	local child = s_getTaskVar(uid, taskid, MvarIndex_Child)
	if child ~= nil and child ~= 0 then log = 0 end
	s_finishTask(uid,taskid,log)

	--总任务完成时的操作
	if info ~= nil then
		--最后一个步骤的完成操作
		local subinfo = GetSubTaskInfo(taskid, info.subtasknum)
		if subinfo ~= nil then
			RunActionList(uid, taskid, info.subtasknum, subinfo.onfinish)

			--如果有收集道具，则删除道具收集列表
			if subinfo.collectitem ~= nil then
				s_removeAllTaskMaterial(uid, taskid)
			end
			if subinfo.dropitem ~= nil then
				s_removeAllTaskDropItem(uid,subinfo.dropitem)
			end
		end

		RunActionList(uid, taskid, 0, info.onfinish)

		if info.OnFinishTask ~= nil then
			info.OnFinishTask(info, uid)
		end
	end

	--客户端消息：如果是父子子任务，则不发消息给客户端，由父任务发送
	if parent == nil or parent == 0 then
		local name = GetTaskName(taskid)
		if name ~= nil then
			--s_sysInfo(uid,name .."任务完成",ChatPos_Tips)
		end

		--播放特效
		ShowUserSfx(uid,31)
	end

	--父子子任务调用父任务的结束流程
	if parent ~= nil and parent ~= 0 then
		local parentsubid = s_getTaskVar(uid, parent, MvarIndex_SubTask)

		AddRoleTaskOperate(uid, parent)
		FinishRoleSubTask(uid, parent, parentsubid)

		--清除父子关系
		s_addTaskVar(uid,taskid,MvarIndex_Parent,0)
	end

	--清空父子关系，并删除子任务，以免麻烦
	local child = s_getTaskVar(uid, taskid, MvarIndex_Child)
	if child ~= nil and child ~= 0 then
		s_addTaskVar(uid, taskid, MvarIndex_Child, 0)
		s_addTaskVar(uid, child, MvarIndex_Parent, 0)
		s_delTask(uid, child)
	end

	--环任务，删掉自身，免得麻烦
	if info.ring ~= nil then
		s_delTask(uid, taskid)
	end

	--主线任务完成弹出NPC对话框，任何疑问，问题请联系王总
	if IsMainNormalTask(taskid) == VALUE_OK then
		local endnpc = s_getTaskValue(uid,taskid,TaskValue_EndNpc)
		local info = rawget(_G,"NpcMenuInfo" .. endnpc)
		--if info ~= nil then
			--ShowNpcMenuByTable(uid,info)
		--end
	end
	--跨区完成任务 本区的也完成
	if s_getCurrentZoneID() ~= s_getOldZoneID(uid) and s_getOldZoneID(uid) ~= 0 then
		s_finishTaskOldZone(uid,taskid)
	end
	if taskid >= 10001 and taskid <= 10020 then
		if taskid ~= 10020 then
			--s_debug("000000000000000000000000")
			taskid = taskid + 1
			AddRoleTaskForGM(uid,taskid)
		end
	end
	return VALUE_OK
end


--删除任务
function OnDeleteRoleTask(uid, taskid)
	local info = GetTaskInfo(taskid)
	if info == nil then return end

	local subtaskid = s_getTaskVar(uid, taskid, MvarIndex_SubTask)
	if subtaskid == nil or subtaskid <= 0 then return end
	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	if subinfo == nil then return end

	--子任务的删除操作
	if subinfo.task ~= nil and subinfo.task[3] ~= nil then
		subinfo.task[3](uid, taskid, subtaskid, subinfo.task[4])
	end

	--删除所有needitem
	for i = 1, subtaskid, 1 do
		local subinfo = GetSubTaskInfo(taskid, i)
		if subinfo ~= nil and subinfo.needitem ~= nil and table.getn(subinfo.needitem) > 0 then
			for j=1, table.getn(subinfo.needitem), 1 do
				s_deleteItemByBaseID(uid,subinfo.needitem[j][1],subinfo.needitem[j][3],"删除任务道具")
			end
		end
	end

	--删除父子任务的子任务
	local child = s_getTaskVar(uid, taskid, MvarIndex_Child)
	if child ~= nil and child ~= 0 then
		s_addTaskVar(uid, taskid, MvarIndex_Child, 0)
		s_addTaskVar(uid, child, MvarIndex_Parent, 0)
		s_delTask(uid, child)
	end

	--删除父子任务的父任务
	local parent = s_getTaskVar(uid, taskid, MvarIndex_Parent)
	if parent ~= nil and parent ~= 0 then
		s_addTaskVar(uid, taskid, MvarIndex_Parent, 0)
		s_addTaskVar(uid, parent, MvarIndex_Child, 0)
		s_delTask(uid, parent)
	end

	local taskProcess = s_getTaskValue(uid, taskid, TaskValue_Process)

	--总任务的删除操作，只有在任务没有完成被删除时，才调用，避免环任务正常完成删除的不正确调用
	if info.OnDeleteTask ~= nil and taskProcess ~= TaskProcess_Done then
		info.OnDeleteTask(info, uid)
	end

	--环任务计数加1，只有在任务存在时才加1，避免重复加1
	if taskProcess ~= TaskProcess_None then
		AddRoundAndRing(uid, taskid)
	end
end

--------------------------------------------------------------
--将程序表格的一些东西在启动时解析到脚本上，避免程序运行时loadstring调用
--每个任务对应一个RoleTaskInfoXXX table,以下三个变量可以修改
--info.awarditem 对应任务的奖励道具
--info.needitem 对应任务的需要工具道具
--info.selectitem 对应任务的可选奖励道具
function InitTaskEvent(taskid)
	--s_debug(" InitTaskEvent  taskid=%d", taskid)
	local info = rawget(_G,"RoleTaskInfo"..taskid)
	if info == nil then
		info = {}
		rawset(_G,"RoleTaskInfo"..taskid ,info)
	end
	--设置奖励道具列表
	local itemstr = s_getTaskValue(0,taskid,TaskValue_AwardItem)
	if info.awarditem == nil then
		info.awarditem = {}
	end
	if itemstr ~= nil and itemstr ~= "" and table.getn(info.awarditem) == 0 then
		info.awarditem =  loadstring("return " .. itemstr)()
	end
	--设置任务的可选奖励道具列表
	if info.selectitem == nil then
		info.selectitem = {}
	end
	--解析任务名字
	local textName = s_getTaskValue(0,taskid,TaskValue_Name)
	if textName == nil then
		return ""
	end
	info.name = textName
	--解析任务描述文本
	local text1 = s_getTaskValue(0,taskid,TaskValue_DescText)
	if info.desctext == nil then
		if text1 == nil then
			return ""
		end
		text1 = trim(text1)
		info.desctext = parseToDesc(text1)
	end
	--解析接受任务对话文本
	local text2 = s_getTaskValue(0,taskid,TaskValue_AcceptText)
	if info.accepttext == nil and text2 ~= nil then
		text2 = trim(text2)
		--info.accepttext = parseToTalk(text2)
        info.accepttext = text2
	end

	--解析完成任务对话文本
	local text3 = s_getTaskValue(0,taskid,TaskValue_FinishText)
	if info.finishtext == nil and text3 ~= nil then
		text3 = trim(text3)
		--info.finishtext = parseToTalk(text3)
        info.finishtext = text3;
	end
	--s_debug("InitTaskEvent taskid=:desctext=%s,accepttext=%s,finishtext=%s", info.desctext, info.accepttext, info.finishtext)
	--解析不可交任务文本
	local text4 = s_getTaskValue(0,taskid,TaskValue_PromptText)
	if info.prompttext == nil and text4 ~= nil then
		text4 = trim(text4)
		--info.prompttext = text4
        info.prompttext = text4;
	end
	--解析任务提示文本
	local textTip = s_getTaskValue(0,taskid,TaskValue_Tip)
	if info.tip == nil and textTip ~= nil then
		textTip = trim(textTip)
		info.tip = textTip
	end
	--解析环数
	local ring = s_getTaskValue(0,taskid,TaskValue_DayNum)
	if info.ring == nil and ring ~= nil and ring ~= 0 then
		info.ring = ring
	end

	--修正环任务参数
	if info.ring ~= nil then
		if info.ring <= 0 then
			info.ring = nil
			info.round = nil
		else
			if info.round == nil then
				info.round = 1
			end
		end
	else
		info.round = nil
	end

	--子任务
	if info.subtasknum == nil then
		info.subtasknum = 1
	end

	for i = 1, info.subtasknum, 1 do
		local subinfo = rawget(info,"subtask"..i)
		if subinfo == nil then
			subinfo = {}
			rawset(info,"subtask"..i, subinfo)
		end

		if subinfo.desctext == nil then subinfo.desctext = info.desctext end
		if subinfo.accepttext == nil then subinfo.accepttext = info.accepttext end
		if subinfo.finishtext == nil then subinfo.finishtext = info.finishtext end
		if subinfo.prompttext == nil then subinfo.prompttext = info.prompttext end
		if subinfo.tip == nil then subinfo.tip = info.tip end

		if i == 1 then
			if subinfo.task == nil then
				textTask = s_getTaskValue(0,taskid,TaskValue_Task)
				if textTask == nil then
					s_debug("InitTaskEvent:taskid:%d, 任务内容为空", taskid)
					return ""
				end
				subinfo.task = {}
				subinfo.task = loadstring("return " .. textTask)()
				if type(subinfo.task) ~= "table" or table.getn(subinfo.task) == 0 then
					s_debug("InitTaskEvent:taskid:%d, 任务内容格式错误:%s", taskid, textTask)
					return ""
				end
				--s_debug("InitTaskEvent:taskid=:%d, 任务内容格式:%s", taskid, textTask)
			end

			--添加接受判定函数
			local bCheckLevel = false
			local bCheckPretask = false
			if subinfo.onacceptcheck ~= nil then
				for ncheck = 1, table.getn(subinfo.onacceptcheck), 1 do
					if subinfo.onacceptcheck[ncheck][1] == s_checkRoleLevel then
						bCheckLevel = true
					end
					if subinfo.onacceptcheck[ncheck][1] == s_checkPretask then
						bCheckPretask = true
					end
					if bCheckLevel == true and bCheckPretask == true then break	end
				end
			end

			if bCheckLevel == false then
				local minLevel = s_getTaskValue(0, taskid, TaskValue_MinLevel)
				if minLevel == nil then minLevel = 0 end
				local maxLevel = s_getTaskValue(0, taskid, TaskValue_MaxLevel)
				if maxLevel == nil then maxLevel = 0 end
				if minLevel > 0 and maxLevel > 0 then
					if subinfo.onacceptcheck == nil then subinfo.onacceptcheck = {} end
					table.insert(subinfo.onacceptcheck, {s_checkRoleLevel,{minLevel,maxLevel}})
				end
			end

			if bCheckPretask == false then
				local pretask = s_getTaskValue(0, taskid, TaskValue_PreTask)
				if pretask ~= nil and pretask > 0 then
					if subinfo.onacceptcheck == nil then subinfo.onacceptcheck = {} end
					table.insert(subinfo.onacceptcheck, {s_checkPretask,{pretask}})
				end
			end

			--设置任务道具列表
			local itemstr1 = s_getTaskValue(0,taskid,TaskValue_NeedItem)
			if subinfo.needitem == nil then
				subinfo.needitem = {}
			end
			if itemstr1 ~= nil and itemstr1 ~= "" and table.getn(subinfo.needitem) == 0 then
				subinfo.needitem = loadstring("return " .. itemstr1)()
			end

		else
			if subinfo.task == nil or type(subinfo.task) ~= "table" or table.getn(subinfo.task) == 0 then
				s_debug("InitTaskEvent:taskid:%d, subtaskid:%d, 任务内容为空", taskid, i)
				return ""
			end
		end

		--初始化：增加NPC入口什么的
		subinfo.task[1](taskid, i, subinfo.task[2])
		--print_dump(subinfo.task, 1)
		--s_debug("InitTaskEvent:taskid222222:%s,%d, %s", subinfo.task[1],taskid, subinfo.task[2])
	end

	return VALUE_OK
end

function print_dump(data, showMetatable, lastCount)
    if type(data) ~= "table" then
        --Value
        if type(data) == "string" then
            io.write("\"", data, "\"")
        else
            io.write(tostring(data))
        end
    else
        --Format
        local count = lastCount or 0
        count = count + 1
        io.write("{\n")
        --Metatable
        if showMetatable then
            for i = 1,count do 
                io.write("\t") 
            end
            local mt = getmetatable(data)
            io.write("\"__metatable\" = ")
            print_dump(mt, showMetatable, count)    -- 如果不想看到元表的元表，可将showMetatable处填nil
            io.write(",\n")        --如果不想在元表后加逗号，可以删除这里的逗号
        end
        --Key
        for key,value in pairs(data) do
            for i = 1,count do 
                io.write("\t") 
            end
            if type(key) == "string" then
                io.write("\"", key, "\" = ")
            elseif type(key) == "number" then
                io.write("[", key, "] = ")
            else
                io.write(tostring(key))
            end
            print_dump(value, showMetatable, count)    -- 如果不想看到子table的元表，可将showMetatable处填nil
            io.write(",\n")        --如果不想在table的每一个item后加逗号，可以删除这里的逗号
        end
        --Format
        for i = 1,lastCount or 0 do 
            io.write("\t") 
        end
            io.write("}")
    end
    --Format
    if not lastCount then
        io.write("\n")
    end
end
--玩家上线重新加载任务描述
function GetTaskDescEvent(uid,taskid)
	local subtaskid = s_getTaskVar(uid, taskid, MvarIndex_SubTask)
	if subtaskid == nil or subtaskid == 0 then return end

	local desc = GetSubTaskDescText(uid, taskid, subtaskid)
	if desc ~= nil then
		s_setTaskValue(uid,taskid,TaskValue_Desc,desc,0)
	end
end


--副本检查 如符合返回场景ID
function CopySceneCheck(uid,utype,uowner)
	local stype = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE)
	if stype ~= utype then
		return VALUE_FAIL
	end
	local sid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
	if sid == 0 then
		return VALUE_FAIL
	end
	local sowner = s_getSceneVar(sid,0,1)
	if sowner ~= uowner then
		return VALUE_FAIL
	end
	return sid
end


--添加角色任务:GM命令用------------------------------------------------------------------------------
function AddRoleTaskForGM(uid, taskid, state, operate, color)
	local info = GetTaskInfo(taskid)
	if info == nil then
		s_sysInfo(uid,"没有这个任务["..taskid.."]，别瞎搞")
		return VALUE_FAIL
	end
	local subinfo = GetSubTaskInfo(taskid, 1)
	local OnAcceptCheck = info.OnAcceptCheck
	local onacceptcheck = subinfo.onacceptcheck
    local ring = info.ring
	info.OnAcceptCheck = nil
	subinfo.onacceptcheck = nil
    info.ring = nil;

	if subinfo ~= nil and subinfo.task ~= nil and subinfo.task[1] ~= nil then
		if subinfo.task[1] == s_taskCustom and subinfo.task[2][1] == 0 and subinfo.task[2][2] == 0 then
			AddRoleSubTask(uid, taskid, 1, state, operate, color)
		else
			subinfo.task[1](taskid, 1, subinfo.task[2], uid)
		end
	end

	info.OnAcceptCheck = OnAcceptCheck
	subinfo.onacceptcheck = onacceptcheck
    info.ring = ring
	return VALUE_OK
end


--添加角色任务:脚本用------------------------------------------------------------------------------
function AddRoleTask(uid, taskid)
	local subinfo = GetSubTaskInfo(taskid, 1)
	if subinfo == nil then
		return
	end
	subinfo.task[1](taskid, 1, subinfo.task[2], uid)
end


function GetWorldLevelExp(level,worldlevel,countrystate)
	local WorldStrongExpTable = {
		{{31,40,0},{41,50,0},{51,60,0},{61,70,0},{71,80,0},{81,90,0},{91,100,0},{101,110,0},{111,120,0},{121,130,0},{131,140,0}},
		{{31,40,100},{41,50,50},{51,60,30},{61,70,0},{71,80,0},{81,90,0},{91,100,0},{101,110,0},{111,120,0},{121,130,0},{131,140,0}},
		{{31,40,120},{41,50,100},{51,60,50},{61,70,30},{71,80,0},{81,90,0},{91,100,0},{101,110,0},{111,120,0},{121,130,0},{131,140,0}},
		{{31,40,140},{41,50,120},{51,60,100},{61,70,50},{71,80,30},{81,90,0},{91,100,0},{101,110,0},{111,120,0},{121,130,0},{131,140,0}},
		{{31,40,160},{41,50,140},{51,60,120},{61,70,100},{71,80,50},{81,90,30},{91,100,0},{101,110,0},{111,120,0},{121,130,0},{131,140,0}},
		{{31,40,200},{41,50,200},{51,60,200},{61,70,200},{71,80,150},{81,90,100},{91,100,50},{101,110,0},{111,120,0},{121,130,0},{131,140,0}},
		{{31,40,200},{41,50,200},{51,60,200},{61,70,200},{71,80,200},{81,90,150},{91,100,100},{101,110,50},{111,120,0},{121,130,0},{131,140,0}},
		{{31,40,200},{41,50,200},{51,60,200},{61,70,200},{71,80,200},{81,90,200},{91,100,150},{101,110,100},{111,120,50},{121,130,0},{131,140,0}},
		{{31,40,200},{41,50,200},{51,60,200},{61,70,200},{71,80,200},{81,90,200},{91,100,200},{101,110,200},{111,120,100},{121,130,50},{131,140,0}},
		{{31,40,200},{41,50,200},{51,60,200},{61,70,200},{71,80,200},{81,90,200},{91,100,200},{101,110,200},{111,120,200},{121,130,100},{131,140,50}}
	}
	local WorldWeakExpTable = {
		{{31,40,0},{41,50,0},{51,60,0},{61,70,0},{71,80,0},{81,90,0},{91,100,0},{101,110,0},{111,120,0},{121,130,0},{131,140,0}},
		{{31,40,120},{41,50,65},{51,60,40},{61,70,5},{71,80,0},{81,90,0},{91,100,0},{101,110,0},{111,120,0},{121,130,0},{131,140,0}},
		{{31,40,140},{41,50,120},{51,60,65},{61,70,40},{71,80,5},{81,90,0},{91,100,0},{101,110,0},{111,120,0},{121,130,0},{131,140,0}},
		{{31,40,160},{41,50,140},{51,60,120},{61,70,65},{71,80,40},{81,90,5},{91,100,0},{101,110,0},{111,120,0},{121,130,0},{131,140,0}},
		{{31,40,180},{41,50,160},{51,60,140},{61,70,120},{71,80,65},{81,90,40},{91,100,5},{101,110,0},{111,120,0},{121,130,0},{131,140,0}},
		{{31,40,200},{41,50,200},{51,60,200},{61,70,200},{71,80,160},{81,90,120},{91,100,60},{101,110,5},{111,120,0},{121,130,0},{131,140,0}},
		{{31,40,220},{41,50,200},{51,60,200},{61,70,200},{71,80,200},{81,90,160},{91,100,120},{101,110,60},{111,120,5},{121,130,0},{131,140,0}},
		{{31,40,220},{41,50,220},{51,60,200},{61,70,200},{71,80,200},{81,90,200},{91,100,160},{101,110,120},{111,120,60},{121,130,5},{131,140,0}},
		{{31,40,220},{41,50,220},{51,60,220},{61,70,200},{71,80,200},{81,90,200},{91,100,200},{101,110,200},{111,120,120},{121,130,60},{131,140,5}},
		{{31,40,220},{41,50,220},{51,60,220},{61,70,220},{71,80,200},{81,90,200},{91,100,200},{101,110,200},{111,120,200},{121,130,120},{131,140,60}}
	}
	if worldlevel > 10 then
		return 0
	end
	local retexp = 0
	if countrystate == CountryStateStrong or countrystate == CountryStateNormal then
		for i = 1,table.getn(WorldStrongExpTable[worldlevel]) do
			if level >= WorldStrongExpTable[worldlevel][i][1]
				and level <= WorldStrongExpTable[worldlevel][i][2] then
				retexp = WorldStrongExpTable[worldlevel][i][3]
				break
			end
		end
	else
		for i = 1,table.getn(WorldWeakExpTable[worldlevel]) do
			if level >= WorldWeakExpTable[worldlevel][i][1]
				and level <= WorldWeakExpTable[worldlevel][i][2] then
				retexp = WorldWeakExpTable[worldlevel][i][3]
				break
			end
		end
	end
	if s_hasWorldUserLevel() ~= 0 then
		local world_max_user_level = worldlevel * 10 + 50
		if world_max_user_level > level and world_max_user_level <= level + 9 then
			retexp = retexp + 10 + world_max_user_level - level
		end
	end
	return retexp;
end


--返回情报任务目标国
function GetQBTaskTargetCountry(cid)
	local country = s_getCountryVar(cid,1,15)
	if country == 0 then
		local target = {}
		local list = pack(s_getCountryList())

		--如果是弱国，先找盟国
		local countrystate = s_getCountryState(cid)
		if countrystate == CountryStateWeak then
			for i = 1,table.getn(list) do
				if list[i] ~= 13 and list[i]~= cid then
					if s_isFriendCountry(cid,list[i]) == VALUE_OK then
						table.insert(target,list[i])
					end
				end
			end
		end

		--遍历查找目标国少于2个的国家
		if table.getn(target) == 0 then
			for i = 1,table.getn(list) do
				if list[i] ~= 13 and list[i]~= cid then
					local targeted = 0
					for j = 1,table.getn(list) do
						if s_getCountryVar(list[j],1,15) == list[i] then
							targeted = targeted + 1
						end
					end
					if targeted < 2 then
						table.insert(target,list[i])
					end
				end
			end
		end

		country = target[math.random(1,100)%table.getn(target)+1]
		s_addCountryVar(cid,1,15,country)
	end
	return country
end


--增加成就任务计数，若没有任务就加上任务
function AddAchieveTaskOperate(uid, taskid, subtaskid, addop)
	local tasktype = s_getTaskValue(0,taskid,TaskValue_Type)
	if tasktype ~= TaskType_Achieve then
		return VALUE_FAIL
	end

	local taskProcess = s_getTaskValue(uid,taskid,TaskValue_Process)
	if taskProcess == TaskProcess_Done then
		return VALUE_FAIL
	end

	--没有任务就加上任务
	if taskProcess == TaskProcess_None then
		AddRoleTask(uid,taskid)
	end

	--增加任务计数
	local subid = s_getTaskVar(uid, taskid, MvarIndex_SubTask)
	if subid ~= subtaskid then
		return VALUE_FAIL
	end
	AddRoleTaskOperate(uid,taskid,"",addop)
	return VALUE_OK
end

--跨区返回完成任务
function OnFinishTaskOldZone(uid,taskid)
	local info = GetTaskInfo(taskid)
	if info == nil then return end
	if info.OnFinishTaskOldZone ~= nil then
		info.OnFinishTaskOldZone(info, uid)
	end
end
