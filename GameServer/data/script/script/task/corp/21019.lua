RoleTaskInfo21019 =
{
	subtasknum = 2,
	parent = 20001,
	subtask1 =
	{
		traceend = [[<p><newline/><n>  回复：</n><n></n><goto id="60555" mapid="5" flagpoint="1" taskid="21019"/></p>]],
		onacceptcheck =
		{
			{s_checkTaskCurRing,{20001,1,10}},
			{s_checkCorps,},
		},
		task = {s_taskTalk,{45112,60555}},
	},
	subtask2 =
	{
		traceend = [[<p><newline/><n>  回复：</n><n></n><goto id="45112" mapid="101" flagpoint="1" taskid="21019"/></p>]],
		task = {s_taskTalk,{60555,45112}},
	},
}
