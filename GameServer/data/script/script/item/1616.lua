--648元充值礼包
function OnUseItemEvent_1616(uid,thisid)
     if s_deleteItemByThisID(uid,thisid,1,"648元充值礼包") ~= VALUE_OK then
        return VALUE_FAIL
     end
    OnRequestRecharge(uid,6,3)
    return VALUE_OK
end
