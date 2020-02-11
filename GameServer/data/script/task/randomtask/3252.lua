
-- 总任务
RoleTaskInfo3252 =
{
	subtasknum = 5,
	subtask1 =
	{
		traceend = [[<p><newline/><n>回复：</n><n></n><goto id="60018" mapid="2" flagpoint="1" taskid="3252"/></p>]],
		accepttext = parseToTalk([[body(    亲爱的player()，身为一镇之长，我很荣幸能够看到你到来。迷雾废墟是个被诅咒的地方，只是不知道为什么荆棘镇一直都不被怪物攻击。大家平时在镇子里还好，若是出门就需要面对野兽的侵袭，居民们情绪都不太稳定，你看是否与他们聊聊，稳定一下大家的情绪。)]]),
		finishtext = parseToTalk([[body(  我是卡西，是镇子里的医生。我最擅长的是兽医，偶尔也能治疗个感冒。)]]),
		task = {s_taskTalk, {60016, 60018}},
		onfinish =
		{
			{s_actionAddBuff,{10606, 3, 15, 0}},
			{s_actionSysInfo,{"医生卡西给你增加了一个buff，让你感觉更加健康",2}}
		},
	},
	subtask2 =
	{
		traceend = [[<p><newline/><n>回复：</n><n></n><goto id="60066" mapid="2" flagpoint="1" taskid="3252"/></p>]],
		accepttext = parseToTalk([[body(    亲爱的player()，有什么身体上的不适就可以来找我。当然，你没事也可以与hot(神秘人米迦勒)聊聊，那家伙一肚子坏水和不安分。你们一定很聊得来！)]]),
		finishtext = parseToTalk([[body(  我是神秘人米迦勒，你可以在我这里接到一些有趣的小任务。当然，你也可以完全无视我。)]]),
		task = {s_taskTalk, {60016, 60066}},
	},
	subtask3 =
	{
		traceend = [[<p><newline/><n>回复：</n><n></n><goto id="60065" mapid="2" flagpoint="1" taskid="3252"/></p>]],
		accepttext = parseToTalk([[body(    亲爱的player()，鉴定达人和宠物达人任务都是我发布的。hot(黑市商人杰克)似乎对你也很有兴趣，可以与他聊聊，那个收破烂的家伙是小镇最有钱的人。你会需要他的！)]]),
		finishtext = parseToTalk([[body(  我是黑市商人，你可以在我这里接取“黑市收购”任务赚点小钱。等你等级足够时，还可以接取“收集装备”任务。)]]),
		task = {s_taskTalk, {60016, 60065}},
		onfinish =
		{
			{s_actionRandomAction,{15, 100, { {s_actionSmile,{24}}}}, },
		},
	},
	subtask4 =
	{
		traceend = [[<p><newline/><n>回复：</n><n></n><goto id="104" mapid="2" flagpoint="1" taskid="3252"/></p>]],
		accepttext = parseToTalk([[body(    富有的player()，我很高兴能够见到你。hot(补给品商人)对你也有兴趣，他一定会推销那堆很难闻的药。嘘，别告诉他是我说的！)]]),
		finishtext = parseToTalk([[body(  我是补给品商人，你可以在我这里购买足够的药品以及其他杂物哦！)]]),
		task = {s_taskTalk, {60016, 104}},
	},
	subtask5 =
	{
		traceend = [[<p><newline/><n>回复：</n><n></n><goto id="60016" mapid="2" flagpoint="1" taskid="3252"/></p>]],
		accepttext = parseToTalk([[body(    亲爱的player()，你了解了这个镇子里的一切。镇长会希望和你聊聊的。)]]),
		finishtext = parseToTalk([[body(  哈哈，镇子里的人都很欢迎你。不是吗？)]]),
		task = {s_taskTalk, {60016, 60016}},
		onfinish =
		{
			{s_actionAddBuff,{5035, 0, 15}},
		},
	},
}
