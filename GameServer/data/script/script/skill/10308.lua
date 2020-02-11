--致盲(作废)
function OnUseSkill_10308(level,etype1,eid1,etype2,eid2)
	s_select(etype2,eid2,0,0)
	local time = {1,1.2,1.4,1.6,2,2.2,2.4,2.6,2.8,3 }
	s_addbuff(etype2,eid2,10308,level,time[level])
	ShowAttack(10308,etype1,eid1,etype2,eid2)
end
