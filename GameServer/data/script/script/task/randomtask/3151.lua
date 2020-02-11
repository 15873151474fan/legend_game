
--	Profession_Soldier      = 1,			//--战士
--	Profession_Spy          = 2,			//--魔刃
--	Profession_Gunman       = 3,			//--枪手
--	Profession_Blast        = 4,			//--魔炮
--	Profession_Freeman      = 5,			//--术士
--	Profession_Doctor       = 6,			//--牧师

-- 总任务
RoleTaskInfo3151 =
{

	subtasknum = 1,
	subtask1 =
	{
		randomtask =
		{
			{100,100,{3152, 3153, 3154, 3155, 3156,3157}},
		},
		task = {s_taskRandomTask, {60006}},
		onfinish =
		{
			{s_actionOpenGuide,{3151}},
		},

	},
}

-- 战士任务
RoleTaskInfo3152 =
{
	parent = 3151,
	subtasknum = 2,
	subtask1 =
	{
		tracebegin = [[<p><newline/><n>  回复：</n><n></n><goto id="5064" mapid="1" flagpoint="1" taskid="3152"/></p>]],
		traceend = [[<p><newline/><n>  回复：</n><n></n><goto id="5064" mapid="1" flagpoint="1" taskid="3152"/></p>]],
		task = {s_taskTalk, {60006, 5064}},
		onaccept =
		{
			{s_actionChangeRide,{50030, 60*5}},
		},
		onacceptcheck =
		{
			{s_checkRoleProfession, {1}},
		},
	},
	subtask2 =
	{
		tracebegin = [[<p><newline/><n>  回复：</n><n></n><goto id="5064" mapid="1" flagpoint="1" taskid="3152"/></p>]],
		traceend = [[<p><newline/><n>  回复：</n><n></n><goto id="60006" mapid="1" flagpoint="1" taskid="3152"/></p>]],
		task = {s_taskTalk, {5064, 60006}},
		onfinish =
		{
			{s_actionChangeRide,{0, 0}},
		},
	},
}

-- 魔刃任务
RoleTaskInfo3153 =
{
	parent = 3151,
	subtasknum = 2,
	subtask1 =
	{
		tracebegin = [[<p><newline/><n>  回复：</n><n></n><goto id="5065" mapid="1" flagpoint="1" taskid="3153"/></p>]],
		traceend = [[<p><newline/><n>  回复：</n><n></n><goto id="5065" mapid="1" flagpoint="1" taskid="3153"/></p>]],
		task = {s_taskTalk, {60006, 5065}},
		onaccept =
		{
			{s_actionChangeRide,{50030, 60*5}},
		},
		onacceptcheck =
		{
			{s_checkRoleProfession, {2}},
		},
	},
	subtask2 =
	{
		tracebegin = [[<p><newline/><n>  回复：</n><n></n><goto id="5065" mapid="1" flagpoint="1" taskid="3153"/></p>]],
		traceend = [[<p><newline/><n>  回复：</n><n></n><goto id="60006" mapid="1" flagpoint="1" taskid="3153"/></p>]],
		task = {s_taskTalk, {5065, 60006}},
		onfinish =
		{
			{s_actionChangeRide,{0, 0}},
		},
	},
}

-- 枪手任务
RoleTaskInfo3154 =
{
	parent = 3151,
	subtasknum = 2,
	subtask1 =
	{
		tracebegin = [[<p><newline/><n>  回复：</n><n></n><goto id="5066" mapid="1" flagpoint="1" taskid="3154"/></p>]],
		traceend = [[<p><newline/><n>  回复：</n><n></n><goto id="5066" mapid="1" flagpoint="1" taskid="3154"/></p>]],
		task = {s_taskTalk, {60006, 5066}},
		onaccept =
		{
			{s_actionChangeRide,{50030, 60*5}},
		},
		onacceptcheck =
		{
			{s_checkRoleProfession, {3}},
		},
	},
	subtask2 =
	{
		tracebegin = [[<p><newline/><n>  回复：</n><n></n><goto id="5066" mapid="1" flagpoint="1" taskid="3154"/></p>]],
		traceend = [[<p><newline/><n>  回复：</n><n></n><goto id="60006" mapid="1" flagpoint="1" taskid="3154"/></p>]],
		task = {s_taskTalk, {5066, 60006}},
		onfinish =
		{
			{s_actionChangeRide,{0, 0}},
		},
	},
}

-- 魔炮任务
RoleTaskInfo3155 =
{
	parent = 3151,
	subtasknum = 2,
	subtask1 =
	{
		tracebegin = [[<p><newline/><n>  回复：</n><n></n><goto id="5067" mapid="1" flagpoint="1" taskid="3155"/></p>]],
		traceend = [[<p><newline/><n>  回复：</n><n></n><goto id="5067" mapid="1" flagpoint="1" taskid="3155"/></p>]],
		task = {s_taskTalk, {60006, 5067}},
		onaccept =
		{
			{s_actionChangeRide,{50030, 60*5}},
		},
		onacceptcheck =
		{
			{s_checkRoleProfession, {4}},
		},
	},
	subtask2 =
	{
		tracebegin = [[<p><newline/><n>  回复：</n><n></n><goto id="5067" mapid="1" flagpoint="1" taskid="3155"/></p>]],
		traceend = [[<p><newline/><n>  回复：</n><n></n><goto id="60006" mapid="1" flagpoint="1" taskid="3155"/></p>]],
		task = {s_taskTalk, {5067, 60006}},
		onfinish =
		{
			{s_actionChangeRide,{0, 0}},
		},
	},
}

-- 术士任务
RoleTaskInfo3156 =
{
	parent = 3151,
	subtasknum = 2,
	subtask1 =
	{
		tracebegin = [[<p><newline/><n>  回复：</n><n></n><goto id="5068" mapid="1" flagpoint="1" taskid="3156"/></p>]],
		traceend = [[<p><newline/><n>  回复：</n><n></n><goto id="5068" mapid="1" flagpoint="1" taskid="3156"/></p>]],
		task = {s_taskTalk, {60006, 5068}},
		onaccept =
		{
			{s_actionChangeRide,{50030, 60*5}},
		},
		onacceptcheck =
		{
			{s_checkRoleProfession, {5}},
		},
	},
	subtask2 =
	{
		tracebegin = [[<p><newline/><n>  回复：</n><n></n><goto id="5068" mapid="1" flagpoint="1" taskid="3156"/></p>]],
		traceend = [[<p><newline/><n>  回复：</n><n></n><goto id="60006" mapid="1" flagpoint="1" taskid="3156"/></p>]],
		task = {s_taskTalk, {5068, 60006}},
		onfinish =
		{
			{s_actionChangeRide,{0, 0}},
		},
	},
}

-- 牧师任务
RoleTaskInfo3157 =
{
	parent = 3151,
	subtasknum = 2,
	subtask1 =
	{
		tracebegin = [[<p><newline/><n>  回复：</n><n></n><goto id="5069" mapid="1" flagpoint="1" taskid="3157"/></p>]],
		traceend = [[<p><newline/><n>  回复：</n><n></n><goto id="5069" mapid="1" flagpoint="1" taskid="3157"/></p>]],
		task = {s_taskTalk, {60006, 5069}},
		onaccept =
		{
			{s_actionChangeRide,{50030, 60*5}},
		},
		onacceptcheck =
		{
			{s_checkRoleProfession, {6}},
		},
	},
	subtask2 =
	{
		tracebegin = [[<p><newline/><n>  回复：</n><n></n><goto id="5069" mapid="1" flagpoint="1" taskid="3157"/></p>]],
		traceend = [[<p><newline/><n>  回复：</n><n></n><goto id="60006" mapid="1" flagpoint="1" taskid="3157"/></p>]],
		task = {s_taskTalk, {5069, 60006}},
		onfinish =
		{
			{s_actionChangeRide,{0, 0}},
		},
	},
}
