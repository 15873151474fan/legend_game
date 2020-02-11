--玄印碎片(大)
function OnUseItemEvent_10225(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10225") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,2,s_getVar(uid,140,2) + 100 * number)
	s_sendNewSpecialItemTips(uid,ItemID_Special_PearlFragment,100 * number)
    return VALUE_OK
end
