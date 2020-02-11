--宠物技能，回城
function OnUseSkill_40109(level,etype1,eid1,etype2,eid2)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	local times = s_getItemValue(eid1,demonid,Item_Attribute_Demon_GohomeTimes)
	if times >= 10 then
		s_sysInfo(eid1,"今天已经使用10次，无法再使用")
		return USE_SKILL_ERROR
	end
	--回城
	s_resetTrafficType(eid1)
	s_showbar(eid1,5000,"OnGoHomeWithDemon("..eid1..","..demonid..")",UninterruptActionType_GOHOME,1,6044)
end

function OnGoHomeWithDemon(uid,demonid)
	local itemid = s_getcurdemon(uid)
	if itemid == 0 or itemid == nil then
		s_sysInfo(uid,"没有跟随宠物,回城失败")
		return USE_SKILL_ERROR
	end
	if itemid ~= demonid then
		s_sysInfo(uid,"使用回城技能后,切换宠物,回城失败")
		return USE_SKILL_ERROR
	end
	local times = s_getItemValue(uid,itemid,Item_Attribute_Demon_GohomeTimes)
	s_setItemValue(uid,itemid,Item_Attribute_Demon_GohomeTimes,times + 1)
	s_sysInfo(uid,string.format("当前宠物今天回城次数剩余%d次",10-times-1))
	ReturnUserHome(uid,"宠物技能")
	s_refreshItem(uid,itemid)
	ShowAttack(40109,SCENE_ENTRY_PLAYER,uid,0,0)
end
