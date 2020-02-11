--内功经验丹(中)
function OnUseItemEvent_10227(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10227") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_refreshIncExp(uid,10000000 * number,ExpType_Item,0)
    return VALUE_OK
end
