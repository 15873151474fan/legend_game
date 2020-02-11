--直升符护1级
function OnUseItemEvent_10243(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10243") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,3,s_getVar(uid,140,3) + 100 * number)
    s_sendNewSpecialItemTips(uid,ItemID_Special_JadeFragment,100 * number)
    return VALUE_OK
end
