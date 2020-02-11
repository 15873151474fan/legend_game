--骑战合一体
function OnUseSkill_10217(level,etype1,eid1,etype2,eid2)
	local ttype,tid = s_getTrafficType(eid1)
	--[[if ttype ~= TrafficType_Horse then
	s_sysInfo(eid1,"非骑乘状态，无法使用该技能")
	return USE_SKILL_ERROR
	end]]--
	s_resetTrafficType(eid1)
	s_setTrafficType(eid1,TrafficType_InHorse,0,10*60)
	ShowAttack(10217,etype1,eid1,etype1,eid1)
end
