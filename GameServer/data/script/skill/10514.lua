--召唤水元素
function OnUseSkill_10514(level,etype1,eid1,etype2,eid2)
	local HP_percent = 0.6 + (level-1)*0.02
	local Time1 = 30
	local maxhp = s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)

	local npcid = s_summon(etype1,eid1,48001)
	if npcid == 0 then
		return USE_SKILL_ERROR
	else
		s_addbuff(SCENE_ENTRY_NPC,npcid,30,maxhp*HP_percent,10)
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER,eid1)
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,Time1*1000)
	end
	--符文相关
	if s_getRuneDur(eid1,10514) > 0 then
		s_reduceRuneDur(eid1,10514)
	end
	ShowAttack(10514,etype1,eid1,etype2,eid2)
end
--水元素的攻击走攻击流程 48001.lua

