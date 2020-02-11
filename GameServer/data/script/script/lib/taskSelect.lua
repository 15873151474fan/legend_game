--可选择任务:任务基本表.xls中：可选任务列表必须在自身表项的前面
--------------------------------------------------------------------------------------------------
--可选择任务{int:NpcID}
--child = {int:taskid1,...}
function s_taskSelect(taskid, subtaskid, paramlist, uid)
	if paramlist == nil or paramlist[1] == nil then return end
	local npcID = paramlist[1]

	--检查随机任务列表
	local subinfo = GetSubTaskInfo(taskid, subtaskid)
	if subinfo == nil or subinfo.child == nil or type(subinfo.child) ~= "table" or table.getn(subinfo.child) == 0 then return end

	local info = GetTaskInfo(taskid)
	if info == nil then return end

	if uid == nil then
		--开始NPC事件：自动接受的子任务不注册
		if npcID > 0 and subtaskid == 1 and (info.parent == nil or info.parent == 0) then
			for i=1, table.getn(subinfo.child), 1 do
				local name = GetTaskName(subinfo.child[i])
				name = name .. "(3)%"..subinfo.child[i]
				AppendMenuToNpc(npcID, name, "s_taskSelect_AcceptDealer($1,"..taskid..","..subtaskid..","..subinfo.child[i]..")", "s_taskSelect_CheckChildAcceptShower($1,"..taskid..","..subtaskid..","..subinfo.child[i]..")")
			end
		end
	end

	--不允许直接接取
end


function s_taskSelect_CheckChildAcceptShower(uid, taskid, subtaskid, child)
	if CheckSubTaskAcceptShower(uid, taskid, subtaskid) == VALUE_FAIL then
		return VALUE_FAIL
	end

	if CheckSubTaskAcceptShower(uid, child, 1) == VALUE_FAIL then
		return VALUE_FAIL
	end
	return VALUE_OK
end


function s_taskSelect_AcceptDealer(uid, taskid, subtaskid, child)
	--主线任务等级不足检查
	if DealMainTaskNoLevel(uid, taskid) == VALUE_OK then return end

	local msg = GetSubTaskAcceptText(uid, child, 1)
	if msg == nil then return end
	local call = "s_taskSelect_Accept($1,".. taskid .. "," .. subtaskid ..","..child..")"
	ShowNpcMenuBottomStyle(uid,msg,"接受(1)",call,"取消(1)")
end


function s_taskSelect_Accept(uid, taskid, subtaskid, child)
	--接受自身任务：子任务完成时，才能完成自身任务
	if AddRoleSubTask(uid, taskid, subtaskid, 1, 0, 0, child) == VALUE_FAIL then return end

	--接受子任务
	s_actionAddRoleTask( uid, taskid, subtaskid, {child} )

	--记录父任务和子任务变量
	s_addTaskVar(uid,child,MvarIndex_Parent,taskid)
	s_addTaskVar(uid,taskid,MvarIndex_Child,child)
end



--[[
RoleTaskInfo3021 = 
{
	subtasknum = 1,
	subtask1 = 
	{
		onacceptcheck = 
		{
			{s_checkPretask, {0}},
		},
		child = {3011, 3001},
		task = {s_taskSelect, {60013}},
	},
}

RoleTaskInfo3011 = 
{
	parent = 3021,
	subtasknum = 1,
	subtask1 = 
	{
		onacceptcheck = 
		{
			{s_checkPretask, {0}},
		},
	},
}

RoleTaskInfo3001 = 
{
	parent = 3021,
	subtasknum = 1,
	subtask1 = 
	{
		onacceptcheck = 
		{
			{s_checkPretask, {0}},
		},
	},
}
]]


