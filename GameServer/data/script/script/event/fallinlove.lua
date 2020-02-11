function OnFallInLove(uid,mode)
	local info = rawget(_G,"NpcMenuInfo198")
	if info ~= nil then
		local func = rawget(info,"Courtship"..mode)
		if func ~= nil and type(func) == "function" then
			func(info,uid)
		end
	end
	return VALUE_OK
end

function OnRetLoverCheckFriend(uid)
	local info = rawget(_G,"NpcMenuInfo198")
	if info ~= nil then
		local func = rawget(info,"FallInLove2")
		if func ~= nil and type(func) == "function" then
			func(info,uid)
		end
	end
	return VALUE_OK
end

function OnRetMarryCheckFriend(uid)
	local info = rawget(_G,"NpcMenuInfo199")
	if info ~= nil then
		local func = rawget(info,"Wedding2")
		if func ~= nil and type(func) == "function" then
			func(info,uid)
		end
	end
	return VALUE_OK
end

function OnMarryMe(uid,mode)
	local info = rawget(_G,"NpcMenuInfo199")
	if info ~= nil then
		local func = rawget(info,"Courtship"..mode)
		if func ~= nil and type(func) == "function" then
			func(info,uid)
		end
	end
	return VALUE_OK
end
