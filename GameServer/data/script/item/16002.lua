--坐骑丹
function OnUseItemEvent_16002(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_16002") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,59,s_getVar(uid,140,59) + 10 * number)
	s_sendNewSpecialItemTips(uid,ItemID_HorseUp_ExpPowder,10 * number)
    return VALUE_OK
end

