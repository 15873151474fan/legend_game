--弹出送花界面
function OnShowFlowerEvent(uid, toid)
	local curmap = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_CURRENT_MAP)
	if curmap == 156 then
		ShowAddSendFlowerDialog(uid,toid)
	end
end
