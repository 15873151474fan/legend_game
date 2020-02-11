--召唤火球(对目标进行常规打击)
function OnUseSkill_7031(level,etype1,eid1,etype2,eid2)
	if s_getValue(etype1,eid1,VALUE_TYPE_PROFESSION) ~= Profession_Gunman then
		return USE_SKILL_ERROR
	end

    local damage  = 0;
	local percent = {1,1.05,1.1,1.15,1.2}
	--是否可PK
	if s_checkPK(7031,etype1,eid1,etype2,eid2) == VALUE_FAIL then
		return USE_SKILL_ERROR
	end
    damage  = GetAttackValue(etype1,eid1) * percent[level];
    MagicAttack(7031,VALUE_TYPE_MDAM,etype1,eid1,etype2,eid2,damage)
	if etype1 == SCENE_ENTRY_PLAYER then
		s_addValue(etype1,eid1,VALUE_TYPE_SKILL_7031,1)
	end

end
