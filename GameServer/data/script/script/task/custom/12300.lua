RoleTaskInfo12300 =
{
	subtasknum = 1,
	subtask1 =
	{
		QAInfo =
		{
			{question = "1.以下哪个任务不需要出国即可完成？", answer = {"<p><button id=1 packid=0 group=12 frame=126 color=GXColorGreen helpuniqid=1 text=A.前线速递/></p>","<p><button id=1 packid=0 group=12 frame=125 color=GXColorRed helpuniqid=1 text=B.收集情报/></p>","<p><button id=1 packid=0 group=12 frame=125 color=GXColorRed helpuniqid=1 text=C.远征/></p>"}, result = {1}},
			{question = "2.战斗将会是腥风血雨的，可能会有危险，可能会遭遇敌人，你是否已经准备充分？", answer = {"<p><button id=1 packid=0 group=12 frame=126 color=GXColorGreen helpuniqid=1 text=A.是，我已经准备好/></p>", "<p><button id=1 packid=0 group=12 frame=125 color=GXColorRed helpuniqid=1 text=B.否，我还需要准备/></p>"}, result = {1}},
			{question = "3.请确定是否取消“新手”状态？", answer = {"<p><button id=1 packid=0 group=12 frame=126 color=GXColorGreen helpuniqid=1 text=A.是，我已经准备好/></p>", "<p><button id=1 packid=0 group=12 frame=125 color=GXColorRed helpuniqid=1 text=B.否，我还需要准备/></p>"}, result = {1}},
		},
		task = {s_taskQA, {126}},
		onfinish=
		{
			{s_actionCancelProtect,{}},
		},
	},
}
