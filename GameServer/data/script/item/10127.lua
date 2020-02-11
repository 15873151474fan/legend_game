--超大神力丹
function OnUseItemEvent_10127(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10127") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,6,s_getVar(uid,140,6) + 100000 * number)
	s_sendNewSpecialItemTips(uid,ItemID_Special_RebirthPoint,100000 * number)
    return VALUE_OK
end
