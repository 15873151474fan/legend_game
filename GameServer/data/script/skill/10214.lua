--易容间谍
function OnUseSkill_10214(level,etype1,eid1,etype2,eid2)
	local time = {300,450 }
	if s_getbufflevel(etype1,eid1,10214) ~= 0 then
		return USE_SKILL_ERROR
	end
	if s_getbufflevel(etype1,eid1,20300) ~= 0 then
		s_sysInfo(eid1,"持有旗帜时无法易容")
		return USE_SKILL_ERROR
	end
	if s_getbufflevel(etype1,eid1,20301) ~= 0 then
		s_sysInfo(eid1,"持有旗帜时无法易容")
		return USE_SKILL_ERROR
	end
	s_addbuff(etype1,eid1,10214,1,time[level])
	ShowAttack(10214,etype1,eid1,etype2,eid2)
end
