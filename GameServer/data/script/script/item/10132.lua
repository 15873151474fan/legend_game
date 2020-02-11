-- 狩魂
function OnUseItemEvent_10132(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10132") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,7,s_getVar(uid,140,7) + 30 * number)
	s_sendNewSpecialItemTips(uid,ItemID_Special_Soul,30 * number)
    return VALUE_OK
end
