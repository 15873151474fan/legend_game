--成就奖杯
--总成就

function RoleTaskInfo49000_WorldInfo(uid, taskid, subtaskid, paramlist)
	local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME) --取玩家名字
	s_worldInfo("<p><n color=GXColorBlueSky>【系】恭喜</n><q buttonid=6005 ownerid=".. uid .. ">" ..name.. "</q><n color=GXColorBlueSky>完成了所有成就，获得了丰厚的奖励！</n><book bookid='70248' text='[详细]'/></p>",ChatPos_Sys + ChatPos_Honor )
end

function RoleTaskInfo49001_WorldInfo(uid, taskid, subtaskid, paramlist)
	local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME) --取玩家名字
	s_worldInfo("<p><n color=GXColorBlueSky>【系】恭喜</n><q buttonid=6005 ownerid=".. uid .. ">" ..name.. "</q><n color=GXColorBlueSky>完成了成长类成就，获得了丰厚的奖励！</n><book bookid='70248' text='[详细]'/></p>",ChatPos_Sys + ChatPos_Honor )
end

function RoleTaskInfo49002_WorldInfo(uid, taskid, subtaskid, paramlist)
	local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME) --取玩家名字
	s_worldInfo("<p><n color=GXColorBlueSky>【系】恭喜</n><q buttonid=6005 ownerid=".. uid .. ">" ..name.. "</q><n color=GXColorBlueSky>完成了战斗类成就，获得了丰厚的奖励！</n><book bookid='70248' text='[详细]'/></p>",ChatPos_Sys + ChatPos_Honor )
end

function RoleTaskInfo49003_WorldInfo(uid, taskid, subtaskid, paramlist)
	local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME) --取玩家名字
	s_worldInfo("<p><n color=GXColorBlueSky>【系】恭喜</n><q buttonid=6005 ownerid=".. uid .. ">" ..name.. "</q><n color=GXColorBlueSky>完成了能力类成就，获得了丰厚的奖励！</n><book bookid='70248' text='[详细]'/></p>",ChatPos_Sys + ChatPos_Honor )
end

function RoleTaskInfo49004_WorldInfo(uid, taskid, subtaskid, paramlist)
	local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME) --取玩家名字
	s_worldInfo("<p><n color=GXColorBlueSky>【系】恭喜</n><q buttonid=6005 ownerid=".. uid .. ">" ..name.. "</q><n color=GXColorBlueSky>完成了社交类成就，获得了丰厚的奖励！</n><book bookid='70248' text='[详细]'/></p>",ChatPos_Sys + ChatPos_Honor )
end

RoleTaskInfo49000 =
{
	subtasknum = 2,
	subtask1 =
	{
		task = {s_taskCustom,{0,0,4,0}},
		autofinish = true,
		onfinish=
		{
			{RoleTaskInfo49000_WorldInfo,{}},
		},
	},
	subtask2 =
	{
		task = {s_taskCustom,{0,0,1,0}},
		autofinish = true,
		onfinish=
		{
			{s_actionAddItem,{14, 0, 5, 0, "1-1", "成就奖励49000_2"}},
			{s_actionAddItem,{20161, 0, 1, 1, "1-1,7-3", "成就奖励49000_2"}},
			{s_actionAddItem,{35300, 0, 1, 0, "1-1", "成就奖励49000_2"}},
			{s_actionAddItem,{24074, 0, 1, 0, "1-1", "成就奖励49000_2"}},
		},
	},
}
--成长
RoleTaskInfo49001 =
{
	subtasknum = 2,
	subtask1 =
	{
		task = {s_taskCustom,{0,0,14,0}},
		autofinish = true,
		onfinish=
		{
			{s_actionAddAchieveTaskOperate,{49000,1}},
			{RoleTaskInfo49001_WorldInfo,{}},
		},
	},
	subtask2 =
	{
		task = {s_taskCustom,{0,0,1,0}},
		autofinish = true,
		onfinish=
		{
			{s_actionAddItem,{14, 0, 4, 0, "1-1", "成就奖励49001_2"}},
			{s_actionAddItem,{27108, 0, 100, 0, "1-1", "成就奖励49001_2"}},
		},
	},
}
--战斗
RoleTaskInfo49002 =
{
	subtasknum = 2,
	subtask1 =
	{
		task = {s_taskCustom,{0,0,12,0}},
		autofinish = true,
		onfinish=
		{
			{s_actionAddAchieveTaskOperate,{49000,1}},
			{RoleTaskInfo49002_WorldInfo,{}},
		},
	},
	subtask2 =
	{
		task = {s_taskCustom,{0,0,1,0}},
		autofinish = true,
		onfinish=
		{
			{s_actionAddItem,{14, 0, 4, 0, "1-1", "成就奖励49002_2"}},
			{s_actionAddItem,{27108, 0, 100, 0, "1-1", "成就奖励49002_2"}},
		},
	},
}
--能力
RoleTaskInfo49003 =
{
	subtasknum = 2,
	subtask1 =
	{
		task = {s_taskCustom,{0,0,14,0}},
		autofinish = true,
		onfinish=
		{
			{s_actionAddAchieveTaskOperate,{49000,1}},
			{RoleTaskInfo49003_WorldInfo,{}},
		},
	},
	subtask2 =
	{
		task = {s_taskCustom,{0,0,1,0}},
		autofinish = true,
		onfinish=
		{
			{s_actionAddItem,{14, 0, 4, 0, "1-1", "成就奖励49003_2"}},
			{s_actionAddItem,{27108, 0, 100, 0, "1-1", "成就奖励49003_2"}},
		},
	},
}
--社交
RoleTaskInfo49004 =
{
	subtasknum = 2,
	subtask1 =
	{
		task = {s_taskCustom,{0,0,11,0}},
		autofinish = true,
		onfinish=
		{
			{s_actionAddAchieveTaskOperate,{49000,1}},
			{RoleTaskInfo49004_WorldInfo,{}},
		},
	},
	subtask2 =
	{
		task = {s_taskCustom,{0,0,1,0}},
		autofinish = true,
		onfinish=
		{
			{s_actionAddItem,{14, 0, 4, 0, "1-1", "成就奖励49004_2"}},
			{s_actionAddItem,{27108, 0, 100, 0, "1-1", "成就奖励49004_2"}},
		},
	},
}
