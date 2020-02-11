--魔神秘典碎片5级
function OnUseItemEvent_10195(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10195") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,3,s_getVar(uid,140,3) + 200 * number)
    s_sendNewSpecialItemTips(uid,ItemID_Special_JadeFragment,200 * number)
    return VALUE_OK
end
