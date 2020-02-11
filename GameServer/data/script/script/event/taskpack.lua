--任务包裹回调
function OnDealTaskPackage(call,uid,baseid,thisid,num)
	if call == nil or call == "" then
		return
	end
	local func = StringToFunction(call)
	if func ~= nil then
		func(uid,baseid,thisid,num)
	end
end

--二格包裹回调
function OnDealTaskPackage2(call,uid,thisid1,thisid2)
	if call == nil or call == "" then
		return
	end
	local func = StringToFunction(call)
	if func ~= nil then
		func(uid,thisid1,thisid2)
	end
end

--九格包裹回调
function OnDealNinePackage(call,uid,item1,item2,item3,item4,item5,item6,item7,item8,item9)
	if call == nil or call == "" then
		return
	end

	if type(call) == "function" then
		call(uid,pack(item1,item2,item3,item4,item5,item6,item7,item8,item9))
	elseif type(call) == "string" then
		local func = StringToFunction(call)
		if func ~= nil then
			func(uid,item1,item2,item3,item4,item5,item6,item7,item8,item9)
		end
	end
end
