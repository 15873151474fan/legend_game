--升1级奖12元活动

--参加活动
function JoinLevelupReward(uid)
	local worldlevel = s_getWorldLevel()
	if worldlevel == 1 and s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL) == 1 and s_getVar(uid,116,69) == 0 then
		s_setVar(uid,116,69,1)
		s_insertLevelupRewardUID(uid)
	end
end

--是否显示升1级送12元图标
function CheckHaveLevelupReward(uid)
	local timeAfterWorldLevelChange = s_getCurTime(TIME_ALLSECONDS) - s_getWorldLevelLastTime()
	if s_getWorldLevel() == 1 then
		s_sendLevelupReward(uid)
	elseif s_getVar(uid,116,69) == 1 then	--参加了活动
		if s_getWorldLevel() < 6
			or (s_getWorldLevel() == 6 and timeAfterWorldLevelChange < 86400*7) then	--活动未结束
		if 0 == s_getVar(uid,116,71) then	--角色未领取60级的对应奖励
			s_sendLevelupReward(uid)
			end
	end
	end
end

--右侧气泡提示有升1级送12元奖励未领取
function RemindLevelupReward(uid)
	if s_getVar(uid,116,69) ~= 1 then
		return
	end
	local worldLevelLastTime
	if s_getWorldLevel() == 1 then
		worldLevelLastTime = 0
	else
		worldLevelLastTime = s_getWorldLevelLastTime()
	end
	local timeAfterWorldLevelChange = s_getCurTime(TIME_ALLSECONDS) - worldLevelLastTime
	local worldLevel = s_getWorldLevel()
	local userLevel = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if worldLevel > 6 or (worldLevel == 6 and timeAfterWorldLevelChange >= 86400*7) then
		return
	end
	if s_getVar(uid,116,70) < worldLevelLastTime or (s_getVar(uid,116,71) == 0 and userLevel >= 60) then
		s_sendRemindLevelupReward(uid)
	end
end

--领取升级奖励
function OnConfirmGetLevelupReward(uid,level,type)
	local userOrder = s_getField(uid,UserVar_LevelupRewardOrder)
	if userOrder == 0 then
		userOrder = 200
	end
	local userLevel = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local moneyPoint = userLevel*12

	if level ~= 100 and type == 0 then
		s_addMoney(uid,MoneyType_GoldTicket,20*moneyPoint,"升1级送12元活动额外奖励赠点")
		s_sysInfo(uid,"您领取了" .. 20*moneyPoint .. "赠点的额外奖励，拥有的现金券越多，可领取的额外奖励也会越多哦！",ChatPos_MsgBox)
		s_setVar(uid,116,70,s_getCurTime(TIME_ALLSECONDS))
	end
	if level == 60 and type == 1 then
		if userLevel < 60 then
			s_sysInfo(uid,"您的等级不足60级无法领取活动奖励！",ChatPos_Sys)
			return
		end
		s_addMoney(uid,MoneyType_GoldTicket,20*moneyPoint,"升1级送12元活动额外奖励赠点")
		s_setVar(uid,116,71,s_getCurTime(TIME_ALLSECONDS))
		s_sysInfo(uid,"您领取了" .. 20*moneyPoint .. "赠点的额外奖励，拥有的现金券越多，可领取的额外奖励也会越多哦！",ChatPos_MsgBox)
		s_addItem(uid,55041,3,1,0,"1-1","“升1级送12元”抽奖券")
		return
	end

	-- 100级解封type == 3是合区等级排行榜乱掉的特殊处理，所有人只发赠点奖励，银币由GM手动补偿
	if level == 100 then
		if type ~= 3 then
			if userOrder > 100 then
				s_addMoney(uid,MoneyType_GoldTicket,30*moneyPoint,"升1级送12元活动奖励赠点")
				s_sysInfo(uid,"您共积累了" .. moneyPoint .. "元现金券，根据“升1级送12元”活动规则，提取为" .. 30*moneyPoint .. "赠点，感谢您对《兵王2》的支持！",ChatPos_MsgBox)
			elseif userOrder > 50 then
				s_addMoney(uid,MoneyType_Money,30*moneyPoint,"升1级送12元活动前100名奖励银币")
				confirmMessage(uid,moneyPoint,30)
			elseif userOrder > 10 then
				s_addMoney(uid,MoneyType_Money,50*moneyPoint,"升1级送12元活动前11-50名奖励银币")
				confirmMessage(uid,moneyPoint,50)
			elseif userOrder > 3 then
				s_addMoney(uid,MoneyType_Money,100*moneyPoint,"升1级送12元活动4-10名奖励银币")
				confirmMessage(uid,moneyPoint,100)
			elseif userOrder == 3 then
				s_addMoney(uid,MoneyType_Money,200*moneyPoint,"升1级送12元活动第3名奖励银币")
				confirmMessage(uid,moneyPoint,200)
			elseif userOrder == 2 then
				s_addMoney(uid,MoneyType_Money,250*moneyPoint,"升1级送12元活动第2名奖励银币")
				confirmMessage(uid,moneyPoint,250)
			elseif userOrder == 1 then
				s_addMoney(uid,MoneyType_Money,300*moneyPoint,"升1级送12元活动第1名奖励银币")
				confirmMessage(uid,moneyPoint,300)
			end
		else
			s_addMoney(uid,MoneyType_GoldTicket,30*moneyPoint,"升1级送12元活动奖励赠点")
			s_sysInfo(uid,"您共积累了" .. moneyPoint .. "元现金券，根据“升1级送12元”活动规则，提取为" .. 30*moneyPoint .. "赠点，感谢您对《兵王2》的支持！",ChatPos_MsgBox)
		end
		s_setVar(uid,116,70,s_getCurTime(TIME_ALLSECONDS))
		s_setVar(uid,116,69,0)
	end
	s_addItem(uid,55041,3,1,0,"1-1","“升1级送12元”抽奖券")
end

function confirmMessage(uid,moneyPoint,times)
	s_sysInfo(uid,"您共积累了" .. moneyPoint .. "元现金券，根据“升1级送12元”活动规则，提取为" .. times*moneyPoint .. "银币，感谢您对《兵王2》的支持！",ChatPos_MsgBox)
end



