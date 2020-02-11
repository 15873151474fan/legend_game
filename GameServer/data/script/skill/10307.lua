--磁力场
function OnUseSkill_10307(level,etype1,eid1,etype2,eid2)
	local npcid = s_summon(etype1,eid1,48002)
	if npcid == 0 then
		return USE_SKILL_ERROR
	end
	s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER,eid1)
	s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,120*1000)
	ShowAttack(10307,etype1,eid1,etype2,eid2)
end
