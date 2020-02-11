--
function OnUseItemEvent_18101(uid,thisid,targetid, number)
    if s_isTitle(SCENE_ENTRY_PLAYER,uid,47)  == VALUE_OK then
            s_sysInfo(uid, "你已经获得该称号，不可重复获得",ChatPos_Tips);
            return VALUE_FAIL
    end
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_18101") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_addTitle(SCENE_ENTRY_PLAYER,uid,47)
    return VALUE_OK
end
