--坐骑直升2级符(超过2级时，获得1200点经验，
function OnUseItemEvent_10248(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"OnUseItemEvent_10248") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_setVar(uid,140,59,s_getVar(uid,140,59) + 1200)
    return VALUE_OK
end
