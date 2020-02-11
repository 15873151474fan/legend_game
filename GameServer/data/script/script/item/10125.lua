--大吉大利
function OnUseItemEvent_10125(uid,thisid)
    if s_deleteItemByThisID(uid,thisid,1,"OnUseItemEvent_10125") ~= VALUE_OK then
        return VALUE_FAIL
    end
    local money = math.random(588,888)
    s_addMoneyMe(uid,MoneyType_Money,money,"大吉大利",AddItemAction_UseItem)
    return VALUE_OK
end
