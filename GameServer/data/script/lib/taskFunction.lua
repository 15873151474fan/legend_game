--任务条件函数

--检查角色等级[minLevel, maxLevel]{int:minLevel, int:maxLevel}
function s_checkRoleLevel(uid, taskid, subtaskid, paramlist, tips)
	local minLevel = paramlist[1]
	local maxLevel = paramlist[2]
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if minLevel ~= nil and minLevel > level then
		--主线任务玩家等级小于最小等级2级也可见菜单
		if IsMainNormalTask(taskid) == VALUE_OK then
			if minLevel ~= 0 and level >= minLevel - 2 then
				return VALUE_OK
			end
		end
		return VALUE_FAIL
	end
	if maxLevel ~= nil and maxLevel ~= 0 and maxLevel < level then
		return VALUE_FAIL
	end
	return VALUE_OK
end

--检查人类进程[minLevel, maxLevel]{int:minLevel, int:maxLevel}
function s_checkWorldLevel(uid, taskid, subtaskid, paramlist, tips)
	local minLevel = paramlist[1]
	local maxLevel = paramlist[2]
	local worldlevel = s_getWorldLevel()
	if minLevel ~= nil and minLevel > worldlevel then
		return VALUE_FAIL
	end
	if maxLevel ~= nil and maxLevel ~= 0 and maxLevel < worldlevel then
		return VALUE_FAIL
	end
	return VALUE_OK
end

--检查离线天数[minOfflineDay, maxOfflineDay]{int:minOfflineDay, int:maxOfflineDay}
function s_checkOfflineDay(uid, taskid, subtaskid, paramlist, tips)
	local minOfflineDay = paramlist[1]
	local maxOfflineDay = paramlist[2]
	local time = s_getCurTime(TIME_ALLSECONDS)
	local last = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LAST_OFFLINE)
	local offlineday = 0
	if time > last then
		offlineday = math.floor((time - last) / 86400)
	end
	if minOfflineDay ~= nil and minOfflineDay > offlineday then
		return VALUE_FAIL
	end
	if maxOfflineDay ~= nil and maxOfflineDay ~= 0 and maxOfflineDay < offlineday then
		return VALUE_FAIL
	end
	return VALUE_OK
end

--检查自身等级与服务器最大等级的差距[minLevelDiff, maxLevelDiff]{int:minLevelDiff, int:maxLevelDiff}
function s_checkLevelDiff(uid, taskid, subtaskid, paramlist, tips)
	local minLevelDiff = paramlist[1]
	local maxLevelDiff = paramlist[2]
	local leveldiff = s_getMaxUserLevel() - s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if minLevelDiff ~= nil and minLevelDiff > leveldiff then
		return VALUE_FAIL
	end
	if maxLevelDiff ~= nil and maxLevelDiff ~= 0 and maxLevelDiff < leveldiff then
		return VALUE_FAIL
	end
	return VALUE_OK
end

--检查自身战力榜排名[minPowerOrder, maxPowerOrder]{int:minPowerOrder, int:maxPowerOrder}
--若没有名次，战力榜值为0
function s_checkPowerOrder(uid, taskid, subtaskid, paramlist, tips)
	local minPowerOrder = paramlist[1]
	local maxPowerOrder = paramlist[2]
	local powerorder = s_getField(uid,UserVar_PowerOrder)
	if powerorder == 0 then powerorder = 10000 end
	if minPowerOrder ~= nil and minPowerOrder > powerorder then
		return VALUE_FAIL
	end
	if maxPowerOrder ~= nil and maxPowerOrder ~= 0 and maxPowerOrder < powerorder then
		return VALUE_FAIL
	end
	return VALUE_OK
end

--检查自身的装备积分[minEquipAmmend, maxEquipAmmend]{int:minEquipAmmend, int:maxEquipAmmend}
function s_checkEquipAmmend(uid, taskid, subtaskid, paramlist, tips)
	local minEquipAmmend = paramlist[1]
	local maxEquipAmmend = paramlist[2]
	local equipammend = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_EQUIP_AMMEND)
	if minEquipAmmend ~= nil and minEquipAmmend > equipammend then
		return VALUE_FAIL
	end
	if maxEquipAmmend ~= nil and maxEquipAmmend ~= 0 and maxEquipAmmend < equipammend then
		return VALUE_FAIL
	end
	return VALUE_OK
end

--检查角色前置任务{int:pretask}
function s_checkPretask(uid, taskid, subtaskid, paramlist, tips)
	local pretask = paramlist[1]
	if pretask ~= nil and pretask ~= 0 then
		local process = s_getTaskValue(uid,pretask,TaskValue_Process)
		if process ~= TaskProcess_Done then
			return VALUE_FAIL
		end
	end
	return VALUE_OK
end

--检查角色互斥任务{int:mutualiytask}
function s_checkMutualiytask(uid, taskid, subtaskid, paramlist, tips)
	local pretask = paramlist[1]
	if pretask ~= nil and pretask ~= 0 then
		local process = s_getTaskValue(uid,pretask,TaskValue_Process)
		if process ~= TaskProcess_None then
			return VALUE_FAIL
		end
	end
	return VALUE_OK
end

--检查指定任务当前轮数[minRound,maxRound]{int:taskid, int:minRound, int:maxRound(0表示不检查)}
function s_checkTaskCurRound(uid, taskid, subtaskid, paramlist, tips)
	local curRound,curRing = GetTaskCurRoundAndRing(uid, paramlist[1])
	local minRound = paramlist[2]
	local maxRound = paramlist[3]

	if minRound ~= nil and curRound < minRound then
		return VALUE_FAIL
	end

	if maxRound ~= nil and maxRound ~= 0 and curRound > maxRound then
		return VALUE_FAIL
	end
	return VALUE_OK
end

--检查指定任务当前环数[minRing,maxRing]{int:taskid, int:minRing, int:maxRing(0表示不检查)}
function s_checkTaskCurRing(uid, taskid, subtaskid, paramlist, tips)
	local curRound,curRing = GetTaskCurRoundAndRing(uid, paramlist[1])
	local minRing = paramlist[2]
	local maxRing = paramlist[3]

	if minRing ~= nil and curRing < minRing then
		return VALUE_FAIL
	end

	if maxRing ~= nil and maxRing ~= 0 and curRing > maxRing then
		return VALUE_FAIL
	end
	return VALUE_OK
end

--检查角色是否可以护送{}
function s_checkGuard(uid, taskid, subtaskid, paramlist, tips)
	return c_checkGuard(uid, tips)
end

--检查角色是否可以进入副本{}
function s_checkIntoCopy(uid, taskid, subtaskid, paramlist, tips)
	return s_canIntoCopy(uid, tips)
end

--检查角色职业{int:职业ID，参见enumProfession}
--	Profession_Soldier      = 1,			//--战士
--	Profession_Spy          = 2,			//--魔刃
--	Profession_Gunman       = 3,			//--枪手
--	Profession_Blast        = 4,			//--魔炮
--	Profession_Freeman      = 5,			//--术士
--	Profession_Doctor       = 6,			//--牧师
function s_checkRoleProfession(uid, taskid, subtaskid, paramlist, tips)
	local profession = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_PROFESSION)
	if profession ~= paramlist[1] then return VALUE_FAIL end

	return VALUE_OK
end

--检查角色官职{int:官职ID}
--FunctionType_Common			= 0 	--百姓
--FunctionType_Marshal		= 1 	--国王
--FunctionType_ViceMarshal	= 2 	--元帅
--FunctionType_Interior		= 3 	--内务大臣
--FunctionType_Treasury		= 4 	--财务大臣
--FunctionType_Defense		= 5 	--军务大臣
--FunctionType_Police			= 6 	--警长
--FunctionType_VicePolice		= 7 	--代警长
--FunctionType_RoseKnight		= 8		--玫瑰骑士
--FunctionType_Commander		= 9		--指挥官
--
function s_checkRoleFunctionType(uid, taskid, subtaskid, paramlist, tips)
	local functiontype = s_getFunction(uid,Relation_Country)
	if functiontype ~= paramlist[1] then
		return VALUE_FAIL
	end
	return VALUE_OK
end
--检查角色职业是否为物理系{}
function s_checkRoleProfessionPhysical(uid, taskid, subtaskid, paramlist, tips)
	local pro = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_PROFESSION)
	if pro == Profession_Soldier or pro == Profession_Gunman or pro == Profession_Spy then
		return VALUE_OK
	end
	return VALUE_FAIL
end

--检查角色职业是否为魔法系{}
function s_checkRoleProfessionMagic(uid, taskid, subtaskid, paramlist, tips)
	local pro = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_PROFESSION)
	if pro == Profession_Soldier or pro == Profession_Gunman or pro == Profession_Spy then
		return VALUE_FAIL
	end
	return VALUE_OK
end


--检查角色是否在指定点的一个范围内{int:mapid, int:posx, int:posy, int:range, string:失败描述}
function s_checkRolePosition(uid, taskid, subtaskid, paramlist, tips)
	local mapid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_CURRENT_MAP)
	if mapid ~= paramlist[1] then
		if paramlist[5] ~= nil then
			s_sysInfo(uid,paramlist[5],ChatPos_Sys + ChatPos_Important)
			s_messageBox(uid,paramlist[5])
		end
		return VALUE_FAIL
	end

	local posx = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSX)
	local posy = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSY)
	if math.abs(posx-paramlist[2]) > paramlist[4] or math.abs(posy-paramlist[3]) > paramlist[4] then
		if paramlist[5] ~= nil then
			s_sysInfo(uid,paramlist[5],ChatPos_Sys)
			s_messageBox(uid,paramlist[5])
		end
		return VALUE_FAIL
	end
	return VALUE_OK
end

--检查角色的交通方式是否为指定的交通方式{int:交通方式(请参见enumTrafficType), string:失败描述}
--[[
enum enumTrafficType
{
TrafficType_None		= 0,	//走路
TrafficType_Ride		= 1,	//奇异兽骑乘(已废除)
TrafficType_Join		= 2,	//合体
TrafficType_Armyequip	= 3,	//团魔甲
TrafficType_RTLead		= 4,	//2人共骑领路
TrafficType_RTFollow	= 5,	//2人共骑跟随
TrafficType_Dance		= 6,	//跳舞
TrafficType_DanceDouble = 7,	//双人跳舞
TrafficType_RideChange	= 8,	//临时性骑乘
TrafficType_Horse		= 9,	//交通工具骑乘
TrafficType_MagicChange	= 10,	//临时性变身
TrafficType_SuperWeapon	= 11,	//超能武器
TrafficType_InGuard		= 12,	//镖车合体
TrafficType_InHorse		= 13,	//骑战一体
TrafficType_Fish		= 14,	//钓鱼
TrafficType_Hug         = 15,   //拥抱
TrafficType_Kiss        = 16,   //接吻
TrafficType_CarrigeLead		= 17,	//双人马车领路
TrafficType_CarrigeFollow	= 18,	//双人马车跟随
TrafficType_Baoqi			= 19,	//抱起
TrafficType_BeiBaoqi		= 20,	//被抱起
TrafficType_Snuggle			= 21,	//依偎
TrafficType_Max,
};
]]
function s_checkRoleTrafficType(uid, taskid, subtaskid, paramlist, tips)
local traffic = s_getTrafficType(uid)
if traffic ~= nil and traffic == paramlist[1] then
	return VALUE_OK
end

if paramlist[2] ~= nil then
	s_sysInfo(uid,paramlist[2],ChatPos_Sys + ChatPos_Important)
end
return VALUE_FAIL
end

function s_checkRoleNoTrafficType(uid, taskid, subtaskid, paramlist, tips)
local traffic = s_getTrafficType(uid)
if traffic ~= nil and traffic ~= paramlist[1] then
	return VALUE_OK
end

if paramlist[2] ~= nil then
	s_sysInfo(uid,paramlist[2],ChatPos_Sys + ChatPos_Important)
end
return VALUE_FAIL
end
--检查是否有团{}
function s_checkCorps(uid, taskid, subtaskid, paramlist, tips)
local corps = s_getCorpsId(uid)
if corps == 0 then return VALUE_FAIL end
return VALUE_OK
end


--检查是否在自己的团基地{}
function s_checkInOwnCorpsBase(uid, taskid, subtaskid, paramlist, tips)
local corps = s_getCorpsId(uid)
if corps == 0 then return VALUE_FAIL end
if CopySceneCheck(uid,CopySceneType_CorpsBase,corps) == VALUE_FAIL then
	return VALUE_FAIL
end
return VALUE_OK
end

--检查自己所在团的指定状态是否OK{int:状态标志位(请参见enumCorpsState)}
--[[
enum enumCorpsState
{
CorpsState_Normal		= 0,			//正常状态
CorpsState_ToRemove		= 1 << 0,		//待删除
};
]]
function s_checkCorpsState(uid, taskid, subtaskid, paramlist, tips)
local corps = s_getCorpsId(uid)
if corps == 0 then return VALUE_FAIL end
if s_corpsState(corps,paramlist[1]) == VALUE_OK then
	return VALUE_OK
end
return VALUE_FAIL
end

--检查是否有团称号{int:团称号ID(0表示什么都可以)}
function s_checkCorpsOccupy(uid, taskid, subtaskid, paramlist, tips)
local corps = s_getCorpsId(uid)
if corps == 0 then
	return VALUE_FAIL
end

local occupy = s_getCorpsField(corps,CorpVar_OccupyID)
if occupy  == 0 or occupy == nil then
	return VALUE_FAIL
end

if paramlist[1] ~= nil and paramlist[1] ~= 0 then
	if occupy ~= paramlist[1] then
		return VALUE_FAIL
	end
end
return VALUE_OK
end

--检查指定团事件的进度状态{int:EventID, int:EventState}
--[[
--事件ID
CpEv_JunXunPre			= 1007  --团突袭任务准备
CpEv_JunXun				= 10001	--团突袭任务
CpEv_HouQin				= 10002	--团训练任务

-- 活动进度枚举
enum enumEventStepType
{
EventStep_None		= 0,		// 未发布
EventStep_Wait		= 1,		// 已发布等待开始
EventStep_Run		= 2,		// 进行中
EventStep_End		= 3,		// 结束
EventStep_Remove	= 4,		// 删除
};
]]
function s_checkCorpsEventStep(uid, taskid, subtaskid, paramlist, tips)
local corps = s_getCorpsId(uid)
if corps == 0 then return VALUE_FAIL end

if paramlist[1] ~= nil and paramlist[1] ~= 0 and paramlist[2] ~=  nil then
	if s_getEvent(Relation_Corps,corps,paramlist[1]) ~= paramlist[2] then
		return VALUE_FAIL
	end
end
return VALUE_OK
end


--检查队伍人数[minSize,maxSize]{int:minSize, int:maxSize, string:失败描述}
--{s_checkTeamSize,{2,2,"必须两人组队"}},
function s_checkTeamSize(uid, taskid, subtaskid, paramlist, tips)
local teamsize = s_getTeamSize(SCENE_ENTRY_PLAYER, uid)
if paramlist[1] ~= nil and teamsize < paramlist[1] then
	if paramlist[3] ~= nil then
		s_sysInfo(uid,paramlist[3])
	end
	return VALUE_FAIL
end

if paramlist[2] ~= nil and paramlist[2] ~= 0 and teamsize > paramlist[2] then
	if paramlist[3] ~= nil then
		s_sysInfo(uid,paramlist[3])
	end
	return VALUE_FAIL
end
return VALUE_OK
end

--检查是否有恋人{}
function s_checkHasLover(uid, taskid, subtaskid, paramlist, tips)
local lover = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LOVER)
if lover == 0 then
	s_sysInfo(uid,"您没有恋人")
	return VALUE_FAIL
end
return VALUE_OK
end

--检查是否有配偶{}
function s_checkHasSpouse(uid, taskid, subtaskid, paramlist, tips)
local spouse = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SPOUSE)
if spouse == 0 then
	s_sysInfo(uid, "您没有配偶")
	return VALUE_FAIL
end
return VALUE_OK
end

--检查是否有恋人或配偶{}
function s_checkHasLoverOrSpouse(uid, taskid, subtaskid, paramlist, tips)
local lover = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LOVER)
local spouse = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SPOUSE)
if lover == 0 and spouse == 0 then
	s_sysInfo(uid, "您没有恋人和配偶")
	return VALUE_FAIL
end
return VALUE_OK
end

--检查是否是恋人组队{int:恋人和自己的距离(0表示不检测距离)}
function s_checkLoverInTeam(uid, taskid, subtaskid, paramlist, tips)
local lover = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LOVER)
if lover == 0 then
	s_sysInfo(uid, "您没有恋人")
	return VALUE_FAIL
end

local bFind = false
local list = s_getTeamEntry(SCENE_ENTRY_PLAYER,uid,paramlist[1])
for i = 1,table.getn(list), 2 do
	if list[i] == SCENE_ENTRY_PLAYER and list[i+1] == lover then
		bFind = true
		break
	end
end

if bFind == false then
	s_sysInfo(uid, "您的恋人不在您身边")
	return VALUE_FAIL
end
return VALUE_OK
end

--检查是否是配偶组队{int:配偶和自己的距离(0表示不检测距离)}
function s_checkSpouseInTeam(uid, taskid, subtaskid, paramlist, tips)
local spouse = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SPOUSE)
if spouse == 0 then
	s_sysInfo(uid, "您没有配偶")
	return VALUE_FAIL
end

local bFind = false
local list = s_getTeamEntry(SCENE_ENTRY_PLAYER,uid,paramlist[1])
for i = 1,table.getn(list), 2 do
	if list[i] == SCENE_ENTRY_PLAYER and list[i+1] == spouse then
		bFind = true
		break
	end
end

if bFind == false then
	s_sysInfo(uid, "您的配偶不在您身边")
	return VALUE_FAIL
end
return VALUE_OK
end


--检查是否是恋人or配偶组队{int:配偶和自己的距离(0表示不检测距离),string:失败描述}
function s_checkLoverOrSpouseInTeam(uid, taskid, subtaskid, paramlist, tips)
local other = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LOVER)
if other == 0 then
	other = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SPOUSE)
end
if other == 0 then
	if paramlist[2] ~= nil then
		s_sysInfo(uid, paramlist[2])
	else
		s_sysInfo(uid, "您没有恋人或配偶")
	end
	return VALUE_FAIL
end

local bFind = false
local list = s_getTeamEntry(SCENE_ENTRY_PLAYER,uid,paramlist[1])
for i = 1,table.getn(list), 2 do
	if list[i] == 0 and list[i+1] == other then
		bFind = true
		break
	end
end

if bFind == false then
	if paramlist[2] ~= nil then
		s_sysInfo(uid, paramlist[2])
	else
		s_sysInfo(uid, "您的恋人或配偶不在您身边")
	end
	return VALUE_FAIL
end
return VALUE_OK
end

--检查是否是异性组队{int:异性自己的距离(0表示不检测距离),string:失败描述}
--[[
--检查两人异性队伍
{s_checkTeamSize,{2,2,"必须两人组队"}},
{s_checkOppositeSexInTeam,{}},
]]
function s_checkOppositeSexInTeam(uid, taskid, subtaskid, paramlist, tips)
local sex = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SEX)

local bFind = false
local list = s_getTeamEntry(SCENE_ENTRY_PLAYER,uid,paramlist[1])
for i = 1,table.getn(list), 2 do
	if list[i] == 0 and list[i+1] ~= uid then
		if sex ~= s_getValue(SCENE_ENTRY_PLAYER,list[i+1],VALUE_TYPE_SEX) then
			bFind = true
			break
		end
	end
end

if bFind == false then
	if paramlist[2] ~= nil then
		s_sysInfo(uid, paramlist[2])
	else
		s_sysInfo(uid, "您的异性朋友不在您身边")
	end
	return VALUE_FAIL
end
return VALUE_OK
end

--检查是否在本国内
function s_checkInHomeland(uid, taskid, subtaskid, paramlist, tips)
local homeland = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND)
local curcountry = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_CURRENT_COUNTRY)
if homeland ~= curcountry then
	return VALUE_FAIL
end
return VALUE_OK
end

--检查本国国战状态是否为指定状态{int:国战状态(参见CountryWarState)}
--[[
// 国战状态
enum CountryWarState
{
Country_War_State_None			= 0,				// 无
Country_War_State_Ready			= 1,				// 准备
Country_War_State_Start			= 2,				// 开始
Country_War_State_Stop			= 3,				// 结束
};
]]
function s_checkCountryWarState(uid, taskid, subtaskid, paramlist, tips)
local homeland = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND)
if paramlist[1] ~= nil and s_getCountryVar(homeland,1,39) == paramlist[1] then
	return VALUE_OK
end
return VALUE_FAIL
end


--检查是否在本国的国战当天{}
function s_checkCountryWarDay(uid, taskid, subtaskid, paramlist, tips)
local homeland = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND)
if s_getCountryVar(homeland, 1, 39) == 0 then
	return VALUE_FAIL
end
if math.floor(s_getCountryVar(homeland,1,38)/86400)+1 ~=  math.floor(s_getCurTime(TIME_ALLSECONDS)/86400) then
	return VALUE_FAIL
end
return VALUE_OK
end

--检查是否在帝都战准备阶段{}
function s_checkWorldWarDay(uid, taskid, subtaskid, paramlist, tips)
--帝都战准备中
if s_getCountryVar(13,11,5) ~= World_War_State_Ready then
	return VALUE_FAIL
end
--是否盟国和守方国
local homeland = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND)
local defendcountry = s_getCountryVar(13,11,4)
if s_isFriendCountry(defendcountry,homeland)  ~= VALUE_OK
	and homeland ~= defendcountry then
	return VALUE_FAIL
end
return VALUE_OK
end

--检查国家变量[minValue, maxValue]{int:country,int:key1, int:key2, int:minValue, int:maxValue}
--{s_checkCountryVar,{13,1,1,0,1}},
function s_checkCountryVar(uid, taskid, subtaskid, paramlist, tips)
local minValue = paramlist[4]
local maxValue = paramlist[5]
local value = s_getCountryVar(paramlist[1], paramlist[2], paramlist[3])
if minValue ~= nil and minValue > value then
	return VALUE_FAIL
end
if maxValue ~= nil and maxValue ~= 0 and maxValue < value then
	return VALUE_FAIL
end
return VALUE_OK
end


--检查当前时间是否在指定的年月日内{{int:year1,{int:month1,{int:day1,int:day2}},{int:month2,{int:day1,int:day2}}},{int:year2,{int:month1,{int:day1,int:day2}},{int:month2,{int:day1,int:day2}}}}
--year:当前年
--month:1-12
--day:1-31
--{s_checkYearMonthDay,{{2012,{7,{10,13}},{8,{10,13}}}, {2013,{1,{10,13}},{2,{10,13}}},},},
function s_checkYearMonthDay(uid, taskid, subtaskid, paramlist, tips)
if paramlist == nil or table.getn(paramlist) == 0 then return VALUE_OK end
local year = s_getCurTime(TIME_CURYEARS)+1900
local month = s_getCurTime(TIME_CURMONTHS)+1
local day = s_getCurTime(TIME_CURMDAYS)

for y=1, table.getn(paramlist) do
	if year == paramlist[y][1] then
		for m=2, table.getn(paramlist[y]) do
			if month == paramlist[y][m][1] then
				if day >= paramlist[y][m][2][1] and day <= paramlist[y][m][2][2] then
					return VALUE_OK
				end
			end
		end
	end
end
return VALUE_FAIL
end


--检查当前时间是否为指定的星期{int:星期(0代表周日，1代表周一，2代表周二，...，6代表周六),int:星期,int:星期,...}
--{s_checkWeekDays,{0,1,2}},
function s_checkWeekDays(uid, taskid, subtaskid, paramlist, tips)
if paramlist == nil or table.getn(paramlist) == 0 then return VALUE_OK end

local weekday = s_getCurTime(TIME_CURWDAYS)
for i=1, table.getn(paramlist) do
	if weekday == paramlist[i] then return VALUE_OK end
end
return VALUE_FAIL
end

--检查当前时间是否在指定的小时内[minHour,maxHour]{int:minHour,int:maxHour(0表示不检查)}
--hour:0-23
function s_checkHour(uid, taskid, subtaskid, paramlist, tips)
local curHour = s_getCurTime(TIME_CURHOURS)
if paramlist[1] ~= nil and curHour < paramlist[1] then
	if paramlist[3] ~= nil then
		s_sysInfo(uid,paramlist[3])
	end
	return VALUE_FAIL
end

if paramlist[2] ~= nil and paramlist[2] ~= 0 and curHour > paramlist[2] then
	if paramlist[3] ~= nil then
		s_sysInfo(uid,paramlist[3])
	end
	return VALUE_FAIL
end
return VALUE_OK
end

--检查当前体力点{int:minusableTiledPoint(0表示不检查)}
--{s_checkUsableTiledPoint,{1}},
function s_checkUsableTiledPoint(uid, taskid, subtaskid, paramlist, tips)
local usableTiledPoint = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_USABLE_TILED_POINT)
if paramlist[1] ~= nil and usableTiledPoint < paramlist[1] then
	s_sysInfo(uid,paramlist[2])
	return VALUE_FAIL
end
return VALUE_OK
end

--检查当前活力点[minVigorPoint,maxVigorPoint]{int:minVigorPoint,int:maxVigorPoitn(0表示不检查)}
function s_checkVigorPoint(uid, taskid, subtaskid, paramlist, tips)
local curVigorPoint = s_getVigorPoint(uid)
if paramlist[1] ~= nil and curVigorPoint < paramlist[1] then
	return VALUE_FAIL
end

if paramlist[2] ~= nil and paramlist[2] ~= 0 and curVigorPoint > paramlist[2] then
	return VALUE_FAIL
end
return VALUE_OK
end
--检查buff时间[minTime,maxTime]{int:BuffID,int:minTime,int:maxTime}
function s_checkBuffTime(uid, taskid, subtaskid, paramlist, tips)
local buffid = paramlist[1]
local minTime = paramlist[2]
local maxTime = paramlist[3]
local curTime = s_getbufftime(SCENE_ENTRY_PLAYER,uid,buffid)
if curTime == nil then curTime = 0 end
if minTime ~= nil and curTime < minTime then
	return VALUE_FAIL
end

if maxTime ~= nil and maxTime ~= 0 and curTime > maxTime then
	return VALUE_FAIL
end

return VALUE_OK
end

--检查玩家性别{int:性别ID，参见enmCharSex}
--	MALE	= 1,			/**<男人*/
--	FEMALE	= 2,			/**<女人*/
function s_checkRoleSex(uid, taskid, subtaskid, paramlist, tips)
local sex = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SEX)
if sex ~= paramlist[1] then return VALUE_FAIL end

return VALUE_OK
end


--检查角色变量[minValue, maxValue]{int:key1, int:key2, int:minValue, int:maxValue}
--{s_checkRoleVar,{1,1,0,1}},
function s_checkRoleVar(uid, taskid, subtaskid, paramlist, tips)
local minValue = paramlist[3]
local maxValue = paramlist[4]
local value = s_getVar(uid, paramlist[1], paramlist[2])
if minValue ~= nil and minValue > value then
	return VALUE_FAIL
end
if maxValue ~= nil and maxValue ~= 0 and maxValue < value then
	return VALUE_FAIL
end
return VALUE_OK
end

--判断角色装备包裹某位置装备是否与目标baseID相等{int:位置, int:targetid}
--目标ID为0时判断包裹对应位置是否不为空,不空返回true，空返回false
--{s_getRolePackItem,{0,1}}
function s_getPackItemBaseID(uid, taskid, subtaskid, paramlist, tips)
local posy = paramlist[1]
local targetid = paramlist[2]
local thisid = s_getItemThisID(uid,PACKAGETYPE_EQUIP,0,posy)
equipid = s_getitembaseid(uid,thisid)
if equipid ~= 0 then
	if targetid == 0 or equipid == targetid then
		return VALUE_OK
	end
end
return VALUE_FAIL
end

--检查随机数，随机数小于分子的表示成功{int:随机分子, int:随机分母}
--{s_checkRandom,{80,100}},
--注意：不要用于随机任务的判断条件，会导致多次计算随机数不相同，导致选中任务，实际接的时候却没有接上任务
function s_checkRandom(uid, taskid, subtaskid, paramlist, tips)
local rand = math.random(1, paramlist[2])
if rand <= paramlist[1] then
	return VALUE_OK
end
return VALUE_FAIL
end

--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------

--事件函数
--------------------------------------------------------------------------------------------------
--删除道具{int:道具BaseID, int:道具数量, string:删除原因, int:道具等级}
function s_actionDeleteItemByBaseID(uid, taskid, subtaskid, paramlist)
s_deleteItemByBaseID(uid, paramlist[1], paramlist[2], paramlist[3], paramlist[4])
end

--删除道具{int:道具ThisID, int:道具数量, string:删除原因}
function s_actionDeleteItemByThisID(uid, taskid, subtaskid, paramlist)
s_deleteItemByThisID(uid, paramlist[1], paramlist[2], paramlist[3])
end

--增加道具{int:道具ID, int:道具等级, int:道具数量, int:是否鉴定(0表示不鉴定,1表示鉴定), string:道具buff, string:获取道具原因}
--若itemlevel > 0, 则itembuff中需要重复包含itemlevel字段(2-itemlevel)
function s_actionAddItem(uid, taskid, subtaskid, paramlist)
s_addItem(uid, paramlist[1], 3, paramlist[3], paramlist[4], paramlist[5], paramlist[6])
end

--根据性别发道具
--增加道具{int:男性道具ID, int:女性道具ID, int:道具数量, int:道具绑定,string:道具buff, string:获取道具原因}
function s_actionSexAddItem(uid, taskid, subtaskid, paramlist)
local sex = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SEX)
if sex == 1 then
	if paramlist[1] ~= nil and paramlist[1] ~= 0 then
		s_addItem(uid, paramlist[1], 3, paramlist[3], paramlist[4], paramlist[5], paramlist[6])
	end
elseif sex == 2 then
	if paramlist[2] ~= nil and paramlist[2] ~= 0 then
		s_addItem(uid, paramlist[2], 3, paramlist[3], paramlist[4], paramlist[5], paramlist[6])
	end
end
end

--接取任务创建副本{int:副本ID, int:副本场景, int:X坐标, int:Y坐标}
function s_actionIntoCopyCustomSingle(uid, taskid, subtaskid, paramlist)
s_intoCopyCustomSingle(uid, paramlist[1], paramlist[2], paramlist[3], paramlist[4])
end

--设置任务经验存量{int:经验值}
function s_actionSetExp(uid, taskid, subtaskid, paramlist)
local exp = paramlist[1]
if exp < 0 then exp = 0 end
s_addTaskVar(uid, taskid, MvarIndex_Exp, exp)
end

--设置任务经验存量，通过百分比{float:百分比(1.0为100%)}
function s_actionSetExpByPercent(uid, taskid, subtaskid, paramlist)
local exp = GetTaskExp(uid, taskid)
exp = math.floor(exp * paramlist[1])
s_addTaskVar(uid, taskid, MvarIndex_Exp, exp)
end

--设置任务经验存量，通过绝对数{int:经验的改变值(可以为负数)}
function s_actionSetExpByDelta(uid, taskid, subtaskid, paramlist)
local exp = GetTaskExp(uid, taskid)
exp = exp + paramlist[1]
if exp < 0 then exp = 0 end
s_addTaskVar(uid, taskid, MvarIndex_Exp, exp)
end

--增加经验{int:经验, ExpType_:经验类型, int:参数(由经验类型决定)}
function s_actionAddExp(uid, taskid, subtaskid, paramlist)
s_refreshExp(uid, paramlist[1], paramlist[2], paramlist[3])
end

--增加角色声望{int:声望增加值}
function s_actionAddRolePrestige(uid, taskid, subtaskid, paramlist)
s_addValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_ALL_PRESTIGE,paramlist[1])
end

--角色军衔升级
function s_actionLevelUpMiliRank(uid, taskid, subtaskid, paramlist)
s_levelupMiliRank(uid)
end

--设置任务ID{int:任务ID}
function s_actionSetSubtaskID(uid, taskid, subtaskid, paramlist)
s_addTaskVar(uid, taskid, MvarIndex_SubTask, paramlist[1])
end

--变身为Npc{int:变身后的NpcID, int:变身时间限制}
--若NpcID为0，则清空变身状态
function s_actionChangeToNpc(uid, taskid, subtaskid, paramlist)
if paramlist[1] ~= nil and paramlist[1] ~= 0 then
	s_setTrafficType(uid,TrafficType_MagicChange,paramlist[1],paramlist[2])
else
	s_resetTrafficType(uid)
end
end

--改变坐骑{int:坐骑的NpcID, int:变身时间限制}
--若NpcID为0，则清空坐骑状态
function s_actionChangeRide(uid, taskid, subtaskid, paramlist)
if paramlist[1] ~= nil and paramlist[1] ~= 0 then
	s_setTrafficType(uid,TrafficType_RideChange,paramlist[1],paramlist[2])
else
	s_resetTrafficType(uid)
end
end

--变身为超能武器{int:是否变为超能武器, int:变身时间限制}
--大于0表示变身，0表示清空
function s_actionChangeToSuperWeapon(uid, taskid, subtaskid, paramlist)
if paramlist[1] ~= nil and paramlist[1] ~= 0 then
	s_setTrafficType(uid,TrafficType_SuperWeapon,0,paramlist[2])
else
	s_resetTrafficType(uid)
end
end

--双人乘骑，自身为主动方{int:是否启用(1表示启用，0表示取消),int:时间(单位秒), int:骑乘坐骑baseid)}
--sample  {s_actionCarrige,{0,0,50025}}		双人马车

function s_actionCarrige(uid, taskid, subtaskid, paramlist)
local sex = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SEX)

local other = 0
local list = s_getTeamEntry(SCENE_ENTRY_PLAYER,uid,paramlist[1])
for i = 1,table.getn(list), 2 do
	if list[i] == 0 and list[i+1] ~= uid then
		if sex ~= s_getValue(SCENE_ENTRY_PLAYER,list[i+1],VALUE_TYPE_SEX) then
			other = list[i+1]
			break
		end
	end
end

if paramlist[1] >= 1 then
	if other ~= 0 then
		s_setTrafficType(uid,TrafficType_CarrigeLead,other,paramlist[2],paramlist[3])
		s_setTrafficType(other,TrafficType_CarrigeFollow,uid,paramlist[2],paramlist[3])
	end
else
	s_resetTrafficType(uid)
	s_resetTrafficType(other)
end
end

--增加一个任务{int:TaskID}
function s_actionAddRoleTask(uid, taskid, subtaskid, paramlist)
if paramlist[1] == nil and paramlist[1] == 0 then return end

local subinfo = GetSubTaskInfo(paramlist[1], 1)
if subinfo ~= nil and subinfo.task ~= nil and subinfo.task[1] ~= nil then
	subinfo.task[1](paramlist[1], 1, subinfo.task[2], uid)
end
end

--发送系统消息{string:msg, int:info_type(请参见ChatPos)}
--[[
enum ChatPos
{
// 以下最多只能容纳16bit，且修改时需要通知GMTool修改！
ChatPos_MsgBox		= 0,	/// 对话框输出 (该类型只能单独使用，请不要和其他类型进行二进制混合，否则客户端无法显示！)
ChatPos_Normal		= 1,	/// 普通聊天输出
ChatPos_Sys			= 2,	/// 系统提示输出
ChatPos_Tips		= 4,	/// 冒泡提示
ChatPos_Pop			= 8,	/// 右下角弹出
ChatPos_Private		= 16,	/// 私聊输出
ChatPos_Important	= 32,	/// 屏幕中央输出(电视^_^)
ChatPos_Honor		= 64,	/// 屏幕中央输出(电视^_^)
ChatPos_Gm			= 128,	/// GM系统公告输出位置
};
]]
function s_actionSysInfo(uid, taskid, subtaskid, paramlist)
if paramlist[1] ~= nil and paramlist[1] ~= "" then
	s_sysInfo(uid,paramlist[1],paramlist[2])
end
end

--发送组队系统消息{string:msg, int:info_type(请参见ChatPos)}
function s_actionTeamInfo(uid, taskid, subtaskid, paramlist)
if paramlist[1] == nil then return end
s_teamInfo(uid, paramlist[1], paramlist[2])
end

--发送团系统消息{string:msg, int:info_type(请参见ChatPos)}
function s_actionCorpsInfo(uid, taskid, subtaskid, paramlist)
local corps = s_getCorpsId(uid)
if corps == 0 then return end

if paramlist[1] ~= nil then
	s_corpsInfo(corps, paramlist[1], paramlist[2])
end
end

--发送军系统消息{string:msg, int:info_type(请参见ChatPos)}
function s_actionArmyInfo(uid, taskid, subtaskid, paramlist)
local army = s_getArmyID(uid)
if army == 0 then return end

if paramlist[1] ~= nil then
	s_armyInfo(army, paramlist[1], paramlist[2])
end
end

--发送全服系统消息{string:msg, int:info_type(请参见ChatPos)}
function s_actionWorldInfo(uid, taskid, subtaskid, paramlist)
if paramlist[1] == nil then return end
s_worldInfo(paramlist[1], paramlist[2])
end

--发送全国系统消息{int:CountryID(0:当前国; 1:本国; 其他:国家ID), string:msg, int:info_type(请参见ChatPos)}
function s_actionCountryInfo(uid, taskid, subtaskid, paramlist)
if paramlist[1] == nil or paramlist[2] == nil then return end

local country = paramlist[1]
if country == 0 then
	country = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_CURRENT_COUNTRY)
end
if country == 1 then
	country = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND)
end
s_countryInfo(country, paramlist[2], paramlist[3])
end

--发送全地图系统消息{int:CountryID(0:当前国; 1:本国; 其他:国家ID), int:mapid, string:msg, int:info_type(请参见ChatPos)}
function s_actionMapInfo(uid, taskid, subtaskid, paramlist)
if paramlist[1] == nil or paramlist[2] == nil or paramlist[3] == nil then return end

local country = paramlist[1]
if country == 0 then
	country = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_CURRENT_COUNTRY)
end
if country == 1 then
	country = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND)
end

s_mapInfo(country, paramlist[2], paramlist[3], paramlist[4])
end

--显示装备合成界面{int:标签页ID}
function s_actionShowEquipComposeInterface(uid, taskid, subtaskid, paramlist)
ShowEquipComposeInterface(uid, paramlist[1])
end


--跳转地图{int:CountryID(0:当前国; 1:本国; 其他:国家ID), int:mapid, int:posx, int:posy, int:区域ID}
function s_actionGoMap(uid, taskid, subtaskid, paramlist)
s_gomap(uid, paramlist[1], paramlist[2], paramlist[3], paramlist[4], paramlist[5])
end

--显示盒子包裹界面{}
function s_actionShowBoxPack(uid, taskid, subtaskid, paramlist)
ShowBoxPack(uid)
end

--任务接收时，设置团勋章奖励{int:团勋章数量}
function s_actionTaskCorpsOffer(uid, taskid, subtaskid, paramlist)
s_addTaskVar(uid,taskid,MvarIndex_Offer,paramlist[1])
end

--任务接收时，设置团繁荣度奖励{int:团繁荣度数量}
function s_actionTaskCorpsGlory(uid, taskid, subtaskid, paramlist)
s_addTaskVar(uid,taskid,MvarIndex_Cglory,1)
end

--任务接收时，设置团资金奖励{int:团资金数量}
function s_actionTaskCorpsMoney(uid, taskid, subtaskid, paramlist)
s_addTaskVar(uid,taskid,MvarIndex_Cmoney,1)
end

--任务接收时，设置繁荣度贡献奖励{int:繁荣度贡献数量}
function s_actionTaskAllGlory(uid, taskid, subtaskid, paramlist)
s_addTaskVar(uid,taskid,MvarIndex_AllGlory,1)
end

--增加恋人双方友好度{int:友好点数}
function s_actionAddFriendDegreeOfLover(uid, taskid, subtaskid, paramlist)
if paramlist[1] == nil or paramlist[1] == 0 then return end
local lover = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LOVER)
if lover ~= 0 then
	s_addFriendDegree(uid,lover,paramlist[1])
	s_addFriendDegree(lover,uid,paramlist[1])
end
end

--增加配偶双方友好度{int:友好点数}
function s_actionAddFriendDegreeOfSpouse(uid, taskid, subtaskid, paramlist)
if paramlist[1] == nil or paramlist[1] == 0 then return end
local spouse = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SPOUSE)
if spouse ~= 0 then
	s_addFriendDegree(uid,spouse,paramlist[1])
	s_addFriendDegree(spouse,uid,paramlist[1])
end
end

--增加恋人or配偶双方友好度{int:友好点数}
function s_actionAddFriendDegreeOfLoverOrSpouse(uid, taskid, subtaskid, paramlist)
if paramlist[1] == nil or paramlist[1] == 0 then return end
local lover = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LOVER)
if lover ~= 0 then
	s_addFriendDegree(uid,lover,paramlist[1])
	s_addFriendDegree(lover,uid,paramlist[1])
	return
end

local spouse = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SPOUSE)
if spouse ~= 0 then
	s_addFriendDegree(uid,spouse,paramlist[1])
	s_addFriendDegree(spouse,uid,paramlist[1])
end
end

--增加恋人or配偶双方亲密度{int:亲密点数}
function s_actionAddCloseDegreeOfLoverOrSpouse(uid, taskid, subtaskid, paramlist)
if paramlist[1] == nil or paramlist[1] == 0 then return end
local lover = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LOVER)
if lover ~= 0 then
	s_addField(uid, UserVar_CloseDegree, paramlist[1])
	s_addField(lover, UserVar_CloseDegree, paramlist[1])
	s_sysInfo(uid, "获取" .. paramlist[1] .. "点亲密度");
	s_sysInfo(lover, "获取" .. paramlist[1] .. "点亲密度");
	return
end

local spouse = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SPOUSE)
if spouse ~= 0 then
	s_addField(uid, UserVar_CloseDegree, paramlist[1])
	s_addField(spouse, UserVar_CloseDegree, paramlist[1])
	s_sysInfo(uid, "获取" .. paramlist[1] .. "点亲密度");
	s_sysInfo(spouse, "获取" .. paramlist[1] .. "点亲密度");
end
end

--简单的增加完成任务，只是标记任务完成，用于任务跳转、任务二选一等{int:taskid}
function s_actionAddAndFinishTask(uid, taskid, subtaskid, paramlist)
if paramlist[1] == nil then return end
s_addTask(uid, paramlist[1])
s_finishTask(uid, paramlist[1])
end


--设置新手保护{}
function s_actionSetProtect(uid, taskid, subtaskid, paramlist)
s_setProtect(uid)
end

--取消新手保护{}
function s_actionCancelProtect(uid, taskid, subtaskid, paramlist)
s_cancelProtect(uid)
end

--开启一个仓库
function s_actionIncStorePackNum(uid, taskid, subtaskid, paramlist)
s_incStorePackNum(uid)
end

--播放一个特效{int:buffid}
function s_actionPlaySfxByBuff(uid, taskid, subtaskid, paramlist)
if paramlist[1] == nil then return end
local npcid = s_summon(SCENE_ENTRY_PLAYER,uid,60570)
s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,10*1000)
if npcid == 0 then
	return VALUE_FAIL
end
s_addbuff(SCENE_ENTRY_NPC,npcid,paramlist[1],1,10)
end

--在主角身上加一个buff{int:buffid, int:buff等级, int:buff持续时间(单位:秒), int:buff需要的参数(某些buff需要)}
function s_actionAddBuff(uid, taskid, subtaskid, paramlist)
if paramlist[1] == nil then return end
s_addbuff(SCENE_ENTRY_PLAYER, uid, paramlist[1], paramlist[2], paramlist[3], paramlist[4])
end

--在主角身上去除一个buff{int:buffid, int:buff数量(0表示清除所有指定id的buff)}
function s_actionRemoveBuff(uid, taskid, subtaskid, paramlist)
if paramlist[1] == nil then return end
s_removebuff(SCENE_ENTRY_PLAYER, uid, paramlist[1], paramlist[2])
end

--在主角身上播放一个特效补充表中的特效{int:SfxID(特效补充表中的特效ID)}
function s_actionAddSfx(uid, taskid, subtaskid, paramlist)
if paramlist[1] == nil then return end
s_sfxMagicPlay(uid, paramlist[1])
end

--播放一个笑脸表情{int:表情ID}
function s_actionSmile(uid, taskid, subtaskid, paramlist)
if paramlist[1] == nil then return end
s_smile(uid, uid, paramlist[1])
end

--播放一个客户端动画脚本{int:动画ID} 客户端data1/AI/ 下可编辑
function s_taskplay(uid, taskid, subtaskid, paramlist)
if paramlist[1] == nil then return end
s_playClientLua(uid, paramlist[1])
end

--播放一个客户端新功能开启{int:新功能开启表的ID}
function s_actionNewFunctionOpen(uid, taskid, subtaskid, paramlist)
if paramlist[1] == nil then return end
s_newFunctionOpen(uid, paramlist[1])
end

--播放一个客户端Guide脚本{int:GuideID} 客户端data/gui/guide/ 下可编辑
function s_actionOpenGuide(uid, taskid, subtaskid, paramlist)
if paramlist[1] == nil then return end
s_openGuide(uid, paramlist[1])
end

--随机在一个事件池中选一个事件做{int:随机分子, int:随机分母, table:事件列表{ {s_action1,{paramlist1}},{s_action2,{paramlist2}},...}
-- {s_actionRandomAction,{ 80, 100, { {s_actionAddItem,{31186, 0, 1,0, "1-1", "RoleTaskInfo3591_1"}}, {s_actionAddItem,{31187, 0, 1,0, "1-1", "RoleTaskInfo1584_1"}}, } }, },
function s_actionRandomAction(uid, taskid, subtaskid, paramlist)
if paramlist[1] == nil or paramlist[2] == nil or paramlist[3] == nil then return end
if type(paramlist[3]) ~= "table" or table.getn(paramlist[3]) <= 0 then return end
if paramlist[1] >= 1 and paramlist[2] >= 1 and paramlist[1] <= paramlist[2] then
	local rand = math.random(1, paramlist[2])
	if rand <= paramlist[1] then
		local num = math.random(1, table.getn(paramlist[3]))
		if paramlist[3][num] ~= nil and paramlist[3][num][1] ~= nil then
			paramlist[3][num][1](uid, taskid, subtaskid, paramlist[3][num][2])
		end
	end
end
end

--给主角发送邮件{string:邮件内容, int:银币数量, int:道具baseid, int:道具数量, string:道具buff}
--{s_actionMail,{"恭喜您获得血战到底第一名奖励：羽灵*12！",0,27125,12,"1-1"}},
function s_actionMail(uid, taskid, subtaskid, paramlist)
s_sysMail(uid, paramlist[1], paramlist[2], paramlist[3], paramlist[4], paramlist[5], 0, "")
end

--给队伍除了自己发送邮件{int:队友和自己的距离(0表示不检查), string:邮件内容, int:银币数量, int:道具baseid, int:道具数量, string:道具buff}
--{s_actionMailToTeam,{0,"恭喜您获得血战到底第一名奖励：羽灵*12！",0,27125,12,"1-1"}},
function s_actionMailToTeam(uid, taskid, subtaskid, paramlist)
local list = s_getTeamEntry(SCENE_ENTRY_PLAYER,uid,paramlist[1])
for i = 1,table.getn(list), 2 do
	if list[i] == SCENE_ENTRY_PLAYER and list[i+1] ~= uid then
		s_sysMail(list[i+1], paramlist[2], paramlist[3], paramlist[4], paramlist[5], paramlist[6], 0, "")
	end
end
end

--设置玩家的变量{int:key1, int:key2, int:value}
--{s_actionSetVar,{1,100,10}},
function s_actionSetVar(uid, taskid, subtaskid, paramlist)
s_setVar(uid, paramlist[1], paramlist[2], paramlist[3])
end

--增加玩家的变量{int:key1, int:key2, int:addvalue}
--{s_actionAddVar,{1,100,10}},
function s_actionAddVar(uid, taskid, subtaskid, paramlist)
local value = s_getVar(uid, paramlist[1], paramlist[2])
if value == nil then return end
s_setVar(uid, paramlist[1], paramlist[2], value+paramlist[3])
end

--设置玩家的任务变量{int:key1, int:key2, int:value}
--{s_actionSetTaskVar,{1,100,10}},
function s_actionSetTaskVar(uid, taskid, subtaskid, paramlist)
s_setVar(uid, paramlist[1], paramlist[2], paramlist[3])
end

--减少玩家的变量{int:key1, int:key2, int:subvalue}
--{s_actionSubVar,{1,100,10}},
function s_actionSubVar(uid, taskid, subtaskid, paramlist)
local value = s_getVar(uid, paramlist[1], paramlist[2])
if value == nil then return end
if value < paramlist[3] then
	value = 0
else
	value = value - paramlist[3]
end
s_setVar(uid, paramlist[1], paramlist[2], value)
end

--设置玩家的任务变量{int:key1, int:key2, int:value}
--{s_actionSetTaskVar,{1,100,10}},
function s_actionSetTaskVar(uid, taskid, subtaskid, paramlist)
s_addTaskVar(uid, paramlist[1], paramlist[2], paramlist[3])
end

--扣除当前体力点{int:subvalue}
--{s_actionSubUsableTiledPoint,{1}},
function s_actionSubUsableTiledPoint(uid, taskid, subtaskid, paramlist, tips)
s_subValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_USABLE_TILED_POINT,paramlist[1])
return VALUE_OK
end

--增加玩家活跃度{int:addvalue}
--{s_actionAddActivePoint,{1}},
function s_actionAddActivePoint(uid, taskid, subtaskid, paramlist, tips)
s_addActivePoint(uid,ActivePointType_Task,paramlist[1])
return VALUE_OK
end

--增加玩家成就任务{int:addtask,int:subtask}
--{s_actionAddAchieveTaskOperate,{49000,1}},
function s_actionAddAchieveTaskOperate(uid, taskid, subtaskid, paramlist)
AddAchieveTaskOperate(uid, paramlist[1], paramlist[2])
return VALUE_OK
end

--删除新功能帮助{int:newfunctionid}
--{s_actionSysRightRemoveNewFunction,{19}},
function s_actionSysRightRemoveNewFunction(uid, taskid, subtaskid, paramlist)
s_sysRightRemoveNewFunction(uid,paramlist[1])
return VALUE_OK
end

function s_actionSysRightServerHotKey(uid, taskid, subtaskid, paramlist)
if paramlist[2] ~= nil and paramlist[2] ~= "" then
	s_sysRightServerHotKey(uid,paramlist[1],paramlist[2],paramlist[3])
end
end

--任务函数
--------------------------------------------------------------------------------------------------
--和NPC谈话{int:BeginNpcID, int:EndNpcID}
--subtaskid不为1时，直接领取
function s_taskTalk(taskid, subtaskid, paramlist, uid)
if paramlist == nil then
	s_debug("任务:taskid:%d,subtaskid:%d 参数为空",taskid, subtaskid)
	return
end
local beginNpcID = 0
if paramlist[1] ~= nil then	beginNpcID = paramlist[1] end
local endNpcID = 0
if paramlist[2] ~= nil then endNpcID = paramlist[2] end
local name = GetTaskName(taskid)
name = name .. GetSuffixToTaskName(taskid, name)
name = name .. "(3)%"..taskid

local info = GetTaskInfo(taskid)
if info == nil then return end

if uid == nil then
	--开始NPC事件：自动接受的子任务不注册
	if beginNpcID > 0 and subtaskid == 1 and (info.parent == nil or info.parent == 0) then
		AppendMenuToNpc(beginNpcID, name, "s_taskTalk_AcceptDealer($1,"..taskid..","..subtaskid..")", "CheckSubTaskAcceptShower($1,"..taskid..","..subtaskid..")")
	end

	--结束NPC事件
	if endNpcID > 0 then
		AppendMenuToNpc(endNpcID, name, "s_taskTalk_FinishDealer($1,"..taskid..","..subtaskid..")", "CheckSubTaskFinishShower($1,"..taskid..","..subtaskid..")")
	end

	--结束NPC为0，标志子任务为自动完成
	if endNpcID == 0 then
		local subinfo = GetSubTaskInfo(taskid, subtaskid)
		if subinfo.autofinish == nil then
			subinfo.autofinish = true
		end
	end
end

--自动接受的子任务直接接取
if uid ~= nil then
	s_taskTalk_Accept(uid, taskid, subtaskid)
end
end

function s_taskTalk_AcceptDealer(uid, taskid, subtaskid)
--主线任务等级不足检查
if DealMainTaskNoLevel(uid, taskid) == VALUE_OK then return end

local msg = GetSubTaskAcceptText(uid, taskid, subtaskid)
if msg == nil then return end
local call = "s_taskTalk_Accept($1,".. taskid .. "," .. subtaskid .. ")"
ShowNpcMenuBottomStyle(uid,msg,"接受(1)",call,"取消(1)")
end

function s_taskTalk_Accept(uid, taskid, subtaskid)
local subinfo = GetSubTaskInfo(taskid, subtaskid)
AddRoleSubTask(uid, taskid, subtaskid, 1, 1, 0, 0, subinfo.task[2][2])
end

function s_taskTalk_FinishDealer(uid, taskid, subtaskid)
local taskProcess = s_getTaskValue(uid,taskid,TaskValue_Process)
if taskProcess ~= TaskProcess_CanDone then
	return VALUE_FAIL
end

local msg = GetSubTaskFinishText(uid, taskid, subtaskid)
if msg == nil then return end
local call = "FinishRoleSubTask($1,".. taskid .. "," .. subtaskid..")"

local info = GetTaskInfo(taskid)
if subtaskid >= info.subtasknum then
	ShowNpcMenuBottomStyle(uid,msg,"完成(1)",call,"取消(1)")
else
	ShowNpcMenuBottomStyle(uid,msg,"继续(1)",call,"取消(1)")
end
end

function s_taskTalk_onDelete(uid, taskid, subtaskid)
--do nothing
end


--------------------------------------------------------------------------------------------------
--等级到达自动完成{int:BeginNpcID, int:EndNpcID, int:需要的等级}
function s_taskLevelUp(taskid, subtaskid, paramlist, uid)
if paramlist == nil then
	s_debug("任务:taskid:%d,subtaskid:%d 参数为空",taskid, subtaskid)
	return
end
s_sysInfo(uid,"123")
local beginNpcID = 0
if paramlist[1] ~= nil then	beginNpcID = paramlist[1] end
local endNpcID = 0
if paramlist[2] ~= nil then endNpcID = paramlist[2] end

if paramlist[3] == nil then return end
local levelUp = paramlist[3]

local name = GetTaskName(taskid)
name = name .. GetSuffixToTaskName(taskid, name)
name = name .. "(3)%"..taskid

local info = GetTaskInfo(taskid)
if info == nil then return end

if uid == nil then
	--开始NPC事件：自动接受的子任务不注册
	if beginNpcID > 0 and subtaskid == 1 and (info.parent == nil or info.parent == 0) then
		AppendMenuToNpc(beginNpcID, name, "s_taskLevelUp_AcceptDealer($1,"..taskid..","..subtaskid..","..levelUp..")", "CheckSubTaskAcceptShower($1,"..taskid..","..subtaskid..")")
	end

	--结束NPC事件
	if endNpcID > 0 then
		AppendMenuToNpc(endNpcID, name, "s_taskLevelUp_FinishDealer($1,"..taskid..","..subtaskid..","..levelUp..")", "CheckSubTaskFinishShower($1,"..taskid..","..subtaskid..")")
	end

	--注册升级时间
	RegisterLevelUpEvent( levelUp, "AddRoleTaskOperate($1,"..taskid..")" )

	--结束NPC为0，标志子任务为自动完成
	if endNpcID == 0 then
		local subinfo = GetSubTaskInfo(taskid, subtaskid)
		if subinfo.autofinish == nil then
			subinfo.autofinish = true
		end
	end
end

--自动接受的子任务直接接取
if uid ~= nil then
	s_taskLevelUp_Accept(uid, taskid, subtaskid, levelUp)
end
end

function s_taskLevelUp_AcceptDealer(uid, taskid, subtaskid, levelUp)
--主线任务等级不足检查
if DealMainTaskNoLevel(uid, taskid) == VALUE_OK then return end

local msg = GetSubTaskAcceptText(uid, taskid, subtaskid)
if msg == nil then return end
local call = "s_taskLevelUp_Accept($1,".. taskid .. "," .. subtaskid .. ","..levelUp..")"
ShowNpcMenuBottomStyle(uid,msg,"接受(1)",call,"取消(1)")
end

function s_taskLevelUp_Accept(uid, taskid, subtaskid, levelUp)
local operate = 0
local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
if level >= levelUp then
	operate = 1
end

local subinfo = GetSubTaskInfo(taskid, subtaskid)
AddRoleSubTask(uid, taskid, subtaskid, 1, operate, 0, 0, subinfo.task[2][2])
end

function s_taskLevelUp_FinishDealer(uid, taskid, subtaskid)
local taskProcess = s_getTaskValue(uid,taskid,TaskValue_Process)
if taskProcess == TaskProcess_Doing then
	local msg = GetSubTaskPromptText(uid, taskid, subtaskid)
	if msg == nil then return end
	ShowNpcMenuBottomStyle(uid,msg,"离开(5)")
elseif taskProcess == TaskProcess_CanDone then
	local msg = GetSubTaskFinishText(uid, taskid, subtaskid)
	if msg == nil then return end
	local call = "FinishRoleSubTask($1,".. taskid .. "," .. subtaskid..")"
	local info = GetTaskInfo(taskid)
	if subtaskid >= info.subtasknum then
		ShowNpcMenuBottomStyle(uid,msg,"完成(1)",call,"取消(1)")
	else
		ShowNpcMenuBottomStyle(uid,msg,"继续(1)",call,"取消(1)")
	end
end
end

function s_checkHaveDemonFinishTask(uid, taskid, subtaskid,paramlist)
local demons = s_getdemonlist(uid)
if demons ~= nil and table.getn(demons) > 0 then
	local process = s_getTaskValue(uid,taskid,TaskValue_Process)
	if process ~= TaskProcess_Doing then
		return
	end
	AddRoleTaskOperate(uid,taskid)
end
end

--添加称号
function s_addTaskTitle(uid, taskid, subtaskid,paramlist)
    s_addTitle(paramlist[1],uid,paramlist[2])
end

--删除称号
function s_delTaskTitle(uid, taskid, subtaskid,paramlist)
    s_delTitle(paramlist[1],uid,paramlist[2])
end


