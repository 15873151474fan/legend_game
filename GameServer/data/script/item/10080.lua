--称号积分(内含25000贡献值)
function OnUseItemEvent_10080(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10080") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,5,s_getVar(uid,140,5) + 25000 * number)
	s_sendNewSpecialItemTips(uid,ItemID_Special_TitleFragment,25000 * number)
    return VALUE_OK
end
