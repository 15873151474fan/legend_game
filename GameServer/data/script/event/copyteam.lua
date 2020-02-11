--注意这里的Table是根据地图信息配置表中获得的
local CopyTeamTable =
{
	{ mapid = 210, name="魔古堡玄界一层", level = 75, rebirth = 0, times = 1, buynum = 1, money = 20, desc = "简单" },	-- 210
	{ mapid = 211, name="魔古堡玄界二层", level = 1002, rebirth = 2, times = 1, buynum = 1, money = 40, desc = "普通" },	-- 211
	{ mapid = 212, name="魔古堡玄界三层", level = 1004, rebirth = 4, times = 1, buynum = 1, money = 80, desc = "困难" },	-- 212
	{ mapid = 227, name="混乱深渊一层", level = 75, rebirth = 2, times = 1, buynum = 1, money = 80, desc = "混乱深渊" },	-- 混乱深渊分2层是同一个副本
--	{ mapid = 227, name="混乱深渊二层", level = 1001, rebirth = 1, times = 1, buynum = 0, money = 80, desc = "混乱困难精英" },	-- 
}

--获得副本相关数据
function GetCopyTeamMapInfo(copytype, index)
	if index == 0 then
		return table.getn(CopyTeamTable);
	end

	if copytype == nil or copytype <= 0 or copytype > 5 then
		return 0
	end

	if index == 1 then
		return CopyTeamTable[copytype].mapid
	elseif index == 3 then
		return CopyTeamTable[copytype].level
	elseif index == 4 then
		return CopyTeamTable[copytype].rebirth
	elseif index == 5 then
		return CopyTeamTable[copytype].times
	elseif index == 6 then
		return CopyTeamTable[copytype].buynum
	elseif index == 7 then
		return CopyTeamTable[copytype].money
	end

	return 0
end

--获得副本队伍最大购买熟练
function GetCTeamExchangeMaxNum(uid)
	return 999
end

--获得副本队伍成员信息
function getMemberInfo(cteamid, MemberTable)
	if cteamid == nil or cteamid == 0 then
		return
	end

	local member = s_getCopyTeamMemberInfo(cteamid)
	if member == nil or table.getn(member) == 0 then
		return
	end

	local temp = {}
	for i=1, table.getn(member), 8 do
		if (i-1) % 8 == 0 then
			temp = {}
		end
		temp.userid = member[math.floor(i / 8) * 8 + 1]
		temp.name = member[math.floor(i / 8) * 8 + 2]
		temp.face = member[math.floor(i / 8) * 8 + 3]
		temp.profession = member[math.floor(i / 8) * 8 + 4]
		temp.level = member[math.floor(i / 8) * 8 + 5]
		temp.power = member[math.floor(i / 8) * 8 + 6]
		temp.rebirth = member[math.floor(i / 8) * 8 + 7]
		temp.times = member[math.floor(i / 8) * 8 + 8]
		table.insert(MemberTable, temp)
	end

	for k,v in ipairs(MemberTable) do
		s_trace("userid="..v.userid..",name="..v.name..",face="..v.face..",profession="..v.profession..",level="..v.level..",power="..v.power..",rebirth="..v.rebirth..",times="..v.times)
	end
end
--获得各类型的次数
function getCopyTypeTime(times, copytype)
	local time1 = 0
	local time2 = 0
	local time3 = 0
	local time4 = 0
	if times > 0 then
		time4 = math.floor(times / 100000)
		time1 = math.floor((times - time4 * 100000) / 10000)
		time2 = math.floor((times - time4 * 100000 - time1 * 10000) / 100)
		time3 = times % 100
	end

	if copytype == 1 then
		return time1
	elseif copytype == 2 then
		return time2
	elseif copytype == 3 then
		return time3
	elseif copytype == 4 then
		return time4
	end

	return 0
end

--创建副本队伍
function CreateCopyTeam(uid, copytype)
	s_debugUser(uid,">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>魔创副本 copytype = "..copytype)
	local taskid = s_getVar(uid,161,4)
	local taskProcess = s_getTaskValue(uid,taskid,TaskValue_Process)
	if taskProcess ~= nil and taskProcess ~= TaskProcess_None then
		s_sysInfo(uid, "您正在押镖中，不能进入多人副本", ChatPos_Tips)
		return
	end

	if copytype == nil or copytype <= 0 or copytype > 4 then
		s_debugUser(uid, "创建副本队伍时,副本类型参数不合法")
		s_sysInfo(uid, "请选择某一种副本类型", ChatPos_Tips)
		return
	end

	if CopyTeamTable[copytype].rebirth == 0 and s_getUserLevel(uid) < CopyTeamTable[copytype].level then
		s_debugUser(uid, "等级不足,无法创建副本队伍")
		s_sysInfo(uid, "等级不足", ChatPos_Tips)
		return
	end

	if s_getRebirthLevel(uid) < CopyTeamTable[copytype].rebirth then
		s_debugUser(uid, "飞升等级不足,无法创建副本队伍")
		s_sysInfo(uid, "飞升等级不足", ChatPos_Tips)
		return
	end

	if copytype <4 then
		if s_getField(uid, 50 + copytype) >= CopyTeamTable[copytype].times then
			s_debugUser(uid, "今日已进入副本队伍次数:"..s_getField(uid, 50 + copytype))
			s_sysInfo(uid, "今日副本队伍次数已用完,可购买或明日再次组队", ChatPos_Tips)
			return
		end
	elseif copytype == 4 then	--新增混乱深渊
		if s_getField(uid,UserVar_AbyssTimes) >= CopyTeamTable[copytype].times then
			s_debugUser(uid, "2今日已进入副本队伍次数:"..s_getField(uid,UserVar_AbyssTimes))
			s_sysInfo(uid, "今日副本队伍次数已用完,可购买或明日再次组队", ChatPos_Tips)
			return
		end
	end

	s_createCopyTeam(uid, copytype)
end

--发送世界邀请
function SendCopyTeamMsg(uid, uname, cteamid, cteamname, copytype)
	s_debugUser(uid, "发送副本队伍世界频道消息");
	s_sendWorldTeamInfo(uid, "正在进行多人副本[[#12]"..CopyTeamTable[copytype].name.."[-]]组队,[#800136,"..cteamid.."]",ChatPos_Normal)
	s_sysInfo(uid, "发送世界邀请成功", ChatPos_Tips)
end

--队长进入副本
function CopyTeamIntoCopy(uid, copytype, cteamid)
	s_debugUser(uid,">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>进入魔古堡副本copytype = "..copytype)
	s_debugUser(uid,">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>进入魔古堡副本cteamid = "..cteamid)
	local taskid = s_getVar(uid,161,4)
	local taskProcess = s_getTaskValue(uid,taskid,TaskValue_Process)
	if taskProcess ~= nil and taskProcess ~= TaskProcess_None then
		s_sysInfo(uid, "您正在押镖中，不能进入多人副本", ChatPos_Tips)
		return
	end
	if copytype == nil or copytype <= 0 or copytype > 4 then
		s_debugUser(uid, "进入副本时,副本类型参数错误,copytype="..(copytype or 0)..",cteamid="..(cteamid or 0))
		s_sysInfo(uid, "请选择一种副本类型进入副本", ChatPos_Tips)
		return
	end

	if cteamid == nil or cteamid == 0 then
		s_debugUser(uid, "进入副本时,cteamid=0")
		return
	end

	local MemberTable = {}
	getMemberInfo(cteamid, MemberTable)
	if table.getn(MemberTable) == 0 then
		s_debugUser(uid, "副本队伍没有成员,cteamid="..cteamid)
		return
	end

	local temp = {}
	for k, v in ipairs(MemberTable) do
		if CopyTeamTable[copytype].rebirth == 0 and v.level < CopyTeamTable[copytype].level then
			s_debugUser(uid, ""..v.name.."不满足副本进入等级")
			s_sysInfo(uid, ""..v.name.."不满足副本进入等级", ChatPos_Tips)
			return
		end

		if v.rebirth < CopyTeamTable[copytype].rebirth then
			s_debugUser(uid, ""..v.name.."不满足副本进入飞升等级")
			s_sysInfo(uid, ""..v.name.."不满足副本进入飞升等级", ChatPos_Tips)
			return
		end

        local bfirst = false
        local taskProcess = s_getTaskValue(v.userid, 1135, TaskValue_Process)
        if taskProcess == TaskProcess_Doing then
            bfirst = true
        end
        if bfirst == false then
            if getCopyTypeTime(v.times, copytype) >= CopyTeamTable[copytype].times then
                s_debugUser(uid, ""..v.name.."无次数进入副本")
                s_sysInfo(uid, ""..v.name.."无次数进入副本", ChatPos_Tips)
                return
            end
        end

		local mapid = s_getUserMapId(v.userid)
		if mapid == nil or mapid ~= 2 then
			s_debugUser(uid, ""..v.name.."与队长不在中都")
			s_sysInfo(uid, ""..v.name.."不在比麒城,无法进入副本", ChatPos_Tips)
			table.insert(temp, v.userid)
		end
	end

	if table.getn(temp) ~= 0 then
		s_sendCopyTeamMsg(uid, "准备进入多人副本,请立即前往比麒城", ChatPos_Normal)
		s_sendCopyTeamCall(uid)
		for i, v in ipairs(temp) do
			s_sysInfo(v, "队长准备进入多人副本,请立即前往比麒城参与战斗", ChatPos_Tips)
		end

		return
	end

	--s_copyteamIntoCopy(uid, cteamid, CopyTeamTable[copytype].mapid, copytype)
	if copytype >=1 and copytype <=3 then
		s_copyteamIntoCopy(uid, cteamid, CopyTeamTable[copytype].mapid, copytype)
	elseif copytype == 4 then
		if table.getn(MemberTable) < 3 then
		 	s_debugUser(uid, "副本队伍成员少于3人,cteamid="..cteamid)
		 	s_sysInfo(uid, "副本队伍成员必须大于3人",ChatPos_Tips)
		 	return
		end
		s_abysscopyIntoCopy(uid, cteamid, 227, copytype)
		--s_abysscopyIntoCopy(uid, cteamid, CopyTeamTable[copytype].mapid, copytype)
	end
end

--购买进入次数
function CopyTeamBuyNum(uid, copytype)
	if copytype == nil or copytype <= 0 or copytype > 4 then
		s_debugUser(uid, "副本类型参数不合法,copytype="..(copytype or 0))
		s_sysInfo(uid, "操作失败", ChatPos_Tips)
		return
	end
	s_debugUser(uid, "请求购买副本队伍类型:copytype="..(copytype or 0).."次数")
	if copytype <4 then
		local times = s_getField(uid, 50 + copytype)
		if  times == 0 then
			s_debugUser(uid, "还没有进入过副本,不需要购买")
			s_sysInfo(uid, "副本次数足够,不需要购买次数", ChatPos_Tips)
			return
		end

		if s_getVar(uid, 290, copytype) >= CopyTeamTable[copytype].buynum then
			s_debugUser(uid, "已经购买次数:"..s_getVar(uid, 290, copytype))
			s_sysInfo(uid, "今日购买次数已用完", ChatPos_Tips)
			return
		end

		if s_checkMoneyByType(uid, MoneyType_Gold, CopyTeamTable[copytype].money) == 0 then
			s_debugUser(uid, "购买副本次数时,元宝不足")
			s_sysInfo(uid, "元宝不足,请前往充值", ChatPos_Tips)
			return
		end

		if s_removeMoney(uid, MoneyType_Gold, CopyTeamTable[copytype].money, "副本队伍购买次数") == 0 then
			s_debugUser(uid, "购买次数时,扣除元宝失败")
			s_sysInfo(uid, "操作失败", ChatPos_Tips)
			return
		end

		s_setField(uid, 50 + copytype, times - 1)
		s_setVar(uid, 290, copytype, s_getVar(uid, 290, copytype) + 1)
		s_sendCopyTeamBuyNum(uid, copytype, CopyTeamTable[copytype].times)
	elseif copytype == 4 then
		local times = s_getField(uid,UserVar_AbyssTimes)
		if  times == 0 then
			s_debugUser(uid, "还没有进入过副本,不需要购买")
			s_sysInfo(uid, "副本次数足够,不需要购买次数", ChatPos_Tips)
			return
		end

		if s_getVar(uid, 290, 10 + copytype) >= CopyTeamTable[copytype].buynum then
			s_debugUser(uid, "已经购买次数:"..s_getVar(uid, 290, 10 + copytype))
			s_sysInfo(uid, "今日购买次数已用完", ChatPos_Tips)
			return
		end

		if s_checkMoneyByType(uid, MoneyType_Gold, CopyTeamTable[copytype].money) == 0 then
			s_debugUser(uid, "购买副本次数时,元宝不足")
			s_sysInfo(uid, "元宝不足,请前往充值", ChatPos_Tips)
			return
		end

		if s_removeMoney(uid, MoneyType_Gold, CopyTeamTable[copytype].money, "副本队伍购买次数") == 0 then
			s_debugUser(uid, "购买次数时,扣除元宝失败")
			s_sysInfo(uid, "操作失败", ChatPos_Tips)
			return
		end
		s_setVar(uid,149,57,0)
		s_setVar(uid,149,60,0)
		s_setField(uid,UserVar_AbyssTimes, times - 1)
		s_setVar(uid, 290,10 + copytype, s_getVar(uid, 290, 10 + copytype) + 1)
		s_sendCopyTeamBuyNum(uid, copytype, CopyTeamTable[copytype].times)
	end
end

--副本次数小红点
function GetCopyTeamEnterableState(uid)
	local level = s_getUserLevel(uid)
	local rebirth = s_getRebirthLevel(uid)

	for i = 1, 4 do
		if i < 4 then 
			if CopyTeamTable[i].rebirth == 0 and level >= CopyTeamTable[i].level and s_getField(uid, 50 + i) < CopyTeamTable[i].times then
				return 1
			end

			if rebirth > 0 and rebirth >= CopyTeamTable[i].rebirth and s_getField(uid, 50 + i) < CopyTeamTable[i].times then
				return 1
			end
		elseif i ==4 then
			if CopyTeamTable[i].rebirth == 0 and level >= CopyTeamTable[i].level and s_getField(uid, UserVar_AbyssTimes) < CopyTeamTable[i].times then
				return 1
			end

			if rebirth > 0 and rebirth >= CopyTeamTable[i].rebirth and s_getField(uid, UserVar_AbyssTimes) < CopyTeamTable[i].times then
				return 1
			end
		end
	end

	return 0
end
