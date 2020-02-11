--灭世斩3级
function OnUseItemEvent_8003(uid,thisid)
    if s_deleteItemByThisID(uid,thisid,1,"灭世斩4级") ~= VALUE_OK then
        return VALUE_FAIL
    end

	if s_getskilllevel(SCENE_ENTRY_PLAYER,uid,5018) == 4 then
        s_addItem(uid,10000,0,337,0,"1-1","灭世斩4级")
    else 
        s_addskill(SCENE_ENTRY_PLAYER,uid,5018,4)
    end
    return VALUE_OK
end
