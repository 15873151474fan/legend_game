--三倍经验丹(8小时)
function OnUseItemEvent_2001(uid,thisid,targetid, number)
    local newmulti, curmulti = getMultiExpBuffInfo(uid,2024)
    if newmulti == nil then
        return VALUE_FAIL
    end

    -- 已有更高级buff，失败
    if newmulti < curmulti then
        s_sysInfo(uid, "已有更高级的效果", ChatPos_Tips)
        return VALUE_FAIL
    end

    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_2001") ~= VALUE_OK then
        return VALUE_FAIL
    end
    local time = 8 * 3600 * number

    -- 相同buff，时间叠加
    if newmulti == curmulti then
        s_addBuffTime(SCENE_ENTRY_PLAYER,uid,2024,time)
        return VALUE_OK
    end

    -- 更高级buff，替换原有
    s_addbuff(SCENE_ENTRY_PLAYER,uid,2024,1,time)
    return VALUE_OK
end