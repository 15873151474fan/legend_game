--内功经验丹(大)
function OnUseItemEvent_10228(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10228") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_refreshIncExp(uid,40000000 * number,ExpType_Item,0)
    return VALUE_OK
end
