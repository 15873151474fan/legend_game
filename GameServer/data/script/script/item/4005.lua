--翅膀礼盒
function OnUseItemEvent_4005(uid,thisid)
	if s_deleteItemByThisID(uid,thisid,1,"翅膀礼盒5") ~= VALUE_OK then
			return VALUE_FAIL
	end
	s_trace("使用翅膀蛋ing..........")
	local yulingdan=10097		--羽灵丹 baseid
	local yulingdan_num=450		--羽灵丹数量
    s_addItem(uid,yulingdan,0,yulingdan_num,0,"1-1","翅膀蛋")
	return VALUE_OK
end
