--护盾碎片(大)
function OnUseItemEvent_10251(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10251") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,61,s_getVar(uid,140,61) + 1000 * number)
	s_sendNewSpecialItemTips(uid,ItemID_Special_ShieldFragment,1000 * number)
    return VALUE_OK
end
