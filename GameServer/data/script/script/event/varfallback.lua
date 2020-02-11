--充值表中因为id变化导致领取状态发生错乱(主要是投资)
local PayTable =
{
	{80077,80078,80079,80080,80081,80082,80083},
	{80085,80086,80087,80088,80089,80090,80091},
	{80093,80094,80095,80096,80097,80098,80099,80100},
}

local UserTable =
{
	1026071,
	1026396,
	1026513,
	1027692,
	1027725,
	1029380,
	1029927,
	1029932,
	1029935,
	1029941,
	1030084,
	1031585,
	1032657,
	1032756,
	1033022,
	1033205,
	1033534,
	1033852,
	1034180,
	1034469,
	1034785,
	1034980,
	1034994,
	1035938,
	1036153,
	1036431,
	1036460,
	1036537,
	1036655,
	1037240,
	1037467,
	1038306,
	1041361,
	1041642,
}
function PayStateFallback(uid)
	--已经处理过了
	if s_getVar(uid, 260, 1) == 1 then
		return
	end

	local isfind = false
	for i, v in pairs(UserTable) do
		if v == uid then
			isfind = true
			break
		end
	end

	if isfind == false then
		s_setVar(uid, 260, 1, 1)
		return
	else
		for i, v in pairs(PayTable) do
			for j, m in pairs(v) do
				--s_trace("uid:"..uid..",m="..m)
				s_setVar(uid, 177, m, 0)
			end
		end
		s_setVar(uid, 260, 1, 1)
	end
end

--限时黑市,中立区var改变
function IsShoppingMallChange(key, base)
	--30249,20254为充值表中的ID
	if key >= base + 30249 and key <= base + 30254 then
		return 1
	end
	return 0
end
