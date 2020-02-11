--100绑定元宝
function OnUseItemEvent_17012(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_17012") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_addMoneyMe(uid,MoneyType_Money,100 * number,"OnUseItemEvent_17012",AddItemAction_UseItem)
    return VALUE_OK
end
