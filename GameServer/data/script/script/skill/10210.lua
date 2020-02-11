--影子战术
function OnUseSkill_10210(level,etype1,eid1,etype2,eid2)
	local stype = s_getValue(etype1,eid1,VALUE_TYPE_SCENE_TYPE)
	if stype == CopySceneType_EquipBoss then
		s_sysInfo(eid1,"当前场景不可使用此技能")
		return USE_SKILL_ERROR
	end
	local list = s_getNineEntry(etype2,eid2,10)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			local stype,sid = s_getselect(list[i],list[i+1])
			if stype == etype1 and sid == eid1 then
				s_select(list[i],list[i+1],0,0)
			end
		end
	end

	s_removebuff(etyp1,eid1,10216)
	--自动下马
	if s_getTrafficType(eid1) == TrafficType_Horse then
		s_resetTrafficType(eid1)
	end
	local npcid = s_summon(etype1,eid1,48005)
	if npcid ~= 0 then
		s_addbuff(etype1,eid1,10216,level,60,npcid)
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER,eid1)
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,60*1000)
	end
	ShowAttack(10210,etype1,eid1,etype2,eid2)
end
