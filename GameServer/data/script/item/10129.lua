--飞升丹
function OnUseItemEvent_10129(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10129") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,6,s_getVar(uid,140,6) + 1000 * number)
	s_sendNewSpecialItemTips(uid,ItemID_Special_RebirthPoint,1000 * number)
    return VALUE_OK
end
