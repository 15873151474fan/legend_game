RoleTaskInfo3471 =
{
	subtasknum = 1,
	subtask1 =
	{
		task = {s_taskCustom, {5064, 5064, 1, 0}},
		onaccept =
		{
			{s_actionOpenGuide,{3471}},
		},
	},
}

function RoleTaskInfo3471:OnAcceptTask(uid)
	local demonid = s_getcurdemon(uid)
	if demonid ~= 0 and demonid ~= nil then
		AddRoleTaskOperate(uid,3471)
	end
end

