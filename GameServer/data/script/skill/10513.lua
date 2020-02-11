--心灵感应
function OnUseSkill_10513(level,etype1,eid1,etype2,eid2)
	if s_getTeamLeader(eid1) == 0 then
		s_sysInfo(eid1,"您没有组队")
		return USE_SKILL_ERROR
	end
	s_sysInfo(eid1,"等待队友回复中...")
	s_inviteTeamMemberToMe(etype1,eid1)
	ShowAttack(10513,etype1,eid1,etype2,eid2)
end
