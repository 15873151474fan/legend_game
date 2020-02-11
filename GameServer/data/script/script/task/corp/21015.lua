RoleTaskInfo21015 =
{
	subtasknum = 2,
	parent = 20001,
	subtask1 =
	{
		traceend = [[<p><newline/><n>  回复：</n><n></n><goto id="60085" mapid="7" flagpoint="1" taskid="21015"/></p>]],
		onacceptcheck =
		{
			{s_checkTaskCurRing,{20001,1,10}},
			{s_checkCorps,},
		},
		task = {s_taskTalk,{45112,60085}},
	},
	subtask2 =
	{
		traceend = [[<p><newline/><n>  回复：</n><n></n><goto id="45112" mapid="101" flagpoint="1" taskid="21015"/></p>]],
		task = {s_taskTalk,{60085,45112}},
	},
}
