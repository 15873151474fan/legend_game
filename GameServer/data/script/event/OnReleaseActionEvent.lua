--解除行为
function OnReleaseActionEvent(uid,copytype,action)
	local stype = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE)
	local sid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
	if copytype ~= stype then
	--		return
	end
	if action == 1 then		-- 团副本解除水晶
		if sid == 0 then
			return
	end
	CopySceneInfo_3:UserLostCrystal(sid,uid)
	return
	end
end
