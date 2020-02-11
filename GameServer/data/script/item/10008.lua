--可以吃的血珠
function OnUseItemEvent_10008(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10008") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_refreshExp(uid,8000000 * number,ExpType_Item,0)
    return VALUE_OK
end
