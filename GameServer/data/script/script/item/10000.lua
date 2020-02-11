--技能残券
function OnUseItemEvent_10000(uid,thisid,targetid, number)
    if s_deleteItemByThisID(uid,thisid,number,"技能残券") ~= VALUE_OK then
        return VALUE_FAIL
    end

    s_setVar(uid,3,14,s_getVar(uid,3,14) + number)
    s_sysInfo(uid,"技能残巻值:"..number)
    return VALUE_OK
end
