--超级元宝礼包
function OnUseItemEvent_17003(uid,thisid)
    if s_deleteItemByThisID(uid,thisid,1,"OnUseItemEvent_17003") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_addMoneyMe(uid,MoneyType_Gold,500,"OnUseItemEvent_17003",AddItemAction_UseItem)
    return VALUE_OK
end
