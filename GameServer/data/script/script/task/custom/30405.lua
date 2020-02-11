--护送泉水
RoleTaskInfo30405 =
{
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleLevel,{70,200}},
			{s_checkWorldWarDay,{}},
			{s_checkWeekDays,{0}},
			{s_checkHour,{17,19}},
		},
		task = {s_taskGuard,{60886,60887,60909}},
		onfinish =
		{
			{s_actionAddItem,{26020,0,1,0,"1-1,3-43200","帝都战复活盾"}},
			{s_actionAddItem,{30019,0,1,0,"1-1","帝都战烟花"}},
		},
	},
}

function RoleTaskInfo30405:GetTaskExp(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local exp = 0.4 * 210 * 1.5 * (50 + 0.1*level^2.2)
	return math.floor(exp)
end
