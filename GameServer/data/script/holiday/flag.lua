--全服夺旗活动
function OnHolidayEvent_Flag(hour,minute)
	if s_getWorldLevel() < 2 then
		return
	end
	--npc208那里还有重入接口,修改时间记得修改那里
	local wday = s_getCurTime(TIME_CURWDAYS)
	if (wday == 1 or wday == 3 or wday == 5) and hour == 22 and minute == 0 then
		local list = pack(s_getCountryList())
		for i = 1,table.getn(list) do
			local play = s_getCountryEntry(list[i])
			for j = 1,table.getn(play) do
				--判断等级
				local level = s_getValue(SCENE_ENTRY_PLAYER,play[j],VALUE_TYPE_LEVEL)
				local stype = s_getValue(SCENE_ENTRY_PLAYER,play[j],VALUE_TYPE_SCENE_TYPE)
				local oldzoneid = s_getValue(SCENE_ENTRY_PLAYER,play[j],VALUE_TYPE_OLD_ZONEID)
				if level > 50 and stype == CopySceneType_None and oldzoneid == 0 then
					local msg ="全服血战到底已经开始，是否参加?"
					local func = "OnReturnJoinFlagBattle("..play[j]..",$2)"
					local buttons = "确定|3|Enter|取消|4|Esc|稍后|5|Esc"
					s_registerMsgBox(play[j],func,buttons,msg)
				end
			end
		end
	end
end

--全服夺旗通知
function OnHolidayEvent_FlagNotice(hour,minute)
	if s_getWorldLevel() < 2 then
		return
	end
	local wday = s_getCurTime(TIME_CURWDAYS)
	if (wday == 1 or wday == 3 or wday == 5) and hour == 21 and minute == 50 then
		if s_isCountryInServer(13) == VALUE_OK then
			s_worldInfo("血战到底副本将在10分钟后开始，参赛会获得巨额经验奖励。",ChatPos_Sys + ChatPos_Honor)
		end
		--[[
		local list = pack(s_getCountryList())
		for i = 1,table.getn(list) do
		s_countryInfo(list[i],"血战到底副本将在10分钟后开始，参赛会获得巨额经验奖励。",ChatPos_Sys + ChatPos_Honor)
		end
		]]
	elseif (wday == 1 or wday == 3 or wday == 5) and hour == 21 and minute == 30 then
		--[[
		local list = pack(s_getCountryList())
		for i = 1,table.getn(list) do
		s_countryInfo(list[i],"血战到底副本将在半小时后开始，参赛会获得巨额经验奖励。",ChatPos_Sys + ChatPos_Honor)
		end
		]]
		if s_isCountryInServer(13) == VALUE_OK then
			s_worldInfo("血战到底副本将在半小时后开始，参赛会获得巨额经验奖励。",ChatPos_Sys + ChatPos_Honor)
		end
	elseif (wday == 1 or wday == 3 or wday == 5) and hour == 21 and minute == 0 then
		--[[
		local list = pack(s_getCountryList())
		for i = 1,table.getn(list) do
		s_countryInfo(list[i],"血战到底副本将在1小时后开始，参赛会获得巨额经验奖励。",ChatPos_Sys + ChatPos_Honor)
		end
		]]
		if s_isCountryInServer(13) == VALUE_OK then
			s_worldInfo("血战到底副本将在1小时后开始，参赛会获得巨额经验奖励。",ChatPos_Sys + ChatPos_Honor)
		end
	end
end

--RegisterHolidayActivityEvent(21,0,"OnHolidayEvent_FlagNotice")
--RegisterHolidayActivityEvent(21,30,"OnHolidayEvent_FlagNotice")
--RegisterHolidayActivityEvent(21,50,"OnHolidayEvent_FlagNotice")
--RegisterHolidayActivityEvent(22,0,"OnHolidayEvent_Flag")

function OnReturnJoinFlagBattle(uid,ret)
	if ret ~= Button_Yes then
		return
	end
	s_intoCopy(uid,4)
end

--超级血战到底

function OnHolidayEvent_CSFlag(hour,minute)
	if s_getCurrentZoneID() ~= s_getBigMiddleZoneID() then
		return
	end
	if s_isCountryInServer(13) ~= VALUE_OK then return end
	local wday = s_getCurTime(TIME_CURWDAYS)
	if wday ~= 6 then return end
	s_callFuncToZoneUser(0,0,"OnRequestCSFlag",0,0,0)
end

function OnRequestCSFlag(uid)
	if s_getWorldLevel() < 4 then return end
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if level < 81 then return end
	local msg = "全奥丁的“超级血战到底”将在三分钟后即将开始，是否立刻前往参加？"
	local buttons = "确定|3|Enter|取消|4|Esc"
	local call = "OnAnswerCSFlagEvent($1,$2)"
	s_registerMsgBox(uid,call,buttons,msg,300)
end

function OnAnswerCSFlagEvent(uid,result)
	if result ~= Button_Yes then
		return
	end
	s_changeRandomZoneBigMiddle(uid)
end

function OnHolidayEvent_CSFlagStart(hour,minute)
	if s_getCurrentZoneID() ~= s_getBigMiddleZoneID() then
		return
	end
	if s_getCurTime(TIME_CURWDAYS) ~= 6 then
		return
	end
	local list = pack(s_getCountryList())
	for i = 1,table.getn(list) do
		local play = s_getCountryEntry(list[i])
		for j = 1,table.getn(play) do
			--判断等级
			local level = s_getValue(SCENE_ENTRY_PLAYER,play[j],VALUE_TYPE_LEVEL)
			local stype = s_getValue(SCENE_ENTRY_PLAYER,play[j],VALUE_TYPE_SCENE_TYPE)
			if level >= 81 and stype == CopySceneType_None then
				local msg ="跨区超级血战到底正式开始，是否立即进入赛场？"
				local func = "OnReturnBigZoneFlagBattle("..play[j]..",$2)"
				local buttons = "确定|3|Enter|取消|4|Esc|稍后|5|Esc"
				s_registerMsgBox(play[j],func,buttons,msg)
			end
		end
	end
end

function OnReturnBigZoneFlagBattle(uid,ret)
	if ret ~= Button_Yes then
		return
	end
	local ctype = 0
	local ulevel = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if ulevel > 80 and ulevel <= 90 then
		ctype = 120
	elseif ulevel > 90 and ulevel <= 100 then
		ctype = 121
	elseif ulevel > 100 and ulevel <= 110 then
		ctype = 122
	elseif ulevel > 110 and ulevel <= 120 then
		ctype = 123
	elseif ulevel > 120 and ulevel <= 130 then
		ctype = 124
	elseif ulevel > 130 and ulevel <= 140 then
		ctype = 125
	elseif ulevel > 140 and ulevel <= 150 then
		ctype = 126
	end
	if ctype ~= 0 then
		s_intoCopy(uid,ctype)
	end
end

--RegisterHolidayActivityEvent(21,57,"OnHolidayEvent_CSFlag")
--RegisterHolidayActivityEvent(22,0,"OnHolidayEvent_CSFlagStart")
