RoleTaskInfo32519 =
{
	parent = 31000,
	subtasknum = 5,
	subtask1 =
	{
		color = TaskColor_Yellow,
		desctext = ([[<p><newline/><n font="3" color="GXColorYellow">[随机]浪漫情缘</n><newline/><image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/><newline/><n font="3" color="GXColorYellow">任务进程：</n><newline/><n>    通过</n><goto id="198" mapid="5" flagpoint="1" taskid="32519"/><n>前往</n><n color='GXColorGreen'>婚礼殿堂</n><n>寻找</n><goto id="203" mapid="156" flagpoint="1" taskid="32519"/><n>。</n></p>]]),
		prompttext = [[   需要找到罗密欧。]],
		traceend = [[<p><newline/><n>通过：</n><goto id="198" mapid="5" flagpoint="1" taskid="32519"/><newline/><n>进入婚礼殿堂回复</n><newline/><goto id="203" mapid="156" flagpoint="1" taskid="32519"/></p>]],
		accepttext = parseToTalk([[body(    请找一下罗密欧吧，他请你去拜访一下。)]]),
		finishtext = parseToTalk([[body(    你来了真是太好了，我需要3朵花和3只蝴蝶，可在本地图中寻找，其中一种只有异性才采集的到哦。)]]),
		onaccept =
		{
			{s_actionCorpsInfo,{"同团的团员，在军乐城的超魔导师达芬奇处接取了黄色品质的“达芬奇的秘密”任务！", 34}},
		},
		task = {s_taskTalk, {60789, 203},},
	},
	subtask2 =
	{
		color = TaskColor_Yellow,
		desctext = ([[<p><newline/><n font="3" color="GXColorYellow">[随机]浪漫情缘</n><newline/><image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/><newline/><n font="3" color="GXColorYellow">任务进程：</n><newline/><n color="GXColorGreen">    收集3朵花和3只蝴蝶，回复</n><goto id="204" mapid="156" flagpoint="1" taskid="32519"/><newline/><n>    男性角色可在本场景中采集到花，女性角色可在本场景捕捉到蝴蝶，道具可交易，可以通过向异性玩家索取。</n><newline/></p>]]),
		prompttext = [[   我需要3朵花和3只蝴蝶，可在本地图中寻找，其中一种只有异性才采集的到哦~~~]],
		tracebegin = [[<p><newline/><n>采集3朵花和3只蝴蝶后回复：</n><newline/><goto id="204" mapid="156" flagpoint="1" taskid="32519"/></p>]],
		traceend = [[<p><newline/><n>采集3朵花和3只蝴蝶后回复：</n><newline/><goto id="204" mapid="156" flagpoint="1" taskid="32519"/></p>]],
		accepttext = parseToTalk([[body(    我需要3朵花和3只蝴蝶，可在本地图中寻找，其中一种只有异性才采集的到哦~~~)]]),
		finishtext = parseToTalk([[body(    在这个世界，一个人的是不够的，希望你可以邀请一位异性队友来帮助你。)]]),
		collectitem =
		{
			{31520, 0, 3},
			{31521, 0, 3},
		},
		task = {s_taskCollect, {203,204}},
		onfinish=
		{
			{s_actionDeleteItemByBaseID,{31520,3,"达芬奇任务删除花"}},
			{s_actionDeleteItemByBaseID,{31521,3,"达芬奇任务删除蝴蝶"}},
			{s_actionAddExp, {15000, ExpType_OptionalTask,32519}},
		},
	},
	subtask3 =
	{
		color = TaskColor_Yellow,
		desctext = ([[<p><newline/><n font="3" color="GXColorYellow">[随机]浪漫情缘</n><newline/><image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/><newline/><n font="3" color="GXColorYellow">任务进程：</n><newline/><n>    与异性组队拥抱或依偎1分钟，回复</n><goto id="204" mapid="156" flagpoint="1" taskid="32519"/><n>（需异性组队交付）</n><newline/><n color="GXColorGreen">    1.选中异性后，鼠标右键点击该玩家头像。</n><newline/><n color="GXColorGreen">    2.选择交互动作，选择依偎或拥抱，等待对方接受即可</n></p>]]),
		prompttext = [[   与异性组队拥抱或依偎1分钟]],
		tracebegin = [[<p><newline/><n>与异性组队拥抱或依偎1分钟后回复：</n><goto id="204" mapid="156" flagpoint="1" taskid="32519"/></p>]],
		traceend = [[<p><newline/><n>与异性组队拥抱或依偎1分钟后回复：</n><goto id="204" mapid="156" flagpoint="1" taskid="32519"/></p>]],
		accepttext = parseToTalk([[body(    在这个世界，一个人的是不够的，希望你可以邀请一位异性队友来帮助你。)]]),
		finishtext = parseToTalk([[body(    这是你们美好的回忆，我会赠送你们一份礼物，你们一起驾驶着马车去找维纳斯吧。)]]),
		task = {s_taskCustom,{204,204,1,0}},
		onfinishcheck1 =
		{
			{s_checkOppositeSexInTeam,{0,"回忆需要异性与您一起分享，请与异性组队一起交付任务。"}},
			{s_checkTeamSize,{2,2,"回忆需要异性与您一起分享，请与异性组队一起交付任务，队伍人数不能超过2人。"}},
		},
		onfinish=
		{
			{s_actionMail,{"您经历了一段浪漫情缘，将这份回忆珍藏吧！",0,31522,1,"1-1"}},
			{s_actionMailToTeam,{0,"您经历了一段浪漫情缘，将这份回忆珍藏吧！",0,31522,1,"1-1"}},
		},
	},
	subtask4 =
	{
		color = TaskColor_Yellow,
		desctext = ([[<p><newline/><n font="3" color="GXColorYellow">[随机]浪漫情缘</n><newline/><image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/><newline/><n font="3" color="GXColorYellow">任务进程：</n><newline/><n>    驾驶双人马车，与异性一起回复</n><goto id="199" mapid="156" flagpoint="1" taskid="32519"/></p>]]),
		prompttext = [[   驾驶双人马车，与异性一起回复维纳斯。]],
		tracebegin = [[<p><newline/><n>与异性同乘双人马车</n><newline/><n>回复：</n><goto id="199" mapid="156" flagpoint="1" taskid="32519"/></p>]],
		traceend = [[<p><newline/><n>与异性同乘双人马车</n><newline/><n>回复：</n><goto id="199" mapid="156" flagpoint="1" taskid="32519"/></p>]],
		accepttext = parseToTalk([[body(    这是你们美好的回忆，我会赠送你们一份礼物，你们一起驾驶着马车去找维纳斯吧。)]]),
		finishtext = parseToTalk([[body(    哦，你们真是天造地设地一对，不过，不知道你们有没有缘分在一起呢？问问你自己的心吧，请收下我的祝福。)]]),
		onacceptcheck1 =
		{
			{s_checkOppositeSexInTeam,{5,"需要异性与您一起与继续任务,双方请不要距离过远。"}},
			{s_checkTeamSize,{2,2,"请与异性组队一起交继续务，队伍人数不能超过2人。"}},
		},
		onaccept =
		{
			{s_actionCarrige,{0,0,0}},
			{s_actionCarrige,{1,60*3,50025}},
		},
		task = {s_taskTalk,{204,199}},
		onfinishcheck1 =
		{
			{s_checkOppositeSexInTeam,{5,"需要异性与您一起与交付任务,双方请不要距离过远。"}},
			{s_checkTeamSize,{2,2,"请与异性组队一起交付任务，队伍人数不能超过2人。"}},
		},
		onfinish=
		{
			{s_actionCarrige,{0,0,0}},
			{s_actionAddExp, {15000, ExpType_OptionalTask,32519}},
			{s_actionMail,{"真幸运，恭喜您完成“达芬奇任务之浪漫情缘”时，获得维纳斯赠送的【彩狐铃铛】！",0,31523,1,"1-1"}},
			{s_actionMailToTeam,{0,"真幸运，恭喜您完成“达芬奇任务之浪漫情缘”时，获得维纳斯赠送的【彩狐铃铛】！",0,31523,1,"1-1"}},
		},
	},
	subtask5 =
	{
		color = TaskColor_Yellow,
		desctext = ([[<p><newline/><n font="3" color="GXColorYellow">[随机]浪漫情缘</n><newline/><image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/><newline/><n font="3" color="GXColorYellow">任务进程：</n><newline/><n>    通过</n><goto id="207" mapid="156" flagpoint="1" taskid="32519"/><n>跳转返回，回复</n><goto id="60789" mapid="5" flagpoint="1" taskid="32519"/><n>,可别忘记和队伍中帮忙的朋友说声再见哦！</n></p>]]),
		prompttext = [[   需要找到罗密欧。]],
		tracebegin = [[<p><newline/><n>通过</n><goto id="207" mapid="156" flagpoint="1" taskid="32519"/><newline/><n>离开，回复：</n><goto id="60789" mapid="5" flagpoint="1" taskid="32519"/></p>]],
		traceend = [[<p><newline/><n>通过</n><goto id="207" mapid="156" flagpoint="1" taskid="32519"/><newline/><n>离开，回复：</n><goto id="60789" mapid="5" flagpoint="1" taskid="32519"/></p>]],
		accepttext = parseToTalk([[body(    哦，你们真是天造地设地一对，不过，不知道你们有没有缘分在一起呢？问问你自己的心吧，请收下我的祝福。)]]),
		finishtext = parseToTalk([[body(    哦，得知你回来，我就知道你收获良多，礼物不要嫌多，还要继续加油~~~)]]),
		task = {s_taskTalk,{199,60789}},
		onfinish=
		{
			{s_actionRandomAction,{ 50, 100, { {s_actionAddItem,{31433, 0, 1,0, "1-1", "梦娜丽莎画卷"}}} }, },
		},
	},
}
