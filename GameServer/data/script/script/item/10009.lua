--装备锁
function OnUseItemEvent_10009(uid,thisid,targetid, number)
    local viplevel = s_getVIPLevel(uid)
    local usenum   = s_getVar(uid,164,9)
	local vipNum={10,20,30,40,50,60,70,80,90,100,120,150,200}
    if viplevel == 0  and usenum >= vipNum[1] then
        s_sysInfo(uid,"非VIP会员玩家每天只能使用10次",ChatPos_Tips)
        return VALUE_FAIL
    elseif viplevel == 1  and usenum >= vipNum[2] then
        s_sysInfo(uid,"VIP会员1每天只能使用20次",ChatPos_Tips)
        return VALUE_FAIL

    elseif viplevel == 2 and usenum >= vipNum[3] then
        s_sysInfo(uid,"VIP会员2每天只能使用30次",ChatPos_Tips)
        return VALUE_FAIL
    elseif viplevel == 3 and usenum >= vipNum[4] then
        s_sysInfo(uid,"VIP会员3每天只能使用40次",ChatPos_Tips)
        return VALUE_FAIL
    elseif viplevel == 4 and usenum >= vipNum[5] then
        s_sysInfo(uid,"VIP会员4每天只能使用50次",ChatPos_Tips)
        return VALUE_FAIL
    elseif viplevel == 5 and usenum >= vipNum[6] then
        s_sysInfo(uid,"VIP会员5每天只能使用60次",ChatPos_Tips)
        return VALUE_FAIL
    elseif viplevel == 6 and usenum >= vipNum[7] then
        s_sysInfo(uid,"VIP会员6每天只能使用70次",ChatPos_Tips)
        return VALUE_FAIL
    elseif viplevel == 7 and usenum >= vipNum[8] then
        s_sysInfo(uid,"VIP会员7每天只能使用80次",ChatPos_Tips)
        return VALUE_FAIL
    elseif viplevel == 8 and usenum >= vipNum[9] then
        s_sysInfo(uid,"VIP会员8每天只能使用90次",ChatPos_Tips)
        return VALUE_FAIL
    elseif viplevel == 9 and usenum >= vipNum[10] then
        s_sysInfo(uid,"VIP会员9每天只能使用100次",ChatPos_Tips)
        return VALUE_FAIL
    elseif viplevel == 10 and usenum >= vipNum[11] then
        s_sysInfo(uid,"VIP会员10每天只能使用120次",ChatPos_Tips)
        return VALUE_FAIL
    elseif viplevel == 11 and usenum >= vipNum[12] then
        s_sysInfo(uid,"VIP会员11每天只能使用150次",ChatPos_Tips)
        return VALUE_FAIL
    elseif viplevel == 12 and usenum >= vipNum[13] then
        s_sysInfo(uid,"VIP会员12每天只能使用200次",ChatPos_Tips)
        return VALUE_FAIL
    end
    local cannum = 0;
	cannum = vipNum[viplevel+1] - usenum
    if number < cannum then
        cannum = number
    end
	
	local canlock = s_canlocktime(uid,targetid)
	if canlock == 0 then
		return
	end
	local tm = s_getItemValue(uid,targetid,Item_Attribute_LockTime)
    if s_deleteItemByThisID(uid,thisid,cannum,"OnUseItemEvent_10009") ~= VALUE_OK then
        return VALUE_FAIL
    end
	s_setItemValue(uid,targetid,Item_Attribute_LockTime,60*60+tm)
	s_refreshItem(uid,targetid)
    s_addVar(uid,164,9,s_getVar(uid,164,9) + cannum)
	s_sysInfo(uid,"消耗装备锁，装备上锁成功",ChatPos_Tips)
    return VALUE_OK
end
