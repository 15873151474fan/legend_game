--火焰斩(令自己的下一次攻击造成剧烈伤害)
function OnUseSkill_7015(level,etype1,eid1,etype2,eid2)
	if s_getValue(etype1,eid1,VALUE_TYPE_PROFESSION) ~= Profession_Soldier then
		return USE_SKILL_ERROR
	end

    local damage  = 0;
	local percent = {1.2,1.3,1.4,1.5,1.6}
	local victim  = {}
	--是否可PK
	if s_checkPK(7015,etype1,eid1,etype2,eid2) == VALUE_FAIL then
		return USE_SKILL_ERROR
	end
    damage  = GetAttackValue(etype1,eid1) * percent[level];
    MagicAttack(7015,VALUE_TYPE_PDAM,etype1,eid1,etype2,eid2,damage)
	if etype1 == SCENE_ENTRY_PLAYER then
		s_addValue(etype1,eid1,VALUE_TYPE_SKILL_7015,1)
	end

end
