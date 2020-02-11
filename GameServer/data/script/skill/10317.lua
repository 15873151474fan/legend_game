--精神之墙
function OnUseSkill_10317(level,etype1,eid1,etype2,eid2)
	local time = {10,12,14,16,18,20}

	s_addbuff(etype1,eid1,10317,level,time[level])
	ShowAttack(10317,etype1,eid1,etype2,eid2)
end
