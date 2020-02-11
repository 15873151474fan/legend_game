--根据祈福次数，获得暴击倍率
function OnBlessGetTimes( blesstimes, viplevel)
	local maxPrayTime = GetMaxPrayTimes(viplevel)
	--s_debug("blesstimes="..blesstimes.."maxTimes="..maxPrayTime)
	if blesstimes > maxPrayTime then
		return -1;
	end 
	for i=1,table.getn(PrayDataBase)do
		local prayArr = PrayDataBase.query(i)
		if prayArr.pray_num == blesstimes then
			s_debug("multiple="..prayArr.multiple)
			return prayArr.multiple
		end
	end
	return 1
end

--获得祈福上限
function GetMaxPrayTimes( viplevel )
		local prayVIP = VipDataBase.query(viplevel)
		--s_debug("GetMaxPrayTimes, pray_maxnum::"..prayVIP.pray_num)
		return prayVIP.pray_num
end

--每次祈福需要消耗的金币数
function OnBlessNeedCostGold()
	--s_debug("OnBlessNeedCostGold................")
	local  cost = 5
    return cost
end

--每次祈福需要消耗的元宝数
function OnBlessNeedCostCoin()
	--s_debug("OnBlessNeedCostCoin................")
	local  cost = 5
    return cost
end

--每次祈福获得金币基数
function OnBlessBaseGetGold()
	--s_debug("OnBlessBaseGetGold................")
	local  getGold = 10
    return getGold
end

--每次祈福获得的元宝基数
function OnBlessBaseGetCoin()
	--s_debug("OnBlessNeedCostCoin................")
	local  getCoin = 50000
    return getCoin
end
