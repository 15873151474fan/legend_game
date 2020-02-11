RoleTaskInfo4313 =
{
	subtasknum = 1,
	subtask1 =
	{
		QAInfo =
		{
			{question = "生命仪升级之后，能够带来什么好处？", answer = {"<p><button id=1 packid=0 group=12 frame=125 color=GXColorRed helpuniqid=1 text=A.提升防御/></p>","<p><button id=1 packid=0 group=12 frame=125 color=GXColorRed helpuniqid=1 text=B.提升攻击/></p>","<p><button id=1 packid=0 group=12 frame=126 color=GXColorGreen helpuniqid=1 text=C.提升血量上限/></p>"}, result = {3}},
		},
		task = {s_taskQA, {60000}},
		onfinish =
		{
			{s_actionOpenGuide,{4313}},
		},
	},
}
