--回血(单次回复等于攻击力的伤害)
function OnUseSkill_5051(level,etype1,eid1,etype2,eid2)
	if s_getValue(etype1,eid1,VALUE_TYPE_PROFESSION) ~= Profession_Freeman then
		return USE_SKILL_ERROR
	end

    local cursp = s_getValue(etype1,eid1,VALUE_TYPE_SP);
    local maxsp = s_getValue(etype1,eid1,VALUE_TYPE_MAXSP)
    local needsp = math.floor(maxsp * 0.05 + 50)
    if cursp < needsp then
        ShowAttack(5051,etype1,eid1,etype2,eid2)
        s_sysInfo(eid1,"法力值不足",ChatPos_Tips)
        return USE_SKILL_ERROR
    end

    s_setValue(etype1,eid1,VALUE_TYPE_SP,cursp - needsp);

    local damage  = 0;
	local percent = {0.8,0.85,0.9,0.95,1}

	--不可pk的才可以加血，比如队友，这判断可能存在bug后期再改吧
	local targetid = s_checkTreat(5051,etype1,eid1,etype2,eid2)
--	if s_checkPK(5051,etype1,eid1,etype2,eid2) == VALUE_OK then
--		return USE_SKILL_ERROR
--	end
	if targetid ~= 0 then
		damage  = GetAttackValue(etype1,eid1) * percent[level];
	    s_addValue(etype1,targetid,VALUE_TYPE_HP,damage)
		ShowAttack(5051,etype1,eid1,etype1,targetid)
	end
	if etype1 == SCENE_ENTRY_PLAYER then
		s_addValue(etype1,eid1,VALUE_TYPE_SKILL_5051,1)
	end
end




