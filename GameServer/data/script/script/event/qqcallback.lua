--QQ有缘人

function OnQQCallBackPresent(uid)
	s_addItem(uid,10,3,5,0,"1-1","QQ有缘人")
	local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
	local country = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND)
	s_countryInfo(country,"<p><n color=GXColorBlueSky>经过百般努力,</n><q buttonid=6005 ownerid=" .. uid .. ">".. name .."</q><n color=GXColorBlueSky>终于找到了有缘人,连系统都感动地获得500赠点奖励</n><dialog hotkeyid=93 text=我也试试/></p>",ChatPos_Sys+ChatPos_Honor)
end
function OnQQCallBackedPresent(uid)
	s_addItem(uid,10,3,5,0,"1-1","QQ有缘人回归")
	s_addItem(uid,55104,3,1,0,"1-1","QQ有缘人回归")
	local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
	local country = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND)
	s_countryInfo(country,"<p><n color=GXColorBlueSky>经过百般努力,</n><q buttonid=6005 ownerid=" .. uid .. ">".. name .."</q><n color=GXColorBlueSky>受有缘人邀请，再次回到兵王2世界，并获得500赠点和老兵荣誉勋章奖励</n><dialog hotkeyid=93 text=QQ有缘人/></p>",ChatPos_Sys+ChatPos_Honor)
end

