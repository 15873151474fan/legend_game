--奖励领取兑换
function OnRequestMobileQQMailPresent(uid,channeltype,messagetype)
	if channeltype == 1 and messagetype == 101 then
		s_addMoney(uid,MoneyType_GoldTicket,100,"手机推广")
		local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
		s_worldInfo("<p><q buttonid='6005' ownerid='" .. uid .."'>" .. name .. "</q><n color='GXColorBlueSky'>使用</n><dialog hotkeyid='66' text=推广系统/><n color='GXColorBlueSky'>给朋友送上祝福，获得100赠点奖励</n></p>",ChatPos_Sys + ChatPos_Honor)
	elseif channeltype == 2 then
		s_sysInfo(uid,"谢谢您的参与" )
	elseif channeltype == 2 then
		s_sysInfo(uid,"谢谢您的参与" )
	end
end
