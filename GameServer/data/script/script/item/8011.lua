--流星火雨2级
function OnUseItemEvent_8011(uid,thisid)
    if s_deleteItemByThisID(uid,thisid,1,"流星火雨2级") ~= VALUE_OK then
        return VALUE_FAIL
    end

	if s_getskilllevel(SCENE_ENTRY_PLAYER,uid,5037) >= 2 then
        s_addItem(uid,10000,0,25,0,"1-1","流星火雨2级")
    else 
        s_addskill(SCENE_ENTRY_PLAYER,uid,5037,2)
    end
    return VALUE_OK
end
