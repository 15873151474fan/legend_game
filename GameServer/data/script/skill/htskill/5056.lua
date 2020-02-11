--隐身(只对怪物有效，使用后玩有可以一直隐身，移动或攻击失效)
function OnUseSkill_5056(level,etype1,eid1,etype2,eid2)
	if s_getValue(etype1,eid1,VALUE_TYPE_PROFESSION) ~= Profession_Freeman then
		return USE_SKILL_ERROR
	end

   --增加buffer,减免伤害 

   --if s_getbufflevel(etype1,eid1,1502) ~= 0 then
   s_removebuff(etype1,eid1,1502)
   --end
   s_addbuff(etype1,eid1,1502,level,60 * 30)

   print("addbufer 1052")
   ShowAttack(5056,etype1,eid1,etype2,eid2)
	if etype1 == SCENE_ENTRY_PLAYER then
		s_addValue(etype1,eid1,VALUE_TYPE_SKILL_5056,1)
	end
end
