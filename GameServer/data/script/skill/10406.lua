--定时炸弹
function OnUseSkill_10406(level,etype1,eid1,etype2,eid2)
	if CheckPowerBuff(etype2,eid2) == VALUE_OK then
		s_sysInfo(eid1,"对方处于免疫状态中",ChatPos_Sys + ChatPos_Important)
		return USE_SKILL_ERROR
	end
	if s_checkPK(10406,etype1,eid1,etype2,eid2) == VALUE_FAIL then
		return USE_SKILL_ERROR
	end
	s_addbuff(etype2,eid2,10407,level,5,eid1)
	ShowAttack(10406,etype1,eid1,etype2,eid2)
end
