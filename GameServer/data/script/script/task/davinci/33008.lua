RoleTaskInfo33008 =
{
	parent = 31000,
	subtasknum = 2,
	subtask1 =
	{
		color = TaskColor_Green,
		desctext = ([[<p><newline/><n font="3" color="GXColorYellow">[随机]吟游诗人</n><newline/><image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/><newline/><n font="3" color="GXColorYellow">任务进程：</n><newline/><n color="GXColorGreen">    前往</n><n color='GXColorGreen'>中立区帝都（东北区域）</n><n>寻找</n><goto id="60803" mapid="8" flagpoint="1" taskid="33008"/><newline/><newline/><n font="3" color="GXColorYellow">任务描述：</n><newline/><n>    最近帝都有很多吟游诗人在游逛，去寻找他们，听听吟游诗人在各地游历收集到的故事吧，不过没有人知道现在他们在哪个地方歌唱哦(找不到的话，尝试原地等待2分钟)如果运气好的话，完成任务还有几率获得诗集上、下篇。</n><newline/></p>]]),
		prompttext = [[   需要找到吟游诗人才获得曲谱。]],
		traceend = [[<p><newline/><n>在帝都（东北区域）寻找：</n><newline/><n></n><goto id="60803" mapid="8" flagpoint="1" taskid="33008"/></p>]],
		accepttext = [[<p><n>		最近帝都有很多吟游诗人在游逛，去寻找他们，听听吟游诗人在各地游历收集到的故事吧，不过没有人知道现在他们在哪个地方歌唱哦(找不到的话，尝试原地等待2分钟)</n><newline/></p><p><button packid='0' group='5' frame='40' id='-1'>海量经验</button></p>]],
		finishtext = parseToTalk([[body(    这个曲谱很珍贵的，你要好好保存。)]]),
		onaccept =
		{
			{s_actionCorpsInfo,{"同团的团员，在军乐城的超魔导师达芬奇处接取了绿色品质的“达芬奇的秘密”任务！", 34}},
		},
		task = {s_taskTalk, {60789, 60803}},
		onfinish=
		{
			{s_actionRandomAction,{ 80, 100, { {s_actionAddItem,{31450, 0, 1,0, "1-1", "RoleTaskInfo33008_2"}}, {s_actionAddItem,{31451, 0, 1,0, "1-1", "RoleTaskInfo33008_2"}}, } }, },
		},
	},
	subtask2 =
	{
		color = TaskColor_Green,
		desctext = ([[<p><newline/><n font="3" color="GXColorYellow">[随机]吟游诗人</n><newline/><image pack="INTERFACE_PACK" infoname="INTERFACE_40_4_P"/><newline/><n font="3" color="GXColorYellow">任务进程：</n><newline/><n>回复：</n><n></n><goto id="60789" mapid="5" flagpoint="1" taskid="33008"/><newline/><newline/><n font="3" color="GXColorYellow">任务描述：</n><newline/><n>    最近帝都有很多吟游诗人在游逛，去寻找他们，听听吟游诗人在各地游历收集到的故事吧，不过没有人知道现在他们在哪个地方歌唱哦(找不到的话，尝试原地等待2分钟)如果运气好的话，完成任务还有几率获得诗集上、下篇。</n><newline/></p>]]),
		prompttext = [[   需要回复达芬奇。]],
		traceend = [[<p><newline/><n>回复：</n><n></n><goto id="60789" mapid="5" flagpoint="1" taskid="33008"/></p>]],
		accepttext = [[<p><n>		对音乐要保持聆听，才可获得非一般的感觉。</n><newline/></p><p><button packid='0' group='5' frame='40' id='-1'>海量经验</button></p>]],
		finishtext = parseToTalk([[body(    伴随着聆听，你可以得到升华。)]]),
		task = {s_taskTalk, {60803, 60789},},
		onfinish=
		{
			{s_actionRandomAction,{ 80, 100, { {s_actionAddItem,{31437, 0, 1,0, "1-1", "吟游诗人奖励"}}} }, },
		},
	},
}
