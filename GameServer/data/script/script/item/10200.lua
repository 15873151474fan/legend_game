--魔神秘典碎片10级
function OnUseItemEvent_10200(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10200") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,3,s_getVar(uid,140,3) + 1200 * number)
	s_sendNewSpecialItemTips(uid,ItemID_Special_JadeFragment,1200 * number)
    return VALUE_OK
end
