--勋章碎片获得50000点荣誉积分
function OnUseItemEvent_10081(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10081") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,4,s_getVar(uid,140,4) + 50000 * number)
	s_sendNewSpecialItemTips(uid,ItemID_Special_AchievementPoint,50000 * number)
    return VALUE_OK
end
