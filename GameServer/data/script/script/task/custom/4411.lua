RoleTaskInfo4411 =
{
	subtasknum = 1,
	subtask1 =
	{
		randomtask =
		{
			{100,100,{4413, 4414}},
		},
		task = {s_taskRandomTask, {60166}},

	},
	subtask2 =
	{
		task = {s_taskCustom, {60166, 60166, 1, 0}},
	},
}


-- 物理职业
RoleTaskInfo4413 =
{
	parent = 4411,
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleProfessionPhysical,{}},
		},
		onaccept =
		{
			{s_actionOpenGuide,{4413}},
		},
		task = {s_taskCustom, {60166, 60166, 1, 0}},
	},
}

-- 魔法职业
RoleTaskInfo4414 =
{
	parent = 4411,
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleProfessionMagic,{}},
		},
		onaccept =
		{
			{s_actionOpenGuide,{4414}},
		},
		task = {s_taskCustom, {60166, 60166, 1, 0}},
	},
}

--宠物驯化回调
function RoleTaskInfo4413:OnGetDemon(uid,demonid,baseid)
	local process = s_getTaskValue(uid,4413,TaskValue_Process)
	if process ~= TaskProcess_Doing then
		return
	end
	AddRoleTaskOperate(uid,4413)
end

RegisterGetDemonEvent("RoleTaskInfo4413:OnGetDemon($1)")

--宠物驯化回调
function RoleTaskInfo4414:OnGetDemon(uid,demonid,baseid)
	local process = s_getTaskValue(uid,4414,TaskValue_Process)
	if process ~= TaskProcess_Doing then
		return
	end
	AddRoleTaskOperate(uid,4414)
end

RegisterGetDemonEvent("RoleTaskInfo4414:OnGetDemon($1)")
