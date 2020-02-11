--198元充值礼包
function OnUseItemEvent_1614(uid,thisid)
    if s_deleteItemByThisID(uid,thisid,1,"198元充值礼包") ~= VALUE_OK then
        return VALUE_FAIL
    end
    OnRequestRecharge(uid,4,3)
    return VALUE_OK
end
