--5折礼券(玄印碎片)
function OnUseItemEvent_3008(uid,thisid)
    if s_removeMoney(uid,MoneyType_Gold,500, "5折礼券") == VALUE_FAIL then
        s_sysInfo("元宝不够，不能兑换",ChatPos_Tips)
        return VALUE_FAIL;
    end
    if s_deleteItemByThisID(uid,thisid,1,"5折礼券(玄印碎片)") ~= VALUE_OK then
        return VALUE_FAIL
    end

    s_addItem(uid,10225,0,1,0,"1-1","5折礼券(玄印碎片)")
    return VALUE_OK
end
