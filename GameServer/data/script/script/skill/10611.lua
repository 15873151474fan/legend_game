--变形药水(作废)
function OnUseSkill_10611(level,etype1,eid1,etype2,eid2)
	if CheckPowerBuff(etype2,eid2) == VALUE_OK then
		s_sysInfo(eid1,"对方处于免疫状态中",ChatPos_Sys + ChatPos_Important)
		return USE_SKILL_ERROR
	end
	local time = {2,3,4,5,6}
	s_addbuff(etype2,eid2,10611,level,time[level])
	ShowAttack(10611,etype1,eid1,etype2,eid2)
end
