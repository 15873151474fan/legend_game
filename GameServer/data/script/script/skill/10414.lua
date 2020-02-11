--死而复生
function OnUseSkill_10414(level,etype1,eid1,etype2,eid2)
	if s_getbufflevel(etype1,eid1,10414) ~= 0 then
		return USE_SKILL_ERROR
	end
	local num = {30,45,60,75}
	s_addbuff(etype1,eid1,10414,level,num[level])
	ShowAttack(10414,etype1,eid1,etype2,eid2)
end
