--宠物技能，合成道具
function OnUseSkill_40104(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	ShowEquipComposeInterface(eid1,2)
	ShowAttack(40104,etype1,eid1,etype2,eid2)
end
