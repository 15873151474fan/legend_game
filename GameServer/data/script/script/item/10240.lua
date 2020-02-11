--直升1级玄印
function OnUseItemEvent_10240(uid,thisid)
    if s_deleteItemByThisID(uid,thisid,1,"OnUseItemEvent_10240") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,2,s_getVar(uid,140,2) + 90)
	s_sendNewSpecialItemTips(uid,ItemID_Special_PearlFragment,90)
    return VALUE_OK
end
