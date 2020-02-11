RoleTaskInfo30294 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck1 = {
			{s_checkIntoCopy,{}},
		},
		onaccept =
		{
			{s_actionIntoCopyCustomSingle,{1009,161,119,132}},
		},
	},
}

function RoleTaskInfo30294:GetTaskExp(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local exp = 65* 5 * (50 + 0.1*level^2.2)
	return math.floor(exp)
end
