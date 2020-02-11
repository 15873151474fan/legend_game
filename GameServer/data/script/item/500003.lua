-- 魂印
function OnUseItemEvent_500003(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_500003") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,130,s_getVar(uid,140,130) + 50000 * number)
	s_sendNewSpecialItemTips(uid,ItemID_Special_HaloExp,50000 * number)
    --s_sysInfo(uid,"获得魂印经验:"..number * 10000)
	return VALUE_OK
end
