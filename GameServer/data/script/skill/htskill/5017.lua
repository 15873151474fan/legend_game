--战神护体(增加5%伤害抵挡（魔法及物理攻击抵挡）)
function OnUseSkill_5017(level,etype1,eid1,etype2,eid2)
	if s_getValue(etype1,eid1,VALUE_TYPE_PROFESSION) ~= Profession_Soldier then
		return USE_SKILL_ERROR
	end

   --增加buffer,减免伤害 

   local percent = {5,5,5,5}
   if s_getbufflevel(etype1,eid1,1100) ~= 0 then
		s_updateBuffTime(etype1,eid1,1100,percent[level])
   else
       s_addbuff(etype1,eid1,1100,level,percent[level])
   end

    ShowAttack(5017,etype1,eid1,etype2,eid2)
	if etype1 == SCENE_ENTRY_PLAYER then
		s_addValue(etype1,eid1,VALUE_TYPE_SKILL_5017,1)
	end
end
