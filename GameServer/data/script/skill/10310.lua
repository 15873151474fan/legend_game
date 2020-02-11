--爆炸射击
function OnUseSkill_10310(level,etype1,eid1,etype2,eid2)
	if s_checkPK(10310,etype1,eid1,etype1,eid2) == VALUE_FAIL then
		return USE_SKILL_ERROR
	end
	local percent1 = 25                  -----初始
	local percent2 = 0.1*level-0.1        -----每级提升
	if etype2 ~= SCENE_ENTRY_NPC then
		local HP =  s_getValue(etype2,eid2,VALUE_TYPE_MAXHP)
	else	--攻击对象为npc时取自身血值
		HP =  s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)
	end

	local damage = HP * (percent1+percent2)/100
	--if damage > math.floor(max[level]) then     --极限值
	--	damage = math.floor(max[level])
	--end
	--s_addbuff(etype1,eid1,20039,50,10)
	--s_addbuff(etype2,eid2,10700,1,150)
	DirectAttack(10310,etype1,eid1,etype2,eid2,damage)
end
