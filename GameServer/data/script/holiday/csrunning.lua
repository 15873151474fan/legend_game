--跨区极速狂飙
function OnHolidayEvent_CSRunning(hour,minute)
	if s_getCurrentZoneID() ~= s_getBigMiddleZoneID() then
		return
	end
	if s_isCountryInServer(13) ~= VALUE_OK then return end
	local wday = s_getCurTime(TIME_CURWDAYS)
	if wday ~= 6 then return end
	s_callFuncToZoneUser(0,0,"OnRequestCSRunning",0,0,0)
end

function OnRequestCSRunning(uid)
	if s_getWorldLevel() < 4 then return end
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if level < 81 then return end
	local msg = "跨区极速狂飙3分钟后开始，是否立刻前往报名？"
	local buttons = "确定|3|Enter|取消|4|Esc"
	local call = "OnAnswerCSRunningEvent($1,$2)"
	s_registerMsgBox(uid,call,buttons,msg,300)
end

function OnAnswerCSRunningEvent(uid,result)
	if result ~= Button_Yes then
		return
	end
	s_changeRandomZoneBigMiddle(uid)
end

--RegisterHolidayActivityEvent(20,2,"OnHolidayEvent_CSRunning")
