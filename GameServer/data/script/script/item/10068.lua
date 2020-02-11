--小袋金币
function OnUseItemEvent_10068(uid,thisid,targetid, number)
    local viplevel = s_getVIPLevel(uid)
    local usenum   = s_getVar(uid,164,1)
    if viplevel == 0  and usenum >= 20 then
        s_sysInfo(uid,"非VIP会员玩家每天只能使用20次",ChatPos_Tips)
        return VALUE_FAIL
    elseif viplevel == 1  and usenum >= 30 then
        s_sysInfo(uid,"VIP会员1每天只能使用30次",ChatPos_Tips)
        return VALUE_FAIL

    elseif viplevel == 2 and usenum >= 50 then
        s_sysInfo(uid,"VIP会员2每天只能使用50次",ChatPos_Tips)
        return VALUE_FAIL
    elseif viplevel == 3 and usenum >= 70 then
        s_sysInfo(uid,"VIP会员3每天只能使用70次",ChatPos_Tips)
        return VALUE_FAIL
    elseif viplevel == 4 and usenum >= 100 then
        s_sysInfo(uid,"VIP会员4每天只能使用100次",ChatPos_Tips)
        return VALUE_FAIL
    elseif viplevel == 5 and usenum >= 150 then
        s_sysInfo(uid,"VIP会员5每天只能使用150次",ChatPos_Tips)
        return VALUE_FAIL
    elseif viplevel == 6 and usenum >= 200 then
        s_sysInfo(uid,"VIP会员6每天只能使用200次",ChatPos_Tips)
        return VALUE_FAIL
    elseif viplevel == 7 and usenum >= 300 then
        s_sysInfo(uid,"VIP会员7每天只能使用300次",ChatPos_Tips)
        return VALUE_FAIL
    elseif viplevel == 8 and usenum >= 400 then
        s_sysInfo(uid,"VIP会员8每天只能使用400次",ChatPos_Tips)
        return VALUE_FAIL
    elseif viplevel == 9 and usenum >= 500 then
        s_sysInfo(uid,"VIP会员9每天只能使用500次",ChatPos_Tips)
        return VALUE_FAIL
    elseif viplevel == 10 and usenum >= 600 then
        s_sysInfo(uid,"VIP会员10每天只能使用600次",ChatPos_Tips)
        return VALUE_FAIL
    elseif viplevel == 11 and usenum >= 800 then
        s_sysInfo(uid,"VIP会员11每天只能使用800次",ChatPos_Tips)
        return VALUE_FAIL
    elseif viplevel == 12 and usenum >= 1000 then
        s_sysInfo(uid,"VIP会员12每天只能使用1000次",ChatPos_Tips)
        return VALUE_FAIL
    end
    local cannum = 0;
    if viplevel == 0 then
        cannum = 20 - usenum
    elseif viplevel == 1 then
        cannum = 30 - usenum
    elseif viplevel == 2 then
        cannum = 50 - usenum
    elseif viplevel == 3 then
        cannum = 70 - usenum
    elseif viplevel == 4 then
        cannum = 100 - usenum
    elseif viplevel == 5 then
        cannum = 150 - usenum
    elseif viplevel == 6 then
        cannum = 200 - usenum
    elseif viplevel == 7 then
        cannum = 300 - usenum
    elseif viplevel == 8 then
        cannum = 400 - usenum
    elseif viplevel == 9 then
        cannum = 500 - usenum
    elseif viplevel == 10 then
        cannum = 600 - usenum
    elseif viplevel == 11 then
        cannum = 800 - usenum
    elseif viplevel == 12 then
        cannum = 1000 - usenum
    end

    if number < cannum then
        cannum = number
    end

    if s_deleteItemByThisID(uid,thisid,cannum,"OnUseItemEvent_10068") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_addMoneyMe(uid,MoneyType_MoneyTicket,100000 * cannum,"使用银两袋",AddItemAction_UseItem)
    s_addVar(uid,164,1,s_getVar(uid,164,1) + cannum)
    return VALUE_OK
end
