--国家水晶押运兽成功到达
function OnArrivedHome(baseid,thisid,sceneid,scenetype)
	s_setValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_IS_ARRIVED,1);
end

function OnCountryPostKillBySys(baseid,level,thisid)
	local curcountry = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_CURRENT_COUNTRY)
	local map = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_CURRENT_MAP)
	s_setCountryPostCarVal(COUNTRY_POSTCAR_STATE_FINISHED,curcountry,map)
	s_postCarEndEvent(thisid,1)
end

