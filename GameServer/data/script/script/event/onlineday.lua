--老兵回归奖励内容
function OnOnlineDayPresent(uid,lastday,days)
	--[[local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local worldlevel = s_getWorldLevel()
	local leveldiff = s_getMaxUserLevel() - s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
	local homeland = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND)
	local month = s_getCurTime(TIME_CURMONTHS) + 1
	local mday = s_getCurTime(TIME_CURMDAYS)
	if (month == 3 and mday >= 31) or (month == 4 and mday <= 1) then
		if worldlevel <= 2 then
			return VALUE_FAIL
		elseif worldlevel <= 3 then
			if level < 41 then
				s_sysInfo(uid,"未满41级的回归老兵角色，无法获取老兵回归奖励。您可以尝试前往新区，我们有很多新服等着您。")
				return VALUE_FAIL
			end
		elseif worldlevel <= 4 then
			if level < 51 then
				s_sysInfo(uid,"未满51级的回归老兵角色，无法获取老兵回归奖励。您可以尝试前往新区，我们有很多新服等着您。")
				return VALUE_FAIL
			end
		elseif worldlevel <= 5 then
			if level < 61 then
				s_sysInfo(uid,"未满61级的回归老兵角色，无法获取老兵回归奖励。您可以尝试前往新区，我们有很多新服等着您。")
				return VALUE_FAIL
			end
		else
			if level < 71 then
				s_sysInfo(uid,"未满71级的回归老兵角色，无法获取老兵回归奖励。您可以尝试前往新区，我们有很多新服等着您。")
				return VALUE_FAIL
			end
		end
		if leveldiff <= 3 then
			s_sysInfo(uid,"你角色等级离最高等级接近，无法获得老兵回归奖励。")
			return VALUE_FAIL
		end
		--回归脚本
		if s_getVar(uid,10001,33) < 1 then
			s_addVar(uid,10001,33,1)
			if days > 14 then
				if worldlevel == 3 then
					s_sysMail(uid,"欢迎您回来，您获得了老兵回归礼包奖励。",0,34125,1,"1-1")
					--s_sysMail(uid,"欢迎您回来，您获得了5星装备礼包！",0,34180,1,"1-1")
					s_sysInfo(uid,"<p><n>欢迎您回到《兵王2》，您已经获取了“黄金老兵礼包”和老兵荣誉勋章！。</n><book bookid='70161' text='【详】'/></p>",ChatPos_Sys + ChatPos_Pop)
				elseif worldlevel == 4 then
					s_sysMail(uid,"欢迎您回来，您获得了老兵回归礼包奖励。",0,34130,1,"1-1")
					--s_sysMail(uid,"欢迎您回来，您获得了5星装备礼包！",0,34180,1,"1-1")
					s_sysInfo(uid,"<p><n>欢迎您回到《兵王2》，您已经获取了“白金老兵礼包”和老兵荣誉勋章！。</n><book bookid='70161' text='【详】'/></p>",ChatPos_Sys + ChatPos_Pop)
				elseif worldlevel == 5 then
					s_sysMail(uid,"欢迎您回来，您获得了老兵回归礼包奖励。",0,34171,1,"1-1")
					--s_sysMail(uid,"欢迎您回来，您获得了5星装备礼包！",0,34180,1,"1-1")
					s_sysInfo(uid,"<p><n>欢迎您回到《兵王2》，您已经获取了“钻石老兵礼包”和老兵荣誉勋章！。</n><book bookid='70161' text='【详】'/></p>",ChatPos_Sys + ChatPos_Pop)
				elseif worldlevel >= 6 then
					s_sysMail(uid,"欢迎您回来，您获得了老兵回归礼包奖励。",0,34190,1,"1-1")
					--s_sysMail(uid,"欢迎您回来，您获得了5星装备礼包！",0,34180,1,"1-1")
					s_sysInfo(uid,"<p><n>欢迎您回到《兵王2》，您已经获取了“黑钻老兵礼包”和老兵荣誉勋章！。</n><book bookid='70161' text='【详】'/></p>",ChatPos_Sys + ChatPos_Pop)
				end
				s_sysMail(uid,"欢迎您回来，您获得了老兵荣誉勋章！使用勋章选择一位实力强的玩家作为您回归的引导者，双方都将获得丰厚的奖励！",0,55104,1,"1-1,7-3") --老兵荣誉勋章
				s_countryInfo(homeland,"<p><n color=GXColorBlueSky>尊敬的老兵</n><q buttonid=6005 ownerid=".. uid .. ">" ..name.. "</q><n color=GXColorBlueSky>带回了老兵荣誉勋章，有幸获得该勋章的玩家帮助老兵成长将可获得一份大礼！</n></p>",ChatPos_Sys + ChatPos_Honor)
			end
		end
	end]]
end
--幸运女神任务
function OnLuckyGoddessTask(uid)
	--如果有任务就删除
	local process = s_getTaskValue(uid,30500,TaskValue_Process)
	if process ~= TaskProcess_None then
		s_delTask(uid,30500,1)
	end
	s_setVar(uid,116,47,0)

	--接取任务
	local subinfo = GetSubTaskInfo(30500,1)
	if RunCheckList(uid, 30500, 1, subinfo.onacceptcheck) == VALUE_FAIL or RunCheckList(uid, 30500, 1, subinfo.onacceptcheck1) == VALUE_FAIL then
		return
	end

	local randomtaskid = s_taskRandomTask_Random(uid, 30500, 1)
	if randomtaskid == 30502 then
		local rand = math.random(1,100)
		if rand > 70 then return end
	elseif randomtaskid == 30503 then
		local rand = math.random(1,100)
		if rand > 70 then return end
	elseif randomtaskid == 30504 then
		local rand = math.random(1,100)
		if rand > 40 then return end
	elseif randomtaskid == 30505 then
		local rand = math.random(1,100)
		if rand > 40 then return end
	end

	AddRoleTask(uid,30500)

	--若接取成功，就记录接取时间
	local process = s_getTaskValue(uid,30500,TaskValue_Process)
	if process ~= TaskProcess_None then
		s_setVar(uid,116,47,s_getCurTime(TIME_ALLSECONDS))
	end
end


--刷新幸运女神任务
function OnRefreshLuckyGoddessTask(uid)
	local process = s_getTaskValue(uid,30500,TaskValue_Process)
	if process == TaskProcess_None then
		return
	end

	local child = s_getTaskVar(uid,30500,MvarIndex_Child)
	process = s_getTaskValue(uid,child,TaskValue_Process)
	if process == TaskProcess_None then
		return
	end
	local subtaskid = s_getTaskVar(uid,child,MvarIndex_SubTask)

	local grandchild = s_getTaskVar(uid,child,MvarIndex_Child)
	process = s_getTaskValue(uid,child,TaskValue_Process)
	if process == TaskProcess_None then
		return
	end

	--重新随机
	local randomtaskid = s_taskRandomTask_Random(uid, child, subtaskid)
	if randomtaskid == 0 then
		local curRound,curRing = GetTaskCurRoundAndRing(uid, child)
		s_debug("随机任务没有找到子任务,uid:%d, taskid:%d, curRound:%d, curRing:%s", uid, child, curRound, curRing)
		return
	end

	--删除之前的子任务
	s_addTaskVar(uid,grandchild,MvarIndex_Parent,0)
	s_addTaskVar(uid,child,MvarIndex_Child,0)
	s_delTask(uid,grandchild,1)

	--记录随机任务
	s_addVar(uid, child, TvarIndex_RandomTaskID, randomtaskid)

	--接受子任务
	s_actionAddRoleTask( uid, child, subtaskid, {randomtaskid} )

	--记录父任务和子任务变量
	s_addTaskVar(uid,randomtaskid,MvarIndex_Parent,child)
	s_addTaskVar(uid,child,MvarIndex_Child,randomtaskid)
end

--感恩节礼物
function OnThankDayPresent(uid, days)
--[[	local buyweek = s_getVar(uid,10008,3)
	local presentweek = s_getVar(uid,10008,4)
	if buyweek == 0 then
		return
	end
	local week = s_getSomeTime(days*86400,TIME_CURYWEEKS)
	if week <= buyweek then
		return
	end
	if week == presentweek then
		return
	end
	if week - buyweek > 4 then
		return
	end
	local wday = s_getSomeTime(days*86400,TIME_CURWDAYS)
	local box = s_getVar(uid,10008,1)
	if week - buyweek < 4 then
		if wday == 1 then
			s_addMoney(uid,MoneyType_GoldTicket,box*200,"暑期狂欢节第"..week-buyweek.."周返利")
			s_sysMail(uid,"您存入"..box.."块金砖，本周获得"..math.floor(box*200).."赠点红利，已发至账户，请查收！")
			s_setVar(uid,10008,2,s_getVar(uid,10008,2)+box*200)
			s_setVar(uid,10008,4,week)
		end
	else
		if wday == 1 then
			s_addMoney(uid,MoneyType_Gold,box*1000,"暑期狂欢节第"..week-buyweek.."周返本金")
			s_sysMail(uid,"感谢您的支持，现将购存金砖所花的"..math.floor(box*1000).."金币全额返还至您的账户，请查收！（期待您下次继续积极参加活动")
			s_setVar(uid,10008,4,week)
			s_setVar(uid,10008,1,0)
			s_setVar(uid,10008,2,0)
			s_setVar(uid,10008,3,0)
			s_setVar(uid,10008,4,0)
		end
	end]]
end

--补签签到奖励
function OnReplenishAward(uid)
	local mday = s_getCurTime(TIME_CURMDAYS)
	if mday <= s_getVar(uid,16,1) then
		return
	end
	local msg ="是否消耗" ..(mday-s_getVar(uid,16,1)).. "张“补签卡”，补签截止今日本月错过的签到？"
	local func = "ReplenishAwardCall($1,$2)"
	local buttons = "确定|3|Enter|取消|4|Esc"
	s_registerMsgBox(uid,func,buttons,msg)
end

function ReplenishAwardCall(uid,ret)
	if ret ~= Button_Yes then
		return
	end
	local mday = s_getCurTime(TIME_CURMDAYS)
	if mday <= s_getVar(uid,16,1) then
		return
	end
	local itemnum = mday-s_getVar(uid,16,1)
	if s_deleteItemByBaseID(uid,55319,itemnum,"补签扣除") ~= VALUE_OK then
		s_messageBox(uid,"补签卡数量不足，扣除失败")
		return
	end
	--	s_setVar(uid,16,1,mday)
	s_replenishLoginAwardDialog(uid)
end
