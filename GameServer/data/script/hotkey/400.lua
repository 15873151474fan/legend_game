function OnHotKeyID_400(uid)
	local msg = "是否离开副本？"
	local buttons = "确定|3|Enter|取消|4|Esc"
	local call = "CallBack_OnHotKeyID_400($1,$2)"
	s_registerMsgBox(uid,call,buttons,msg,300)
end

function CallBack_OnHotKeyID_400(uid,result)
	if result ~= Button_Yes then
		return
	end
	local country = s_getVar(uid,2,1)
	local map = s_getVar(uid,2,2)
	local x = s_getVar(uid,2,3)
	local y = s_getVar(uid,2,4)
	s_gomap(uid,country,map,x,y)
end
