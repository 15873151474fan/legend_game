--优惠状态数表
local favoState2RPType = {
    [24] = 205,       --超值礼包
    [27] = 208,       --投资返利
    [37] = 210,       --超值首充
    [38] = 209,       --百元首充
    [30] = 201,       --每日首充
    [32] = 202,       --首充豪礼
    [33] = 203,       --限时黑市
    [34] = 204,       -- VIP奖励
    [35] = 206,       --今日回馈
    [36] = 207,       --尊贵特权
}
--------------------------------------以下是优惠状态获取事件----------------------------------

function GetFavorableState(uid,dwid)
	if dwid == 37 or dwid == 38 then
		local point = GetRechargePoint(uid)
		if point == 0 and dwid == 37 and s_getVar(uid, 230,1) < 300 then
			return 0;
		elseif point == 2 and dwid == 37 then
			return 0;
		elseif point == 103 and dwid == 37 then
			return 0;
		elseif point == 104 and dwid == 38 then
			return 0;
		end

		return 1;
	end
    return s_rpUpdate(uid, favoState2RPType[dwid])
end




