--钓鱼
function OnUseSkill_50012(level,etype1,eid1,etype2,eid2)
	local traffic = s_getTrafficType(eid1)
	if traffic == TrafficType_Horse then
		s_resetTrafficType(eid1)
	end
	traffic = s_getTrafficType(eid1)
	if traffic == TrafficType_None then
		if s_getbufflevel(etype1,eid1,101) == 0 then
			--判断区域
			if s_checkZoneType(etype1,eid1,ZONE_FISH) ~= VALUE_OK then
				s_sysInfo(eid1,"当前区域无法使用，请前往军乐城[329,708]处使用该技能")
				return VALUE_FAIL
			end
			--判断是否装备鱼竿
			local weapon = s_getWeapon(eid1)
			local baseid  = s_getItemValue(eid1,weapon,Item_Base_ID)
			if baseid ~= 29062 then
				s_sysInfo(eid1,"您可以到钓鱼管理员处购买鱼竿");
				return VALUE_FAIL
			end
			local weapon = s_getWeapon(eid1)
			local dur = s_getItemValue(eid1,weapon,Item_Attribute_Dur)
			if dur == 0 then
				s_sysInfo(eid1,"鱼竿耐久为零，无法继续钓鱼");
				return VALUE_FAIL
			end
			s_addbuff(etype1,eid1,101,1,1200)
			s_setTrafficType(eid1,TrafficType_Fish,level)
		end
	elseif traffic == TrafficType_Fish then
		s_resetTrafficType(eid1)
		s_removebuff(etype1,eid1,101)
	elseif s_getbufflevel(etype1,eid1,101) > 0 then
		s_removebuff(etype1,eid1,101)
	else
		s_sysInfo(eid1,"当前状态不能钓鱼")
	end
	ShowAttack(50012,etype1,eid1,etype2,etype2)
end
