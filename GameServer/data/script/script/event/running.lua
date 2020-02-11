--极速狂飙
--完成比赛
local function addItemToWinner(runnerid,itemerid,itemid)
	s_addItem(runnerid,itemid,3,1,0,"1-1","春节极速狂飙")
	s_addItem(itemerid,itemid,3,1,0,"1-1","春节极速狂飙")
end
function OnCompleteRunning(runnerid,itemerid,order)
	local cname = s_getValue(SCENE_ENTRY_PLAYER,runnerid,VALUE_TYPE_HOMELADN_NAME)
	local rname = s_getValue(SCENE_ENTRY_PLAYER,runnerid,VALUE_TYPE_NAME)
	local iname = s_getValue(SCENE_ENTRY_PLAYER,itemerid,VALUE_TYPE_NAME)
	if order == 1 then
		local msg = string.format("%s的%s与%s获得了极速狂飙的冠军",cname,rname,iname)
		s_worldInfo(msg,ChatPos_Sys + ChatPos_Honor)
	elseif order == 2 then
		local msg = string.format("%s的%s与%s获得了极速狂飙的亚军",cname,rname,iname)
		s_worldInfo(msg,ChatPos_Sys + ChatPos_Honor)
	elseif order == 3 then
		local msg = string.format("%s的%s与%s获得了极速狂飙的季军",cname,rname,iname)
		s_worldInfo(msg,ChatPos_Sys + ChatPos_Honor)
	end
	s_addValue(SCENE_ENTRY_PLAYER,itemerid,VALUE_TYPE_EXP_MEDAL,5)
	s_addValue(SCENE_ENTRY_PLAYER,runnerid,VALUE_TYPE_EXP_MEDAL,5)
	local runner_sex = s_getValue(SCENE_ENTRY_PLAYER,runnerid,VALUE_TYPE_SEX)
	local itemer_sex = s_getValue(SCENE_ENTRY_PLAYER,itemerid,VALUE_TYPE_SEX)
	local mod = 1
	if runner_sex ~= itemer_sex then
		mod = 1.3
	end
	GetRunningExp(runnerid,order,mod)
	GetRunningExp(itemerid,order,mod)
	--马年极速狂飙活动
	--[[if order == 1 then
	addItemToWinner(runnerid,itemerid,24128)
	local msg = string.format("%s的%s与%s获得了马年赛马活动的冠军“一马当先”称号奖励",cname,rname,iname)
	s_worldInfo(msg,ChatPos_Sys + ChatPos_Honor)
	elseif order == 2 then
	addItemToWinner(runnerid,itemerid,24129)
	local msg = string.format("%s的%s与%s获得了马年赛马活动的亚军“马如游龙”称号奖励",cname,rname,iname)
	s_worldInfo(msg,ChatPos_Sys + ChatPos_Honor)
	elseif order == 3 then
	addItemToWinner(runnerid,itemerid,24130)
	local msg = string.format("%s的%s与%s获得了马年赛马活动的季军“马到功成”称号奖励",cname,rname,iname)
	s_worldInfo(msg,ChatPos_Sys + ChatPos_Honor)
	elseif order == 4 then
	addItemToWinner(runnerid,itemerid,24131)
	local msg = string.format("%s的%s与%s获得了马年赛马活动的第4名“驷马难追”称号奖励",cname,rname,iname)
	s_worldInfo(msg,ChatPos_Sys + ChatPos_Sys)
	elseif order == 5 then
	addItemToWinner(runnerid,itemerid,24131)
	local msg = string.format("%s的%s与%s获得了马年赛马活动的第5名“驷马难追”称号奖励",cname,rname,iname)
	s_worldInfo(msg,ChatPos_Sys + ChatPos_Sys)
	elseif order <= 10 then
	addItemToWinner(runnerid,itemerid,24132)
	local msg = string.format("%s的%s与%s获得了马年赛马活动的第6-10名“脱缰之马”称号奖励",cname,rname,iname)
	s_worldInfo(msg,ChatPos_Sys + ChatPos_Sys)
	end]]--
	--活力点
	s_addVigorPoint(runnerid, 6)
	s_debugUser(runnerid,"完成极速狂飙，获得6点活力点")
	s_addVigorPoint(itemerid, 6)
	s_debugUser(itemerid,"完成极速狂飙，获得6点活力点")
	--活动界面计数
	local nowday = s_getCurTime(TIME_ALLDAYS)
	s_addVar(runnerid, 30032, TvarIndex_Day, nowday)
	s_addVar(itemerid, 30032, TvarIndex_Day, nowday)
	RefreshTaskDailyInfo(runnerid, 30032)
	RefreshTaskDailyInfo(itemerid, 30032)
	s_debug(""..iname.."与"..rname.."完成极速狂飙")
end

--index 道具位置索引
function OnUseRunningItem(itemid,runner1,runner2,index)
	local etype = SCENE_ENTRY_PLAYER
	local removeitem = VALUE_OK

	--静默箴言，无法使用道具
	local bufflevel = s_getbufflevel(etype,runner1,40)
	if bufflevel ~= 0 then
		s_sysInfo(runner1,"当前状态无法使用比赛道具")
		return VALUE_FAIL
	end

	--两极反转
	if itemid == 1001 then
		JumpTo(etype,runner1,etype,runner2,6)
		ShowAttack(7075,etype,runner1,etype,runner2)
	elseif itemid == 1002 then
		JumpTo(etype,runner1,etype,runner2,9)
		ShowAttack(7075,etype,runner1,etype,runner2)
	elseif itemid == 1003 then
		JumpTo(etype,runner1,etype,runner2,12)
		ShowAttack(7075,etype,runner1,etype,runner2)
	elseif itemid == 1004 then
		JumpTo(etype,runner1,etype,runner2,15)
		ShowAttack(7075,etype,runner1,etype,runner2)
		--涡轮增压
	elseif itemid == 1101 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7076,36,4,40)
	elseif itemid == 1102 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7076,36,6,60)
	elseif itemid == 1103 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7076,36,8,80)
	elseif itemid == 1104 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7076,36,10,100)
		--空间束缚
	elseif itemid == 1201 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7077,37,2)
	elseif itemid == 1202 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7077,37,3)
	elseif itemid == 1203 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7077,37,4)
	elseif itemid == 1204 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7077,37,5)
		--重力场
	elseif itemid == 1301 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7078,38,4)
	elseif itemid == 1302 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7078,38,6)
	elseif itemid == 1303 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7078,38,8)
	elseif itemid == 1304 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7078,38,10)
		--电磁扰动
	elseif itemid == 1401 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7079,39,6)
	elseif itemid == 1402 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7079,39,8)
	elseif itemid == 1403 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7079,39,10)
	elseif itemid == 1404 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7079,39,12)
		--静默箴言
	elseif itemid == 1501 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7080,40,6)
	elseif itemid == 1502 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7080,40,8)
	elseif itemid == 1503 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7080,40,10)
	elseif itemid == 1504 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7080,40,12)
		--绝对领域
	elseif itemid == 1601 then
		UseRunningItem_MultiAttack(etype,runner1,7081,41,4)
	elseif itemid == 1602 then
		UseRunningItem_MultiAttack(etype,runner1,7081,41,6)
	elseif itemid == 1603 then
		UseRunningItem_MultiAttack(etype,runner1,7081,41,8)
	elseif itemid == 1604 then
		UseRunningItem_MultiAttack(etype,runner1,7081,41,10)
		--时空沼泽
	elseif itemid == 1701 then
		UseRunningItem_MultiAttack(etype,runner1,7082,42,4)
	elseif itemid == 1702 then
		UseRunningItem_MultiAttack(etype,runner1,7082,42,6)
	elseif itemid == 1703 then
		UseRunningItem_MultiAttack(etype,runner1,7082,42,8)
	elseif itemid == 1704 then
		UseRunningItem_MultiAttack(etype,runner1,7082,42,10)
		--磁力妄境
	elseif itemid == 1801 then
		UseRunningItem_MultiAttack(etype,runner1,7083,43,4)
	elseif itemid == 1802 then
		UseRunningItem_MultiAttack(etype,runner1,7083,43,6)
	elseif itemid == 1803 then
		UseRunningItem_MultiAttack(etype,runner1,7083,43,8)
	elseif itemid == 1804 then
		UseRunningItem_MultiAttack(etype,runner1,7083,43,10)
		--防御镜面
	elseif itemid == 1901 then
		UseRunningItem_Attack(etype,runner1,0,0,7084,44,6)
	elseif itemid == 1902 then
		UseRunningItem_Attack(etype,runner1,0,0,7084,44,8)
	elseif itemid == 1903 then
		UseRunningItem_Attack(etype,runner1,0,0,7084,44,10)
	elseif itemid == 1904 then
		UseRunningItem_Attack(etype,runner1,0,0,7084,44,12)
		--绝对防御
	elseif itemid == 2001 then
		UseRunningItem_Attack(etype,runner1,0,0,7085,45,6)
	elseif itemid == 2002 then
		UseRunningItem_Attack(etype,runner1,0,0,7085,45,8)
	elseif itemid == 2003 then
		UseRunningItem_Attack(etype,runner1,0,0,7085,45,10)
	elseif itemid == 2004 then
		UseRunningItem_Attack(etype,runner1,0,0,7085,45,12)
		--解
	elseif itemid == 2101 then
		RemoveRunningDeBuff(etype,runner1)
		UseRunningItem_Attack(etype,runner1,0,0,7086,0,0)
	elseif itemid == 2102 then
		RemoveRunningDeBuff(etype,runner1)
		s_removeRunningItem(runner1,index)
		s_addRunningItem(runner1,index,2101)
		removeitem = VALUE_FAIL
		UseRunningItem_Attack(etype,runner1,0,0,7086,0,0)
	elseif itemid == 2103 then
		RemoveRunningDeBuff(etype,runner1)
		s_removeRunningItem(runner1,index)
		s_addRunningItem(runner1,index,2102)
		removeitem = VALUE_FAIL
		UseRunningItem_Attack(etype,runner1,0,0,7086,0,0)
	elseif itemid == 2104 then
		RemoveRunningDeBuff(etype,runner1)
		s_removeRunningItem(runner1,index)
		s_addRunningItem(runner1,index,2103)
		removeitem = VALUE_FAIL
		UseRunningItem_Attack(etype,runner1,0,0,7086,0,0)
		--经验卡
	elseif itemid == 2201 then
		return VALUE_OK
	elseif itemid == 2202 then
		return VALUE_OK
	elseif itemid == 2203 then
		return VALUE_OK
	elseif itemid == 2204 then
		return VALUE_OK
			--破坏神
	elseif itemid == 2301 then
		local check = CheckRunningAttack(etype,runner2)
		if check == 1 then
			RandomRemoveRunningItem(etype,runner2,1)
			ShowAttack(7088,etype,runner1,etype,runner2)
		elseif check == 2 then
			RandomRemoveRunningItem(etype,runner1,1)
			ShowAttack(7088,etype,runner2,etype,runner1)
		end
	elseif itemid == 2302 then
		local check = CheckRunningAttack(etype,runner2)
		if check == 1 then
			RandomRemoveRunningItem(etype,runner2,2)
			ShowAttack(7088,etype,runner1,etype,runner2)
		elseif check == 2 then
			RandomRemoveRunningItem(etype,runner1,2)
			ShowAttack(7088,etype,runner2,etype,runner1)
		end
	elseif itemid == 2303 then
		local check = CheckRunningAttack(etype,runner2)
		if check == 1 then
			RandomRemoveRunningItem(etype,runner2,3)
			ShowAttack(7088,etype,runner1,etype,runner2)
		elseif check == 2 then
			RandomRemoveRunningItem(etype,runner1,3)
			ShowAttack(7088,etype,runner2,etype,runner1)
		end
	end
	if removeitem == VALUE_OK then
		s_removeRunningItem(runner1,index)
	end
	return VAULE_OK
end

--给比赛者添加BUFF，两人都加
function AddBuffToPair(etype,eid,buff,level,time)
	--local partner = s_getRunningPartner(eid)
	s_addbuff(etype,eid,buff,level,time)
	--s_addbuff(etype,partner,buff,level,time)
end

--单攻
function UseRunningItem_Attack(etype1,eid1,etype2,eid2,skill,buff,time,level)
	if level == nil then level = 1 end
	if etype2 == 0 and eid2 == 0 then
		etype2 = etype1; eid2 = eid1;
	end
	local check = CheckRunningAttack(etype2,eid2)
	if check == 1 then
		if buff ~= 0 and buff ~= nil then
			AddBuffToPair(etype2,eid2,buff,level,time)
		end
		ShowAttack(skill,etype1,eid1,etype2,eid2)
	elseif check == 2 then
		if buff ~= 0 and buff ~= nil then
			AddBuffToPair(etype1,eid1,buff,level,time)
		end
		ShowAttack(skill,etype2,eid2,etype1,eid1)
	end
end

--群攻
function UseRunningItem_MultiAttack(etype1,eid1,skill,buff,max)
	local num = 0
	local list = s_getNineEntry(etype1,eid1,15)
	local victim = {}
	for i = 1,table.getn(list), 2 do
		if (list[i] == etype1 and list[i+1] ~= eid1)  then
			if s_getTrafficType(list[i+1]) == TrafficType_RTLead then
				local check = CheckRunningAttack(list[i],list[i+1])
				if check == 1 then
					table.insert(victim,list[i])
					table.insert(victim,list[i+1])
					table.insert(victim,0)
					AddBuffToPair(list[i],list[i+1],buff,1,5)
					num = num + 1
					if  num >= max then
						break
					end
				elseif check == 2 then
					AddBuffToPair(etype1,eid1,buff,1,5)
					ShowAttack(skill,list[i],list[i+1],etype1,eid1)
				end
			end
		end
	end
	s_attack(skill,etype1,eid1,0,0,unpack(victim))
end

--防御
--0:抵消伤害,1:可以伤害,2:反射伤害(所谓伤害指加减益BUFF)
function CheckRunningAttack(etype,eid)
	if etype == 0 and eid == 0 then
		return VALUE_OK
	end
	--镜面防御
	if s_getbufflevel(etype,eid,44) ~= 0 then
		s_removebuff(etype,eid,44)
		return 2
	end
	--绝对防御
	if s_getbufflevel(etype,eid,45) ~= 0 then
		return VALUE_FAIL
	end
	return VALUE_OK
end

--清除所有减益BUFF
function RemoveRunningDeBuff(etype,eid)
	local buffs = {36,37,38,39,40,41,42,43}
	local partner = s_getRunningPartner(eid)
	for i = 1, table.getn(buffs) do
		s_removebuff(etype,eid,buffs[i])
		s_removebuff(etype,partner,buffs[i])
	end
end

function RemoveCSRunningDeBuff(etype,eid)
	local buffs = {36,37,38,39,40,41,42,43}
	local partner = s_getCSRunningPartner(eid)
	for i = 1, table.getn(buffs) do
		s_removebuff(etype,eid,buffs[i])
		s_removebuff(etype,partner,buffs[i])
	end
end

--随机删除比赛道具
function RandomRemoveRunningItem(etype,eid,num)
	local itemindex = {}
	for i = 0, 2 do
		local itemid = s_getRunningItem(eid,i)
		if itemid ~= nil and itemid ~= 0 then
			table.insert(itemindex,i)
		end
	end
	if table.getn(itemindex) < 1 then
		return
	end
	local remove = {}
	if table.getn(itemindex) < num then
		remove = itemindex
	else
		while table.getn(remove) < num do
			local rand = math.random(1,table.getn(itemindex))
			table.insert(remove,itemindex[rand])
			table.remove(itemindex,rand)
		end
	end
	for i = 1, table.getn(remove) do
		s_removeRunningItem(eid,remove[i])
	end
end

function RandomRemoveCSRunningItem(etype,eid,num)
	local itemindex = {}
	for i = 0, 2 do
		local itemid = s_getCSRunningItem(eid,i)
		if itemid ~= nil and itemid ~= 0 then
			table.insert(itemindex,i)
		end
	end
	if table.getn(itemindex) < 1 then
		return
	end
	local remove = {}
	if table.getn(itemindex) < num then
		remove = itemindex
	else
		while table.getn(remove) < num do
			local rand = math.random(1,table.getn(itemindex))
			table.insert(remove,itemindex[rand])
			table.remove(itemindex,rand)
		end
	end
	for i = 1, table.getn(remove) do
		s_removeCSRunningItem(eid,remove[i])
	end
end

--完成比赛经验奖励
function GetRunningExp(runnerid,order,mod)
	local level1 = s_getValue(SCENE_ENTRY_PLAYER,runnerid,VALUE_TYPE_LEVEL)
	local orderadd = 0
	if order > 0 and order <= 10 then
		orderadd = (11 - order)
	end
	local itemadd = 0
	for i = 0, 2 do
		local item = s_getRunningItem(runnerid,i)
		if item == 2201 then
			itemadd = itemadd + 0.05
		elseif item == 2202 then
			itemadd = itemadd + 0.1
		elseif item == 2203 then
			itemadd = itemadd + 0.15
		elseif item == 2204 then
			itemadd = itemadd + 0.20
		end
	end
	local exp = math.floor(200*(50+0.1*level1^2.2)*(1+0.1*orderadd)*(1+itemadd)*mod)


	--成就点奖励
	AddAchieveTaskOperate(runnerid,40003,1)
	s_sysInfo(runnerid,"完成极速狂飙比赛,获得经验奖励")
	s_refreshExp(runnerid,exp,ExpType_Running,0)
	s_addActivePoint(runnerid,ActivePointType_Task,35)
end

--完成跨区极速狂飙
function OnCompleteCSRunning(runnerid,itemerid,order)
	local cname = s_getValue(SCENE_ENTRY_PLAYER,runnerid,VALUE_TYPE_HOMELADN_NAME)
	local rname = s_getValue(SCENE_ENTRY_PLAYER,runnerid,VALUE_TYPE_NAME)
	local iname = s_getValue(SCENE_ENTRY_PLAYER,itemerid,VALUE_TYPE_NAME)
	local countryid = s_getValue(SCENE_ENTRY_PLAYER,runnerid,VALUE_TYPE_HOMELADN)
	if order == 1 then
		local msg = string.format("%s的%s与%s获得了跨区极速狂飙的冠军",cname,rname,iname)
		s_countryAllInfo(countryid,msg,ChatPos_Sys + ChatPos_Honor)
		s_incVarOldZoneUser(runnerid,125,13,30)
		s_incVarOldZoneUser(itemerid,125,13,30)
	elseif order == 2 then
		local msg = string.format("%s的%s与%s获得了跨区极速狂飙的亚军",cname,rname,iname)
		s_countryAllInfo(countryid,msg,ChatPos_Sys + ChatPos_Honor)
		s_incVarOldZoneUser(runnerid,125,13,23)
		s_incVarOldZoneUser(itemerid,125,13,23)
	elseif order == 3 then
		local msg = string.format("%s的%s与%s获得了跨区极速狂飙的季军",cname,rname,iname)
		s_countryAllInfo(countryid,msg,ChatPos_Sys + ChatPos_Honor)
		s_incVarOldZoneUser(runnerid,125,13,20)
		s_incVarOldZoneUser(itemerid,125,13,20)
	elseif order == 4 then
		s_incVarOldZoneUser(runnerid,125,13,17)
		s_incVarOldZoneUser(itemerid,125,13,17)
	elseif order == 5 then
		s_incVarOldZoneUser(runnerid,125,13,14)
		s_incVarOldZoneUser(itemerid,125,13,14)
	elseif order == 6 then
		s_incVarOldZoneUser(runnerid,125,13,11)
		s_incVarOldZoneUser(itemerid,125,13,11)
	elseif order < 16 then
		s_incVarOldZoneUser(runnerid,125,13,8)
		s_incVarOldZoneUser(itemerid,125,13,8)
	else
		s_incVarOldZoneUser(runnerid,125,13,3)
		s_incVarOldZoneUser(itemerid,125,13,3)
	end
	s_debug(""..cname.."与"..rname.."完成跨区极速狂飙")
end

--index 道具位置索引
function OnUseCSRunningItem(itemid,runner1,runner2,index)
	local etype = SCENE_ENTRY_PLAYER
	local removeitem = VALUE_OK

	--静默箴言，无法使用道具
	local bufflevel = s_getbufflevel(etype,runner1,40)
	if bufflevel ~= 0 then
		s_sysInfo(runner1,"当前状态无法使用比赛道具")
		return VALUE_FAIL
	end

	--两极反转
	if itemid == 1001 then
		JumpTo(etype,runner1,etype,runner2,6)
		ShowAttack(7075,etype,runner1,etype,runner2)
	elseif itemid == 1002 then
		JumpTo(etype,runner1,etype,runner2,9)
		ShowAttack(7075,etype,runner1,etype,runner2)
	elseif itemid == 1003 then
		JumpTo(etype,runner1,etype,runner2,12)
		ShowAttack(7075,etype,runner1,etype,runner2)
	elseif itemid == 1004 then
		JumpTo(etype,runner1,etype,runner2,15)
		ShowAttack(7075,etype,runner1,etype,runner2)
		--涡轮增压
	elseif itemid == 1101 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7076,36,4,40)
	elseif itemid == 1102 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7076,36,6,60)
	elseif itemid == 1103 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7076,36,8,80)
	elseif itemid == 1104 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7076,36,10,100)
		--空间束缚
	elseif itemid == 1201 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7077,37,2)
	elseif itemid == 1202 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7077,37,3)
	elseif itemid == 1203 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7077,37,4)
	elseif itemid == 1204 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7077,37,5)
		--重力场
	elseif itemid == 1301 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7078,38,4)
	elseif itemid == 1302 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7078,38,6)
	elseif itemid == 1303 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7078,38,8)
	elseif itemid == 1304 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7078,38,10)
		--电磁扰动
	elseif itemid == 1401 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7079,39,6)
	elseif itemid == 1402 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7079,39,8)
	elseif itemid == 1403 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7079,39,10)
	elseif itemid == 1404 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7079,39,12)
		--静默箴言
	elseif itemid == 1501 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7080,40,6)
	elseif itemid == 1502 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7080,40,8)
	elseif itemid == 1503 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7080,40,10)
	elseif itemid == 1504 then
		UseRunningItem_Attack(etype,runner1,etype,runner2,7080,40,12)
		--绝对领域
	elseif itemid == 1601 then
		UseRunningItem_MultiAttack(etype,runner1,7081,41,4)
	elseif itemid == 1602 then
		UseRunningItem_MultiAttack(etype,runner1,7081,41,6)
	elseif itemid == 1603 then
		UseRunningItem_MultiAttack(etype,runner1,7081,41,8)
	elseif itemid == 1604 then
		UseRunningItem_MultiAttack(etype,runner1,7081,41,10)
		--时空沼泽
	elseif itemid == 1701 then
		UseRunningItem_MultiAttack(etype,runner1,7082,42,4)
	elseif itemid == 1702 then
		UseRunningItem_MultiAttack(etype,runner1,7082,42,6)
	elseif itemid == 1703 then
		UseRunningItem_MultiAttack(etype,runner1,7082,42,8)
	elseif itemid == 1704 then
		UseRunningItem_MultiAttack(etype,runner1,7082,42,10)
		--磁力妄境
	elseif itemid == 1801 then
		UseRunningItem_MultiAttack(etype,runner1,7083,43,4)
	elseif itemid == 1802 then
		UseRunningItem_MultiAttack(etype,runner1,7083,43,6)
	elseif itemid == 1803 then
		UseRunningItem_MultiAttack(etype,runner1,7083,43,8)
	elseif itemid == 1804 then
		UseRunningItem_MultiAttack(etype,runner1,7083,43,10)
		--防御镜面
	elseif itemid == 1901 then
		UseRunningItem_Attack(etype,runner1,0,0,7084,44,6)
	elseif itemid == 1902 then
		UseRunningItem_Attack(etype,runner1,0,0,7084,44,8)
	elseif itemid == 1903 then
		UseRunningItem_Attack(etype,runner1,0,0,7084,44,10)
	elseif itemid == 1904 then
		UseRunningItem_Attack(etype,runner1,0,0,7084,44,12)
		--绝对防御
	elseif itemid == 2001 then
		UseRunningItem_Attack(etype,runner1,0,0,7085,45,6)
	elseif itemid == 2002 then
		UseRunningItem_Attack(etype,runner1,0,0,7085,45,8)
	elseif itemid == 2003 then
		UseRunningItem_Attack(etype,runner1,0,0,7085,45,10)
	elseif itemid == 2004 then
		UseRunningItem_Attack(etype,runner1,0,0,7085,45,12)
		--解
	elseif itemid == 2101 then
		RemoveCSRunningDeBuff(etype,runner1)
		UseRunningItem_Attack(etype,runner1,0,0,7086,0,0)
	elseif itemid == 2102 then
		RemoveCSRunningDeBuff(etype,runner1)
		s_removeCSRunningItem(runner1,index)
		s_addCSRunningItem(runner1,index,2101)
		removeitem = VALUE_FAIL
		UseRunningItem_Attack(etype,runner1,0,0,7086,0,0)
	elseif itemid == 2103 then
		RemoveCSRunningDeBuff(etype,runner1)
		s_removeCSRunningItem(runner1,index)
		s_addCSRunningItem(runner1,index,2102)
		removeitem = VALUE_FAIL
		UseRunningItem_Attack(etype,runner1,0,0,7086,0,0)
	elseif itemid == 2104 then
		RemoveCSRunningDeBuff(etype,runner1)
		s_removeCSRunningItem(runner1,index)
		s_addCSRunningItem(runner1,index,2103)
		removeitem = VALUE_FAIL
		UseRunningItem_Attack(etype,runner1,0,0,7086,0,0)
		--经验卡
	elseif itemid == 2201 then
		return VALUE_OK
	elseif itemid == 2202 then
		return VALUE_OK
	elseif itemid == 2203 then
		return VALUE_OK
	elseif itemid == 2204 then
		return VALUE_OK
			--破坏神
	elseif itemid == 2301 then
		local check = CheckRunningAttack(etype,runner2)
		if check == 1 then
			RandomRemoveCSRunningItem(etype,runner2,1)
			ShowAttack(7088,etype,runner1,etype,runner2)
		elseif check == 2 then
			RandomRemoveCSRunningItem(etype,runner1,1)
			ShowAttack(7088,etype,runner2,etype,runner1)
		end
	elseif itemid == 2302 then
		local check = CheckRunningAttack(etype,runner2)
		if check == 1 then
			RandomRemoveCSRunningItem(etype,runner2,2)
			ShowAttack(7088,etype,runner1,etype,runner2)
		elseif check == 2 then
			RandomRemoveCSRunningItem(etype,runner1,2)
			ShowAttack(7088,etype,runner2,etype,runner1)
		end
	elseif itemid == 2303 then
		local check = CheckRunningAttack(etype,runner2)
		if check == 1 then
			RandomRemoveCSRunningItem(etype,runner2,3)
			ShowAttack(7088,etype,runner1,etype,runner2)
		elseif check == 2 then
			RandomRemoveCSRunningItem(etype,runner1,3)
			ShowAttack(7088,etype,runner2,etype,runner1)
		end
	end
	if removeitem == VALUE_OK then
		s_removeCSRunningItem(runner1,index)
	end
	return VAULE_OK
end
