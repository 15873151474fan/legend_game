--超级经验丹
function OnUseItemEvent_10083(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10083") ~= VALUE_OK then
        return VALUE_FAIL
    end
    --s_refreshExp(uid,10000000 * number,ExpType_Item,0)
    s_refreshExp(uid,10000000 * number,ExpType_Show,0)
    return VALUE_OK
end
