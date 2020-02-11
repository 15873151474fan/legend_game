--轻云步法(增加5%/10%/15%/20%/20%移动速度)
function OnUseSkill_6000(level,etype1,eid1,etype2,eid2)
	if 1 then return end
    if eid1 ~= eid2 then
        s_debug("轻云步法只能对自己使用")
		return USE_SKILL_ERROR;
    end

    local percent = {3000,3500,4000,4500,5000}
    s_debug("level="..level)

	s_addbuff(etype1,eid1,1601,1,10,percent[level])

	ShowAttack(6000,etype1,eid1,etype2,eid2)
	if etype1 == SCENE_ENTRY_PLAYER then
		s_addValue(etype1,eid1,VALUE_TYPE_SKILL_6000,1)
	end
end
