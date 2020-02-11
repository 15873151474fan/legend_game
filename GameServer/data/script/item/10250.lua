--护盾碎片(中)
function OnUseItemEvent_10250(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10250") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,61,s_getVar(uid,140,61) + 50 * number)
	s_sendNewSpecialItemTips(uid,ItemID_Special_ShieldFragment,50 * number)
    return VALUE_OK
end
