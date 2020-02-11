--100绑定元宝
function OnUseItemEvent_19098(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_19098") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_addMoneyMe(uid,MoneyType_Gold,100 * number,"OnUseItemEvent_19098",AddItemAction_UseItem)
    return VALUE_OK
end
