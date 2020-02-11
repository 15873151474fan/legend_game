--平衡输血(作废 )
function OnUseSkill_10613(level,etype1,eid1,etype2,eid2)
	local percent = {40,52,64,76,88,100 }
	local hp1 = s_getValue(etype1,eid1,VALUE_TYPE_HP)
	local hp2 = s_getValue(etype2,eid2,VALUE_TYPE_HP)
	local maxhp = s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)
	local hp = (hp2 * percent[level] / 100 + hp1) / 2

	s_subValue(etype2,eid2,VALUE_TYPE_HP,hp/2)
	s_addValue(etype2,eid2,VALUE_TYPE_HP,hp)

	s_addValue(etype1,eid1,VALUE_TYPE_HP,hp)
	if hp > maxhp then
		s_subValue(etype1,eid1,VALUE_TYPE_HP,hp - maxhp)
	end
	ShowAttack(10613,etype1,eid1,etype2,eid2)
end
