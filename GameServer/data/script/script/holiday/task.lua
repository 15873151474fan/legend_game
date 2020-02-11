--活动通知
--冒险活动
function OnHolidayEvent_Adventure(hour,minute)
	if s_isCountryInServer(13) == VALUE_OK  and s_getWorldLevel() == 1 then
		s_worldInfo("“冒险岛”活动现在开始，31级以上勇士可寻找争夺型副本中转站的诺奇参加！",ChatPos_Sys+ChatPos_Honor)
	end
	if s_getWorldLevel() == 1 then
		local list = pack(s_getCountryList())
		for i = 1,table.getn(list) do
			local play = s_getCountryEntry(list[i])
			for j = 1,table.getn(play) do
				--判断等级
				local level = s_getValue(SCENE_ENTRY_PLAYER,play[j],VALUE_TYPE_LEVEL)
				local stype = s_getValue(SCENE_ENTRY_PLAYER,play[j],VALUE_TYPE_SCENE_TYPE)
				if level >= 31 and stype == CopySceneType_None then
					local msg ="练习PK的冒险岛活动开始了，是否立即参加，获得积分可兑换丰厚奖励！"
					local func = "OnEnterAdventureBattle("..play[j]..",$2)"
					local buttons = "确定|3|Enter|取消|4|Esc"
					s_registerMsgBox(play[j],func,buttons,msg)
				end
			end
		end
	end
end

function OnEnterAdventureBattle(uid,ret)
	if ret ~= Button_Yes then
		return
	end
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if level >= 31 and level <= 40 then
		s_intoCopy(uid,66)
	elseif level >= 41 and level <= 50 then
		s_intoCopy(uid,67)
	elseif level >= 51 and level <= 60 then
		s_intoCopy(uid,68)
	end
end

--RegisterHolidayActivityEvent(12,0,"OnHolidayEvent_Adventure")
--RegisterHolidayActivityEvent(20,0,"OnHolidayEvent_Adventure")
