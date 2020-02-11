--快速传送
function OnQuickGoToEvent(uid,id,gotype)
	local homeland = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND)
	if gotype == 0 then
		s_gomap(uid,homeland,3,390,352)
	else
		s_moveto(uid,homeland,3,390,352)
	end
end

