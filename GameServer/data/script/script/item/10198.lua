--魔神秘典碎片8级
function OnUseItemEvent_10198(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10198") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,3,s_getVar(uid,140,3) + 650 * number)
    s_sendNewSpecialItemTips(uid,ItemID_Special_JadeFragment,650 * number)
    return VALUE_OK
end
