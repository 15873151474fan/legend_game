--春运活动
function OnRequestSpringTrave(uid)
	if s_getVar(uid,10007,7) ~= 1 then
		return
	end
	s_addItem(uid,55051,3,1,0,"1-1","春运宝箱")
	s_setVar(uid,10007,7,2)
	local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
	s_worldInfo("<p><n color=GXColorBlueSky>恭喜"..name.."</n><n color=GXColorBlueSky>达到60级，获得春运宝箱，有机会抽取春运飞机票、火车票！！</n><book bookid='70275'>[关于]</book></p>",ChatPos_Sys + ChatPos_Honor)
end

