--返回遗忘沙漠
function OnUseSkill_90004(level,etype1,eid1,etype2,eid2)
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
	local guard = s_getGuardID(eid1)
	if guard ~= 0 then
		s_sysInfo(eid1,"不能在运车中使用此技能",ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end
	local homeland = s_getValue(etype1,eid1,VALUE_TYPE_HOMELAND)
	local country = s_getValue(etype1,eid1,VALUE_TYPE_CURRENT_COUNTRY)
	if homeland ~= country then
		s_sysInfo(eid1,"不能在国外使用此技能",ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end
	if etype1 == SCENE_ENTRY_PLAYER then
		s_gomap(eid1,0,3,102,99)
	end
	ShowAttack(90004,etype1,eid1,etype,eid)
end
