--冰龙时装->转化为坐骑时装碎片
function OnUseItemEvent_310001(uid,baseid,thisid,number)
    
    if s_deleteItemByThisID(uid,thisid,number,"坐骑时装") ~= VALUE_OK then
        s_trace("删除不成功")
        return VALUE_FAIL
    end

    s_addItem(uid,5001,0,20,0,"1-1","坐骑时装碎片")

    return VALUE_OK
end
