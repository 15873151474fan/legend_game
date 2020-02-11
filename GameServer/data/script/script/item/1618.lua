--2598元充值礼包
function OnUseItemEvent_1618(uid,thisid)
    if s_deleteItemByThisID(uid,thisid,1,"2598元充值礼包") ~= VALUE_OK then
        return VALUE_FAIL
    end
    OnRequestRecharge(uid,8,3)
    return VALUE_OK
end
