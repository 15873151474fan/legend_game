--转生神力丹
function OnUseItemEvent_10116(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10116") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,6,s_getVar(uid,140,6) + 10000 * number)
	s_sendNewSpecialItemTips(uid,ItemID_Special_RebirthPoint,10000 * number)
    return VALUE_OK
end
