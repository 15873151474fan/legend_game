--团加护
function OnUseSkill_44431(level,etype1,eid1,etype2,eid2)
	local corps = s_getCorpsId(eid1)
	if corps == 0 or corps == nil then
		s_sysInfo(eid1,"当前没有团，不能使用此技能")
		return USE_SKILL_ERROR
	end
	local buff = {59, 60, 61, 62, 63, 64, 65, 66, 67, 68}
	if s_getbufflevel(etype1, eid1, buff[level]) ~= 0 then
		s_removebuff(etype1, eid1, buff[level])
	end
	s_addbuff(etype1, eid1, buff[level], 1, 600)
	ShowAttack(44431,etype1,eid1,etype2,eid2)
end
