--护送

--------------------------------------------------------------------------------------------------
--护送{int:BeginNpcID, int:EndNpcID, int:GuardNpcID, int:是否不合体(1表示不合体,0表示可以合体)}
function s_taskGuard(taskid, subtaskid, paramlist, uid)
	if paramlist == nil or paramlist[1] == nil or paramlist[2] == nil or paramlist[3] == nil then return end
	local beginNpcID = paramlist[1]
	local endNpcID = paramlist[2]
	local guardNpcID = paramlist[3]
	local name = GetTaskName(taskid)
	name = name .. GetSuffixToTaskName(taskid, name)
	name = name .. "(3)%"..taskid

	local info = GetTaskInfo(taskid)
	if info == nil then return end

	if uid == nil then
		--开始NPC事件：自动接受的子任务不注册
		if beginNpcID > 0 and subtaskid == 1 and (info.parent == nil or info.parent == 0) then
			AppendMenuToNpc(beginNpcID, name, "s_taskGuard_AcceptDealer($1,"..taskid..","..subtaskid..","..guardNpcID..","..endNpcID..")", "CheckSubTaskAcceptShower($1,"..taskid..","..subtaskid..")")
		end

		--结束NPC事件
		if endNpcID > 0 then
			AppendMenuToNpc(endNpcID, name, "s_taskGuard_FinishDealer($1,"..taskid..","..subtaskid..")", "CheckSubTaskFinishShower($1,"..taskid..","..subtaskid..")")
		end

		--自动添加护送检查
		local subinfo = GetSubTaskInfo(taskid, subtaskid)
		if subinfo ~= nil then
			local bCheckGuard = false
			if subinfo.onacceptcheck ~= nil then
				for ncheck = 1, table.getn(subinfo.onacceptcheck), 1 do
					if subinfo.onacceptcheck[ncheck][1] == s_checkGuard then
						bCheckGuard = true
						break
					end
				end
			end

			if bCheckGuard == false then
				if subinfo.onacceptcheck1 == nil then subinfo.onacceptcheck1 = {} end
				table.insert(subinfo.onacceptcheck1, {s_checkGuard,{}})
			end
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
		s_taskGuard_Accept(uid, taskid, subtaskid, guardNpcID, endNpcID)
	end
end

function s_taskGuard_Accept(uid, taskid, subtaskid, guardNpcID, endNpcID)
	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	if AddRoleSubTask(uid, taskid, subtaskid, 1, 1, 0, 0, subinfo.task[2][2]) == VALUE_FAIL then return end

	local guardid = 0
	if subinfo.task[2][4] ~= nil then
		guardid = s_summonGuard(uid, guardNpcID, taskid, endNpcID, 0, 0, false, subinfo.task[2][4])
	else
		guardid = s_summonGuard(uid, guardNpcID, taskid, endNpcID)
	end
	if guardNpcID == 60996 and guardid ~= 0 and guardid ~= nil then
		local curCountry = s_getValue(SCENE_ENTRY_NPC,guardid,VALUE_TYPE_CURRENT_COUNTRY)
		s_addCountryVar(curCountry,1,121,guardid)
		local sid = s_getValue(SCENE_ENTRY_NPC,guardid,VALUE_TYPE_SCENE_ID)
		local curRobinHp = s_getCountryVar(curCountry,1,120)
		if curRobinHp == 0 then
			s_sysInfo(uid,"罗宾已死亡，无法接受见好就收任务！")
			s_delTask(uid,taskid)
			return VALUE_FAIL
		end
		s_setValue(SCENE_ENTRY_NPC,guardid,VALUE_TYPE_HP,curRobinHp)
		s_addbuff(SCENE_ENTRY_NPC,guardid,20272,1,60 * 60,1)
		s_setValue(SCENE_ENTRY_NPC,guardid,VALUE_TYPE_NPC_COUNTRY,s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND))
		local ninePlayer = s_getNineEntry(SCENE_ENTRY_PLAYER,uid,30)
		for i = 1, table.getn(ninePlayer), 2 do
			if ninePlayer[i] == SCENE_ENTRY_PLAYER then
				s_sysInfo(ninePlayer[i+1],"兄弟们，见好就收，我殿后,大家跟我一起撤退！",ChatPos_Important + ChatPos_Sys)
			end
		end
		--清除站立的罗宾，王国金库
		s_clearNpc(s_getVar(uid,101,54))
		s_setVar(uid,101,54,0)
		s_clearNpc(s_getVar(uid,101,55))
		s_setVar(uid,101,55,0)
	end
end

function s_taskGuard_AcceptDealer(uid, taskid, subtaskid, guardNpcID, endNpcID)

	--主线任务等级不足检查
	if DealMainTaskNoLevel(uid, taskid) == VALUE_OK then return end

	local msg = GetSubTaskAcceptText(uid, taskid, subtaskid)
	if msg == nil then return end
	local call = "s_taskGuard_Accept($1,".. taskid .. "," .. subtaskid .. ","..guardNpcID..","..endNpcID..")"
	ShowNpcMenuBottomStyle(uid,msg,"接受(1)",call,"取消(1)")
end

function s_taskGuard_FinishDealer(uid, taskid, subtaskid)
	local taskProcess = s_getTaskValue(uid,taskid,TaskValue_Process)
	if taskProcess ~= TaskProcess_CanDone then
		return VALUE_FAIL
	end

	local msg = GetSubTaskFinishText(uid, taskid, subtaskid)
	if msg == nil then return end
	local call = "s_taskGuard_Finish($1,".. taskid .. "," .. subtaskid..")"
	local info = GetTaskInfo(taskid)
	if subtaskid >= info.subtasknum then
		ShowNpcMenuBottomStyle(uid,msg,"完成(1)",call,"取消(1)")
	else
		ShowNpcMenuBottomStyle(uid,msg,"继续(1)",call,"取消(1)")
	end
end

function s_taskGuard_Finish(uid, taskid, subtaskid)
	if s_commitGuard(uid,taskid) == VALUE_FAIL then
		local msg = GetSubTaskPromptText(uid, taskid, subtaskid)
		if msg == nil then return end
		ShowNpcMenuBottomStyle(uid,msg,"离开(5)")
	else
		FinishRoleSubTask(uid, taskid, subtaskid)
	end
end





--[[

RoleTaskInfo3001 =
{
	subtasknum = 1,
	subtask1 = 
	{
		task = {s_taskGuard, {60045, 60046, 41004, false}},
	},
}

]]
