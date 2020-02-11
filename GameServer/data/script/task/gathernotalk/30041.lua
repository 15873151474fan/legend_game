RoleTaskInfo30041 =
{
	ring = 3,
	subtasknum = 1,
	subtask1 =
	{
		task = {s_taskCustom, {0, 0, 0, 0}},
	},

	target = 31166,
	--收集对话提示
	msg = [[<p><n>    收集10枚荆棘果，交给我。该任务在45级至53级之间可完成。</n><newline/><n color='GXColorGreen'>   荆棘果散落在隐匿者丛林的各个角落。</n><newline/><n color='GXColorGreen'>   每周四完成该任务，可获得双倍经验奖励。</n></p>]],
}

function RoleTaskInfo30041:GetTaskIntroText(uid)
	local msg =
		[[
title(荆棘果)
body(
blankline()   收集10份中隐匿着丛林出现的荆棘果，交给goto(60099,6)。
blankline()   每天最多可完成3次，hot(周四完成该任务可获得双倍经验)。周四完成任务所获得的数字，将在周六抽奖时使用。
blankline()   exp(大量)
)
]]   
	return parseToDesc(msg)
end

function RoleTaskInfo30041:GetTaskExp(uid)
	--30*2.5*人物等级^1.1*次数加成*翻牌子
	--场景系数*(30+人物等级^1.5)*次数加成
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local curRound, curRing = GetTaskCurRoundAndRing(uid,30041)
	local time = curRing
	local exp = math.floor(55 * (30+level^1.5) * (1+0.2*(time-1)) )
	return exp
end

function RoleTaskInfo30041:TaskReward(uid, taskid, subtaskid)
end
