--魔神秘典碎片3级
function OnUseItemEvent_10193(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10193") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,3,s_getVar(uid,140,3) + 90 * number)
    s_sendNewSpecialItemTips(uid,ItemID_Special_JadeFragment,90 * number)
    return VALUE_OK
end
