RoleTaskInfo32500 =
{
	parent = 31000,
	subtasknum = 4,
	subtask1 =
	{
		color = TaskColor_Yellow,
		desctext = ([[<p><newline/><n font="3" color="GXColorYellow">[随机]七宗罪之暴怒</n><newline/><image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/><newline/><n font="3" color="GXColorYellow">任务进程：</n><newline/><n color="GXColorGreen">    第一步：将</n><n color='GXColorGreen'>火焰蜘蛛奥克</n><n>押送至</n><goto id="218" mapid="5" flagpoint="1" taskid="32500"/><newline/><n>    第二步：在</n><goto id="60791" mapid="5" flagpoint="1" taskid="32500"/><n>封印火焰蜘蛛奥克</n><newline/><n>    第三步：将封印获得的惩戒之光与救赎之光交给</n><goto id="60792" mapid="5" flagpoint="1"/><n>，获得天国福音。</n><newline/><n>    第四步：将天国福音送至</n><goto pos="128,145" mapid="5" flagpoint="1" taskid="32500"/><newline/><newline/><n font="3" color="GXColorYellow">任务描述：</n><newline/><n>    傲慢是一种罪，需要神的光辉惩戒。对血腥电锯的惩戒，即是神的慈悲，也是神的威严。</n><newline/><newline/><n font="3" color="GXColorYellow">任务描述：</n><newline/><n>    随机任务，需完成后才可获得奖励。每天随机任务可进行一次。</n><newline/></p>]]),
		prompttext = [[   惩戒罪恶的道路充满荆棘，需要将BOSS押送至此地，才可进行下一步任务。]],
		traceend = [[<p><newline/><n>押送BOSS至：</n><n></n><goto id="218" mapid="5" flagpoint="1" taskid="32500"/></p>]],
		accepttext = [[<p><n>	我需要你帮助我们。最近，我们抓到了一批恶魔，他们诱惑人类走向邪恶。我需要你将他们净化。将他们押送到指定的神官处。</n><newline/><button packid='0' group='5' frame='40' id='-1'>海量经验</button><n></n></p>]],
		finishtext = parseToTalk([[body(    你已经获得了hot(救赎之光)与hot(惩戒之光)，接下来，就可以在我这里将神的光芒转化为“天国福音”！)]]),
		onaccept =
		{
			{s_actionCorpsInfo,{"同团的团员，在军乐城的超魔导师达芬奇处接取了黄色品质的“达芬奇的秘密”任务！", 34}},
		},
		task = {s_taskGuard,{60789,218,61079,1}},
		onfinish=
		{
			{s_actionAddItem,{31422, 0, 1,0, "1-1", "RoleTaskInfo32500"}},
			{s_actionAddBuff,{1015, 0, 40,0}},
		},
	},

	subtask2 =
	{
		color = TaskColor_Yellow,
		desctext = ([[<p><newline/><n font="3" color="GXColorYellow">[随机]七宗罪之暴怒</n><newline/><image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/><newline/><n font="3" color="GXColorYellow">任务进程：</n><newline/><n>    第一步：将火焰蜘蛛奥克押送至</n><goto id="218" mapid="5" flagpoint="1" taskid="32500"/><newline/><n color="GXColorGreen">    第二步：在</n><goto id="60791" mapid="5" flagpoint="1" taskid="32500"/><n color="GXColorGreen">封印火焰蜘蛛奥克</n><newline/><n>    第三步：将封印获得的惩戒之光与救赎之光交给</n><goto id="60792" mapid="5" flagpoint="1"/><n>，获得天国福音。</n><newline/><n>    第四步：将天国福音送至</n><goto pos="128,145" mapid="5" flagpoint="1" taskid="32500"/><newline/><newline/><n font="3" color="GXColorYellow">任务描述：</n><newline/><n>    傲慢是一种罪，需要神的光辉惩戒。对血腥电锯的惩戒，即是神的慈悲，也是神的威严。</n><newline/><newline/><n font="3" color="GXColorYellow">任务描述：</n><newline/><n>    随机任务，需完成后才可获得奖励。每天随机任务可进行一次。</n><newline/></p>]]),
		prompttext = [[   你还没有封印火焰蜘蛛奥克。]],
		tracebegin = [[<p><newline/><n>封印：</n><n></n><goto id="60791" mapid="5" flagpoint="1" taskid="32500"/></p>]],
		traceend = [[<p><newline/><n>告知：</n><n></n><goto id="60792" mapid="5" flagpoint="1" taskid="32500"/></p>]],
		accepttext = parseToTalk([[body(    player()，火焰蜘蛛奥克已经被封印在了一个坍塌的空间。需要你亲手将他的罪孽消灭。)]]),
		finishtext = parseToTalk([[body(    你已经获得了救赎之光，接下来，至需要获得拯救之光，就可以在我这里合成为“天国福音”！)]]),
		onstartbar =
		{
			{s_actionSysInfo, {"开始读条", 34}},
		},
		onendbar =
		{
			{s_actionSysInfo, {"", 34}},
		},
		onsuccess =
		{
			{s_actionSysInfo, {"读条成功", 34}},
		},
		onfail =
		{
			{s_actionSysInfo, {"读条失败", 34}},
		},
		clicknpc = {60791, 1, 0, 1000, 100, 100},
		task = {s_taskClickNpc, {218, 60792},},
		onfinish=
		{
			{s_actionAddItem,{31423, 0, 1,0, "1-1", "RoleTaskInfo32500"}},
		}
	},
	subtask3 =
	{
		color = TaskColor_Yellow,
		desctext = ([[<p><newline/><n font="3" color="GXColorYellow">[随机]七宗罪之暴怒</n><newline/><image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/><newline/><n font="3" color="GXColorYellow">任务进程：</n><newline/><n>    第一步：将火焰蜘蛛奥克押送至</n><goto id="218" mapid="5" flagpoint="1" taskid="32500"/><newline/><n>    第二步：在</n><goto id="60791" mapid="5" flagpoint="1" taskid="32500"/><n>封印火焰蜘蛛奥克</n><newline/><n color="GXColorGreen">    第三步：将封印获得的惩戒之光与救赎之光交给</n><goto id="60792" mapid="5" flagpoint="1"/><n>，获得天国福音。</n><newline/><n>    第四步：将天国福音送至</n><goto pos="128,145" mapid="5" flagpoint="1" taskid="32500"/><newline/><newline/><n font="3" color="GXColorYellow">任务描述：</n><newline/><n>    傲慢是一种罪，需要神的光辉惩戒。对血腥电锯的惩戒，即是神的慈悲，也是神的威严。</n><newline/><newline/><n font="3" color="GXColorYellow">任务描述：</n><newline/><n>    随机任务，需完成后才可获得奖励。每天随机任务可进行一次。</n><newline/></p>]]),
		tracebegin = [[<p><newline/><n>告知：</n><n></n><goto id="60792" mapid="5" flagpoint="1" taskid="32500"/></p>]],
		traceend = [[<p><newline/><n>告知：</n><n></n><goto id="60792" mapid="5" flagpoint="1" taskid="32500"/></p>]],
		accepttext = parseToTalk([[body(    亲爱的player()，你已经将罪孽深重的火焰蜘蛛奥克送被神审判的道路。这只展现了神的威严和慈悲。)]]),
		finishtext = parseToTalk([[body(    你已经获得了hot(救赎之光)与hot(惩戒之光)，接下来，就可以在我这里将神的光芒转化为“天国福音”！)]]),
		collectitem =
		{
			{31422, 0, 1},
			{31423, 0, 1},
		},
		task = {s_taskCollect, {60792, 60792}},
		onfinish=
		{
			{s_actionAddItem,{31424, 0, 1,0, "1-1", "RoleTaskInfo32500"}},
			{s_actionAddItem,{31427, 0, 1,0, "1-1", "RoleTaskInfo32500"}},
			{s_actionDeleteItemByBaseID,{31422, 1,  "RoleTaskInfo32500"}},
			{s_actionDeleteItemByBaseID,{31423, 1,  "RoleTaskInfo32500"}},
		},
	},
	subtask4 =
	{
		color = TaskColor_Yellow,
		tracebegin = [[<p><newline/><n>回复：</n><n></n><goto pos="128,145" mapid="5" country="13" flagpoint="1"/></p>]],
		traceend = [[<p><newline/><n>回复：</n><n></n><goto id="60789" mapid="5" flagpoint="1" taskid="32500"/></p>]],
		desctext = ([[<p><newline/><n font="3" color="GXColorYellow">[随机]七宗罪之暴怒</n><newline/><image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/><newline/><n font="3" color="GXColorYellow">任务进程：</n><newline/><n>    第一步：将火焰蜘蛛奥克押送至</n><goto id="218" mapid="5" flagpoint="1" taskid="32500"/><newline/><n>    第二步：在</n><goto id="60791" mapid="5" flagpoint="1" taskid="32500"/><n>封印火焰蜘蛛奥克</n><newline/><n>    第三步：将封印获得的惩戒之光与救赎之光交给</n><goto id="60792" mapid="5" flagpoint="1"/><n>，获得天国福音。</n><newline/><n color="GXColorGreen">    第四步：将天国福音送至</n><goto pos="128,145" mapid="5" flagpoint="1" taskid="32500"/><n color="GXColorGreen">释放。之后寻找</n><goto id="60789" mapid="5" flagpoint="1" taskid="32500"/><n color="GXColorGreen">完成任务！</n><newline/><newline/><n font="3" color="GXColorYellow">任务描述：</n><newline/><n>    傲慢是一种罪，需要神的光辉惩戒。对血腥电锯的惩戒，即是神的慈悲，也是神的威严。</n><newline/><newline/><n font="3" color="GXColorYellow">任务描述：</n><newline/><n>    随机任务，需完成后才可获得奖励。每天随机任务可进行一次。</n><newline/></p>]]),
		accepttext = parseToTalk([[body(    亲爱的player()，到指定地点将hot(天国福音)释放。)]]),
		finishtext = parseToTalk([[body(    罪孽往往源自内心的欲望，你容易战胜恶魔，甚至是强大的敌人。但要警惕，那些在你内心滋生的罪恶，是否会影响你的纯洁。祝福你，孩子！)]]),
		oncheck =
		{
			{s_checkRolePosition, {5, 128, 145, 5, "在军乐城坐标(128,145)附近使用"}},
		},
		onstartbar =
		{
			{s_actionSysInfo, {"开始读条", 34}},
		},
		onendbar =
		{
			{s_actionSysInfo, {"结束读条", 34}},
		},
		onsuccess =
		{
			{s_actionSysInfo, {"读条成功", 34}},
			{s_actionPlaySfxByBuff,{5017}},
		},
		onfail =
		{
			{s_actionSysInfo, {"读条失败", 34}},
		},
		--使用道具
		useitem = {31424,0,1,"1-1",0,3000,100,100},
		task = {s_taskUseItem, {60792, 60789}},
		onfinish=
		{
			{s_actionDeleteItemByBaseID,{31424, 1,  "RoleTaskInfo32500"}},
			{s_actionRandomAction,{ 50, 100, { {s_actionAddItem,{31432, 0, 1,0, "1-1", "七宗罪奖励"}}} }, },
		},
	},
}
