--2绑定元宝
function OnUseItemEvent_17007(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_17007") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_addMoneyMe(uid,MoneyType_Money,2 * number,"OnUseItemEvent_17007",AddItemAction_UseItem)
    return VALUE_OK
end
