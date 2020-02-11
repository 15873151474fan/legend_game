-- 羽灵(高级)
function OnUseItemEvent_10096(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10096") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,60,s_getVar(uid,140,60) + 20 * number)
	s_sendNewSpecialItemTips(uid,ItemID_Special_WingExp,20 * number)
    return VALUE_OK
end
