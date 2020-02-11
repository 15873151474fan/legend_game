--盟国回城技能
function OnUseSkill_5521(level,etype1,eid1,etype2,eid2)
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
	if ((map == 5) or (map >= 135 and map <= 142) or (map >= 146 and map <= 153))and homeland ~= country then
		if s_getbufflevel(etype1,eid1,107) ~= 0 then
			s_sysInfo(eid1,"您身上有水晶，无法在军乐城使用回城")
			return VALUE_FAIL
		end
		if s_getbufflevel(etype1,eid1,108) ~= 0 then
			s_sysInfo(eid1,"您身上有水晶，无法在军乐城使用回城")
			return VALUE_FAIL
		end
		if s_getbufflevel(etype1,eid1,109) ~= 0 then
			s_sysInfo(eid1,"您身上有水晶，无法在军乐城使用回城")
			return VALUE_FAIL
		end
		if s_getbufflevel(etype1,eid1,110) ~= 0 then
			s_sysInfo(eid1,"您身上有水晶，无法在军乐城使用回城")
			return VALUE_FAIL
		end
		if s_getbufflevel(etype1,eid1,111) ~= 0 then
			s_sysInfo(eid1,"您身上有水晶，无法在军乐城使用回城")
			return VALUE_FAIL
		end
	end
	ReturnUserAlly(eid1,"OnUseSkill_5521")
	ShowAttack(5521,etype1,eid1,etype,eid)
end
