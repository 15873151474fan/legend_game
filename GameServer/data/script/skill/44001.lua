--聚能火炮攻击
function OnUseSkill_44001(level, etype1, eid1, etype2, eid2)
	if s_checkPK(44001,etype1,eid1,etype2,eid2) == VALUE_FAIL then
		return USE_SKILL_ERROR
	end
	local equipid = s_getValue(etype1,eid1,VALUE_TYPE_ARMY_EQUIP_ID)
	if equipid == 0 then
		return USE_SKILL_ERROR
	end
	local driver = s_getValue(SCENE_ENTRY_NPC,equipid,VALUE_TYPE_DRIVER)
	if driver == 0 then
		return USE_SKILL_ERROR
	end
	local damage = 0
	if etype2 == SCENE_ENTRY_PLAYER then
		damage = s_getValue(SCENE_ENTRY_PLAYER, driver, VALUE_TYPE_MDAM)
		local hit = s_getValue(SCENE_ENTRY_PLAYER,driver,VALUE_TYPE_MHIT)
		damage = damage +  math.random(0,hit)
	else
		local DAMAGE = {900,1100,1350,1700,2000}
		local lv = s_getskilllevel(SCENE_ENTRY_PLAYER,driver,10409)
		damage = DAMAGE[lv];
	end
	MagicAttack(44001,VALUE_TYPE_MDAM,SCENE_ENTRY_NPC,equipid,etype2,eid2,damage)
end

