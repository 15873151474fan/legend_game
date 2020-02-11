--直升经验书(大)
function OnUseItemEvent_10234(uid,thisid)
    local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
    if  level < 80 then
        s_sysInfo(uid,"80级以上才能使用",ChatPos_Tips);
        return VALUE_FAIL
    end
    if s_deleteItemByThisID(uid,thisid,1,"OnUseItemEvent_10234") ~= VALUE_OK then
        return VALUE_FAIL
    end
    if level < 84 then
        s_levelup(uid)
    else
        s_refreshExp(uid,300000000,ExpType_Item,0)
    end
    return VALUE_OK
end
