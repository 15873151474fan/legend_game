--灵戒碎片(大)
function OnUseItemEvent_10222(uid,thisid,targetid, number)
   s_debug("OnUseItemEvent_10222........................................................"..uid..thisid,targetid)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10222.lua") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,185,1,s_getVar(uid,185,1) + 10 * number)
	s_sendNewSpecialItemTips(uid,ItemID_Special_RingFragment,10 * number)
	s_refreshRingValue(uid)
    return VALUE_OK
end
