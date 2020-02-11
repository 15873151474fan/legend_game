RoleTaskInfo15205 =
{
	subtasknum = 1,
	subtask1 =
	{
		collectitem =
		{
			{26010, 0, 1},
		},
		task = {s_taskCollect, {135,135}},
	},
	onfinish =
	{
		{s_actionDeleteItemByBaseID,{26010,1,"删除技能降级手册"}},
	},
}
