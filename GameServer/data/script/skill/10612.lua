--天然抗体
function OnUseSkill_10612(level,etype1,eid1,etype2,eid2)
	local time = {15,20,25,30,35 }

	if s_getbufflevel(etype2,eid2,10722) ~= 0 then
		s_sysInfo(eid1,"对方当前免疫天然抗体技能")
		s_sysInfo(eid2,"免疫对方自然抗体")
		return USE_SKILL_ERROR
	end

	s_addbuff(etype2,eid2,10612,level,time[level])
	s_addbuff(etype2,eid2,10722,1,time[level]*2)
	ShowAttack(10612,etype1,eid1,etype2,eid2)
end
