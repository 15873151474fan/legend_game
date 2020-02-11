RoleTaskInfo30332 =
{
	subtasknum = 1,
	subtask1 =
	{
		collectitem =
		{
			{31541, 0, 1},
		},
		task = {s_taskCollect, {320,320}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{31541,1,"删除七夕的祝福"}},
		},
	},
}

function RoleTaskInfo30332:GetTaskExp(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local exp = 15 * (50 + 0.1*level^2.2)
	return math.floor(exp)
end
