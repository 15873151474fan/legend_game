--无双擂台赛
function OnHolidayEvent_FightTeam_Notice1(hour,minute)
	local week = s_getCurTime(TIME_CURYWEEKS)
	if week%2 ~= 0 then
		return
	end
	if s_getCountryVar(13,19,35) == 1 then return end
	if s_isCountryInServer(13) == VALUE_OK then
		local weekday = s_getCurTime(TIME_CURWDAYS)
		if weekday ~= 1 then
			return
		end
		s_worldInfo("<p><n color=GXColorBlueSky>两周一届的“3vs3无双擂台”选拔赛将在30分钟后开始，请前往</n><goto id=\"358\" mapid=\"160\" x=\"115\" y=\"85\" npcid=\"358\" cid=\"13\" flagpoint=\"1\" /><n color=GXColorBlueSky>组建战队报名参赛！</n></p>")
	end
end
function OnHolidayEvent_FightTeam_Notice2(hour,minute)
	local week = s_getCurTime(TIME_CURYWEEKS)
	if week%2 ~= 0 then
		return
	end
	if s_getCountryVar(13,19,35) == 1 then return end
	if s_isCountryInServer(13) == VALUE_OK then
		local weekday = s_getCurTime(TIME_CURWDAYS)
		if weekday ~= 1 then
			return
		end
		s_worldInfo("<p><n color=GXColorBlueSky>两周一届的“3vs3无双擂台”选拔赛将在15分钟后开始，请前往</n><goto id=\"358\" mapid=\"160\" x=\"115\" y=\"85\" npcid=\"358\" cid=\"13\" flagpoint=\"1\" /><n color=GXColorBlueSky>组建战队报名参赛！</n></p>")
	end
end
function OnHolidayEvent_FightTeam_Notice3(hour,minute)
	local week = s_getCurTime(TIME_CURYWEEKS)
	if week%2 ~= 0 then
		return
	end
	if s_getCountryVar(13,19,35) == 1 then return end
	if s_isCountryInServer(13) == VALUE_OK then
		local weekday = s_getCurTime(TIME_CURWDAYS)
		if weekday ~= 1 then
			return
		end
		s_worldInfo("<p><n color=GXColorBlueSky>两周一届的“3vs3无双擂台”选拔赛将在5分钟后开始，请前往</n><goto id=\"358\" mapid=\"160\" x=\"115\" y=\"85\" npcid=\"358\" cid=\"13\" flagpoint=\"1\" /><n color=GXColorBlueSky>组建战队报名参赛！</n></p>")
	end
end
RegisterHolidayActivityEvent(18,30,"OnHolidayEvent_FightTeam_Notice1")
RegisterHolidayActivityEvent(18,45,"OnHolidayEvent_FightTeam_Notice2")
RegisterHolidayActivityEvent(18,55,"OnHolidayEvent_FightTeam_Notice3")
