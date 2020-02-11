--坐骑兑换券
function OnUseItemEvent_16001(uid,thisid)
    if s_deleteItemByThisID(uid,thisid,1,"坐骑兑换券") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_addItem(uid,270401,0,1,0,"1-1","坐骑兑换券")
    return VALUE_OK
end
