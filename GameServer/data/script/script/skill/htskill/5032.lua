--召唤闪电(召唤一道闪电从天而降，对敌人造成剧烈伤害)
function OnUseSkill_5032(level,etype1,eid1,etype2,eid2)
	if s_getValue(etype1,eid1,VALUE_TYPE_PROFESSION) ~= Profession_Gunman then
		return USE_SKILL_ERROR
	end

    local damage  = 0;
	local percent = {1.1000,1.1336,1.1673,1.2009,1.2345}
	--是否可PK
	if s_checkPK(5032,etype1,eid1,etype2,eid2) == VALUE_FAIL then
		return USE_SKILL_ERROR
	end
    damage  = GetAttackValue(etype1,eid1) * percent[level];
    MagicAttack(5032,VALUE_TYPE_MDAM,etype1,eid1,etype2,eid2,damage)
	if etype1 == SCENE_ENTRY_PLAYER then
		s_addValue(etype1,eid1,VALUE_TYPE_SKILL_5032,1)
	end

end