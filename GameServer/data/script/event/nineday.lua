--9天夺宝活动
function OnNineDayPresentEvent(uid)
	--检查活动日
	local serverstarttime = s_getCountryField(13,CountryVar_ServerStartTime)
	if serverstarttime == 0 or serverstarttime == nil then
		return
	end
	local opentime = s_getCurTime(TIME_ALLSECONDS) - serverstarttime
	if opentime > 86400 * 9 then
		return
	end
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if level >= 20 then
		s_sendNineDayReward(uid)
	end
end
