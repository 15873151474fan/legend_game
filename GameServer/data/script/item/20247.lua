--翅膀直升2级符
function OnUseItemEvent_10247(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10247") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,60,s_getVar(uid,140,60) + 90)
    return VALUE_OK
end
