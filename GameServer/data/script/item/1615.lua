--328元充值礼包
function OnUseItemEvent_1615(uid,thisid)
    if s_deleteItemByThisID(uid,thisid,1,"328元充值礼包") ~= VALUE_OK then
        return VALUE_FAIL
    end
    OnRequestRecharge(uid,5,3)
    return VALUE_OK
end
