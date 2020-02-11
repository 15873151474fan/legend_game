--QQ有缘人

function OnTeacherRewardPresent(uid,score)
	if score > 3 then
		s_debug("发现非法的打赏奖励" .. score)
	end
	s_addItem(uid,10,3,5 * score,0,"1-1","打赏辅导员")
	local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
	local country = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND)
	s_countryInfo(country,"<p><n color=GXColorBlueSky>因学员结业好评,</n><q buttonid=6005 ownerid=" .. uid .. ">".. name .."</q><n color=GXColorBlueSky>得到系统" .. score * 500 .."赠点打赏</n><book bookid=70189>[关于辅导员]</book></p></p>",ChatPos_Sys+ChatPos_Honor)
end

