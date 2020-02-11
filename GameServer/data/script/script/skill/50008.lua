--返回团基地
function OnUseSkill_50008(level,etype1,eid1,etype2,eid2)
	if etype1 ~= SCENE_ENTRY_PLAYER then
		return VALUE_FAIL
	end
	local corps = s_getCorpsId(eid1)
	if corps == 0 then
		s_sysInfo(eid1,"没有加入团，无法使用返回团基地技能",ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end
	local ctype = s_getValue(etype1,eid1,VALUE_TYPE_SCENE_TYPE)
	if ctype ~= 0 then
		s_sysInfo(eid1,"不能在副本中使用此技能",ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end
	if s_corpsState(corps,CorpsState_ToRemove) == VALUE_OK then
		s_sysInfo(uid,"团处于解散状态不可前往",ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end
	local homeland = s_getValue(etype1,eid1,VALUE_TYPE_HOMELAND)
	local curcountry = s_getValue(etype1,eid1,VALUE_TYPE_CURRENT_COUNTRY)
	if homeland ~= curcountry then
		s_sysInfo(eid1,"不能在国外使用此技能",ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end
	local guard = s_getGuardID(eid1)
	if guard ~= 0 then
		s_sysInfo(eid1,"不能在运车中使用此技能",ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end
	ShowAttack(50008,etype1,eid1,etype2,eid2)
	s_intoCopy(eid1,CopySceneType_CorpsBase,corps)
end

