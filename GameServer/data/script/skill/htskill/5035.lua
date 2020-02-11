--法术盾(增加1%/2%/3%/4%的伤害抵挡)
function OnUseSkill_5035(level,etype1,eid1,etype2,eid2)
	if s_getValue(etype1,eid1,VALUE_TYPE_PROFESSION) ~= Profession_Gunman then
		return USE_SKILL_ERROR
	end
	--s_debug("OnUseSkill_5035...................level="..level.." getbuflevel="..s_getbufflevel(etype1,eid1,1300))
	--增加buffer,减免伤害
        
	if s_getbufflevel(etype1,eid1,1300) ~= 0 then
		s_updateBuffTime(etype1,eid1,1300,60 * 5)
		return;
	end
	s_addbuff(etype1,eid1,1300,level,60 * 5)

	--s_trace("5035 level="..level..",etype1="..etype1..",eid1="..eid1..",etype2="..etype2..",eid2="..eid2)
	ShowAttack(5035,etype1,eid1,etype2,eid2)
	if etype1 == SCENE_ENTRY_PLAYER then
		s_addValue(etype1,eid1,VALUE_TYPE_SKILL_5035,1)
	end
end
