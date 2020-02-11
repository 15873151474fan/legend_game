--采集一种道具

--------------------------------------------------------------------------------------------------
--采集{int:BeginNpcID, int:EndNpcID, int:道具ID, int:道具数量, int:道具等级, int:道具Quality}
function s_taskGather(taskid, subtaskid, paramlist, uid)
	if paramlist == nil or paramlist[1] == nil or paramlist[2] == nil then return end
	local beginNpcID = paramlist[1]
	local endNpcID = paramlist[2]
	local itemID = paramlist[3]
	local itemNum = 1
	if paramlist[4] ~= nil then itemNum = paramlist[4] end
	local itemLevel = 0
	if paramlist[5] ~= nil then itemLevel = paramlist[5] end
	local itemQuality = 0
	if paramlist[6] ~= nil then itemQuality = paramlist[6] end

	local name = GetTaskName(taskid)
	name = name .. GetSuffixToTaskName(taskid, name)
	name = name .. "(3)%"..taskid

	local info = GetTaskInfo(taskid)
	if info == nil then return end

	if uid == nil then
		--开始NPC事件：自动接受的子任务不注册
		if beginNpcID > 0 and subtaskid == 1 and (info.parent == nil or info.parent == 0) then
			AppendMenuToNpc(beginNpcID, name, "s_taskGather_AcceptDealer($1,"..taskid..","..subtaskid..")", "CheckSubTaskAcceptShower($1,"..taskid..","..subtaskid..")")
		end

		--开始NPC事件：自动接受的子任务不注册
		if endNpcID > 0 then
			AppendMenuToNpc(endNpcID, name, "s_taskGather_FinishDealer($1,"..taskid..","..subtaskid..","..itemID..","..itemNum..","..itemLevel..","..itemQuality..")", "CheckSubTaskFinishShower($1,"..taskid..","..subtaskid..")")
		end
	end

	--自动接受的子任务直接接取
	if uid ~= nil then
		s_taskGather_Accept(uid, taskid, subtaskid)
	end
end

function s_taskGather_AcceptDealer(uid, taskid, subtaskid)
	--主线任务等级不足检查
	if DealMainTaskNoLevel(uid, taskid) == VALUE_OK then return end

	local msg = GetSubTaskAcceptText(uid, taskid, subtaskid)
	if msg == nil then return end
	local call = "s_taskGather_Accept($1,".. taskid .. "," .. subtaskid ..")"
	ShowNpcMenuBottomStyle(uid,msg,"接受(1)",call,"取消(1)")
end

function s_taskGather_Accept(uid, taskid, subtaskid)
	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	AddRoleSubTask(uid, taskid, subtaskid, 1, 0, 0, 0, subinfo.task[2][2])
end


function s_taskGather_FinishDealer(uid, taskid, subtaskid, itemID, itemNum, itemLevel, itemQuality)
	local taskProcess = s_getTaskValue(uid,taskid,TaskValue_Process)
	if taskProcess == TaskProcess_Doing then
		local name = GetTaskName(taskid)
		local msg = GetSubTaskPromptText(uid, taskid, subtaskid)
		if msg == nil then return end
		ShowTaskPack(uid,name,msg,"确定","s_taskGather_Finish($1,"..taskid..","..subtaskid..",$2,$3,$4)", itemID, itemLevel, itemQuality)
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

function s_taskGather_Finish(uid, taskid, subtaskid, baseid, thisid, num)
	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	if subinfo == nil then return end

	if subinfo.task == nil or subinfo.task[2] == nil then return end
	if subinfo.task[2][3] == nil then return end
	if baseid ~= subinfo.task[2][3] then
		s_sysInfo(uid,"收集物品不正确")
		return
	end

	local subNum = 1
	if subinfo.task[2][4] ~= nil then subNum = subinfo.task[2][4] end
	if num < subNum then
		s_sysInfo(uid,"收集物品数量不足")
		return
	end

	local subLevel = 0
	if subinfo.task[2][5] ~= nil then subLevel = subinfo.task[2][5] end
	if subLevel > 0 then
		local itemlevel = s_getItemValue(uid,thisid,Item_Attribute_Level)
		if itemlevel ~= subLevel then
			s_sysInfo(uid,"收集物品等级不正确")
			return
		end
	end

	local subQuality = 0
	if subinfo.task[2][6] ~= nil then subQuality = subinfo.task[2][6] end
	if subQuality > 0 then
		local itemQuality = s_getItemValue(uid,thisid,Item_Attribute_Quality)
		if itemQuality ~= subQuality then
			s_sysInfo(uid,"收集物品品质不正确")
			return
		end
	end

	local reason = string.format("任务(%d-%d)删除",taskid, subtaskid)
	if s_deleteItemByThisID(uid,thisid,subNum,reason) ~= VALUE_OK then
		s_sysInfo(uid,"物品删除失败")
		return
	end

	AddRoleTaskOperate(uid, taskid)
	s_taskGather_FinishDealer(uid, taskid, subtaskid, subinfo.task[2][3], subNum, subLevel, subQuality)
end



--[[

RoleTaskInfo3001 =
{
	subtasknum = 1,
	subtask1 = 
	{
		task = {s_taskGather, {60045, 60046, 31051, 10, 1, 1}},
	},
}

]]
