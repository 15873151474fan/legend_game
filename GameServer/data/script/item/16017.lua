--五香粽
function OnUseItemEvent_16017(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,1,"棒棒糖") ~= VALUE_OK then
        return VALUE_FAIL
    end
    if s_getbufflevel(SCENE_ENTRY_PLAYER,uid,6401)  > 0 then
        local  buftime  = s_getbufftime(SCENE_ENTRY_PLAYER,uid,6401);
        if buftime == nil  then
            buftime = 0;
        end
        s_updateBuffTime(SCENE_ENTRY_PLAYER,uid,6401,buftime + 60 * 60)
    else
        s_addbuff(SCENE_ENTRY_PLAYER,uid,6401,1,60 * 60) 
    end
    return VALUE_OK
end
