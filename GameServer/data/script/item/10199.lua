--魔神秘典碎片9级
function OnUseItemEvent_10199(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10199") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,3,s_getVar(uid,140,3) + 900 * number)
    s_sendNewSpecialItemTips(uid,ItemID_Special_JadeFragment,900 * number)
    return VALUE_OK
end
