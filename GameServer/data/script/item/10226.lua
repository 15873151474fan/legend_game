--内功经验丹(小)
function OnUseItemEvent_10226(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10226") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_refreshIncExp(uid,2000000 * number,ExpType_Item,0 )
    return VALUE_OK
end
