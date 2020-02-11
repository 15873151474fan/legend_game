--宠物技能，寻路
function OnUseSkill_40001(level,etype1,eid1,etype2,eid2)
	if s_getbufflevel(SCENE_ENTRY_PLAYER,eid1,1002) == 0 then
		s_addbuff(SCENE_ENTRY_PLAYER,eid1,1002,1,60*60)
	end
	ShowAttack(40001,etype1,eid1,etype2,eid2)
end
