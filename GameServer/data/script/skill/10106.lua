--巨刃跳劈(作废)
function OnUseSkill_10106(level,etype1,eid1,etype2,eid2)
	local posx = s_getValue(etype2,eid2,VALUE_TYPE_POSX)
	local posy = s_getValue(etype2,eid2,VALUE_TYPE_POSY)
	if s_goto(etype1,eid1,posx,posy,2) ~= VALUE_OK then
		return USE_SKILL_ERROR
	end
	s_addbuff(etype1,eid1,20,1,1)
	local percent = {110,120,130,140,150}
	MAGIC_ATTACK_PERCENT_VALUE = percent[level] * 100
	local damage = s_getValue(etype1,eid1,VALUE_TYPE_PDAM)
	MagicAttack(10106,VALUE_TYPE_PDAM,etype1,eid1,etype2,eid2,damage)
end
