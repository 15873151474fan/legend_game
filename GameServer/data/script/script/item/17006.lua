--1绑定元宝
function OnUseItemEvent_17006(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_17006") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_addMoneyMe(uid,MoneyType_Money,1 * number,"OnUseItemEvent_17006",AddItemAction_UseItem)
    return VALUE_OK
end
