--进度条回调
function OnTaskBarEventCallBack(uid,call,tbreak)
	if call == nil then
		return
	end
	local func = StringToFunction(call)
	if tbreak == 1 then
		--需要处理打断的回调第二个参数为打断标志
		func(uid,tbreak)
	else
		func(uid,0)
	end
end
