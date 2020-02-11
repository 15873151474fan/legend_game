--恭喜发财
function OnUseItemEvent_10123(uid,thisid)
    if s_deleteItemByThisID(uid,thisid,1,"OnUseItemEvent_10123") ~= VALUE_OK then
        return VALUE_FAIL
    end
    local money = math.random(288,588)
    s_addMoneyMe(uid,MoneyType_Money,money,"恭喜发财",AddItemAction_UseItem)
    return VALUE_OK
end
