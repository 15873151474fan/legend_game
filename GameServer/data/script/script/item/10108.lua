-- 羽灵（特级）
function OnUseItemEvent_10108(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10108") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,60,s_getVar(uid,140,60) + 10 * number)
	s_sendNewSpecialItemTips(uid,ItemID_Special_WingExp,10 * number)
    return VALUE_OK
end
