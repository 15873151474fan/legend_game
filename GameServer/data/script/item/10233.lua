--直升经验书(中)
function OnUseItemEvent_10233(uid,thisid)
    local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
    if  level < 1 then
        s_sysInfo(uid,"1级以上才能使用",ChatPos_Tips);
        return VALUE_FAIL
    end
    if s_deleteItemByThisID(uid,thisid,1,"OnUseItemEvent_10233") ~= VALUE_OK then
        return VALUE_FAIL
    end
    if level < 80 then
        s_levelup(uid)
    else
        s_refreshExp(uid,15000000,ExpType_Item,0)
    end
    return VALUE_OK
end
