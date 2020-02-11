--直升2级称号
function OnUseItemEvent_10242(uid,thisid)
    if s_deleteItemByThisID(uid,thisid,1,"OnUseItemEvent_10242") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,5,s_getVar(uid,140,5) + 200000)
	s_sendNewSpecialItemTips(uid,ItemID_Special_TitleFragment,200000)
    return VALUE_OK
end
