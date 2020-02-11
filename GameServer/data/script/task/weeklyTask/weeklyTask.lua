godWeekTaskID = { 50080, 50090, 50100, 50110, 50120 }
godWeekTaskStarExtr = { 1, 1.2, 1.5, 1.9, 2.4 }
godWeekTaskVigorPoint = { 450, 600, 750, 900, 1050 }
godWeekTaskKillNpcNum = { 3000, 4000, 5000, 6000, 7000 }
godWeekTaskKillEnemyNum = { 20, 30, 40, 50, 60 }
godWeekTaskUseMoney = { 5000, 5000, 10000, 3000, 5000 }
godWeekTaskGetCardNum = { 2, 3, 4, 5, 6 }
godWeekTaskState = { {450, 3000, 20, 5000, 2},
	{600, 4000, 30, 5000, 3},
	{750, 5000, 40, 10000, 4},
	{900, 6000, 50, 3000, 5},
	{1050, 7000, 60, 5000, 6},
}
function randomGodWeekTask()
	local taskIndex = math.random(1,5)
	local taskStar = math.random(1,5)
	return godWeekTaskID[taskIndex] + taskStar
end

--任务经验
function getWeeklyTaskBaseExp(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local exp = math.floor(1500 * (50 + 0.1 * level^2.2))
	return exp
end

function getWeeklyTaskExp(uid,taskid)
	local exp = getWeeklyTaskBaseExp(uid) * godWeekTaskStarExtr[taskid % 10]
	return exp
end

function weeklyTaskFinishDeal(uid)
	if s_getVar(uid,101,79) == 0 then
		s_setVar(uid,101,77,0)
	else
		s_setVar(uid,101,77,2)
	end
	s_setVar(uid,101,78,0)
	s_setVar(uid,101,80,0)
	s_setVar(uid,101,81,0)
	s_setVar(uid,101,82,0)
	s_setVar(uid,101,83,0)
	s_setVar(uid,101,84,0)
end

function getWeeklyTaskState(uid,taskid)
	if taskid == nil or taskid == 0 then
		return nil
	end
	local taskType = math.floor(taskid / 10) - 5007
	if taskType < 1 or taskType > 5 then
		return nil
	end
	local taskStar = taskid % 10   --公式等于taskid-floor(taskid/10)*10
	if taskStar < 1 or taskStar > 5 then
		return nil
	end
	return godWeekTaskState[taskStar][taskType]
end

function OnWeeklyTaskInterfaceInit(uid)
	if s_getVar(uid,101,80) == 0 then
		local newTaskID = randomGodWeekTask()
		if newTaskID ~= 0 and newTaskID ~= nil then
			s_setVar(uid,101,80,newTaskID)
		end
	end
end

function OnOpenWeeklyTaskInterface(uid)
	ShowRefreshWeeklyTaskInterface(uid)
end

function OnAcceptWeeklyTask(uid)
	if s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL) < 81 then
		s_sysInfo(uid,"等级不足，请81级以后再来接取吧！")
		return
	end
	if s_getVar(uid,101,77) == 1 then
		s_sysInfo(uid,"您有尚未完成的神恩任务！")
		return
	elseif s_getVar(uid,101,77) == 2 and s_getVar(uid,101,79) == 1 then
		s_sysInfo(uid,"一周只能接取一次神恩任务！")
		return
	end
	local taskID = s_getVar(uid,101,80)
	if taskID ~= 0 then
		local subinfo = GetSubTaskInfo(taskID, 1)
		if subinfo == nil then
			return
		end
		local param1 = subinfo.task[2][1]
		local param2 = subinfo.task[2][2]
		local state = getWeeklyTaskState(uid,taskID)
		--AddRoleTask(uid,taskID)
		--		AddRoleSubTask(uid,taskID,1,state,0,2)
		--
		local info = GetTaskInfo(taskID)
		local subinfo = GetSubTaskInfo(taskID,1)
		local OnAcceptCheck = info.OnAcceptCheck
		local onacceptcheck = subinfo.onacceptcheck
		info.OnAcceptCheck = nil
		subinfo.onacceptcheck = nil
		local color = 0
		if taskID == 50082 or taskID == 50092 or taskID == 50102 or taskID == 50112 or taskID == 50122 then
			color = 1
		elseif taskID == 50083 or taskID == 50093 or taskID == 50103 or taskID == 50113 or taskID == 50123 then
			color = 2
		elseif taskID == 50084 or taskID == 50094 or taskID == 50104 or taskID == 50114 or taskID == 50124 then
			color = 3
		elseif taskID == 50085 or taskID == 50095 or taskID == 50105 or taskID == 50115 or taskID == 50125 then
			color = 4
		end
		AddRoleSubTask(uid, taskID, 1, state, 0, color) --定义任务颜色
		--AddRoleTaskForGM(uid,taskID,state,0,2)
		info.OnAcceptCheck = OnAcceptCheck
		subinfo.onacceptcheck = onacceptcheck
		--local desc = GetSubTaskDescText(uid,taskID,1)
		s_setTaskValue(uid,33526,TaskValue_Desc,desc,1)
		s_setVar(uid,101,77,1)
		s_setVar(uid,101,78,taskID)
		s_setVar(uid,101,79,1)
		s_sysInfo(uid,"成功接取神恩任务！")
	end
end

function OnRefreshGodWeekTask(uid)
	if s_getVar(uid,101,77) ~= 0 then
		s_sysInfo(uid,"未接取任务状态下才可刷新！")
		return VALUE_FAIL
	end

	if s_removeMoney(uid,MoneyType_GoldTicket,200,"刷新神恩周常任务扣除") ~= VALUE_OK then
		s_sysInfo(uid,"不足200赠点无法刷新")
		return VALUE_FAIL
	end

	local newTaskID = randomGodWeekTask()
	if newTaskID ~= 0 and newTaskID ~= nil then
		s_setVar(uid,101,80,newTaskID)
	end
	s_sysInfo(uid,"神恩周常任务成功刷新")
	s_debug("" .. s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME) .. "刷新神恩周常任务成功，新任务ID: " .. newTaskID)
	return VALUE_OK
end

function OnOpenBlessWeeklyTaskInterface(uid)
	ShowBlessWeeklyTaskInterface(uid)
end

function OnBlessWeeklyTask(uid,lock1,lock2,lock3,lock4)
	if uid == nil or uid == 0 then
		return
	end
	--除第一次打开不需要花费赠点，此后再次祈福需要花费赠点
	if s_getVar(uid,101,81) ~= 0 then
		local money = (lock1 + lock2 + lock3 + lock4 + 1) * 200
		if s_removeMoney(uid,MoneyType_GoldTicket,money,"神恩祈福扣除") ~= VALUE_OK then
			s_sysInfo(uid,"赠点不足" .. money)
			return VALUE_FAIL
		end
	end
	if s_getVar(uid,101,81) == 0 or lock1 == 0 then
		s_setVar(uid,101,81,math.random(1,5))
	end
	if s_getVar(uid,101,82) == 0 or lock2 == 0 then
		s_setVar(uid,101,82,math.random(1,5))
	end
	if s_getVar(uid,101,83) == 0 or lock3 == 0 then
		s_setVar(uid,101,83,math.random(1,5))
	end
	if s_getVar(uid,101,84) == 0 or lock4 == 0 then
		s_setVar(uid,101,84,math.random(1,5))
	end
end

function OnGetGodBlessCard(uid)
	if uid == 0 or uid == nil then
		return
	end
	local cardNum = { 0, 0, 0, 0, 0 }
	for i = 1, 4 do
		cardNum[s_getVar(uid,101,80 + i)] = cardNum[s_getVar(uid,101,80 + i)] + 1
	end

	for i = 1, table.getn(cardNum) do
		if cardNum[i] == 2 then
			s_addItem(uid,55270 + i,0,1,0,"1-1,7-1","神恩卡牌")
		elseif cardNum[i] == 3 then
			s_addItem(uid,55270 + i,0,1,0,"1-1,7-2","神恩卡牌")
		elseif cardNum[i] == 4 then
			s_addItem(uid,55270 + i,0,1,0,"1-1,7-3","神恩卡牌")
		end
	end

	s_setVar(uid,101,81,0)
	s_setVar(uid,101,82,0)
	s_setVar(uid,101,83,0)
	s_setVar(uid,101,84,0)
end

function GetWeeklyTaskStar(starNum)
	local starStr = ""
	for i = 1, starNum do
		starStr = starStr .. "★"
	end
	return starStr
end

weeklyTaskTraceEnd = [[<p><n>  回复：</n><goto id="372" mapid="5" flagpoint="1" taskid="50112"/></p>]]
