RoleTaskInfo30272 =
{
	subtasknum = 1,
	subtask1 =
	{
		collectitem =
		{
			{31412, 0, 1},
		},

		task = {s_taskCollect, {216,216}},

		onfinish =
		{
			{s_actionDeleteItemByBaseID,{31412,1,"RoleTaskInfo30272"}},
		},
	},
}

function RoleTaskInfo30272:GetTaskExp(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local exp = 87 * (50 + 0.1*level^2.2)
	return math.floor(exp)
end
