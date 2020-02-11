--磁力场陷阱自曝(紧急撤退)
function OnUseSkill_48013(level,etype1,eid1,etype2,eid2)
	local percent = {35,44,53,62,71,80 }

	local master = s_getValue(SCENE_ENTRY_NPC,eid1,VALUE_TYPE_MASTER)
	if master == 0 or master == nil then return USE_SKILL_ERROR end
	level = s_getskilllevel(SCENE_ENTRY_PLAYER,master,10314)
	if level == 0 then return USE_SKILL_ERROR end

	local list = s_getNineEntry(SCENE_ENTRY_NPC,eid1,3)
	local victim = {}
	for i = 1,table.getn(list), 2 do
		if list[i] ~= SCENE_ENTRY_PLAYER or list[i+1] ~= master then
			if s_checkPK(48013,SCENE_ENTRY_PLAYER,master,list[i],list[i+1]) == VALUE_OK then
				s_addbuff(list[i],list[i+1],10702,percent[level],3)
			end
		end
	end
	s_setValue(SCENE_ENTRY_NPC,eid1,VALUE_TYPE_HP,0)
	DirectAttack(48002,etype1,eid1,unpack(victim))
end
