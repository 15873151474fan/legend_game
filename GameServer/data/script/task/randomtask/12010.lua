
-- 总任务
RoleTaskInfo12010 =
{
	subtasknum = 8,
	subtask1 =
	{
		traceend = [[<p><newline/><n>回复：</n><n></n><goto id="45112" mapid="101" flagpoint="1" taskid="12010"/></p>]],
		accepttext = parseToTalk([[body(    亲爱的player()，欢迎你来到团基地。)]]),
		finishtext = parseToTalk([[body(  我是团科技官，在我这里可以接取到hot(团建设任务)。团建设任务一共有10环，每次完成任务，都有几率获得当环经验翻倍的效果。除了可以hot(获得大量经验奖励)，你还可以获得hot(团勋章和贡献度)。所以，每天都记得要完成团建设任务哦！)]]),
		task = {s_taskTalk, {45110, 45112}},
	},
	subtask2 =
	{
		traceend = [[<p><newline/><n>回复：</n><n></n><goto id="45129" mapid="101" flagpoint="1" taskid="12010"/></p>]],
		accepttext = parseToTalk([[body(    亲爱的player()，欢迎你来到团基地。)]]),
		finishtext = parseToTalk([[body(  我是团仓库管理员！你可以hot(在我身后的箱子中)存取道具。当然，你也可以通过我身后的团仓库，hot(捐献团资金)。捐献团资金需要消耗银币，团资金将会用于团的各种日常活动中。)]]),
		task = {s_taskTalk, {45110, 45129}},
	},
	subtask3 =
	{
		traceend = [[<p><newline/><n>回复：</n><n></n><goto id="45118" mapid="101" flagpoint="1" taskid="12010"/></p>]],
		accepttext = parseToTalk([[body(    亲爱的player()，欢迎你来到团基地。)]]),
		finishtext = parseToTalk([[body(  叽叽咕咕……咔咔……我是团种植管理员。你可以叫我Bili，请不要喊我小什么或者大什么。在我这里出售各种团种植道具。)]]),
		task = {s_taskTalk, {45110, 45118}},
	},
	subtask4 =
	{
		traceend = [[<p><newline/><n>回复：</n><n></n><goto id="45113" mapid="101" flagpoint="1" taskid="12010"/></p>]],
		accepttext = parseToTalk([[body(    亲爱的player()，欢迎你来到团基地。)]]),
		finishtext = parseToTalk([[body(  亲爱的，我很高兴见到你。团长可以在我这儿hot(发布团训练任务、团舞会)。你可以在我这儿购买各种团活动道具。怎么样？常来转转，我们可以一起喝喝茶。)]]),
		task = {s_taskTalk, {45110, 45113}},
	},
	subtask5 =
	{
		traceend = [[<p><newline/><n>回复：</n><n></n><goto id="45117" mapid="101" flagpoint="1" taskid="12010"/></p>]],
		accepttext = parseToTalk([[body(    亲爱的player()，欢迎你来到团基地。)]]),
		finishtext = parseToTalk([[body(  看到我身后那丑丑的胖子了么？我就是负责喂养它的。别看这胖子长得丑。等养肥了宰掉绝对让你爽歪歪。姐一生戎马，早已看破红尘。不要因为我的犀利而迷失了你人生的目标！)]]),
		task = {s_taskTalk, {45110, 45117}},
	},
	subtask6 =
	{
		traceend = [[<p><newline/><n>回复：</n><n></n><goto id="45111" mapid="101" flagpoint="1" taskid="12010"/></p>]],
		accepttext = parseToTalk([[body(    亲爱的player()，欢迎你来到团基地。)]]),
		finishtext = parseToTalk([[body(  哇哈哈哈哈哈哈，我最喜欢拿着火炮到处轰人玩了。谁要欺负我的人，我就追他十条街。人挡杀人，神挡弑神！跟着我一起做团突袭任务吧！让我们的炮火烧光那些笨蛋！)]]),
		task = {s_taskTalk, {45110, 45111}},
	},
	subtask7 =
	{
		traceend = [[<p><newline/><n>回复：</n><n></n><goto id="45119" mapid="101" flagpoint="1" taskid="12010"/></p>]],
		accepttext = parseToTalk([[body(    亲爱的player()，欢迎你来到团基地。)]]),
		finishtext = parseToTalk([[body(  我是团魔甲管理员，魔甲的制造与维护都是我在管理。这个地方疯子太多了，我们一定要用冷静的视觉来思考。魔甲的美感不是一般人能够理解的。你懂的！打造魔甲需要消耗魔甲打造材料。你可以通过hot(团建设任务或击败团BOSS)获得。)]]),
		task = {s_taskTalk, {45110, 45119}},
	},
	subtask8 =
	{
		traceend = [[<p><newline/><n>回复：</n><n></n><goto id="45110" mapid="101" flagpoint="1" taskid="12010"/></p>]],
		accepttext = parseToTalk([[body(    亲爱的player()，欢迎你来到团基地。)]]),
		finishtext = parseToTalk([[body(  我是团指挥官，很高兴见到你。在我这里，团长可以发布团守卫活动。团员可以领取团奖金。我想每次我们见面，都会是很开心的一件事。)]]),
		task = {s_taskTalk, {45110, 45110}},
	},
}
