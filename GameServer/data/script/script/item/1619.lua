--5898元充值礼包
function OnUseItemEvent_1619(uid,thisid)
    if s_deleteItemByThisID(uid,thisid,1,"5898元充值礼包") ~= VALUE_OK then
        return VALUE_FAIL
    end
    OnRequestRecharge(uid,9,3)
    return VALUE_OK
end
