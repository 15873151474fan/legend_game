--经验丹(大)
function OnUseItemEvent_10149(uid,thisid,targetid, number)
    local usenum = s_getVar(uid,164,7)
	local usenums=0
	local sysOpenDays = s_openServiceDay()
	if  sysOpenDays == 1 then
		usenums= 50
	elseif	sysOpenDays == 2 then
		usenums= 60
	else
		usenums=9999999
	end
    if  usenum >= usenums then
        s_sysInfo(uid,"每日只能使用" .. usenums .. "次",ChatPos_Tips,ChatPos_Tips)
        return VALUE_FAIL
    end
    local cannum = usenums - usenum;
    if number < cannum then
        cannum = number;
    end
    if cannum  > 178 then
        --cannum = 178;
    end
    s_debug("cannum="..cannum)
    if s_deleteItemByThisID(uid,thisid,cannum,"OnUseItemEvent_10149") ~= VALUE_OK then
        return VALUE_FAIL
    end
    s_debug("exp item"..cannum*12000000)
    --s_refreshExp(uid,12000000 * cannum,ExpType_Item,0)
    s_refreshExp(uid,12000000 * cannum,ExpType_Show,0)
    s_setVar(uid,164,7,s_getVar(uid,164,7) + cannum)
    return VALUE_OK
end
