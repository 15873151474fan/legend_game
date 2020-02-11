--重新选择宝箱事件
function OnPalaceReselectEvent(uid,times,price)
	if times == 0 then
		s_reselectPalaceItem(uid)
		return VALUE_OK
	end
	local func = string.format("OnReselectHeziPalace(%u,$2,%u,%u)",uid,times,price)
	local msg = "再来一次，需要消耗".. price * times.."文金币,是否继续?"
	s_registerMsgBox(uid,func,"确定|3|Enter|取消|5|Esc",msg)
	return VALUE_OK
end

function OnReselectHeziPalace(uid,result,times,price)
	if result == Button_Yes then
		if s_removeMoney(uid,MoneyType_Gold,times * price, "刷新宝箱") == VALUE_OK then
			s_reselectPalaceItem(uid)
		else
			s_sysInfo(uid,"金币不足")
		end
	end
end

