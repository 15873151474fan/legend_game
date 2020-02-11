--魔神秘典碎片2级
function OnUseItemEvent_10192(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10192") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,3,s_getVar(uid,140,3) + 1 * number)
    s_sendNewSpecialItemTips(uid,ItemID_Special_JadeFragment,1 * number)
    return VALUE_OK
end
