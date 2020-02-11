--hxw 11/19改成被动技能了
--暴击剑术(20%概率触发，直接读取伤害)
--function OnUseSkill_5012(level,etype1,eid1,etype2,eid2)
	--if s_getValue(etype1,eid1,VALUE_TYPE_PROFESSION) ~= Profession_Soldier then
		--return USE_SKILL_ERROR
	--end

	--if s_checkPK(5012,etype1,eid1,etype2,eid2) == VALUE_FAIL then
		--return USE_SKILL_ERROR
	--end
    ----local percent = {1.05,1.05,1.05,1.05,1.05}
    --local percent = {0,0,0,0}
    --local damage = GetAttackValue(etype1,eid1);
	--if math.random(1,100) < 20 then -- 1000随便填 的，到时候具本问一下策划这个值是多少
        --damage = math.floor(damage * (1.0 + percent[level]))
    --end
    --MagicAttack(5012,VALUE_TYPE_PDAM,etype1,eid1,etype2,eid2,damage)

--end
