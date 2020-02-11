Fenmotaskinfo={42001,42002,42003,42004,}

function RoleTaskInfoSealGetTaskDailyInfo(uid, outvec)
--	if outvec == nil then return end
	s_debug("ttttttttttttttt")
	OnRequestFenmoDailyTask(uid)
--	table.insert(outvec,42001)
--	table.insert(outvec, 1)
--	table.insert(outvec, 0)
--	table.insert(outvec, 0)
--	table.insert(outvec, 0)
end
function OnRequestFenmoDailyTask(uid)

	s_debug("OnRequestFenmoDailyTask %u",uid)
--	if s_getVar(uid,440,1) then
--		s_debug("任务还未完成，不能接取")
--		return
--	end
	local rebirthnum = s_getRebirthLevel(uid)
	local info = rawget(_G,"Fenmotaskinfo")
	if info == nil then
		s_debug("获取宗门任务信息出错")
	end

	if s_getVar(uid,169,200) ~= 0 then
		s_debug("----------------已有任务")
		return ;
	end
	local taskid = info[math.random(1,#info)]

	local subinfo = GetSubTaskInfo(taskid, 1)
	local targetnum = subinfo.task[2][4]
	s_debug("----------------%u",targetnum)
	AddRoleTaskForGM(uid,taskid,targetnum,1,0)
	s_setVar(uid,169,200,taskid)
	if s_hasTask(uid,taskid) then
--		s_setVar(uid,169,51,taskid)
--		s_sendFenmoTaskInfo(uid,taskid,s_getVar(uid,169,51),1)
		s_debugUser(uid," 添加封魔洞任务 >>>>>>id %u",taskid)
	end
end

function OnfinishFenMoDailyTask(uid)
	-- body
	local taskid = s_getVar(uid,169,200) 
	local process = s_getTaskValue(uid,taskid,TaskValue_Process)
	if taskid == 0 or taskid == nil then
		s_debugUser(uid,"封魔洞日常任务未找到任务id")
		return
	end
	local taskinfo = GetTaskInfo(taskid)
	if taskinfo == nil then
		s_debug("------------000000")
		return
	end
	if process ~= TaskProcess_CanDone then
		s_debug("------------%u",process)
		s_sysInfo(uid,"请完成任务后再来领奖")
		return
	end
	s_debug("領取獎勵")
	FinishRoleTask(uid,taskid)
	s_delTask(uid,taskid)
	s_setTaskValue(uid,taskid,TaskValue_Process,0)
--	s_setVar(uid,169,51,0)

	return VALUE_OK
end

function OnfinishZhiTask(uid,typeid)
	local taskid = s_getVar(uid,440,2)
	local process = s_getTaskValue(uid,taskid,TaskValue_Process)
	if taskid == 0 or taskid == nil then
		s_debugUser(uid,"封魔洞日常任务未找到任务id")
		return
	end
	local taskinfo = GetTaskInfo(taskid)
	if taskinfo == nil then
		s_debug("------------000000")
		return
	end
	if process ~= TaskProcess_CanDone then
		s_debug("------------%u",process)
		return
	end
	s_debug("領取獎勵")
	FinishRoleTask(uid,taskid,typeid)
	s_delTask(uid,taskid)
	s_setTaskValue(uid,taskid,TaskValue_Process,0)

end
