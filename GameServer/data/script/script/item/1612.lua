--30元充值礼包
function OnUseItemEvent_1612(uid,thisid)
    if s_deleteItemByThisID(uid,thisid,1,"30元充值礼包") ~= VALUE_OK then
        return VALUE_FAIL
    end
    OnRequestRecharge(uid,2,3)
    return VALUE_OK
end
