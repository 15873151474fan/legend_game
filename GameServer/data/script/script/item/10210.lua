--温神莲碎片(小)
function OnUseItemEvent_10210(uid,thisid,targetid, number)
    s_debug("OnUseItemEvent_10210  num="..number.."id="..targetid)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10210") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,1,s_getVar(uid,140,1) + 2 * number)
    s_sendNewSpecialItemTips(uid,ItemID_Special_DiamondFragment,2 * number)
    return VALUE_OK
end
