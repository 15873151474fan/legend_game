--摇颜色事件
function OnEndFreshColorEvent(uid, forcedoff)
	if UserCalls == nil then
		return
	end
	if UserCalls[uid] == nil then
		return
	end
	if UserCalls[uid].eventid ~= USER_EVENT_FRESH_COLOR then
		return
	end
	if UserCalls[uid].call == nil then
		return
	end
	if UserCalls[uid].call.uid ~= uid then
		return
	end
	UserCalls[uid].call.param_ext[2] = forcedoff
	UserCalls[uid].call:Exec()
	UserCalls[uid].call = nil
end
