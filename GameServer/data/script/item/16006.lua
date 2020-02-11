--坐骑丹(高级)
function OnUseItemEvent_16006(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_16006") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,59,s_getVar(uid,140,59) + 2000 * number)
	s_sendNewSpecialItemTips(uid,ItemID_HorseUp_ExpPowder,2000 * number)
    return VALUE_OK
end
