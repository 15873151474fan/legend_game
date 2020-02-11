--宠物技能，修理物品
function OnUseSkill_40108(level,etype1,eid1,itemid)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	if checkEquip(eid1,itemid) ~= VALUE_OK then
		return USE_SKILL_ERROR
	end
	local dur = s_getItemValue(eid1,itemid,Item_Attribute_Dur)
	local maxdur = s_getItemValue(eid1,itemid,Item_Attribute_MaxDur)
	if dur >= maxdur then
		s_sysInfo(eid1,"此物品耐久没有损耗，无法使用")
		return USE_SKILL_ERROR
	end
	--local today = s_getCurTime(TIME_ALLDAYS)
	--local day = s_getItemValue(eid1,demonid,Item_Attribute_Demon_RepairDay)
	local times = s_getItemValue(eid1,demonid,Item_Attribute_Demon_RepairTimes)
	if times >= 10 then
		s_sysInfo(eid1,"今天已经使用10次，无法再使用")
		return USE_SKILL_ERROR
	end
	--修理
	if s_repairItem(eid1,itemid) ~= VALUE_OK then
		s_sysInfo(eid1,"修理失败")
		return USE_SKILL_ERROR
	else
		s_sysInfo(eid1,"修理成功")
	end
	--增加今日使用次数
	s_setItemValue(eid1,demonid,Item_Attribute_Demon_RepairTimes,times + 1)
	s_sysInfo(eid1,string.format("当前宠物今天修理次数剩余%d次",10-times-1))
	s_refreshItem(eid1,demonid)
	ShowAttack(40108,etype1,eid1,etype2,eid2)
end
