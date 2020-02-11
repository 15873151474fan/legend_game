--遥控飞车定时炸弹
function OnUseSkill_44002(level, etype1, eid1, etype2, eid2)
	local equipid = s_getValue(etype1,eid1,VALUE_TYPE_ARMY_EQUIP_ID)
	if equipid == 0 then
		return USE_SKILL_ERROR
	end
	local driver = s_getValue(SCENE_ENTRY_NPC,equipid,VALUE_TYPE_DRIVER)
	if driver == 0 then
		return USE_SKILL_ERROR
	end
	level = s_getskilllevel(SCENE_ENTRY_PLAYER,driver,10406)
	if level == 0 then
		s_sysInfo(eid1,"您还没有学习定时炸弹技能")
		return USE_SKILL_ERROR
	end
	local victim ={}
	local damage = { 300,400,500,750,1000,1500,2000,3000,4000,5000,6000}
	local list = s_getNineEntry(etype1,eid1,3)
	for i = 1,table.getn(list), 2 do
		if list[i] ~= etype or list[i+1] ~= eid then
			if s_checkPK(44002,SCENE_ENTRY_PLAYER,driver,list[i],list[i+1]) == VALUE_OK then
				table.insert(victim,list[i])
				table.insert(victim,list[i+1])
				table.insert(victim,damage[level]/3)
			end
		end
	end
	s_setValue(SCENE_ENTRY_NPC,equipid,VALUE_TYPE_LIFE,1000)
	DirectAttack(0,etype1,eid1,unpack(victim))
end
