--经验丹(中)
function OnUseItemEvent_10148(uid,thisid,targetid, number)
    local usenum = s_getVar(uid,164,6)
	local usenums=0
	local sysOpenDays = s_openServiceDay()
	if  sysOpenDays == 1 then
		usenums=100
	elseif	sysOpenDays == 2 then
		usenums= 125
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
    if cannum > 268 then
      --cannum = 268;
    end
    s_debug("cannum="..cannum)
    if s_deleteItemByThisID(uid,thisid,cannum,"OnUseItemEvent_10148") ~= VALUE_OK then
        return VALUE_FAIL
    end
    --s_refreshExp(uid,1000000 * cannum,ExpType_Item,0)
    s_refreshExp(uid,8000000 * cannum,ExpType_Show,0)
    s_setVar(uid,164,6,s_getVar(uid,164,6) + cannum)
    return VALUE_OK
end
