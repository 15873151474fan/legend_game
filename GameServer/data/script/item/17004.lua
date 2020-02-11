--封测大礼包
function OnUseItemEvent_17004(uid,thisid)
    if s_deleteItemByThisID(uid,thisid,1,"OnUseItemEvent_17004") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_addItem(uid,10069,0,1,0,"1-1","封测大礼包")
    s_addItem(uid,10056,0,1,0,"1-1","封测大礼包")
    s_addItem(uid,10080,0,1,0,"1-1","封测大礼包")
    s_addItem(uid,10081,0,1,0,"1-1","封测大礼包")
    return VALUE_OK
end
