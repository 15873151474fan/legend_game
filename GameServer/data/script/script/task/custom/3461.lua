RoleTaskInfo3461 =
{
	subtasknum = 1,
	subtask1 =
	{
		onaccept =
		{
			{s_checkHaveDemonFinishTask,{}},
			{s_actionOpenGuide,{3461}},
		},
		task = {s_taskCustom, {5064, 5064, 1, 0}},
		onfinish =
		{
		},
	},
}


--宠物驯化回调
function RoleTaskInfo3461:OnGetDemon(uid)
	local process = s_getTaskValue(uid,3461,TaskValue_Process)
	if process ~= TaskProcess_Doing then
		return
	end
	AddRoleTaskOperate(uid,3461)
end
RegisterGetDemonEvent("RoleTaskInfo3461:OnGetDemon($1)")
