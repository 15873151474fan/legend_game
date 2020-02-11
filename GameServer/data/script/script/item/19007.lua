--10绑定元宝
function OnUseItemEvent_19007(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_19007") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_addMoneyMe(uid,MoneyType_Gold,10 * number,"OnUseItemEvent_19007",AddItemAction_UseItem)
    return VALUE_OK
end
