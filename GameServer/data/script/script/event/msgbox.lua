--消息框回调
function OnMSGBoxEvent(func,uid,result)
	local call = StringToFunction(func)
	if call ~= nil then
		call(uid,result)
	end
end

--输入框回调
function OnInputBoxEvent(func,uid,content)
	--[[
	local call = rawget(_G,func)
	if call == nil or type(call) ~= "function" then
	s_debug("回调函数:"..func.."不是全局函数")
	return
	end
	call(uid,content)
	]]
	if InputCalls == nil then
		return
	end
	local call = InputCalls[uid]
	if call == nil then
		return
	end
	if call.uid ~= uid then
		s_debug("回调对象的目标ID不匹配:OnInputBoxEvent")
		return
	end
	call.param_ext = { content}
	call:Exec()
end

--读书框回调
function OnBookBoxEvent(func,uid,result)
	local call = StringToFunction(func)
	if call ~= nil then
		call(uid,result)
	end
end
