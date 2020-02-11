--15元宝红包
function OnUseItemEvent_10092(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"15元宝红包") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_redPacketReward(uid, 1, 15*number)
    return VALUE_OK
end

