--普天同庆
function OnAllUserWorldLevelEvent(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if level >= 10 then
		s_addItem(uid,55307,3,1,0,"1-1","普天同庆")
		s_addbuff(SCENE_ENTRY_PLAYER,uid,5033,1,5)
	end
end
