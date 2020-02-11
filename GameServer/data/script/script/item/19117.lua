--10绑定元宝
function OnUseItemEvent_19117(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_19117") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_addMoneyMe(uid,MoneyType_Gold,200 * number,"OnUseItemEvent_19117",AddItemAction_UseItem)
    return VALUE_OK
end
