--直升1级称号
function OnUseItemEvent_10246(uid,thisid)
    if s_deleteItemByThisID(uid,thisid,1,"OnUseItemEvent_10246") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,5,s_getVar(uid,140,5) + 50000)
	s_sendNewSpecialItemTips(uid,ItemID_Special_TitleFragment,50000)
    return VALUE_OK
end
