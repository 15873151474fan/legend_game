RoleTaskInfo50011 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkYearMonthDay,{{2012,{9,{29,30}},{10,{1,8}}}},}
		},
		dropitem =
		{
			{60829,100,55011, 0, 1, "1-1"},
		},
		task = {s_taskKillNpcDrop, {333,333}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{55011,1,"删除嫦娥的羽衣"}},
		},
	},
}

function RoleTaskInfo50011:GetTaskExp(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local exp = 87 * (50 + 0.1*level^2.2)
	return math.floor(exp)
end

RoleTaskInfo50012 =
{

	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkYearMonthDay,{{2012,{9,{29,30}},{10,{1,8}}}},}
		},
	},
}
