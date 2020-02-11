--高级元宝礼包
function OnUseItemEvent_17002(uid,thisid)
    if s_deleteItemByThisID(uid,thisid,1,"OnUseItemEvent_17002") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_addMoneyMe(uid,MoneyType_Gold,200,"OnUseItemEvent_17002",AddItemAction_UseItem)
    return VALUE_OK
end
