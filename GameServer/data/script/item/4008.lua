--翅膀礼盒
function OnUseItemEvent_4008(uid,thisid)
	if s_deleteItemByThisID(uid,thisid,1,"翅膀礼盒8") ~= VALUE_OK then
			return VALUE_FAIL
	end

	local wing_id=290801		--翅膀baseid
	local yulingdan=10097--羽灵丹 baseid
	local yulingdan_num=630		--羽灵丹数量
	local ret = s_haveWing(uid,wing_id)
	if ret == 1 then
		s_setVar(uid,140,60,s_getVar(uid,140,60) + yulingdan_num)
		s_sendNewSpecialItemTips(uid,ItemID_Special_WingExp,yulingdan_num)
		s_checkWingRedPoint(uid)
	else	
		local ret2 = s_activeWing(uid,wing_id)
		if ret2 == 1 then
			s_sysInfo("激活了八阶翅膀",ChatPos_Tips)
		end
	end
	return VALUE_OK
end
