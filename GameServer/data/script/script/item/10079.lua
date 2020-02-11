--勋章碎片获得5000点荣誉积分
function OnUseItemEvent_10079(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10079") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,4,s_getVar(uid,140,4) + 5000 * number)
	s_sendNewSpecialItemTips(uid,ItemID_Special_AchievementPoint,5000 * number)
    return VALUE_OK
end
