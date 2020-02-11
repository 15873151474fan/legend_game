--QQ有缘人

function OnWeiBoPresent(uid,followers,statuses)
	s_addMoney(uid,MoneyType_GoldTicket,1000,"微博赠送")
	s_sysInfo(uid,"<p><n color=GXColorGreen>绑定微博成功，您将会获得系统赠送赠点奖励，赠点可在</n><dialog hotkeyid=16 text=赠点商店/><n color=GXColorGreen>消费。</n></p>",ChatPos_Sys + ChatPos_Important);
	local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
	local country = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND)
	s_countryInfo(country,"<p><q buttonid=6005 ownerid=" .. uid .. ">" .. name .. "</q><n color=GXColorGreen>已经</n><dialog hotkeyid=1 text=绑定 tabid=1-2/><n color=GXColorGreen>了新浪微博，轻松获取系统奖励的1000赠点！</n><book bookid=70001>[关于微博]</book></p>",ChatPos_Sys+ChatPos_Honor)
end

