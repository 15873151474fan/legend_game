--灭世斩1级
function OnUseItemEvent_8000(uid,thisid)
    if s_deleteItemByThisID(uid,thisid,1,"灭世斩1级") ~= VALUE_OK then
        return VALUE_FAIL
    end

	if s_getskilllevel(SCENE_ENTRY_PLAYER,uid,5018) >= 1 then
        s_addItem(uid,10000,0,150,0,"1-1","灭世斩1级")
    else 
        s_addskill(SCENE_ENTRY_PLAYER,uid,5018,1)
    end
    return VALUE_OK
end
