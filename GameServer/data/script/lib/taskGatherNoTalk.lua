--采集一种道具，没有接收任务对话的步骤

--------------------------------------------------------------------------------------------------
--采集{int:NpcID, int:道具ID, int:道具数量, int:道具等级, int:道具Quality}
function s_taskGatherNoTalk(taskid, subtaskid, paramlist, uid)
	if paramlist == nil or paramlist[1] == nil or paramlist[2] == nil then return end
	local npcID = paramlist[1]
	local itemID = paramlist[2]
	local itemNum = 1
	if paramlist[3] ~= nil then itemNum = paramlist[3] end
	local itemLevel = 0
	if paramlist[4] ~= nil then itemLevel = paramlist[4] end
	local itemQuality = 0
	if paramlist[5] ~= nil then itemQuality = paramlist[5] end

	local name = GetTaskName(taskid)
	name = name .. GetSuffixToTaskName(taskid, name)
	name = name .. "(3)%"..taskid

	local info = GetTaskInfo(taskid)
	if info == nil then return end

	if uid == nil then
		--开始NPC事件：自动接受的子任务不注册
		if npcID > 0 and subtaskid == 1 and (info.parent == nil or info.parent == 0) then
			AppendMenuToNpc(npcID, name, "s_taskGatherNoTalk_AcceptDealer($1,"..taskid..","..subtaskid..","..itemID..","..itemNum..","..itemLevel..","..itemQuality..")", "CheckSubTaskAcceptShower($1,"..taskid..","..subtaskid..")")
		end
	end

	--自动接受的子任务直接接取
end

function s_taskGatherNoTalk_AcceptDealer(uid, taskid, subtaskid, itemID, itemNum, itemLevel, itemQuality)
	--主线任务等级不足检查
	if DealMainTaskNoLevel(uid, taskid) == VALUE_OK then return end

	local msg = GetSubTaskPromptText(uid, taskid, subtaskid)
	local name = s_getTaskValue(uid,taskid,TaskValue_Name)
	ShowTaskPack(uid,name,msg,"确定","s_taskGatherNoTalk_Finish($1,"..taskid..","..subtaskid..",$2,$3,$4)", itemID, itemLevel, itemQuality)
end

function s_taskGatherNoTalk_Finish(uid, taskid, subtaskid, baseid, thisid, num)
	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	if subinfo == nil then return end

	if subinfo.task == nil or subinfo.task[2] == nil then return end
	if subinfo.task[2][2] == nil then return end
	if baseid ~= subinfo.task[2][2] then
		s_sysInfo(uid,"收集物品不正确")
		return
	end

	local subNum = 1
	if subinfo.task[2][3] ~= nil then subNum = subinfo.task[2][3] end
	if num < subNum then
		s_sysInfo(uid,"收集物品数量不足")
		return
	end

	local subLevel = 0
	if subinfo.task[2][4] ~= nil then subLevel = subinfo.task[2][4] end
	if subLevel > 0 then
		local itemlevel = s_getItemValue(uid,thisid,Item_Attribute_Level)
		if itemlevel ~= subLevel then
			s_sysInfo(uid,"收集物品等级不正确")
			return
		end
	end

	local subQuality = 0
	if subinfo.task[2][5] ~= nil then subQuality = subinfo.task[2][5] end
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

	AddRoleSubTask(uid, taskid, subtaskid, 1, 1)
	FinishRoleSubTask(uid, taskid, subtaskid)
end



--[[

RoleTaskInfo3001 =
{
	subtasknum = 1,
	subtask1 = 
	{
		task = {s_taskGatherNoTalk, {60045, 31051, 10, 1, 1}},
	},
}

]]
