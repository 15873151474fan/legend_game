RoleTaskInfo30400 =
{
	subtasknum = 1,
	subtask1 =
	{
		randomtask =
		{
			{100,100,{30401, 30402}},
		},
		task = {s_taskRandomTask, {60200}},
	},
}

-- 男性角色
RoleTaskInfo30401 =
{
	parent = 30400,
	subtasknum = 2,
	subtask1 =
	{
		traceend = [[<p><newline/><n>与</n><goto id="60200" mapid="1" flagpoint="1" taskid="30400"/><n>对话</n><newline/><n>获取"喵喵的告别信"</n></p>]],
		finishtext = parseToTalk([[body(    这是猫猫离家时留着的告别信，我都看不懂……newline()    据说，与异性角色邀请合并，可以翻译。newline()    还有种说法，直接找hot2(宠物商人)也可翻译。)]]),
		onacceptcheck1 =
		{
			{s_checkUsableTiledPoint,{35,"当前体力值不足，请明日再来。或完成10轮团建设任务。"}},
		},
		onacceptcheck =
		{
			{s_checkRoleSex,{1}},
		},
		onaccept =
		{
			{s_actionSubUsableTiledPoint,{35}},
			{s_actionSmile,{13}},
		},
		task = {s_taskTalk,{60200,60200}},
		onfinish=
		{
			{s_actionAddItem,{31266, 0, 1,0,"1-1","男性角色获得任务道具"}},
		}
	},
	subtask2 =
	{
		tracebegin = [[<p><newline/><n>与</n><n color='GXColorGreen'>异性合并告别信</n><newline/><n>或找</n><goto id="112" mapid="3" flagpoint="1" 	taskid="30401"/><n>翻译</n><newline/><n>找回猫猫后，交给</n><goto id="60200" mapid="1" flagpoint="1" taskid="30401"/></p>]],
		traceend = [[<p><n>找回猫猫后，交给</n><goto id="60200" mapid="1" flagpoint="1" taskid="30401"/></p>]],
		collectitem =
		{
			{31653, 0, 1},
		},
		task = {s_taskCollect, {60200,60200}},
		onfinish =
		{
			{s_actionAddActivePoint,{40}},
			{s_actionDeleteItemByBaseID,{31653,1,"收回丢失的小猫"}},
		},
	},
}

-- 女性角色
RoleTaskInfo30402 =
{
	parent = 30400,
	subtasknum = 2,
	subtask1 =
	{
		traceend = [[<p><newline/><n>与</n><n></n><goto id="60200" mapid="1" flagpoint="1" taskid="30400"/><n>对话</n><newline/><n>获取"喵喵的告别信"</n></p>]],
		finishtext = parseToTalk([[body(    这是猫猫离家时留着的告别信，我都看不懂……newline()    据说，与异性角色邀请合并，可以翻译。newline()    还有种说法，直接找hot2(宠物商人)也可翻译。)]]),
		onacceptcheck1 =
		{
			{s_checkUsableTiledPoint,{35,"当前体力值不足，请明日再来。或完成10轮团建设任务。"}},
		},
		onacceptcheck =
		{
			{s_checkRoleSex,{2}},
		},
		onaccept =
		{
			{s_actionSubUsableTiledPoint,{35}},
			{s_actionSmile,{13}},
		},
		task = {s_taskTalk,{60200,60200}},
		onfinish=
		{
			{s_actionAddItem,{31267, 0, 1,0,"1-1","男性角色获得任务道具"}},
		}
	},
	subtask2 =
	{
		tracebegin = [[<p><newline/><n>与</n><n color='GXColorGreen'>异性合并告别信</n><newline/><n>或找</n><goto id="112" mapid="3" flagpoint="1" 	taskid="30401"/><n>翻译</n><newline/><n>找回猫猫后，交给</n><goto id="60200" mapid="1" flagpoint="1" taskid="30401"/></p>]],
		traceend = [[<p><n>找回猫猫后，交给</n><goto id="60200" mapid="1" flagpoint="1" taskid="30401"/></p>]],
		collectitem =
		{
			{31653, 0, 1},
		},
		task = {s_taskCollect, {60200,60200}},
		onfinish =
		{
			{s_actionAddActivePoint,{40}},
			{s_actionDeleteItemByBaseID,{31653,1,"收回丢失的小猫"}},
		},
	},
}

---任务经验
function RoleTaskInfo30400:GetTaskExp(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local exp = math.floor(0.8*210*1.5*(50+0.1 * level^2.2))
	return math.floor(exp)
end
