-- 狩魂
function OnUseItemEvent_10119(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10119") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,7,s_getVar(uid,140,7) + 20000 * number)
	s_sendNewSpecialItemTips(uid,ItemID_Special_Soul,20000 * number)
    return VALUE_OK
end
