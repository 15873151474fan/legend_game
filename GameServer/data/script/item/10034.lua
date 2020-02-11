--超级血包(小)
function OnUseItemEvent_10034(uid,thisid,targetid,number)
    if s_getbufflevel(SCENE_ENTRY_PLAYER,uid,30003) ~= 0 then
       local totalhp = s_getbuffvalue(SCENE_ENTRY_PLAYER,uid,30003) 
       if totalhp >= math.pow(2,32) then
            s_sysInfo(uid,"当前已叠加太多，无法再继续使用",ChatPos_Tips)
            return VALUE_FAIL
        end
        if s_deleteItemByThisID(uid,thisid,number,"超级血包(小)") ~= VALUE_OK then
            return VALUE_FAIL
        end
       s_updateBuffValue(SCENE_ENTRY_PLAYER,uid,30003,totalhp + 2000000*number)
    else
        if s_deleteItemByThisID(uid,thisid,number,"超级血包(小)") ~= VALUE_OK then
            return VALUE_FAIL
        end
       s_addbuff(SCENE_ENTRY_PLAYER,uid,30003,1,5,2000000*number) 
    end
    if s_getbufflevel(SCENE_ENTRY_PLAYER,uid,30004) ~= 0 then
       local totalmp = s_getbuffvalue(SCENE_ENTRY_PLAYER,uid,30004) 
       if totalmp >= math.pow(2,32) then
            --s_sysInfo(uid,"当前已叠加太多，无法再继续使用")
            return VALUE_FAIL
        end
       s_updateBuffValue(SCENE_ENTRY_PLAYER,uid,30004,totalmp + 2000000*number)
    else
       s_addbuff(SCENE_ENTRY_PLAYER,uid,30004,1,5,2000000*number) 
    end
    return VALUE_OK
end

