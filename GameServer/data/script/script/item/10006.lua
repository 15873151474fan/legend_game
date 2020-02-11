--疾行丹(增加1分钟的移动速度，提升150%)
function OnUseItemEvent_10006(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10006") ~= VALUE_OK then
        return VALUE_FAIL
    end

	s_addbuff(SCENE_ENTRY_PLAYER,uid,1602,1,120,2000)
    return VALUE_OK
end
