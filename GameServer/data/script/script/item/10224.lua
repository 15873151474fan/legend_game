--玄印碎片(中)
function OnUseItemEvent_10224(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10224") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,2,s_getVar(uid,140,2) + 20 * number)
	s_sendNewSpecialItemTips(uid,ItemID_Special_PearlFragment,20 * number)
    return VALUE_OK
end
