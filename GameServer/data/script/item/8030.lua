--召唤神灵
function OnUseItemEvent_8030(uid,thisid)
    if s_deleteItemByThisID(uid,thisid,1,"召唤神灵") ~= VALUE_OK then
        return VALUE_FAIL
    end

	if s_getskilllevel(SCENE_ENTRY_PLAYER,uid,5060) >= 1 then
        s_addItem(uid,10000,0,25,0,"1-1","召唤神灵")
    else 
        s_addskill(SCENE_ENTRY_PLAYER,uid,5060,1)
    end
    return VALUE_OK
end
