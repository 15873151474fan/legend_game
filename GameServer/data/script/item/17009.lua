--10绑定元宝
function OnUseItemEvent_17009(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_17009") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_addMoneyMe(uid,MoneyType_Money,10 * number,"OnUseItemEvent_17009",AddItemAction_UseItem)
    return VALUE_OK
end
