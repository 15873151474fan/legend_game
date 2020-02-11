--玄印碎片(小)
function OnUseItemEvent_10223(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10223") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,2,s_getVar(uid,140,2) + 1*number)
	s_sendNewSpecialItemTips(uid,ItemID_Special_PearlFragment,1*number)
    return VALUE_OK
end
