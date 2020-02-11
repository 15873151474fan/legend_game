--精神燃烧
function OnUseSkill_10208(level,etype1,eid1,etype2,eid2)
	if etype1 == etype2 and eid1 == eid2 then
		return USE_SKILL_ERROR
	end

	if s_getbufflevel(etype2,eid2,10721) ~= 0 then
		s_sysInfo(eid1,"对方当前对精神燃烧技能免疫")
		return USE_SKILL_ERROR
	end

	local burn = {30,35,40,45,50,55}

	local sp = s_getValue(etype2,eid2,VALUE_TYPE_MAXSP)
	sp = sp * burn[level] / 100
	sp = s_subValue(etype2,eid2,VALUE_TYPE_SP,sp)
	local cursp = s_getValue(etype2,eid2,VALUE_TYPE_SP)
	s_sysInfo(eid1,"燃烧" .. sp .."点魔力值,对方剩余" .. cursp .."点")
	s_showSubSp(etype1,eid1,etype2,eid2,sp)
	s_addbuff(etype2,eid2,10309,1,4)
	s_addbuff(etype2,eid2,10721,1,10)

	ShowAttack(10208,etype1,eid1,etype2,eid2)
end
