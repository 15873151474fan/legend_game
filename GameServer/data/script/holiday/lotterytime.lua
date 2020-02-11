function OnAllUserPresentEvent_Notice(hour,minute)
	if s_isCountryInServer(13) == VALUE_OK then
		s_worldInfo("<p><n>今晚将会进行“超爽派送”活动，活动期将在</n><n color='GXColorGreen'>20：10-21:00</n><n>进行。每个玩家在线，每隔10分钟即可获得</n><n color='GXColorGreen'>可交易经验密宝等神秘道具！</n><n>每个角色每天最多可使用各54份。</n></p>",ChatPos_Sys)
	end
end

function OnAllUserPresentEvent_Notice1(hour,minute)
	if s_isCountryInServer(13) == VALUE_OK then
		s_worldInfo("<p><n>“超爽派送”活动已经开始！活动期将在</n><n color='GXColorGreen'>20：10-21:00</n><n>进行。每个玩家在线，每隔10分钟即可获得</n><n color='GXColorGreen'>可交易经验密宝等神秘道具！</n><n>每个角色每天最多可使用各54份。</n></p>",10)
	end
end

--[[
RegisterHolidayActivityEvent(12,05,"OnAllUserPresentEvent_Notice")
RegisterHolidayActivityEvent(14,05,"OnAllUserPresentEvent_Notice")
RegisterHolidayActivityEvent(16,05,"OnAllUserPresentEvent_Notice")
RegisterHolidayActivityEvent(18,05,"OnAllUserPresentEvent_Notice")
RegisterHolidayActivityEvent(19,05,"OnAllUserPresentEvent_Notice")
RegisterHolidayActivityEvent(19,55,"OnAllUserPresentEvent_Notice")
RegisterHolidayActivityEvent(20,10,"OnAllUserPresentEvent_Notice1")
RegisterHolidayActivityEvent(20,30,"OnAllUserPresentEvent_Notice1")
]]--
