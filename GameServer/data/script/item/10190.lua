--迷之宝箱
function OnUseItemEvent_10190(uid,thisid)
    if s_deleteItemByThisID(uid,thisid,1,"OnUseItemEvent_10190") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_addMoney(uid,MoneyType_Gold, 100,"OnUseItemEvent_10190")
    return VALUE_OK
end
