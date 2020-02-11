--万事如意
function OnUseItemEvent_10124(uid,thisid)
    if s_deleteItemByThisID(uid,thisid,1,"OnUseItemEvent_10124") ~= VALUE_OK then
        return VALUE_FAIL
    end
    local money = math.random(188,288)
    s_addMoneyMe(uid,MoneyType_Money,money,"万事如意",AddItemAction_UseItem)
    return VALUE_OK
end
