--照明弹
function OnUseSkill_10311(level,etype1,eid1,etype2,eid2)
	local npcid = s_summon(etype1,eid1,48006)
	if npcid == 0 then
		return USE_SKILL_ERROR
	end
	s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER,eid1)
	s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,60*1000)
	ShowAttack(10311,etype1,eid1,etype2,eid2)
end
