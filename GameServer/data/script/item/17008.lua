--5绑定元宝
function OnUseItemEvent_17008(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_17008") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_addMoneyMe(uid,MoneyType_Money,5 * number,"OnUseItemEvent_17008",AddItemAction_UseItem)
    return VALUE_OK
end
