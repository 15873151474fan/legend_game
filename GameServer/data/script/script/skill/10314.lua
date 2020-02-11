--紧急撤退
function OnUseSkill_10314(level,etype1,eid1,etype2,eid2,posx,posy)
	local x1 = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
	local y1 = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	if math.abs(posx - x1) > 12 or math.abs(posy - y1) > 12 then
		return USE_SKILL_ERROR
	end
	local npcid = s_summon(etype1,eid1,48013)
	if npcid == 0 then
		return USE_SKILL_ERROR
	end
	s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER,eid1)
	s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,10*1000)

	s_goto(etype1,eid1,posx,posy,4)
	ShowAttack(10314,etype1,eid1,etype2,eid2)
end
