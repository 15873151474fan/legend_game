-- 羽毛
function OnUseItemEvent_19017(uid,thisid,targetid,number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_19017") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_debugUser(userid,">>>>>>>>>>>>>>消耗羽毛，加精华")
	s_setVar(uid,140,60,s_getVar(uid,140,60) + number)
	s_sendNewSpecialItemTips(uid,ItemID_Special_WingExp,number)
	s_checkWingRedPoint(uid)
    return VALUE_OK
end
