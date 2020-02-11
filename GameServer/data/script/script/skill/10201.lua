--刺杀
function OnUseSkill_10201(level,etype1,eid1,etype2,eid2)
	if etype1 == etype2 and eid1 == eid2 then
		return USE_SKILL_ERROR
	end
	local hurt = { 12,18,26,38,54,73,108,144,198,250,306,360,466,572,691,
		810,991,1179,1362,1544,1828,2134,2444,2752,3067,3367,3673,3979,4284,4568,4852}

	local skilllv = s_getskilllevel(etype1,eid1,10216)
	if skilllv ~= 0 and  math.random(0,1000) <= 50 then
		if s_getbuffnum(etype1,eid1,10201) < skilllv then
			s_addbuff(etype1,eid1,10201,1,60)
		end
	end

	local damage = s_getValue(etype1,eid1,VALUE_TYPE_PDAM)
	if etype2 == SCENE_ENTRY_PLAYER then
		damage = damage + hurt[level]
	else
		damage = damage + hurt[level]*1.5
	end
	if s_getRuneDur(eid1,10201) > 0 then
		damage = math.floor(damage+hurt[level]*0.2)
		s_reduceRuneDur(eid1,10201)
	end
	MagicAttack(10201,VALUE_TYPE_PDAM,etype1,eid1,etype2,eid2,damage)
end
