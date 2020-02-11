--10绑定元宝
function OnUseItemEvent_19116(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_19116") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_addMoneyMe(uid,MoneyType_Gold,50 * number,"OnUseItemEvent_19116",AddItemAction_UseItem)
    return VALUE_OK
end
