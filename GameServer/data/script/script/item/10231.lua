--大力丹(高级)
function OnUseItemEvent_10231(uid,thisid)
    if s_getbufflevel(SCENE_ENTRY_PLAYER,eid1,30013) ~= 0 then
        s_sysInfo(uid,"不可重复使用",ChatPos_Tips)
        return VALUE_FAIL
    end
    if s_deleteItemByThisID(uid,thisid,1,"OnUseItemEvent_10231") ~= VALUE_OK then
        return VALUE_FAIL
    end
    local time = 8 * 60 * 60
    s_addbuff(SCENE_ENTRY_PLAYER,eid1,30013,1,time)
    return VALUE_OK
end
