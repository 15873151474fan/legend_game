--凝神聚气
function OnUseSkill_10218(level,etype1,eid1,etype2,eid2)
	local skilllv = s_getskilllevel(etype1,eid1,10216)
	local num = s_getbuffnum(etype1,eid1,10201)
	local buffnum = 0
	if skilllv > num then
		buffnum = skilllv - num
	end
	for i=1,buffnum do
		s_addbuff(etype1,eid1,10201,1,60)
	end
	ShowAttack(10218,etype1,eid1,etype2,eid2)
end
