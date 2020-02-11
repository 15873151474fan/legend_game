--一击必杀
function OnUseSkill_10209(level,etype1,eid1,etype2,eid2)
	if etype1 == etype2 and eid1 == eid2 then
		return USE_SKILL_ERROR
	end
	local per = 0.1
	local percent = {80,85,90,95}

	local hp = s_getValue(etype1,eid1,VALUE_TYPE_HP)
	local maxhp = s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)
	if hp / maxhp > percent[level]/100 then
		s_sysInfo(eid1,"生命值低于"..percent[level].."%才能使用此技能")
		return USE_SKILL_ERROR
	end

	local skilllv = s_getskilllevel(etype1,eid1,10216)
	if skilllv ~= 0 and  math.random(0,1000) <= 50 then
		if s_getbuffnum(etype1,eid1,10201) < skilllv then
			s_addbuff(etype1,eid1,10201,1,60)
		end
	end

	--s_setValue(etype1,eid1,VALUE_TYPE_HP,1)
	local damage = s_getValue(etype1,eid1,VALUE_TYPE_PDAM)
	damage = damage * (1.4 + 2 * ( percent[level] / 100 - hp / maxhp))
	s_addValue(etype1,eid1,VALUE_TYPE_IGNOREDEF,10000)
	if s_getRuneDur(eid1,10209) > 0 then
		local rand = math.random(1,100)
		if rand <= 10 then
			s_addbuff(etype2,eid2,10703,1,2)
		end
		s_reduceRuneDur(eid1,10209)
	end
	MagicAttack(10209,VALUE_TYPE_PDAM,etype1,eid1,etype2,eid2,damage)
	s_setup(etype1,eid1,1)	--立即刷新属性，把忽视防御刷掉
end

