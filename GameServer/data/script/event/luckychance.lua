--机缘
function openluckychance(uid)
	if 1 then return end
	s_debug("openluckychance ..uid %u",uid)
	local incchance = s_getVar(uid,169,86)
	local decchance = s_getVar(uid,169,87)
	local totalchance = 0
	local wdays = s_getCurTime(5)
	if wdays == 1 then
		wdays = 7 
	end
	local todaychance = ChanceGetLUADataBase.query(wdays) 
	if todaychance == nil then
		s_debug("openluckychance nil todaychance"..uid)
		return 0
	end 

	----测试
	--local xxxxchancerate = math.random(11,60) --配置表中最大值
	--s_addluckychance(uid,xxxxchancerate)
	--if 1 then return end
	----测试1
	--
	if incchance >= decchance then
		if incchance - decchance >= 20 then
			totalchance = todaychance.rate + 20 * 100
		else
			totalchance = todaychance.rate + (incchance - decchance) * 100
		end
	else
		local tmpchance	= 0
		if decchance - incchance >= 20 then
			tmpchance = 20 * 100
		else
			tmpchance = (decchance - incchance) * 100
		end
		if todaychance.rate <= tmpchance then
			s_debug("openluckychance tmp rate too low")
			return 0
		else
			totalchance = todaychance.rate - tmpchance
		end
	end

	local ratenum = math.random(1,10000) --配置表中最大值

	s_debug("openluckychance uid %u inc %u  del %u today %u totalchance %u ratenum %u",uid,incchance,decchance,todaychance.rate,totalchance,ratenum)

	if ratenum >= totalchance then
		s_debug("openluckychance rate finalrate too low")
		return 0
	end
	local chanceinfo = {}
	local uviplevel = s_getVIPLevel(uid)
	--s_debug(" >>>>>>>>>>>> getvip .."..uviplevel)
	for k,v in pairs (ChanceLUADataBase)do
		if type(v) == "table" then
			--s_debug(" >>>>>>>>>>>> getvip .."..v.vip .." ..index .. "..v.index)
			if v.vip == uviplevel then
				table.insert(chanceinfo,v)	
			end
		end
	end
	table.sort(chanceinfo, function(a, b) return a.rate < b.rate end)

	--for k,v in ipairs(chanceinfo) do
	--	if type(v) == "table"then
	--	s_debug(" 111pppp >>>>>>>>>>>>>..."..v.rate)
	--	end
	--end
	local chancerate = math.random(1,10000) --配置表中最大值
	local finalinfo = nil
	for k,v in ipairs(chanceinfo) do
		if type(v) == "table"then
			if chancerate > v.rate then
			else
				finalinfo = v
				break;
			end
		end
	end
	if finalinfo ~= nil and type(finalinfo) == "table" then
		s_addluckychance(uid,finalinfo.index)
		s_debug("openluckychance finalinfo is %u",finalinfo.index)
	else
		s_debug("openluckychance finalinfo is nil ")
	end

end
