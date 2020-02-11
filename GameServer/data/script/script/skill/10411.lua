--遥控车
function OnUseSkill_10411(level,etype1,eid1,etype2,eid2)
	if (etype1 ~= SCENE_ENTRY_PLAYER) then
		return USE_SKILL_ERROR
	end
	if s_getbufflevel(etype1,eid1,20300) ~= 0 then
		s_sysInfo(eid1,"持有旗帜时无法使用遥控飞车")
		return USE_SKILL_ERROR
	end
	if s_getbufflevel(etype1,eid1,20301) ~= 0 then
		s_sysInfo(eid1,"持有旗帜时无法使用遥控飞车")
		return USE_SKILL_ERROR
	end
	local equipid = s_getValue(etype1,eid1,VALUE_TYPE_ARMY_EQUIP_ID)
	if equipid ~= 0 then
		return USE_SKILL_ERROR
	end
	local demonid = s_getcurdemon(eid1)
	if demonid ~= nil and demonid ~= 0 then
		s_restdemon(eid1)
		s_sysInfo(eid1,"使用遥控飞车，自动收起宠物",ChatPos_Sys + ChatPos_Important)
	end
	local time = {60,120,180,240}
	local myequip = s_summonArmyEquip(eid1, 44302)
	s_setValue(SCENE_ENTRY_NPC,myequip,VALUE_TYPE_MASTER,eid1)
	s_setValue(SCENE_ENTRY_NPC,myequip,VALUE_TYPE_LIFE,time[level]*1000)
	ShowAttack(10411,etype1,eid1,0,0)
end
