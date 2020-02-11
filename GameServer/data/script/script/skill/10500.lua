--行者姿态
function OnUseSkill_10500(level,etype1,eid1,etype2,eid2)
	if s_getValue(etype1,eid1,VALUE_TYPE_PROFESSION) ~= Profession_Freeman then
		return USE_SKILL_ERROR
	end
	if s_getbufflevel(etype1,eid1,10500) ~= 0 then
		s_removebuff(etype1,eid1,10500)
	else
		s_addbuff(etype1,eid1,10500,level,5*60*60)
		ShowAttack(10500,etype1,eid1,etype2,eid2)
	end
end
