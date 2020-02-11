
-- 总任务
RoleTaskInfo3803 =
{
	subtasknum = 7,
	subtask1 =
	{
		traceend = [[<p><newline/><n>回复：</n><n></n><goto id="135" mapid="3" flagpoint="1" taskid="3803"/></p>]],
		accepttext = parseToTalk([[body(    亲爱的player()，欢迎来到光明城。这里是光明教会的中心，是最接近神的地方。虽然没有帝都的沧桑，也没有军乐城的繁华，但这里是个很轻松的地方。你可以前往光明祭司亚塔尼斯处与她聊聊。)]]),
		finishtext = parseToTalk([[body(  神说要有光明，于是人间便多了此处。被命运所指引而来的人啊，你的去处将会是哪里？接下去，你应该要和hot(团联络官)聊聊了。)]]),
		task = {s_taskTalk, {60000, 135}},
	},
	subtask2 =
	{
		traceend = [[<p><newline/><n>回复：</n><n></n><goto id="122" mapid="3" flagpoint="1" taskid="3803"/></p>]],
		accepttext = parseToTalk([[body(    亲爱的player()，神创造了世界，也需要有人能够捍卫。你可以找到团联络官，与她聊聊。她将会推荐你进入一个优秀的团。开启一段热血的旅程。)]]),
		finishtext = parseToTalk([[body(  很高兴见到你，player()。21级就可以申请加入团了哦！如果要创建团，那你必须要等级达到25级以上。接下去，你应该要和hot(设置回城点的爱莎)聊聊了。)]]),
		task = {s_taskTalk, {60000, 122}},
	},
	subtask3 =
	{
		traceend = [[<p><newline/><n>回复：</n><n></n><goto id="60550" mapid="3" flagpoint="1" taskid="3803"/></p>]],
		accepttext = parseToTalk([[body(    亲爱的player()，在战斗过程中难免会受到一些创伤。如果受伤轻，那可以吃点药恢复下血量！如果受伤中，你就需要重生了。hot(设置回城点)，是很重要的一件事。去找到爱莎吧。她是个好说话的姑娘，就在那里等着你喃！)]]),
		finishtext = parseToTalk([[body(  hello，我是爱莎。我最喜欢的是草莓棉花糖，其次就是这座城市了。你可以设置复活点，60级前光明城都是个很适合的复活点哦！接下去，你应该要和hot(黑市商人杰克)聊聊了。)]]),
		task = {s_taskTalk, {60000, 60550}},
	},
	subtask4 =
	{
		traceend = [[<p><newline/><n>回复：</n><n></n><goto id="60065" mapid="3" flagpoint="1" taskid="3803"/></p>]],
		accepttext = parseToTalk([[body(    亲爱的player()，在迷雾废墟一别几日，我们又见面了。你的等级已经提升不少，也可以尝试更多有趣的任务了。)]]),
		finishtext = parseToTalk([[body(  哈哈，怎么又是我喃？你可以在我这里完成hot(黑市收购)和hot(收集装备)任务哦！接下来，你应该要和hot(商业大师卡耐基)聊聊了。)]]),
		task = {s_taskTalk, {60000, 60065}},
	},
	subtask5 =
	{
		traceend = [[<p><newline/><n>回复：</n><n></n><goto id="171" mapid="3" flagpoint="1" taskid="3803"/></p>]],
		accepttext = parseToTalk([[body(    亲爱的player()，我就是商业大师卡耐基。我善于赚钱，也善于花钱。你可以在我附近摆摊，也可以通过拍卖行、求购行进行买卖。只要你想，钱，肯定是源源不绝的。)]]),
		finishtext = parseToTalk([[body(  我最喜欢的就是把银币堆成小山，然后在小山里游泳。好吧，很高兴见到你。接下来，你应该与hot(舞蹈大师桃乐丝)聊聊。)]]),
		task = {s_taskTalk, {60000, 171}},
	},
	subtask6 =
	{
		traceend = [[<p><newline/><n>回复：</n><n></n><goto id="170" mapid="3" flagpoint="1" taskid="3803"/></p>]],
		accepttext = parseToTalk([[body(    音乐是愉悦身心的行为，当你的身体跟着音乐摇摆时，你就会得到快乐。很多人都以为舞蹈是堕落的快乐，可我一直觉得快乐无分高低，只有是否真的快乐。)]]),
		finishtext = parseToTalk([[body(  hello，你可以在我附近跳舞。每天跳舞都可以获得大量的经验，国家舞会时经验会非常丰富。当然，跳舞时别忘了hot(舞票)，那很重要。好了，很高兴你来和我说话。你快去找hot(光明骑士团团长卡尔)吧！他等着你。)]]),
		task = {s_taskTalk, {60000, 170}},
	},
	subtask7 =
	{
		traceend = [[<p><newline/><n>回复：</n><n></n><goto id="60000" mapid="1" flagpoint="1" taskid="3803"/></p>]],
		accepttext = parseToTalk([[body(    与他们的聊天，让你喜欢上这座城市了吗？)]]),
		finishtext = parseToTalk([[body(	60级之前，你需要在这座城市中度过一段愉快的时光。)]]),
		task = {s_taskTalk, {60000, 60000}},
	},
}
