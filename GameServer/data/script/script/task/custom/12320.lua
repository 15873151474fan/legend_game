RoleTaskInfo12320 =
{
	subtasknum = 1,
	subtask1 =
	{
		QAInfo =
		{
			{question = "1.再次取消新手保护，将无法恢复，你确定要这样做吗？", answer = {"<p><button id=1 packid=0 group=12 frame=126 color=GXColorGreen helpuniqid=1 text=A.是/></p>","<p><button id=1 packid=0 group=12 frame=125 color=GXColorRed helpuniqid=1 text=B.否/></p>"}, result = {1}},
			{question = "2.你真的决定了么？", answer = {"<p><button id=1 packid=0 group=12 frame=126 color=GXColorGreen helpuniqid=1 text=A.是，我已经准备好/></p>", "<p><button id=1 packid=0 group=12 frame=125 color=GXColorRed helpuniqid=1 text=B.否，我还需要准备/></p>"}, result = {1}},
		},
		task = {s_taskQA, {126}},
		onfinish=
		{
			{s_actionCancelProtect,{}},
		},
	},
}
