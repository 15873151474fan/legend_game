--聚能火炮
function OnUseSkill_10409(level,etype1,eid1,etype2,eid2)
	local stype = s_getValue(etype1,eid1,VALUE_TYPE_SCENE_TYPE)
	if stype >= CopySceneType_Challenge and stype <= CopySceneType_Challenge5 then
		s_sysInfo(eid1,"当前场景不能使用此技能")
		return USE_SKILL_ERROR
	end
	if s_getbufflevel(etype1,eid1,10304) ~= 0 then
		s_sysInfo(eid1,"瞄准标记状态下不允许使用聚能火炮",ChatPos_Sys + ChatPos_Important)
		return USE_SKILL_ERROR
	end
	if s_getbufflevel(etype1,eid1,20300) ~= 0 then
		s_sysInfo(eid1,"持有旗帜时无法使用聚能火炮")
		return USE_SKILL_ERROR
	end
	if s_getbufflevel(etype1,eid1,20301) ~= 0 then
		s_sysInfo(eid1,"持有旗帜时无法使用聚能火炮")
		return USE_SKILL_ERROR
	end
	if etype1 ~= SCENE_ENTRY_PLAYER then
		return USE_SKILL_ERROR
	end
	if s_getValue(etype1,eid1,VALUE_TYPE_ARMY_EQUIP_ID) ~= 0 then
		return USE_SKILL_ERROR
	end
	local demonid = s_getcurdemon(eid1)
	if demonid ~= nil and demonid ~= 0 then
		s_restdemon(eid1)
		s_sysInfo(eid1,"使用聚能火炮，自动收起宠物",ChatPos_Sys + ChatPos_Important)
	end
	local hptimes = {2,2.5,3,3.5,4}
	ShowAttack(10409,etype1,eid1,0,0)
	s_summonArmyEquip(eid1, 44301, hptimes[level])
end
