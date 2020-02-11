--魔神秘典碎片1级
function OnUseItemEvent_10191(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10191") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,3,s_getVar(uid,140,3) + 10 * number)
    s_sendNewSpecialItemTips(uid,ItemID_Special_JadeFragment,10 * number)
    return VALUE_OK
end
