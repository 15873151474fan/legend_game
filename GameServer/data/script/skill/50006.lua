--返回星之城
function OnUseSkill_50006(level,etype1,eid1,etype2,eid2)
	local ctype = s_getValue(etype1,eid1,VALUE_TYPE_SCENE_TYPE)
	if ctype ~= 0 then
		s_sysInfo(eid1,"不能在副本中使用此技能",ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end
	local map = s_getValue(etype1,eid1,VALUE_TYPE_CURRENT_MAP)
	if map == 105 then
		s_sysInfo(eid1,"不能在监狱中使用此技能",ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end
	if etype1 == SCENE_ENTRY_PLAYER then
		local country = s_getValue(etype1,eid1,VALUE_TYPE_HOMELAND)
		s_gomap(eid1,country,1,Star_City_Return_x,Star_City_Return_y)
	end
	ShowAttack(50006,etype1,eid1,etype,eid)
end
