--魔神秘典碎片6级
function OnUseItemEvent_10196(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10196") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,3,s_getVar(uid,140,3) + 300 * number)
    s_sendNewSpecialItemTips(uid,ItemID_Special_JadeFragment,300 * number)
    return VALUE_OK
end
