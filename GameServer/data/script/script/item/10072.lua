--大袋金币
function OnUseItemEvent_10072(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10071") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_addMoneyMe(uid,MoneyType_MoneyTicket,200000 * number,"使用大袋银两",AddItemAction_UseItem)
    return VALUE_OK
end
