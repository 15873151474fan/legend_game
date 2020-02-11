--50绑定元宝
function OnUseItemEvent_17011(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_17011") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_addMoneyMe(uid,MoneyType_Money,50 * number,"OnUseItemEvent_17011",AddItemAction_UseItem)
    return VALUE_OK
end
