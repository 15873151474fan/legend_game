--圣诞节充值反馈活动
function OnRedeemGoldEvent_ChristmasGold(uid,goldnum)
	local country = s_getCountryVar(13,14,7)
	if country == 0 then
		return VALUE_FAIL
	end
	if country == 1 then
		local curGoldNum = s_getVar(uid,1,13) + goldnum
		if curGoldNum >= 5000 and s_getVar(uid,116,214) == 0 then
			s_sysMail(uid,"每日累计充值送好礼：您今日累计充值达5000金币,已额外返还1000绑银以纪念币道具的形式发送到您的包裹里了，请注意查收！（活动期间每天累计充值越多返还的越多哦！）",0,0,0,"",0,"累计充值")
			--s_addMoney(uid,MoneyType_Gold,500,"累计充值送好礼",MoneyActionTypeAdd_Mail)
			s_addItem(uid,55323,3,1,0,"1-1","累计充值送好礼")
			s_setVar(uid,116,214,1)
		end

		if curGoldNum >= 10000 and s_getVar(uid,116,214) == 1 then
			s_sysMail(uid,"每日累计充值送好礼：您今日累计充值达10000金币,已额外返还3000绑银以纪念币道具的形式发送到您的包裹里了，请注意查收！（活动期间每天累计充值越多返还的越多哦！）",0,0,0,"",0,"累计充值")
			--s_addMoney(uid,MoneyType_Gold,1200,"累计充值送好礼",MoneyActionTypeAdd_Mail)
			s_addItem(uid,55323,3,3,0,"1-1","累计充值送好礼")
			s_setVar(uid,116,214,2)
		end

		if curGoldNum >= 20000 and s_getVar(uid,116,214) == 2 then
			s_sysMail(uid,"每日累计充值送好礼：您今日累计充值达20000金币,已额外返还7000绑银以纪念币道具的形式发送到您的包裹里了，请注意查收！（活动期间每天累计充值越多返还的越多哦！）")
			--s_addMoney(uid,MoneyType_Gold,3500,"累计充值送好礼",MoneyActionTypeAdd_Mail)
			s_addItem(uid,55323,3,7,0,"1-1","累计充值送好礼")
			s_setVar(uid,116,214,3)
		end

		if curGoldNum >= 50000 and s_getVar(uid,116,214) == 3 then
			s_sysMail(uid,"每日累计充值送好礼：您今日累计充值达50000金币,已额外返还21000绑银以纪念币道具的形式发送到您的包裹里了，请注意查收！（活动期间每天累计充值越多返还的越多哦！）",0,0,0,"",0,"累计充值")
			--s_addMoney(uid,MoneyType_Gold,8000,"累计充值送好礼",MoneyActionTypeAdd_Mail)
			s_addItem(uid,55323,3,21,0,"1-1","累计充值送好礼")
			s_setVar(uid,116,214,4)
		end

		if curGoldNum >= 100000 and s_getVar(uid,116,214) == 4 then
			s_sysMail(uid,"每日累计充值送好礼：您今日累计充值达100000金币,已额外返还48000绑银以纪念币道具的形式发送到您的包裹里了，请注意查收！（活动期间每天累计充值越多返还的越多哦！）",0,0,0,"",0,"累计充值")
			--s_addMoney(uid,MoneyType_Gold,18000,"累计充值送好礼",MoneyActionTypeAdd_Mail)
			s_addItem(uid,55323,3,48,0,"1-1","累计充值送好礼")
			s_setVar(uid,116,214,5)
		end

		if curGoldNum >= 200000 and s_getVar(uid,116,214) == 5 then
			s_sysMail(uid,"每日累计充值送好礼：您今日累计充值达200000金币,已额外返还108000绑银以纪念币道具的形式发送到您的包裹里了，请注意查收！（活动期间每天累计充值越多返还的越多哦！）",0,0,0,"",0,"累计充值")
			--s_addMoney(uid,MoneyType_Gold,50000,"累计充值送好礼",MoneyActionTypeAdd_Mail)
			s_addItem(uid,55323,3,108,0,"1-1","累计充值送好礼")
			s_setVar(uid,116,214,6)
		end
	end
end
