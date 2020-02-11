--灵戒碎片(小)
function OnUseItemEvent_10220(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10220") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,185,1,s_getVar(uid,185,1) + 1*number)
	s_sendNewSpecialItemTips(uid,ItemID_Special_RingFragment,1*number)
    s_refreshRingValue(uid)
    return VALUE_OK
end
