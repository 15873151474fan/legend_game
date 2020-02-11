--怒火中烧
function OnUseSkill_10118(level,etype1,eid1,etype2,eid2)
	local hp = s_getValue(etype1,eid1,VALUE_TYPE_HP)
	local maxhp = s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)
	local myhurt = math.floor(maxhp*30/100)
	if hp <= myhurt then
		s_sysInfo(eid1,"当前生命值已不足以使用此技能")
		return USE_SKILL_ERROR
	end
	s_subValue(etype1,eid1,VALUE_TYPE_HP,myhurt)

	s_removebuff(etype1,eid1,10118)
	s_addbuff(etype1,eid1,10118,level,20)
	ShowAttack(10118,etype1,eid1,etype2,eid2)
end
