-- 狩魂
function OnUseItemEvent_10136(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10136") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,7,s_getVar(uid,140,7) + 300 * number)
	s_sendNewSpecialItemTips(uid,ItemID_Special_Soul,300 * number)
    return VALUE_OK
end
