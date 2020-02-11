-- 周卡(1日体验卡)
function OnUseItemEvent_10093(uid,thisid)
    local time = 24 * 3600
    if s_getVar(uid, 149, 15) == 0 then
	    s_addbuff(SCENE_ENTRY_PLAYER,uid,6201,1,time)
	    s_addbuff(SCENE_ENTRY_PLAYER,uid,6202,1,time)
	    s_addbuff(SCENE_ENTRY_PLAYER,uid,6203,1,time)
	    s_addbuff(SCENE_ENTRY_PLAYER,uid,6204,1,time)
	else
	    s_addbuff(SCENE_ENTRY_PLAYER,uid,6204,1,time)
    end
    s_addWeekCardTime(uid,time,1)
    return VALUE_OK
end


