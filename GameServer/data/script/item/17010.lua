--20绑定元宝
function OnUseItemEvent_17010(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_17010") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_addMoneyMe(uid,MoneyType_Money,20 * number,"OnUseItemEvent_17010",AddItemAction_UseItem)
    return VALUE_OK
end
