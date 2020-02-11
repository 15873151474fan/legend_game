--地狱冥火普通攻击
function OnUseSkill_5003(level,etype1,eid1,etype2,eid2)
	if s_checkPK(5003,etype1,eid1,etype2,eid2) == VALUE_FAIL then
		return USE_SKILL_ERROR
	end
	--if s_getbufflevel(etype2,eid2,2002) ~= 0 then
        --return USE_SKILL_ERROR
	--end
    --s_addbuff(etype2,eid2,2002,1,2)
    local damage = s_getValue(etype1,eid1,VALUE_TYPE_MDAM);
    MagicAttack(5003,VALUE_TYPE_PDAM,etype1,eid1,etype2,eid2,damage)

end
