--全服拉车活动
function OnHolidayEvent_Guard_Begin(hour,minute)
	local month = s_getCurTime(TIME_CURMONTHS) + 1
	local mday = s_getCurTime(TIME_CURMDAYS)
	local weekday = s_getCurTime(TIME_CURWDAYS) --周日拉车安全
	if weekday == 0 then
		s_gmCmd(0,"peace","open=true")
		s_gmCmd(0,"guard","open=true")
	end
end
function OnHolidayEvent_Guard_Finish(hour,minute)
	local month = s_getCurTime(TIME_CURMONTHS) + 1
	local mday = s_getCurTime(TIME_CURMDAYS)
	local weekday = s_getCurTime(TIME_CURWDAYS) --周日拉车安全
	if weekday == 0 then
		s_gmCmd(0,"peace","open=false")
		s_gmCmd(0,"guard","open=false")
	end
end
--RegisterHolidayActivityEvent(18,0,"OnHolidayEvent_Guard_Begin")
--RegisterHolidayActivityEvent(19,0,"OnHolidayEvent_Guard_Finish")

