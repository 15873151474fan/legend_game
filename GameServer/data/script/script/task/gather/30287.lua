RoleTaskInfo30287 =
{
	subtasknum = 1,
	subtask1 =
	{

	},
}

function RoleTaskInfo30287:GetTaskExp(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local exp = 180 * (50 + 0.1*level^2.2)
	return math.floor(exp)
end
