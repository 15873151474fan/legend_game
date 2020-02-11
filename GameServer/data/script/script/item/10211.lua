--温神莲碎片(中)
function OnUseItemEvent_10211(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10211") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,1,s_getVar(uid,140,1) + 20 * number)
	s_sendNewSpecialItemTips(uid,ItemID_Special_DiamondFragment,20 * number)
    return VALUE_OK
end
