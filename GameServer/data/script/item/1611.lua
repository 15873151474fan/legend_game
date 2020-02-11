--6元充值礼包
function OnUseItemEvent_1611(uid,thisid)
    if s_deleteItemByThisID(uid,thisid,1,"6元充值礼包") ~= VALUE_OK then
        return VALUE_FAIL
    end
    OnRequestRecharge(uid,1,3)
    return VALUE_OK
end
