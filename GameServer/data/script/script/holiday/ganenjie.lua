--火鸡盛宴
function OnHolidayEvent_Npc_56035(hour,minute)
	local month = s_getCurTime(TIME_CURMONTHS) + 1
	local mday = s_getCurTime(TIME_CURMDAYS)
	local outtime = VALUE_FAIL
	if month == 11 and mday >= 26  then
		outtime = VALUE_OK
	elseif month == 12 and mday <= 2  then
		outtime = VALUE_OK
	end
	if outtime == VALUE_FAIL then
		return
	end
	local list = pack(s_getCountryList())
	for i = 1,table.getn(list) do
		if list[i] ~= 13 then
			s_countryInfo(list[i],"<p><n color='GXColorBlueSky'>感恩节火鸡盛宴开始了，41级以上角色可寻找光明城</n><goto id='56035' mapid='3' flagpoint='0'/><n color='GXColorBlueSky'>品尝美食！丰富奖励等着您！</n></p>",ChatPos_Sys + ChatPos_Honor)
		end
	end
end
--RegisterHolidayActivityEvent(18,01,"OnHolidayEvent_Npc_56035")
