--勋章碎片(小)获得1000点荣誉积分
function OnUseItemEvent_10077(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10077") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,4,s_getVar(uid,140,4) + 1000 * number)
	s_sendNewSpecialItemTips(uid,ItemID_Special_AchievementPoint,1000*number)
    return VALUE_OK
end
