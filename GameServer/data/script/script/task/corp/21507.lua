RoleTaskInfo21507 =
{
	subtasknum = 3,
	parent = 20001,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkTaskCurRing,{20001,5,10}},
			{s_checkCorps,},
		},
		traceend = [[<p><newline/><n>前往</n><n></n><goto id="135" mapid="3" flagpoint="1" taskid="21507"/></p>]],
		task = {s_taskTalk,{45112,135}},
	},
	subtask2 =
	{
		traceend = [[<p><newline/><n>前往</n><n></n><goto id="60157" mapid="6" flagpoint="1" taskid="21507"/></p>]],
		task = {s_taskGuard,{135,60157,60106}},
	},
	subtask3 =
	{
		traceend = [[<p><event hotkeyid="52" eid="100" cid="39" text="快速返回团基地"/><newline/><n>回复：</n><n></n><goto id="45112" mapid="101" flagpoint="1" taskid="21507"/></p>]],
		task = {s_taskTalk,{60157,45112}},
	},
}
