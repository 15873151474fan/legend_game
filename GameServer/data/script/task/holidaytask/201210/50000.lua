RoleTaskInfo50000 =
{
	subtasknum = 1,
	subtask1 =
	{
		--随机任务组，第一组是品质最好的
		randomtask =
		{
			{100,100,{50001,50002,50003,50004,50005,50006,50007,50008,50009}},
		},

		random = {0, 26130, 50, 0, 0, "刷新任务"},
		onacceptcheck =
		{
			{s_checkYearMonthDay,{{2012,{9,{29,30}},{10,{1,8}}}},}
		},
		task = {s_taskRandomColor, {333}},
	},
}

--舞票
RoleTaskInfo50001 =
{
	parent = 50000,
	subtasknum = 1,
	subtask1 =
	{
		task = {s_taskCustom,{333,333,1,0}},
	},
}
--矿石
RoleTaskInfo50002 =
{
	parent = 50000,
	subtasknum = 1,
	subtask1 =
	{
		collectitem =
		{
			{27112, 1, 5},
		},
		task = {s_taskCollect, {333, 333}},
	},
	onfinish =
	{
		{s_actionDeleteItemByBaseID,{27112,5,"端午活动扣除",1}},
	},
}
--药材
RoleTaskInfo50003 =
{
	parent = 50000,
	subtasknum = 1,
	subtask1 =
	{
		collectitem =
		{
			{27113, 1, 5},
		},
		task = {s_taskCollect, {333, 333}},
	},
	onfinish =
	{
		{s_actionDeleteItemByBaseID,{27113,5,"端午活动扣除",1}},
	},
}

--团建设
RoleTaskInfo50004 =
{
	parent = 50000,
	subtasknum = 1,
	subtask1 =
	{
		task = {s_taskCustom,{333,333,1,0}},
	},
}

--团频道发言
RoleTaskInfo50005 =
{
	parent = 50000,
	subtasknum = 1,
	subtask1 =
	{
		task = {s_taskCustom,{333,333,1,0}},
	},
}
--小妖
RoleTaskInfo50006 =
{
	parent = 50000,
	subtasknum = 1,
	subtask1 =
	{
		task = {s_taskKillNpc, {333,333,{10341,10342,10343,10344,10345,10346,10347,10348},1}},
	},
}
--国家频道发言
RoleTaskInfo50007 =
{
	parent = 50000,
	subtasknum = 1,
	subtask1 =
	{
		task = {s_taskCustom,{333,333,1,0}},
	},
}

--好友对话
RoleTaskInfo50008 =
{
	parent = 50000,
	subtasknum = 1,
	subtask1 =
	{
		task = {s_taskCustom,{333,333,1,0}},
	},
}
--合成
RoleTaskInfo50009 =
{

	parent = 50000,
	subtasknum = 1,
	subtask1 =
	{
		task = {s_taskCustom,{333,333,1,0}},
	},
}

function RoleTaskInfo50000:GetTaskExp(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local exp = 20 * (50 + 0.1*level^2.2)
	return math.floor(exp)
end
