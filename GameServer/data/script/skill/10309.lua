--封闭射击
function OnUseSkill_10309(level,etype1,eid1,etype2,eid2)
	if CheckPowerBuff(etype2,eid2) == VALUE_OK then
		s_sysInfo(eid1,"对方处于免疫状态中",ChatPos_Sys + ChatPos_Important)
		return USE_SKILL_ERROR
	end
	local time = {5,8,11,14}
	s_addbuff(etype2,eid2,10309,level,time[level])
	ShowAttack(10309,etype1,eid1,etype2,eid2)
end
