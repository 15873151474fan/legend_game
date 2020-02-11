--宠物技能，鉴定物品
function OnUseSkill_40107(level,etype1,eid1,itemid)
	local demonid = s_getcurdemon(eid1)
	if demonid == 0 or demonid == nil then
		return USE_SKILL_ERROR
	end
	if checkEquip(eid1,itemid) ~= VALUE_OK then
		return USE_SKILL_ERROR
	end
	if s_getItemValue(eid1,itemid,Item_Attribute_Judge) ~= 0 then
		return USE_SKILL_ERROR
	end
	--local today = s_getCurTime(TIME_ALLDAYS)
	--local day = s_getItemValue(eid1,demonid,Item_Attribute_Demon_JudgeDay)
	local times = s_getItemValue(eid1,demonid,Item_Attribute_Demon_JudgeTimes)
	if times >= 10 then
		s_sysInfo(eid1,"今天已经使用10次，无法再使用")
		return USE_SKILL_ERROR
	end
	--鉴定
	if s_judgeItem(eid1,itemid) ~= VALUE_OK then
		s_deleteItemByThisID(eid1,itemid,1,"宠物技能鉴定损坏删除")
		s_sysInfo(eid1,"很遗憾，鉴定失败，装备被损坏！")
	else
		s_sysInfo(eid1,"恭喜，鉴定成功！")
	end
	--增加今日使用次数
	s_setItemValue(eid1,demonid,Item_Attribute_Demon_JudgeTimes,times + 1)
	s_sysInfo(eid1,string.format("当前宠物今天鉴定次数剩余%d次",10-times-1))
	s_refreshItem(eid1,demonid)
	ShowAttack(40107,etype1,eid1,etype2,eid2)
end
