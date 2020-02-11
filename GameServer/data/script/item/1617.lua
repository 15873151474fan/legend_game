--1298元充值礼包
function OnUseItemEvent_1617(uid,thisid)
    if s_deleteItemByThisID(uid,thisid,1,"1298元充值礼包") ~= VALUE_OK then
        return VALUE_FAIL
    end
    OnRequestRecharge(uid,7,3)
    return VALUE_OK
end
