--上下线金币分成

function OnGoldChildPresent(uid,child_num_1,child_num_2)
	local num = child_num_1 * 0.1 + child_num_2 * 0.05
	s_addMoney(uid,MoneyType_GoldTicket,num,"理财奖励")
	if num > 1000 then
		local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
		local country = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND)
		s_countryInfo(country,"<p><q buttonid=6005 ownerid=" .. uid .. ">".. name .."</q><n color=GXColorBlueSky>得到系统" .. num .."赠点理财奖励</n><book bookid=70229>[关于理财]</book></p></p>",ChatPos_Sys+ChatPos_Honor)
	end
end

