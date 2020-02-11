--疯狂射杀
function OnUseSkill_10315(level,etype1,eid1,etype2,eid2)
	--[[
	local percent = {10,8,6,4}
	local maxhp = s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)
	local hp = s_getValue(etype1,eid1,VALUE_TYPE_HP)
	if hp <= maxhp * percent[level] / 100 then
	s_sysInfo(eid1,"生命值太低,无法使用技能")
	return USE_SKILL_ERROR
	end
	]]
	s_addbuff(etype1,eid1,10306,level,5)
	ShowAttack(10315,etype1,eid1,etype2,eid2)
end
