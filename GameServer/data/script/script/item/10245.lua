--直升1级勋章
function OnUseItemEvent_10245(uid,thisid)
    if s_deleteItemByThisID(uid,thisid,1,"OnUseItemEvent_10245") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,4,s_getVar(uid,140,4) + 50000)
	s_sendNewSpecialItemTips(uid,ItemID_Special_AchievementPoint,50000)
    return VALUE_OK
end
