--火元素攻击
function OnUseSkill_48002(level,etype1,eid1,etype2,eid2)
	if level == 0 then level = 1 end
	if etype1 ~= etype2 or eid1 ~= eid2 then
		local MDAM_percent = { 60,65,70,75,80,85,90,95,100}
		local damage = s_getValue(etype1,eid1,VALUE_TYPE_MDAM)

		local master = s_getValue(etype1,eid1,VALUE_TYPE_MASTER)
		if master == 0 then
			return USE_SKILL_ERROR
		end
		local slevel = s_getskilllevel(SCENE_ENTRY_PLAYER,master,48002)
		if slevel == nil or slevel < 1 or slevel > table.getn(MDAM_percent) then
			return USE_SKILL_ERROR
		end
		--符文相关
		if s_getRuneDur(master,48002) > 0 then
			local rand = math.random(1,100)
			if rand == 1 then
				s_addbuff(etype2,eid2,10506,1,2)
			end
		end
		DirectAttack(48002,etype1,eid1,etype2,eid2,damage * MDAM_percent[slevel])
	end
end
