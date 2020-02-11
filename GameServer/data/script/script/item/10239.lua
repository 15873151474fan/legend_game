--直升经验书
function OnUseItemEvent_10239(uid,thisid)
    local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
    if  level >= 150 then
        s_sysInfo(uid,"你已经达到最高级，不需要再使用",ChatPos_Tips);
        return VALUE_FAIL
    end
    if s_deleteItemByThisID(uid,thisid,1,"OnUseItemEvent_10239") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_levelup(uid)
    return VALUE_OK
end
