--兑换彩票
function OnRequestRedeemDailyLottery(uid,grade)
	local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
	if grade == 1 then
		s_addItem(uid,29136,3,1,0,"1-1","一等奖")
	elseif grade == 2 then
		s_addItem(uid,29137,3,1,0,"1-1","二等奖")
	elseif grade == 3 then
		s_addItem(uid,29138,3,1,0,"1-1","三等奖")
	elseif grade == 4 then
		s_addItem(uid,29145,3,1,0,"1-1","幸运奖奖励")
		s_sysInfo(uid,"<p><n>恭喜您获得幸运奖奖品</n></p>",ChatPos_Sys + ChatPos_Important)
	elseif grade == 5 then
		s_addItem(uid,29146,3,1,0,"1-1","参与奖奖励")
		s_sysInfo(uid,"<p><n>恭喜您获得参与奖奖品</n></p>",ChatPos_Sys + ChatPos_Important)
	else
		s_messageBox(uid,"很遗憾您没有中奖，幸运奖和参与奖获取时间已过。")
	end
end

--[[天降洪福
function OnAllUserPresentEvent(uid,presenttype)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if level >= 10 then
		s_addItem(uid,16,3,2,0,"1-0","赠点奖励")
		s_addItem(uid,34008,3,2,0,"1-0","经验奖励")
		s_addbuff(SCENE_ENTRY_PLAYER,uid,5031,1,15)
	end
end
]]--
