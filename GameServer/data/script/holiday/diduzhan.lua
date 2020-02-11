--帝都战拉人框
function OnHolidayEvent_DiDuZhan(hour,minute)
	if s_getWorldLevel() < 4 then
		return
	end
	--npc208那里还有重入接口,修改时间记得修改那里
	local wday = s_getCurTime(TIME_CURWDAYS)
	if wday == 0 and hour == 20 and minute == 0
		and s_getCountryVar(13,11,5) == World_War_State_Ready then
		if s_isCountryInServer(13) == VALUE_OK then
			s_worldInfo("帝都战正式开始！期待诸国少侠的卓越战功！",ChatPos_Sys+ChatPos_Honor)
		end
		local defense = s_getCountryVar(13,11,4)
		local list = pack(s_getCountryList())
		for i = 1,table.getn(list) do
			local msg = ""
			local fun = "OnReturnJoinDiduZhan($1,$2)"
			local buttons = "确定|3|Enter|取消|4|Esc"
			if s_isFriendCountry(list[i], defense) == VALUE_OK
				or defense == list[i] then
				-- 守方
				msg = "帝都战正式开始，帝皇的忠臣们，前往那片荣耀的战场吧！"
			else
				-- 攻方
				msg = "帝都战正式开始，响应王的号召，前往那片荣耀的战场吧！"
			end
			local play = s_getCountryEntry(list[i])
			for j = 1,table.getn(play) do
				local level = s_getValue(SCENE_ENTRY_PLAYER,play[j],VALUE_TYPE_LEVEL)
				if level >= 70 then
					s_registerMsgBox(play[j],fun,buttons,msg)
				end
			end
		end
	end
end

function OnReturnJoinDiduZhan(uid,ret)
	if ret ~= Button_Yes then
		return
	end
	s_intoCopy(uid,73)
end

--资源运输通知
function OnHolidayEvent_YunShu(hour,minute)
	if s_getWorldLevel() < 4 then
		return
	end
	if s_isCountryInServer(13) == VALUE_OK
		and s_getCountryVar(13,11,5) == World_War_State_Ready
		and s_getCurTime(TIME_CURWDAYS) == 0 then
		s_worldInfo("感受到大战的气息，战争之泉出现在中立区帝都，帝皇国的臣民可以运送获得战争资源。"
			,ChatPos_Sys+ChatPos_Honor)
	end
end

--奇兵交锋通知
function OnHolidayEvent_Raiders(hour,minute)
	if s_getWorldLevel() < 4 then
		return
	end
	if s_isCountryInServer(13) == VALUE_OK
		and s_getCountryVar(13,11,5) == World_War_State_Ready
		and s_getCurTime(TIME_CURWDAYS) == 0 then
		s_worldInfo("帝都战还有30分钟后开始，请各国少侠前往中立区集结，可在先锋官赛巴斯申请参加先锋战，可获得珍贵道具奖励！"
			,ChatPos_Sys+ChatPos_Honor)
	end
end
RegisterHolidayActivityEvent(19,30,"OnHolidayEvent_Raiders")
RegisterHolidayActivityEvent(20,0,"OnHolidayEvent_DiDuZhan")
RegisterHolidayActivityEvent(17,0,"OnHolidayEvent_YunShu")
