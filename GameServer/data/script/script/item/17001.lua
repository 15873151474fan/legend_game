--中级元宝礼包
function OnUseItemEvent_17001(uid,thisid)
    if s_deleteItemByThisID(uid,thisid,1,"OnUseItemEvent_17001") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_addMoneyMe(uid,MoneyType_Gold,100,"OnUseItemEvent_17001",AddItemAction_UseItem)
    return VALUE_OK
end
