--水元素攻击
function OnUseSkill_48001(level,etype1,eid1,etype2,eid2)
	if level == 0 then level = 1 end
	if etype1 ~= etype2 or eid1 ~= eid2 then
		local master = s_getValue(etype1,eid1,VALUE_TYPE_MASTER)
		if master == 0 then
			return USE_SKILL_ERRORs
		end
		local damage = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_MDAM)
		local slevel = s_getskilllevel(SCENE_ENTRY_PLAYER,master,10514)
		if slevel == nil or slevel < 1 then
			return USE_SKILL_ERROR
		end
		local MDAM_percent = 0.3 + (slevel-1)*0.01

		--符文相关
		if s_getRuneDur(master,48001) > 0 then
			local rand = math.random(1,100)
			if rand == 1 then
				s_addbuff(etype2,eid2,10514,1,2)
			end
		end
		DirectAttack(48001,etype1,eid1,etype2,eid2,damage * MDAM_percent)
	end
end
