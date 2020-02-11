--灵戒碎片(中)
function OnUseItemEvent_10221(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10221") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,185,1,s_getVar(uid,185,1) + 5 * number)
	s_sendNewSpecialItemTips(uid,ItemID_Special_RingFragment,5 * number)
	s_refreshRingValue(uid)
    return VALUE_OK
end
