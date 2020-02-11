-- 周卡(1日体验卡)
function OnUseItemEvent_10104(uid,thisid)
    local time = 24 * 3600
    if s_getVar(uid, 149, 15) == 0 then
	    s_addbuff(SCENE_ENTRY_PLAYER,uid,2039,1,time)
    end
    s_addWeekCardTime(uid,time,1)
    return VALUE_OK
end


