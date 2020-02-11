--舍身取义
function OnUseSkill_10117(level,etype1,eid1,etype2,eid2)
	if etype2 == SCENE_ENTRY_NPC then
		s_sysInfo(eid1,"此技能无法对非玩家对象使用")
		return USE_SKILL_ERROR
	end
	if etype1 == etype2 and eid1 == eid2 then
		return USE_SKILL_ERROR
	end
	if s_getbufflevel(etype2,eid2,10724) ~= 0 then
		s_sysInfo(eid1,"对方处于舍身取义免疫状态")
		return USE_SKILL_ERROR
	end
	local percent = { 15,17,19,21,23,25 }
	if s_checkPK(10117,etype1,eid1,etype2,eid2) == VALUE_FAIL then
		s_sysInfo(eid1,"无法攻击")
		return USE_SKILL_ERROR
	end
	local hp = s_getValue(etype1,eid1,VALUE_TYPE_HP)
	local maxhp = s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)
	local myhurt = math.floor(maxhp*percent[level]/100)
	if hp <= myhurt then
		s_sysInfo(eid1,"当前生命值已不足以使用此技能")
		return USE_SKILL_ERROR
	end

	s_subValue(etype1,eid1,VALUE_TYPE_HP,myhurt)
	s_addbuff(etype2,eid2,10724,1,10)
	DirectAttack(0,etype1,eid1,etype2,eid2,math.floor(myhurt/2))
	ShowAttack(10117,etype1,eid1,etype2,eid2)
end
