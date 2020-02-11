--飞升神力丹
function OnUseItemEvent_16007(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_16007") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,59,s_getVar(uid,140,59) + 50000 * number)
	s_sendNewSpecialItemTips(uid,ItemID_HorseUp_ExpPowder,50000 * number)
    return VALUE_OK
end
