--8折礼巻
function OnUseItemEvent_13000(uid,thisid)
    if s_deleteItemByThisID(uid,thisid,1,"OnUseItemEvent_13000") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_addMoneyMe(uid,MoneyType_Gold,80,"OnUseItemEvent_13000",AddItemAction_UseItem)
    s_addItem(uid,10081,0,1,0,"1-1","封测大礼包")
    return VALUE_OK
end
