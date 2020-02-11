-- 羽灵
function OnUseItemEvent_10095(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10095") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,60,s_getVar(uid,140,60) + 1 * number)
	s_sendNewSpecialItemTips(uid,ItemID_Special_WingExp,1 * number)
    return VALUE_OK
end
