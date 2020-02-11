--称号积分(小)(内含500贡献值)
function OnUseItemEvent_10076(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10076") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,5,s_getVar(uid,140,5) + 500 * number)
	s_sendNewSpecialItemTips(uid,ItemID_Special_TitleFragment,500*number)
    return VALUE_OK
end
