-- 狩魂
function OnUseItemEvent_10139(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10139") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,7,s_getVar(uid,140,7) + 600 * number)
	s_sendNewSpecialItemTips(uid,ItemID_Special_Soul,600 * number)
    return VALUE_OK
end
