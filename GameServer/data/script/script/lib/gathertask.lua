--收集物品日常任务模板
GatherTask =
{
}

--//========对外接口=====================//
function GatherTask:show(uid,taskid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local minlevel = s_getTaskValue(uid,taskid,TaskValue_MinLevel)
	local maxlevel = s_getTaskValue(uid,taskid,TaskValue_MaxLevel)
	if level < minlevel or level > maxlevel then
		return VALUE_FAIL
	end
	return CheckRoundAndRing(uid, taskid)
end

function GatherTask:deal(uid,taskid,npcid)
	local target = GatherTask:getTaskTarget(taskid)
	local name = s_getItemBaseValue(target,5)
	local msg = GatherTask:getTaskMsg(taskid)
	local caption = string.format("收集%s",name)
	local func = string.format("GatherTask:showAward($1,$2,$3,$4,%u)",taskid)
	s_addVar(uid,109,1,npcid)
	ShowTaskPack(uid,caption,msg,"确定",func,target)
end
--//==============================================//

function GatherTask:getNpcName(uid)
	local npcid = s_getVar(uid,109,1)
	local name = s_getNpcBase(npcid,1)
	if name == nil then name = "" end
	return name
end

function GatherTask:getTaskTarget(taskid)
	local info = rawget(_G,"RoleTaskInfo"..taskid)
	if info ~= nil and info.target ~= nil then
		return info.target
	end
	s_debug("日常收集材料任务：%u，收集目标没有配置",taskid)
	return 0
end

function GatherTask:getTaskMsg(taskid)
	local info = rawget(_G,"RoleTaskInfo"..taskid)
	if info ~= nil and info.msg ~= nil then
		return info.msg
	end
	s_debug("日常收集材料任务：%u，没有配置",taskid)
	return ""
end

function GatherTask:showAward(uid,baseid,thisid,num,taskid)
	local target = GatherTask:getTaskTarget(taskid)
	if baseid ~= target then
		s_sysInfo(uid,"物品不正确")
		return
	end
	if num < 10 then
		s_sysInfo(uid,"物品数量不足")
		return
	end
	if CheckRoundAndRing(uid, taskid) == VALUE_FAIL then
		return
	end
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local curRound,curRing = GetTaskCurRoundAndRing(uid, taskid)
	local time = curRing
	--local exp = math.floor(20*2.5*level^1.1 * (1+0.2*(time-1)) )
	local exp = GetTaskExp(uid,taskid)
	--周四采集日经验2倍
	local weekday = s_getCurTime(TIME_CURWDAYS)
	if weekday == 4 then
		exp = exp * 2
	end
	local msg = [[<p><n>兑换经验:</n><n color=\"GXColorGreen\">]]..exp
	msg = msg .. [[</n></p><p><newline /></p><p><n color=\"GXColorYellow\">每日可完成3次</n></p>]]
	local call = string.format("GatherTask:getAward($1,%u,%u,%u)",thisid,exp,taskid)
	ShowNpcMenuBottomStyle(uid,msg,"确定(3)",call,"取消(3)")
end

function GatherTask:getAward(uid,itemid,exp,taskid)
	--提示玩家是否进行赌博
	local func = string.format("GatherTask:checkGuessCard(%u,$2,%u,%u,%u)",uid,itemid,exp,taskid)
	local name = GatherTask:getNpcName(uid)
	local msg = string.format("%s要与你赌一把。(本次任务中%u经验将被当作筹码，胜利后可获得额外%u经验奖励)",name,exp/2,exp/2)
	s_registerMsgBox(uid,func,"确定|3|Enter|取消|5|Esc",msg,300)
end

function GatherTask:finishTask(uid,taskid,exp,itemid)
	if s_deleteItemByThisID(uid,itemid,10,"收集任务"..taskid.."删除") == VALUE_OK then
		--周四采集日给予采集卡
		local weekday = s_getCurTime(TIME_CURWDAYS)
		if weekday == 4 then
			s_addLuckyCard(uid,4)
		end
		s_refreshExp(uid,exp,ExpType_GatherFlower,0)
		AddRoleSubTask(uid, taskid, 1, 1, 1)
		FinishRoleSubTask(uid, taskid, 1)
		--活力点
		s_addVigorPoint(uid, 2)
		s_debugUser(uid,"完成收集任务，获得2点活力点")
		RefreshTaskDailyInfo(uid, 30062)
	end
end

function GatherTask:checkGuessCard(uid,result,itemid,exp,taskid)
	if result == Button_Yes then
		local old_exp = math.floor(exp /2)
		local gamble_exp = math.floor(exp / 2)
		local tip1 = string.format("%s要与你赌一把。(本次任务经验中的%u点经验将被当作筹码，胜利后可获得%u点额外经验奖励)",GatherTask:getNpcName(uid),gamble_exp,gamble_exp)
		local tip2 = string.format("请选择要开的牌!\n胜利将获得额外经验%u\n失败将失去原有经验%u",gamble_exp,gamble_exp)
		local gc = GuessCard:Start(uid,tip1,tip2,2)
		local call = Call:New(uid,GatherTask,GatherTask.EndGuessGame,{itemid,old_exp,taskid,gamble_exp})
		gc:registerOverEvent(call)
		call = Call:New(uid,GatherTask,GatherTask.GiveupGuessGame,{itemid,old_exp,taskid,gamble_exp})
		gc:registerGiveupEvent(call)
		s_addVar(uid,109,2,0)
	elseif result == Button_No then
		GatherTask:finishTask(uid,taskid,exp,itemid)
	end
end

function GatherTask:EndGuessGame(uid,param,param_ext)
	local itemid = param[1]
	local old_exp = param[2]
	local taskid = param[3]
	local gamble_exp = param[4]
	local result = param_ext[1]
	if result == 0 then	--输掉猜牌
		GatherTask:finishTask(uid,taskid,old_exp, itemid)
	elseif result > 0 then --赢
		gamble_exp = gamble_exp*2
		local var = s_getVar(uid,109,2)
		if var > 0 then
			GatherTask:finishTask(uid,taskid,gamble_exp + old_exp ,itemid)
			return
		end
		--提示是否继续游戏
		local func = string.format("GatherTask:gameagain(%u,$2,%u,%u,%u,%u)",uid,itemid,old_exp,gamble_exp,taskid)
		local name = GatherTask:getNpcName(uid)
		local msg = string.format("恭喜你战胜了%s并获得了%u经验奖励,是否与%s再来一局?(当前经验筹码合计%u点，失败将失去所有筹码，胜利将获得额外的%u点经验)",name,gamble_exp/2,name,gamble_exp,gamble_exp)
		s_registerMsgBox(uid,func,"确定|3|Enter|放弃|5|Esc",msg,300)
	end
end

function GatherTask:GiveupGuessGame(uid,param,param_ext)
	local itemid = param[1]
	local old_exp = param[2]
	local taskid = param[3]
	local gamble_exp = param[4]
	local result = param_ext[1]
	GatherTask:finishTask(uid,taskid,gamble_exp + old_exp,itemid)
end

function GatherTask:gameagain(uid,result,itemid,old_exp,gamble_exp,taskid)
	if result == Button_Yes then
		local tip1 = string.format("恭喜你战胜了%s并获得了%d经验奖励，是否再与%s来一局？(如继续将抵押%d经验，胜利可获得%d的额外经验)",GatherTask:getNpcName(uid),gamble_exp/2,GatherTask:getNpcName(uid),gamble_exp,gamble_exp)
		local tip2 = string.format("请选择要开的牌!\n胜利将获得额外经验%d\n失败将失去原有经验%d",gamble_exp,gamble_exp)
		local gc = GuessCard:Start(uid,tip1,tip2,2)
		local call = Call:New(uid,GatherTask,GatherTask.EndGuessGame,{itemid,old_exp,taskid,gamble_exp})
		gc:registerOverEvent(call)
		call = Call:New(uid,GatherTask,GatherTask.GiveupGuessGame,{itemid,old_exp,taskid,gamble_exp})
		gc:registerGiveupEvent(call)
		s_addVar(uid,109,2,1)
	elseif result == Button_No then
		GatherTask:finishTask(uid,taskid,gamble_exp + old_exp ,itemid)
	end
end
