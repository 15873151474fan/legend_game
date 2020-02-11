--押镖任务
function EscortTaskInfo(uid,tasktype)
	--请求打开界面与数据信息
	if tasktype == 0 then
		local bdouble = 0;
		local step1 = s_getEvent(Relation_World,0,DoubleEscort1)
		local step2 = s_getEvent(Relation_World,0,DoubleEscort2)
		if step1 == EventStep_Run  or step2 == EventStep_Run  then
			bdouble = 1;
		end
		local cur_escort_id = s_getVar(uid,161,3)
		if cur_escort_id == 0 then
			cur_escort_id = EscortTaskRefresh(uid)
			s_setVar(uid,161,3,cur_escort_id)
		end

		local cannum = 0
		if step2 == 2 then
			if s_getVar(uid,161,1) == 0 then
				cannum = 2 - s_getVar(uid,161,1)
				s_setVar(uid,161,1,s_getVar(uid,161,1) + 2)
			elseif s_getVar(uid,161,1) == 1 then
				cannum = 2
				s_setVar(uid,161,1,s_getVar(uid,161,1) + 1)
			else
				cannum = 5 - s_getVar(uid,161,1)
			end
		else
			cannum = 2 - s_getVar(uid,161,1)
		end
		local remain = 5 - s_getVar(uid,161,7)
		if remain <= 0 then
			remain = 0
		end
		if cannum <= 0 then
			cannum = 0
		end
		--是否是任务可执行的时间内
		s_sendEscortTaskInfo(uid,cur_escort_id,cannum,0,0,bdouble,remain)

		--刷新镖令
	elseif tasktype == 1 then
		local bdouble = 0;
		local step1 = s_getEvent(Relation_World,0,DoubleEscort1)
		local step2 = s_getEvent(Relation_World,0,DoubleEscort2)
		if step1 == EventStep_Run  or step2 == EventStep_Run  then
			bdouble = 1;
		end
		if bdouble ~= 1 then
			s_sysInfo(uid,"当前还不是押镖活动期间",ChatPos_Tips)
			return;
		end
		--		local cur_escort_id = s_getVar(uid,161,3)
		--		if cur_escort_id == 4 then
		--			s_sysInfo(uid,"已经是最高的等级，请前往完成任务!",ChatPos_Tips)
		--			return;
		--		end

		local cannum = 0
		if step2 == 2  then
			if s_getVar(uid,161,1) == 0 then
				cannum = 2 - s_getVar(uid,161,1) + s_getVar(uid,161,2)
				s_setVar(uid,161,1,s_getVar(uid,161,1) + 2)
			elseif s_getVar(uid,161,1) == 1 then
				cannum = 2
				s_setVar(uid,161,1,s_getVar(uid,161,1) + 1)
			else
				cannum = 5 - s_getVar(uid,161,1)
			end
		else
			cannum = 2 - s_getVar(uid,161,1)
		end
		--		local cannum =  2 - s_getVar(uid,161,1)  + s_getVar(uid,161,2)

		local remain = 0
		if cannum <= 0 then
			s_sysInfo(uid,"今日押镖次数不足",ChatPos_Tips)
			return;
		else
			s_setVar(uid,161,7,s_getVar(uid,161,7) + 1)
			remain =  5 - s_getVar(uid,161,7)
			if remain > 0 then
				if s_removeMoney(uid,MoneyType_MoneyTicket,10000,"刷新镖令任务") ~= VALUE_OK then
					s_sysInfo(uid,"银币不足，不能刷新",ChatPos_Tips)
					return;
				end
			else
				remain = 0
			end
		end
		if s_getVar(uid,161,7) > 5 then
			if s_deleteItemByBaseID(uid,10094,1,"刷镖令") ~= VALUE_OK then
				s_quickBuyItem(uid,10094,1)
				return;
			end
		end
		cur_escort_id = EscortTaskRefresh(uid);
		s_setVar(uid,161,3,cur_escort_id)
--		s_setVar(uid,161,7,s_getVar(uid,161,7) + 1)
		s_sendEscortTaskInfo(uid,cur_escort_id,cannum,0,0,bdouble,remain)
		--接受任务
	elseif tasktype == 2 then
		local bdouble = 0;
		local step1 = s_getEvent(Relation_World,0,DoubleEscort1)
		local step2 = s_getEvent(Relation_World,0,DoubleEscort2)
		if step1 == EventStep_Run  or step2 == EventStep_Run then
			bdouble = 1;
		end
		if bdouble ~= 1 then
			s_sysInfo(uid,"当前还不是押镖活动期间",ChatPos_Tips)
			return;
		end
		if s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL) < 40 then
			s_sysInfo(uid,"请升到40级以后再来!",ChatPos_Tips)
			return;
		end
		local taskid = s_getVar(uid,161,4)
		if taskid == 0 then
			s_sysInfo(uid,"当前没有任务，不能接取",ChatPos_Tips)
			return;
		end

		local taskProcess = s_getTaskValue(uid,taskid,TaskValue_Process)
		if taskProcess ~= nil and taskProcess ~= TaskProcess_None then
			s_sysInfo(uid,"当前押镖任务还未完成，不能重复接取",ChatPos_Tips)
			return;
		end
		--是否是任务第一次玩,第一次玩不扣次数，不元宝
		local bfirst = 0;
		local taskProcess = s_getTaskValue(uid, 1036, TaskValue_Process)
		if taskProcess == TaskProcess_Doing  then
			bfirst = 1;
		end

		local taskProcess = s_getTaskValue(uid, 1117, TaskValue_Process)
		if taskProcess == TaskProcess_Doing  then
			bfirst = 1;
		end

		local taskProcess = s_getTaskValue(uid, 1126, TaskValue_Process)
		if taskProcess == TaskProcess_Doing  then
			bfirst = 1;
		end

		local taskProcess = s_getTaskValue(uid, 1139, TaskValue_Process)
		if taskProcess == TaskProcess_Doing  then
			bfirst = 1;
		end

		local taskProcess = s_getTaskValue(uid, 1145, TaskValue_Process)
		if taskProcess == TaskProcess_Doing  then
			bfirst = 1;
		end

		local taskProcess = s_getTaskValue(uid, 1153, TaskValue_Process)
		if taskProcess == TaskProcess_Doing  then
			bfirst = 1;
		end

		if bfirst == 0 then
			local cannum = 0
			if step2 == 2 then
				if s_getVar(uid,161,1) == 0 then
					cannum = 2 - s_getVar(uid,161,1)
					s_setVar(uid,161,1,s_getVar(uid,161,1) + 2)
				elseif s_getVar(uid,161,1) == 1 then
					cannum = 2
					s_setVar(uid,161,1,s_getVar(uid,161,1) + 1)
				else
					cannum = 5 - s_getVar(uid,161,1)
				end
			else
				cannum = 2 - s_getVar(uid,161,1)
			end
			--            local cannum =  2 - s_getVar(uid,161,1)  + s_getVar(uid,161,2)
			if cannum <= 0 then
				cannum = 0
				s_sysInfo(uid,"押镖次数不足",ChatPos_Tips)
				return;
			end
			if  s_getVar(uid,161,1) > 10 then
				s_setVar(uid,161,2,s_getVar(uid,161,2) - 1)
			else
				s_setVar(uid,161,1,s_getVar(uid,161,1)  + 1)
			end
		end
		if(s_getVar(uid,1,99) ~= 0) then
			s_dropFromHorse(uid);
		end
		AddRoleTaskForGM(uid,taskid)
		--[[
		--购买次数
		--刷新次数
		elseif tasktype == 3 then
		local vipnum = s_getVar(uid,149,20)
		if vipnum == 0 then
		s_sysInfo(uid,"拥有贵族特权才可购买押镖次数，可前往[返利-贵族特权]查看",ChatPos_Tips)
		return;
		end
		s_debug(uid..",押镖每日可购买次数="..vipnum)
		if s_getVar(uid,161,7) >= vipnum then
		s_sysInfo(uid,"本日刷新次数已达上限",ChatPos_Tips)
		return;
		end
		if s_removeMoney(uid,MoneyType_Gold,5,"刷新镖令") ~= VALUE_OK then
		s_sysInfo(uid,"元宝不足，不能刷新",ChatPos_Tips)
		return;
		end
		s_setVar(uid,161,2,s_getVar(uid,161,2) + 1)
		s_setVar(uid,161,7,s_getVar(uid,161,7) + 1)
		local cannum =  2 - s_getVar(uid,161,1)  + s_getVar(uid,161,2)

		--是否是双倍奖励时间
		--       local bdouble = 0;
		--       local step1 = s_getEvent(Relation_World,0,DoubleEscort1)
		--       local step2 = s_getEvent(Relation_World,0,DoubleEscort2)
		--       local step3 = s_getEvent(Relation_World,0,DoubleEscort3)
		--       if step1 == EventStep_Run  or step2 == EventStep_Run or  step3 == EventStep_Run then
		--           bdouble = 1;
		--       end

		--        s_sendEscortTaskInfo(uid,s_getVar(uid,161,3),cannum,0,0,bdouble)
		--]]
		--完成任务
	elseif tasktype == 4 then
		local taskid = s_getVar(uid,161,4)
		if taskid == 0 then
			s_sysInfo(uid,"没有接取任务，不能完成",ChatPos_Tips)
			return;
		end
		local taskProcess = s_getTaskValue(uid,taskid,TaskValue_Process)
		if taskProcess ~= TaskProcess_CanDone then
			s_sysInfo(uid,"任务还未完成，不能完成",ChatPos_Tips)
			return;
		end
		local taskinfo = GetTaskInfo(taskid)
		if taskinfo == nil then
			s_sysInfo(uid,"获取任务信息出错",ChatPos_Tips)
			return;
		end
		FinishRoleTask(uid,taskid);

		--放弃任务
	elseif tasktype == 5 then
		local taskid = s_getVar(uid,161,4)
		local taskProcess = s_getTaskValue(uid,taskid,TaskValue_Process)
		if taskProcess ~= nil and taskProcess == TaskProcess_None then
			s_sysInfo(uid,"没接任务，不用能放弃",ChatPos_Tips)
			return;
		end
		--s_setVar(uid,161,4,0)
		--s_setVar(uid,161,3,0)
		s_setVar(uid,161,5,0)
		s_delTitle(SCENE_ENTRY_PLAYER,uid,40)
		s_delTitle(SCENE_ENTRY_PLAYER,uid,41)
		s_delTitle(SCENE_ENTRY_PLAYER,uid,42)
		s_delTitle(SCENE_ENTRY_PLAYER,uid,43)
		s_removebuff(SCENE_ENTRY_PLAYER,uid,2006)
		s_removebuff(SCENE_ENTRY_PLAYER,uid,2007)
		s_delTask(uid,taskid)

		--local cur_escort_id = s_getVar(uid,161,3)
		--if cur_escort_id == 0 then
		--cur_escort_id = EscortTaskRefresh(uid)
		--s_setVar(uid,161,3,cur_escort_id)
		--end
		--返还次数
		--        if s_getVar(uid,161,1) > 0 then
		--            s_setVar(uid,161,1,s_getVar(uid,161,1) - 1)
		--        end
		local cannum =  2 - s_getVar(uid,161,1)  + s_getVar(uid,161,2)
		s_sendEscortTaskInfo(uid,cur_escort_id,cannum,0,0)

		--宝藏任务
	else
		TreasureTaskInfo(uid,tasktype)
	end

end

--刷新当前镖令
function EscortTaskRefresh(uid)
	local rand = math.random(1,100)
	local cur_escort_id = 0;
	if rand <= 35 then
		cur_escort_id = 1
		s_setVar(uid,161,4,31101)
	elseif rand <= 65 then
		cur_escort_id = 2;
		s_setVar(uid,161,4,31102)
	elseif rand <= 85 then
		cur_escort_id = 3;
		s_setVar(uid,161,4,31103)
	elseif rand <= 100 then
		cur_escort_id = 4;
		s_setVar(uid,161,4,31104)
	end

	----第一次接必定4星
	--if s_getVar(uid,161,6) == 0 then
	--cur_escort_id = 4;
	--s_setVar(uid,161,4,31104)
	--s_setVar(uid,161,6,1)
	--end

	local bfirst = 0;
	local taskProcess = s_getTaskValue(uid, 1036, TaskValue_Process)
	if taskProcess == TaskProcess_Doing  then
		bfirst = 1;
	end

	local taskProcess = s_getTaskValue(uid, 1117, TaskValue_Process)
	if taskProcess == TaskProcess_Doing  then
		bfirst = 1;
	end

	local taskProcess = s_getTaskValue(uid, 1126, TaskValue_Process)
	if taskProcess == TaskProcess_Doing  then
		bfirst = 1;
	end

	local taskProcess = s_getTaskValue(uid, 1139, TaskValue_Process)
	if taskProcess == TaskProcess_Doing  then
		bfirst = 1;
	end

	local taskProcess = s_getTaskValue(uid, 1145, TaskValue_Process)
	if taskProcess == TaskProcess_Doing  then
		bfirst = 1;
	end

	local taskProcess = s_getTaskValue(uid, 1153, TaskValue_Process)
	if taskProcess == TaskProcess_Doing  then
		bfirst = 1;
	end
	--有任务接都是最高级
	--    if bfirst == 1 then
	--        cur_escort_id = 4;
	--        s_setVar(uid,161,4,31104)
	--    end
	return cur_escort_id;
end

--做任务时被杀死(killid->杀人者id)
function EscortTaskKillPlayer(uid,killid)
	local taskid = s_getVar(uid,161,4)
	local taskinfo = GetTaskInfo(taskid)
	if taskinfo == nil then
		s_debug("押镖任务被杀时找不到相应任务")
		return;
	end
	s_setVar(uid,161,5,1)
	local cur_escort_id = s_getVar(uid,161,3);
	--死亡时候，立刻交任务，获得70%的奖励

	s_setVar(uid,161,5,0)
	s_delTitle(SCENE_ENTRY_PLAYER,uid,40)
	s_delTitle(SCENE_ENTRY_PLAYER,uid,41)
	s_delTitle(SCENE_ENTRY_PLAYER,uid,42)
	s_delTitle(SCENE_ENTRY_PLAYER,uid,43)
	s_removebuff(SCENE_ENTRY_PLAYER,uid,2006)
	s_removebuff(SCENE_ENTRY_PLAYER,uid,2007)
	s_delTask(uid,taskid)
	FinishRoleTask(uid,taskid+10);
	--	FinishRoleTask(uid,taskid);
	local name = s_getValue(SCENE_ENTRY_PLAYER,killid,VALUE_TYPE_NAME)
	s_sysInfo(uid,"押镖失败，你被"..name.."击杀,失去30%%的押镖奖励",ChatPos_Tips);
	--给杀人者奖励
	local bindgoldstr = s_getTaskValue(uid,taskid,TaskValue_BindMoneyGold)
	if bindgoldstr == nil or bindgoldstr == "" then
		bindgoldstr = "0"
		--自身经验为0，则检查随机子任务的经验
		local child = s_getTaskVar(uid, taskid, MvarIndex_Child)
		if child ~= nil and child ~= 0 then
			bindgoldstr = s_getTaskValue(uid, child, TaskValue_BindMoneyGold)
		end
	end
	local bindGold = tonumber(bindgoldstr)

	local cannum =  2 - s_getVar(uid,161,1)  + s_getVar(uid,161,2)
	local remain =  5 - s_getVar(uid,161,7)
	s_sendEscortTaskInfo(uid,cur_escort_id,cannum,1,killid,bdouble,remain)
	s_setVar(uid,161,5,0)

	--  bindGold = math.floor(bindGold * 0.3 )
	--劫镖次数

	local killnum = s_getVar(killid,161,8)
	if killnum  >= 3 then
		s_sysInfo(killid,"今日劫镖大于2次，不能再获得奖励",ChatPos_Tips)
		return;
	end
	s_setVar(killid,161,8,killnum + 1)
	local bindgold = 0
	if taskid == 31101 then
		bindgold = 60
	elseif taskid == 31102 then
		bindgold = 120
	elseif taskid == 31103 then
		bindgold = 180
	elseif taskid == 31104 then
		bindgold = 240
	end
	s_sysInfo(killid,"劫镖成功，获得"..bindgold.."绑定元宝",ChatPos_Sys)
	s_addMoney(killid,MoneyType_Money,bindgold,"劫镖",39)
	s_robSuccess(uid,killid,bindgold)
end
