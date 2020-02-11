--时空传送阵
function OnUseSkill_10510(level,etype1,eid1,etype2,eid2)
	local persons = {6,12,18,24,30}
	local npcid = s_summon(etype1,eid1,48011)
	if npcid == 0 then
		return USE_SKILL_ERROR
	end
	local country = s_getValue(etype1,eid1,VALUE_TYPE_HOMELAND)
	s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NPC_COUNTRY,country)
	s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NPC_PORTALNUM,persons[level])
	s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER,eid1)
	s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,55*1000)
	ShowAttack(10510,etype1,eid1,SCENE_ENTRY_NPC,npcid)
end
