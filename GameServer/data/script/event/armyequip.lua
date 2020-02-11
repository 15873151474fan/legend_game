--团魔甲相关事件

--紧急召唤
function OnEmergUseEquipEvent(uid)
	local corps = s_getCorpsId(uid)
	if corps == 0 then
		return VALUE_FAIL
	end
	if s_corpsState(corps,CorpsState_ToRemove) == VALUE_OK then
		return VALUE_FAIL
	end
	s_listArmyEquip(uid, 1, 1)
end

--紧急领取读条
function OnEmergGetEquipEvent(uid,btype,bindex)
	if s_getMoney(uid,MoneyType_MoneyTicket) < 50 then
		s_sysInfo(uid, "紧急领取需花费50绑银", ChatPos_Sys + ChatPos_Important)
		return
	end
	local stype = s_getValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_SCENE_TYPE)
	if stype > 0 then
		if stype ~= CopySceneType_EmperorWar then
			s_sysInfo(uid,"副本中禁止紧急领取团魔甲", ChatPos_Sys + ChatPos_Important)
			return
		end
	end
	--	local curcountry = s_getValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_CURRENT_COUNTRY)
	--	local homeland = s_getValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_HOMELAND)
	--	if homeland ~= curcountry then
	--		s_sysInfo(uid,"只能在本国紧急领取团魔甲", ChatPos_Sys + ChatPos_Important)
	--		return
	--	end
	local call = "s_getArmyEquip("..uid.."," ..btype.."," ..bindex.. ", 1)"
	s_showbar(uid,5000,call,UninterruptActionType_None,1)
end

--领取读条
function OnGetEquipEvent(uid,btype,bindex)
	local call = "s_getArmyEquip("..uid.."," ..btype.."," ..bindex..", 0)"
	s_showbar(uid,5000,call,UninterruptActionType_None,1)
end


--申请驾驶场景上装备
function OnRequestDriverEquip(uid,equipid,etype)
	if etype == 41 then		--水晶矿车
		CopySceneInfo_3:RequstDriverCar(uid,equipid)
		return
	end
	if etype == 42 then		--军战碉堡
		CopySceneInfo_7:RequstIntoFort(uid,equipid)
		return
	end
	if etype == 44 then		--巨型火炮
		s_addDriver(uid,equipid)
		return
	end
	if etype == 45 then		--国战碉堡
		s_addDriver(uid,equipid)
		return
	end
	if etype == 47 then
		s_addDriver(uid,equipid)
		return
	end
end

--团魔甲销毁
--魔甲销毁不再返还道具，改为增加团魔甲材料属性
--function OnDestroyArmyEquip(uid, baseid, num, level)
--	local str = "1-1," .. Item_Attribute_Level .. "-" .. level
--	s_addItem(uid,baseid,0,num,0,str,"拆团魔甲")
--end

