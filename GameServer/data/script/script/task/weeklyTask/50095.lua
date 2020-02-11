--神恩周常任务
RoleTaskInfo50095 =
{
	ring = 1,
	subtasknum = 1,
	subtask1 =
	{
		task = {s_taskCustom,{0,0,0,0}},
	},
	taskID = 50095,
}

function getMapInfo(level)
	if level == nil then return end
	local mapName = ""
	local mapid = 0
	if level < 81 then
		return mapName,mapid
	end
	if level <= 85 then
		mapName = "经验地宫5号"
		mapid = 152
	elseif level <= 90 then
		mapName = "经验地宫6号"
		mapid = 153
	elseif level <= 95 then
		mapName = "经验地宫7号"
		mapid = 154
	elseif level <= 100 then
		mapName = "经验地宫8号"
		mapid = 155
	elseif level <= 110 then
		mapName = "经验地宫9号"
		mapid = 178
	elseif level <= 120 then
		mapName = "经验地宫10号"
		mapid = 179
	elseif level <= 130 then
		mapName = "经验地宫11号"
		mapid = 180
	elseif level <= 140 then
		mapName = "经验地宫12号"
		mapid = 181
	else
		mapName = "经验地宫13号"
		mapid = 182
	end
	return mapName,mapid
end

--任务追踪
function RoleTaskInfo50095:GetTaskTraceText(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if level == nil then return end
	if level < 81 then
		return
	end
	local mapName, mapid = getMapInfo(level)
	local info = ""
	if s_getTaskValue(uid, self.taskID, TaskValue_Process) ~= TaskProcess_CanDone then
		info = "请在本周内累计消灭".. mapName .. "中的" .. godWeekTaskKillNpcNum[self.taskID % 10] .."只怪物（与角色等级相差5级以内）"
		info = string.format("body(%s)",info)
		info = parseToDesc(info)
	else
		info = weeklyTaskTraceEnd
	end
	return info
end

--任务描述
function RoleTaskInfo50095:GetSubTaskDescText(uid,taskid,subtaskid)
	local text = [[title4(【%s】赫淮斯托斯的火种)
	body(hotyellow_3(任务进程:)newline()space()space()神恩周常任务，请在本周内通过goto(183,5)传送进入hot(%s，杀死]] .. godWeekTaskKillNpcNum[self.taskID % 10]  .. [[只与角色等级相差5级以内的怪物)后向goto(372,5)回复。周日即可进行交付领取任务奖励。
    blankline()hotyellow_3(任务描述:)newline()space()space()你感觉到一股难以忍受的灼热感充斥在你的周围，一个燃烧着熊熊火焰的神出现在你的面前，他命令你在一周内击杀hot(7000)个怪物以熄灭他心中的怒火，事后赫淮斯托斯将给予你深藏在火种中的宝藏newline()（小道消息--听说奥丁大陆的怪物对阿佛洛狄忒不敬！）newline()hot(    每周都可参加随机神恩周常，周日才可以交付噢，根据任务星数的不同难度也不同，获得的奖励更不同啦！))]]
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local mapName, mapid = getMapInfo(level)
	text = string.format(text,GetWeeklyTaskStar(self.taskID % 10),mapName)
	text = parseToDesc(text)
	return text
end

--检查是否可以接受任务
function RoleTaskInfo50095:CheckAccept(uid,taskID)
	local process = s_getTaskValue(uid,self.taskID,TaskValue_Process)
	if process ~= TaskProcess_None then
		return VALUE_FAIL
	end
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local minLevel = 81
	if minLevel > level then
		return VALUE_FAIL
	end
	if maxLevel ~= nil  and maxLevel < level then return VALUE_FAIL end
	if CheckRoundAndRing(uid, self.taskID) == VALUE_FAIL then return VALUE_FAIL end
	return VALUE_OK
end


function RoleTaskInfo50095:GetSubTaskAcceptText(uid,taskid,subtaskid)
	--确定收集内容
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local msg = [[body(   要想在这个世界活下去，只有在敌人战胜你之前先战胜现在的你！只有不断的向前，才能最终将世界踩在脚下！blankline()   对于现在的你，击败%s正合适。blankline())]]
	local targetinfo = "aaaa"
	msg = string.format(msg,targetinfo)
	msg = parseToTalk(msg)
	local offline = s_getVar(uid,8,12)*0.1
	msg = string.gsub(msg,"$OFFLINE",offline)
	return msg
end

function RoleTaskInfo50095:OnAcceptTask(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if level < 101 then
		local expmedal =  level * 3
		s_addTaskVar(uid,self.taskID,MvarIndex_GrowthMedal,expmedal)
	end
end

--添加任务
function RoleTaskInfo50095:AddTask(uid)
	s_setVar(uid,101,77,1)
	s_setVar(uid,101,78,self.taskID)
	s_setVar(uid,101,79,1)
end

--删除任务
function RoleTaskInfo50095:OnDeleteTask(uid)
	weeklyTaskFinishDeal(uid)
end

--检查是否显示完成菜单
function RoleTaskInfo50095:CheckFinish(uid)
	local process = s_getTaskValue(uid,self.taskID,TaskValue_Process)
	if process ~= TaskProcess_None then
		return VALUE_OK
	end
	return VALUE_FAIL
end

--显示交付任务菜单
function RoleTaskInfo50095:ShowFinish(uid)
	local process = s_getTaskValue(uid,self.taskID,TaskValue_Process)
	if process == TaskProcess_Doing then
		local doing = s_getTaskValue(uid,self.taskID,TaskValue_PromptText)
		doing = trim(doing)
		ShowNpcMenuBottomStyle(uid,doing,"离开(5)")
	elseif process == TaskProcess_CanDone then
		local msg = GetSubTaskFinishText(uid,self.taskID,1)
		local str = "RoleTaskInfo50095:FinishTask($1)"
		ShowNpcMenuBottomStyle(uid,msg,"完成(1)",str,"取消(1)")
	end
end

--避免CommonTaskReward
function RoleTaskInfo50095:TaskReward(uid, taskid, subtaskid)
end

--交付任务
function RoleTaskInfo50095:FinishTask(uid)
	if s_getCurTime(TIME_CURWDAYS) ~= 0 then
		s_sysInfo(uid,"周日才可交付神恩任务")
		return
	end
	local exp = getWeeklyTaskExp(uid,self.taskID)
	s_refreshExp(uid,exp,ExpType_OptionalTask,self.taskID)

	--神恩祈福道具
	s_addItem(uid,55276,0,5,0,"1-1","RoleTaskInfo50095")
	FinishRoleTask(uid,self.taskID)
	weeklyTaskFinishDeal(uid)
end

--注册怪物回调
function RoleTaskInfo50095:RegisterMonsterCall(uid,level)
	local userLevel = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if userLevel == nil or level == nil then
		return
	end
	if math.abs(userLevel - level) > 5 then
		return
	end
	local _,mapid = getMapInfo(userLevel)
	if mapid == 0 then
		return
	end
	local map = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_CURRENT_MAP)
	if map ~= mapid then
		return
	end
	local taskProcess = s_getTaskValue(uid,self.taskID,TaskValue_Process)
	if taskProcess == TaskProcess_CanDone then
		return
	end
	AddRoleTaskOperate(uid,self.taskID)
end
--s_setNpcDeadEvent(16109)
RegisterNpcDeadLevelEvent("RoleTaskInfo50095:RegisterMonsterCall($1,$2)")

--未接取状态说明
function RoleTaskInfo50095:GetTaskIntroText(uid)
	local msg =
		[[
title(生存训练)
body(
blankline()   据说goto(60559,5)正在发布击败大量妖魔的任务。
blankline()   每次接取生存训练任务需消耗35体力值，可获取1.5倍经验或丰厚道具奖励。
blankline()   每天最多可完成1次，hot(周一完成该任务可获得额外50%的经验加成)。周一完成任务所获得的数字，将在周六抽奖时使用。
blankline()   exp(大量)
)
]]
	return parseToDesc(msg)
end

--NPC菜单
--AppendMenuToNpc(60559,"生存训练(2)","RoleTaskInfo50095:ShowAccept($1)","RoleTaskInfo30045:CheckAccept($1)")
AppendMenuToNpc(372,"神恩周常任务(2)","RoleTaskInfo50095:ShowFinish($1)","RoleTaskInfo50095:CheckFinish($1)")
