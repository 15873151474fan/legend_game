--魔神秘典碎片4级
function OnUseItemEvent_10194(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10194") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,3,s_getVar(uid,140,3) + 135 * number)
    s_sendNewSpecialItemTips(uid,ItemID_Special_JadeFragment,135 * number)
    return VALUE_OK
end
