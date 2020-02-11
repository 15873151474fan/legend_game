RoleTaskInfo21705 =
{
	subtasknum = 2,
	parent = 20001,
	subtask1 =
	{
		traceend = [[<p><newline/><n>前往</n><n></n><goto id="60153" mapid="3" flagpoint="1" taskid="21705"/></p>]],
		onacceptcheck =
		{
			{s_checkTaskCurRing,{20001,1,10}},
			{s_checkCorps,},
		},
		task = {s_taskTalk,{45112,60153}},
		onfinish =
		{
			{s_actionAddItem,{31198,0,1,0,"1-1","RoleTaskInfo21705_1"}},
		},
	},
	subtask2 =
	{
		traceend = [[<p><event hotkeyid="52" eid="100" cid="39" text="快速返回团基地"/><newline/><n>回复：</n><n></n><goto id="45112" mapid="101" flagpoint="1" taskid="21705"/></p>]],
		collectitem =
		{
			{31198, 0, 1},
		},
		task = {s_taskCollect, {60153, 45112}},
		onfinish =
		{
			{s_actionDeleteItemByBaseID,{31198,1,"RoleTaskInfo21705"}},
		},
	},
}
