RoleTaskInfo30300 =
{
	subtasknum = 1,
	subtask1 =
	{
		--随机任务组，第一组是品质最好的
		randomtask =
		{
			{15,100,{30301,30302,30306,30307,30308,30309}},
		},

		random = {0, 26130, 50, 0, 0, "刷新任务"},
		task = {s_taskRandomColor, {305}},
	},
}
--手札
RoleTaskInfo30301 =
{
	parent = 30300,
	subtasknum = 1,
	subtask1 =
	{
		task = {s_taskCustom,{305,305,1,0}},
	},
}
--舞票
RoleTaskInfo30302 =
{
	parent = 30300,
	subtasknum = 1,
	subtask1 =
	{
		task = {s_taskCustom,{305,305,1,0}},
	},
}
--矿石
RoleTaskInfo30303 =
{
	parent = 30300,
	subtasknum = 1,
	subtask1 =
	{
		collectitem =
		{
			{27112, 0, 5},
		},
		task = {s_taskCollect, {305, 305}},
	},
	onfinish =
	{
		{s_actionDeleteItemByBaseID,{27112,5,"端午活动扣除",0}},
	},
}
--药材
RoleTaskInfo30304 =
{
	parent = 30300,
	subtasknum = 1,
	subtask1 =
	{
		collectitem =
		{
			{27113, 0, 5},
		},
		task = {s_taskCollect, {305, 305}},
	},
	onfinish =
	{
		{s_actionDeleteItemByBaseID,{27113,5,"端午活动扣除",0}},
	},
}
--水果
RoleTaskInfo30305 =
{
	parent = 30300,
	subtasknum = 1,
	subtask1 =
	{
		collectitem =
		{
			{44004, 1, 1},
		},
		task = {s_taskCollect, {305, 305}},
	},
	onfinish =
	{
		{s_actionDeleteItemByBaseID,{44004,1,"端午活动扣除"}},
	},
}

--小妖
RoleTaskInfo30306 =
{
	parent = 30300,
	subtasknum = 1,
	subtask1 =
	{
		task = {s_taskKillNpc, {305,305,{10341,10342,10343,10344,10345,10346,10347,10348,10349,10350,10351,10352,10353},1}},
	},
}
--情报
RoleTaskInfo30307 =
{

	parent = 30300,
	subtasknum = 1,
	subtask1 =
	{
		task = {s_taskCustom,{305,305,1,0}},
	},
}
--速递
RoleTaskInfo30308 =
{
	parent = 30300,
	subtasknum = 1,
	subtask1 =
	{
		task = {s_taskCustom,{305,305,1,0}},
	},
}
--远征
RoleTaskInfo30309 =
{

	parent = 30300,
	subtasknum = 1,
	subtask1 =
	{
		task = {s_taskCustom,{305,305,1,0}},
	},
}
--生存
RoleTaskInfo30310 =
{

	parent = 30300,
	subtasknum = 1,
	subtask1 =
	{
		task = {s_taskCustom,{305,305,1,0}},
	},
}
