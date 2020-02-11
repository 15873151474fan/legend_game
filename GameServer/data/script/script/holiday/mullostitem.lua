--全服经验掉落
function OnHolidayEvent_Mullost_Begin(hour,minute)
	local month = s_getCurTime(TIME_CURMONTHS) + 1
	local mday = s_getCurTime(TIME_CURMDAYS)
	s_gmCmd(0,"lostitem","num=2")
end
function OnHolidayEvent_Mulexp_Finish(hour,minute)
	local month = s_getCurTime(TIME_CURMONTHS) + 1
	local mday = s_getCurTime(TIME_CURMDAYS)
	s_gmCmd(0,"lostitem","num=1")
end
--RegisterHolidayActivityEvent(21,0,"OnHolidayEvent_Mullost_Begin")
--RegisterHolidayActivityEvent(23,59,"OnHolidayEvent_Mullost_Finish")

