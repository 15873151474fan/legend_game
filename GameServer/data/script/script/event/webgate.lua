--网页推广奖励
function OnRequestWebGatePresent(uid,webtype)
	if webtype == 0 then
		s_addVar(uid,10001,11,s_getVar(uid,10001,11) + 1)
		if s_getVar(uid,10001,11) <= 20 then
			s_addMoney(uid,MoneyType_GoldTicket,100,"网页推广")
			local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
			if s_getVar(uid,10001,11) <= 2 then
				s_worldInfo("<p><q buttonid='6005' ownerid='" .. uid .."'>" .. name .. "</q><n color='GXColorBlueSky'>使用</n><dialog hotkeyid='66' text=网页推广/><n color='GXColorBlueSky'>获得100赠点奖励</n></p>",ChatPos_Sys + ChatPos_Honor)
			else
				s_sysInfo(uid,"使用网页推广获得100赠点奖励",ChatPos_Sys + ChatPos_Important)
			end
		elseif s_getVar(uid,10001,11) <= 200 then
			s_addMoney(uid,MoneyType_GoldTicket,20,"网页推广")
			s_sysInfo(uid,"使用网页推广获得20赠点奖励",ChatPos_Sys + ChatPos_Important)
		end
	else
		s_sysInfo(uid,"谢谢您的参与" )
	end
end

