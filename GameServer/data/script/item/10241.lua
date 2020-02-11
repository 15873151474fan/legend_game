--直升2级玄印
function OnUseItemEvent_10241(uid,thisid)
    if s_deleteItemByThisID(uid,thisid,1,"OnUseItemEvent_10241") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,4,s_getVar(uid,140,4) + 200000)
	s_sendNewSpecialItemTips(uid,ItemID_Special_AchievementPoint,200000)
    return VALUE_OK
end
