--称号积分(内含25000贡献值)
function OnUseItemEvent_10078(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10078") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,5,s_getVar(uid,140,5) + 100000 * number)
	s_sendNewSpecialItemTips(uid,ItemID_Special_TitleFragment,100000 * number)
    return VALUE_OK
end
