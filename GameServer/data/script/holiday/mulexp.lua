--全服经验双倍
function OnHolidayEvent_Mulexp_Begin(hour,minute)
	local month = s_getCurTime(TIME_CURMONTHS) + 1
	local mday = s_getCurTime(TIME_CURMDAYS)
	if month == 3 and mday >= 9 and mday <= 11 then
		s_gmCmd(0,"mulexp","num=200")
	end
end
function OnHolidayEvent_Mulexp_Finish(hour,minute)
	local month = s_getCurTime(TIME_CURMONTHS) + 1
	local mday = s_getCurTime(TIME_CURMDAYS)
	if month == 3 and mday >= 9 and mday <=11 then
		s_gmCmd(0,"mulexp","num=100")
	end
end
--RegisterHolidayActivityEvent(21,0,"OnHolidayEvent_Mulexp_Begin")
--RegisterHolidayActivityEvent(23,59,"OnHolidayEvent_Mulexp_Finish")

