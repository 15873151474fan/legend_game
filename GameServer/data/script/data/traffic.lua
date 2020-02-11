--交通方式附加属性定义
--交通方式定义具体参见 lib/define.lua
--目前只有一个属性
--采集  0-不可采集,当前交通方式下不可采集
--      1-可以直接采集，动作互斥不予考虑
--      2-可以采集，系统直接强制退出当前交通方式，然后采集
TrafficData =
{
	gatherinfo =
	{
		{traffic = 1,  value = 2,	tip = "骑乘"},
		{traffic = 2,  value = 0,	tip = "合体"},
		{traffic = 3,  value = 0,	tip = "团魔甲"},
		{traffic = 4,  value = 0,	tip = "极速狂飙"},
		{traffic = 5,  value = 0,	tip = "极速狂飙"},
		{traffic = 6,  value = 0,	tip = "跳舞"},
		{traffic = 7,  value = 0,	tip = "跳舞"},
		{traffic = 8,  value = 2,	tip = "变身"},
		{traffic = 9,  value = 2,	tip = "骑乘"},
		{traffic = 10,  value = 0,	tip = "变身"},
		{traffic = 11,  value = 2,	tip = "骑乘"},
	}
}

function CheckCanGatherByTraffic(uid)
	local traffic = s_getTrafficType(uid)
	if traffic == 0 then
		return VALUE_OK
	end
	local info = TrafficData.gatherinfo
	if info == nil then
		return VALUE_FAIL,""
	end
	for i = 1 , table.getn(info) do
		if traffic == info[i].traffic then
			if info[i].value == 0 then
				return VALUE_FAIL, info[i].tip
			elseif info[i].value == 1 then
				return VALUE_OK
			elseif info[i].value == 2 then
				s_resetTrafficType(uid)
				return VALUE_OK
			end
			break
		end
	end
	return VALUE_FAIL, ""
end
