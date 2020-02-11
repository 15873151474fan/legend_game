--神恩周常任务
RoleTaskInfo50115 =
{
	ring = 1,
	subtasknum = 1,
	subtask1 =
	{
		task = {s_taskCustom,{0,0,0,0}},
	},
	taskID = 50115,
}

--任务追踪
function RoleTaskInfo50115:GetTaskTraceText(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if level < 81 then
		return
	end
	local info = ""
	if s_getTaskValue(uid, self.taskID, TaskValue_Process) ~= TaskProcess_CanDone then
		info = "请在本周内累计消耗" .. godWeekTaskUseMoney[self.taskID % 10] .."金币"
		info = string.format("body(%s)",info)
		info = parseToDesc(info)
	else
		info = weeklyTaskTraceEnd
	end
	return info
end

--任务描述
function RoleTaskInfo50115:GetSubTaskDescText(uid,taskid,subtaskid)
	local text = [[title4(【%s】德魔忒尔的点金术)
	body(hotyellow_3(任务进程:)newline()space()space()神恩周常任务，请在hot(本周内消费]] .. godWeekTaskUseMoney[self.taskID % 10] .. "金币，周日即可交付领取任务奖励。" .. [[)
    blankline()hotyellow_3(任务描述:)newline()space()space()掌管着大地以及拥有神乎其技点金之术的德魔忒尔是奥丁大陆子民的最爱，为了每年的谷物的丰收以及立法保护，女神要求你献上hot(5000金币)来换取她对你一如既往的祝福与保护。
	newline()hot(space()space()每周都可参加随机神恩周常，周日才可以交付噢，根据任务星数的不同难度也不同，获得的奖励更不同啦！)
	blankline())]]
	text = string.format(text,GetWeeklyTaskStar(self.taskID % 10))
	text = parseToDesc(text)
	return text
end

--检查是否可以接受任务
function RoleTaskInfo50115:CheckAccept(uid,taskID)
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


function RoleTaskInfo50115:GetSubTaskAcceptText(uid,taskid,subtaskid)
	--确定收集内容
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local msg = [[body(  请在本周内累计消耗5000绑银，在周日回复：goto(60559,5)
	绑银账单查看请点击 blankline())]]
	msg = parseToTalk(msg)
	return msg
end

function RoleTaskInfo50115:OnAcceptTask(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if level < 101 then
		local expmedal =  level * 3
		s_addTaskVar(uid,self.taskID,MvarIndex_GrowthMedal,expmedal)
	end
end

--添加任务
function RoleTaskInfo50115:AddTask(uid)
	s_setVar(uid,101,77,1)
	s_setVar(uid,101,78,self.taskID)
	s_setVar(uid,101,79,1)
end

--删除任务
function RoleTaskInfo50115:OnDeleteTask(uid)
	weeklyTaskFinishDeal(uid)
end

--检查是否显示完成菜单
function RoleTaskInfo50115:CheckFinish(uid)
	local process = s_getTaskValue(uid,self.taskID,TaskValue_Process)
	if process ~= TaskProcess_None then
		return VALUE_OK
	end
	return VALUE_FAIL
end

--显示交付任务菜单
function RoleTaskInfo50115:ShowFinish(uid)
	local process = s_getTaskValue(uid,self.taskID,TaskValue_Process)
	if process == TaskProcess_Doing then
		local doing = s_getTaskValue(uid,self.taskID,TaskValue_PromptText)
		doing = trim(doing)
		ShowNpcMenuBottomStyle(uid,doing,"离开(5)")
	elseif process == TaskProcess_CanDone then
		local msg = GetSubTaskFinishText(uid,self.taskID,1)
		local str = "RoleTaskInfo50115:FinishTask($1)"
		ShowNpcMenuBottomStyle(uid,msg,"完成(1)",str,"取消(1)")
	end
end

--避免CommonTaskReward
function RoleTaskInfo50115:TaskReward(uid, taskid, subtaskid)
end

--交付任务
function RoleTaskInfo50115:FinishTask(uid)
	if s_getCurTime(TIME_CURWDAYS) ~= 0 then
		s_sysInfo(uid,"周日才可交付神恩任务")
		return
	end
	local exp = getWeeklyTaskExp(uid,self.taskID)
	s_refreshExp(uid,exp,ExpType_OptionalTask,self.taskID)

	--神恩祈福道具
	s_addItem(uid,55276,0,5,0,"1-1","RoleTaskInfo50115")

	FinishRoleTask(uid,self.taskID)
	weeklyTaskFinishDeal(uid)
end

--注册怪物回调
function RoleTaskInfo50115:RegisterMonsterCall(uid,level)
	local userLevel = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if userLevel == nil then
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
--RegisterNpcDeadLevelEvent("RoleTaskInfo50115:RegisterMonsterCall($1,$2)")

--未接取状态说明
function RoleTaskInfo50115:GetTaskIntroText(uid)
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
--AppendMenuToNpc(60559,"生存训练(2)","RoleTaskInfo50115:ShowAccept($1)","RoleTaskInfo30045:CheckAccept($1)")
AppendMenuToNpc(372,"神恩周常任务(2)","RoleTaskInfo50115:ShowFinish($1)","RoleTaskInfo50115:CheckFinish($1)")
