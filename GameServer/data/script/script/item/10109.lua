-- 羽灵（特级）
function OnUseItemEvent_10109(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10109") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,60,s_getVar(uid,140,60) + 100* number)
	s_sendNewSpecialItemTips(uid,ItemID_Special_WingExp,100 * number)
    return VALUE_OK
end
