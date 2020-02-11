RoleTaskInfo15244 =
{
	subtasknum = 1,
	subtask1 =
	{
		QAInfo =
		{
			{question = "1.觉醒神魂需要支付手续费么？", answer = {"<p><button id=1 packid=0 group=12 frame=125 color=GXColorRed helpuniqid=1 text=A.不需要/></p>","<p><button id=1 packid=0 group=12 frame=126 color=GXColorGreen helpuniqid=1 text=B.需要支付一定的手续费/></p>"}, result = {2}},
			{question = "2.神魂阶数大于0的紫装可以觉醒么？", answer = {"<p><button id=1 packid=0 group=12 frame=126 color=GXColorGreen helpuniqid=1 text=A.可以/></p>","<p><button id=1 packid=0 group=12 frame=125 color=GXColorRed helpuniqid=1 text=B.不可以/></p>"}, result = {1}},
			{question = "3.觉醒后的装备通过什么提升能力？", answer = {"<p><button id=1 packid=0 group=12 frame=125 color=GXColorRed helpuniqid=1 text=A.念咒语/></p>","<p><button id=1 packid=0 group=12 frame=126 color=GXColorGreen helpuniqid=1 text=B.可以通过吞噬始初之净血提升/></p>"}, result = {2}},
			{question = "4.装备养成升级后，觉醒阶数和效果变化么？", answer = {"<p><button id=1 packid=0 group=12 frame=125 color=GXColorRed helpuniqid=1 text=A.当然会变化/></p>","<p><button id=1 packid=0 group=12 frame=126 color=GXColorGreen helpuniqid=1 text=B.不会变化的放心吧/></p>"}, result = {2}},
		},
		task = {s_taskQA, {60559}},
		onfinish =
		{
			{s_actionOpenGuide,{15244}},
		},
	},
}


RoleTaskInfo15245 =
{
	subtasknum = 1,
	subtask1 =
	{
		QAInfo =
		{
			{question = "1.始初之净血可合成提升品质么？", answer = {"<p><button id=1 packid=0 group=12 frame=125 color=GXColorRed helpuniqid=1 text=A.不可以/></p>","<p><button id=1 packid=0 group=12 frame=126 color=GXColorGreen helpuniqid=1 text=B.可以/></p>"}, result = {2}},
			{question = "2.可以选择是否保存本次吞噬结果么？", answer = {"<p><button id=1 packid=0 group=12 frame=126 color=GXColorGreen helpuniqid=1 text=A.可以/></p>","<p><button id=1 packid=0 group=12 frame=125 color=GXColorRed helpuniqid=1 text=B.不可以/></p>"}, result = {1}},
			{question = "3.吞噬越高品质的净血是不是效果越高？", answer = {"<p><button id=1 packid=0 group=12 frame=125 color=GXColorRed helpuniqid=1 text=A.当然不是/></p>","<p><button id=1 packid=0 group=12 frame=126 color=GXColorGreen helpuniqid=1 text=B.是的，单次可能提升的能力区间越大/></p>"}, result = {2}},
		},
		task = {s_taskQA, {60559}},
		onfinish =
		{
			{s_actionOpenGuide,{15245}},
		},
	},
}
