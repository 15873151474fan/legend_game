--护盾碎片(小)
function OnUseItemEvent_10249(uid,thisid,targetid, number)   
if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10249") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,61,s_getVar(uid,140,61) + 5 * number)
	s_sendNewSpecialItemTips(uid,ItemID_Special_ShieldFragment,5 * number)
    return VALUE_OK
end
