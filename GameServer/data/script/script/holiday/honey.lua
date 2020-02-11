--情人节活动
function OnHolidayEvent_Honey(hour,minute)
	local month = s_getCurTime(TIME_CURMONTHS) + 1
	local mday = s_getCurTime(TIME_CURMDAYS)
	if month == 4 and mday == 30 then
		local list = pack(s_getCountryList())
		for i = 1,table.getn(list) do
			s_countryInfo(list[i],"<p><newline/><n>今晚19:00起进行3轮秒杀活动！</n><newline/><n>秒茶叶蛋、999玫瑰、碧波仙子！</n><newline/><n color='GXColorGreen'>届时请点击右上秒杀界面参与！</n></p>",ChatPos_Pop)
		end
	end
end
--RegisterHolidayActivityEvent(8,55,"OnHolidayEvent_Honey")
--RegisterHolidayActivityEvent(11,55,"OnHolidayEvent_Honey")
--RegisterHolidayActivityEvent(17,55,"OnHolidayEvent_Honey")
--RegisterHolidayActivityEvent(18,55,"OnHolidayEvent_Honey")
