RoleTaskInfo30016 =
{
	ring = 3,
	subtasknum = 1,
	subtask1 =
	{
		task = {s_taskCustom, {0, 0, 0, 0}},
	},

	target = 31071,
	--收集对话提示
	msg = [[<p><n>    收集10个地精岩髓，交给我。该任务在21级至35级之间可完成。</n><newline/><n color='GXColorGreen'>   地精岩髓散落在燃烧平原的各个角落。</n><newline/><n color='GXColorGreen'>   每周四完成该任务，可获得双倍经验奖励。</n></p>]],
}

function RoleTaskInfo30016:GetTaskIntroText(uid)
	local msg =
		[[
title(地精岩髓)
body(
blankline()   收集散落在燃烧平原的地精岩髓10枚，交给goto(60062,4)。
blankline()   每天最多可完成3次，hot(周四完成该任务可获得双倍经验)。周四完成任务所获得的数字，将在周六抽奖时使用。
blankline()   exp(大量)
)
]]   
	return parseToDesc(msg)
end

function RoleTaskInfo30016:GetTaskExp(uid)
	--30*2.5*人物等级^1.1*次数加成*翻牌子
	--场景系数*(30+人物等级^1.5)*次数加成
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local curRound, curRing = GetTaskCurRoundAndRing(uid,30016)
	local time = curRing
	local exp = math.floor(36 * (30+level^1.5) * (1+0.2*(time-1)) )
	return exp
end

function RoleTaskInfo30016:TaskReward(uid, taskid, subtaskid)
end
