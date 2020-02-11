RoleTaskInfo30320 =
{
	subtasknum = 1,
	subtask1 =
	{
		--随机任务组，第一组是品质最好的
		randomtask =
		{
			{10,100,{30321,30322,30323,30324,30325,30326,30327,30328,30329,30330}},
		},

		random = {0, 26130, 50, 0, 0, "刷新任务"},
		task = {s_taskRandomColor, {313}},
	},
}
--手札
RoleTaskInfo30321 =
{
	parent = 30320,
	subtasknum = 1,
	subtask1 =
	{
		task = {s_taskCustom,{313,313,1,0}},
	},
}
--舞票
RoleTaskInfo30322 =
{
	parent = 30320,
	subtasknum = 1,
	subtask1 =
	{
		task = {s_taskCustom,{313,313,1,0}},
	},
}
--矿石
RoleTaskInfo30323 =
{
	parent = 30320,
	subtasknum = 1,
	subtask1 =
	{
		collectitem =
		{
			{27112, 1, 5},
		},
		task = {s_taskCollect, {313, 313}},
	},
	onfinish =
	{
		{s_actionDeleteItemByBaseID,{27112,5,"端午活动扣除",1}},
	},
}
--药材
RoleTaskInfo30324 =
{
	parent = 30320,
	subtasknum = 1,
	subtask1 =
	{
		collectitem =
		{
			{27113, 1, 5},
		},
		task = {s_taskCollect, {313, 313}},
	},
	onfinish =
	{
		{s_actionDeleteItemByBaseID,{27113,5,"端午活动扣除",1}},
	},
}
--水果
RoleTaskInfo30325 =
{
	parent = 30320,
	subtasknum = 1,
	subtask1 =
	{
		collectitem =
		{
			{44004, 1, 1},
		},
		task = {s_taskCollect, {313, 313}},
	},
	onfinish =
	{
		{s_actionDeleteItemByBaseID,{44004,1,"端午活动扣除"}},
	},
}

--小妖
RoleTaskInfo30326 =
{
	parent = 30320,
	subtasknum = 1,
	subtask1 =
	{
		task = {s_taskKillNpc, {313,313,{10341,10342,10343,10344,10345,10346,10347,10348},1}},
	},
}
--情报
RoleTaskInfo30327 =
{

	parent = 30320,
	subtasknum = 1,
	subtask1 =
	{
		task = {s_taskCustom,{313,313,1,0}},
	},
}
--速递
RoleTaskInfo30328 =
{
	parent = 30320,
	subtasknum = 1,
	subtask1 =
	{
		task = {s_taskCustom,{313,313,1,0}},
	},
}
--远征
RoleTaskInfo30329 =
{

	parent = 30320,
	subtasknum = 1,
	subtask1 =
	{
		task = {s_taskCustom,{313,313,1,0}},
	},
}
--生存
RoleTaskInfo30330 =
{

	parent = 30320,
	subtasknum = 1,
	subtask1 =
	{
		task = {s_taskCustom,{313,313,1,0}},
	},
}
