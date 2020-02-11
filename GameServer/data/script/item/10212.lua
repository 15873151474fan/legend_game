--温神莲碎片(大)
function OnUseItemEvent_10212(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10212") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,1,s_getVar(uid,140,1) + 200 * number)
	s_sendNewSpecialItemTips(uid,ItemID_Special_DiamondFragment,200 * number)
    return VALUE_OK
end
