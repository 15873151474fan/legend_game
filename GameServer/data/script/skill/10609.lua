--净化牧歌 待开发(移除debuff)
function OnUseSkill_10609(level,etype1,eid1,etype2,eid2)
	local list = s_getTeamEntry(etype1,eid1,20)
	for i = 1,table.getn(list), 2 do
		if list[i+1] ~= eid1 then
			s_removebuff(list[i],list[i+1],10002)
		end
	end
	ShowAttack(10609,etype1,eid1,etype2,eid2)
end
