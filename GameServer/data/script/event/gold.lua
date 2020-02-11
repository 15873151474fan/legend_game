--玩家等级提升事件
function OnRequestGoldPresentEvent(uid)
	local info =

			{
				talk = "<p><n>  各种福利，让您获得更佳游戏体验。</n></p><p><vipcolor/><n>  （定期关注，会有惊喜哦！）</n></p>",
				button = {
					--{"清除绑银使用上限（每天1次）(2,0,1)","OnResetMoneyTicketDaily($1)"},
					{"领取每日军衔工资(2)","NpcMenuInfo135:DealGetPay($1)",},
					--	{"领取1元超值礼包(2)","OnGetGoldPresentEvent($1,1)","ShowGoldPresentEvent($1,1)"},
					--	{"领取10元超值礼包(2)","OnGetGoldPresentEvent($1,2)","ShowGoldPresentEvent($1,2)"},
					--	{"领取30元超值礼包(2)","OnGetGoldPresentEvent($1,3)","ShowGoldPresentEvent($1,3)"},
					{"购买10个潘多拉的魔盒（需1000金币）(2)","OpenHotkeyDialog($1,16,100,2,111,1)","ShowPlayGoldBox($1)"},
					{"领取每周回馈福利(2)","s_openGoldReturn($1,1)"},
					{"领取每月回馈福利(2)","s_openGoldReturn($1,2)"},
					{"领取每月VIP福利(2)","s_openGoldReturn($1,3)"},
					{"领取七天闯关福利(2)","OnSevenDayPresentEvent($1)"},
					{"兑换幸运礼券（需200赠点）(2)","OnBuyLotteryDailyItem($1)","ShowBuyLotteryDailyItem($1)"},
					{"查看中奖名单(2,0)","OnRequestLotteryHistory($1)"},
					{"查看我的理财(2)","s_openGoldChild($1)"},
				},
			}
	ShowNpcMenuByTable(uid,info,1)
end

--福利宝箱
--
function ShowPlayGoldBox(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if s_getVar(uid,116,48) ~= 0 then
		s_sysInfo(uid,"您今天已经购买过福利宝箱")
		return VALUE_FAIL
	end
	if level <= 60 then
		return VALUE_FAIL
	end
	return VALUE_OK
end

function GetPayGoldBox(uid)
	if s_getVar(uid,116,48) ~= 0 then
		s_sysInfo(uid,"您今天已经购买过福利宝箱")
		return VALUE_FAIL
	end
	local msg = "你确定要购买10个潘多拉魔盒吗？"
	local buttons = "确定|3|Enter|取消|4|Esc"
	local call = "DealGetPayGoldBox($1,$2,$3)"
	s_registerMsgBox(uid,call,buttons,msg,300)
	return VALUE_OK
end

function DealGetPayGoldBox(uid,result,baseid)
	if result ~= Button_Yes then
		return
	end
	if s_removeMoney(uid,MoneyType_Gold,1000,"潘多拉魔盒") == VALUE_FAIL then
		s_sysInfo(uid,"您身上的金币不足1000金币")
		return
	end
	s_addVar(uid,116,48,1)
	s_addItem(uid,34168,3,10,0,"1-1","1000金币购买")
	RefreshTaskDailyInfo(uid, 49115)
	local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
	local homeland = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND)
	s_countryInfo(homeland,"<p><n>【系】"..name.."</n><n>在福利领取中成功兑换了10个潘多拉的魔盒</n></p>",ChatPos_Sys + ChatPos_Honor)
end

--团福利回馈
function ShowGoldPresentEvent(uid,ptype)
	if ptype == 1 then
		if s_getVar(uid,114,10) ~= 0 then
			return VALUE_FAIL
		end
	elseif ptype == 2 then
		if s_getVar(uid,114,10) ~= 1 then
			return VALUE_FAIL
		end
	else
		if s_getVar(uid,114,10) ~= 2 then
			return VALUE_FAIL
		end
	end
	return VALUE_OK
end
function OnGetGoldPresentEvent(uid,ptype)
	if ptype == 1 then
		if s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_ALL_REDEEM) < 100 then
			s_sysInfo(uid,"<p><n>您的充值没有超过</n><n color='GXColorGreen'>1元</n><n>，无法领取礼包。是否立即</n><dialog hotkeyid='15' text='充值'/><book bookid='70007'>[关于金币]</book></p>")
			return
		end
		local msg = "<p><n>   支付</n><n color='GXColorGreen'>100金币</n><n>，即可获得下列所有道具，每个角色</n><n color='GXColorGreen'>只有一次机会</n><n>是否领取?</n><newline/><n color='GXColorYellow'>  （滚动鼠标，查看所有奖励）</n><newline/><object id='32034' num='1' parameter='quality=0'/></p>"		local call = "OnGetGoldPresentEvent_1("..uid..","..ptype..")"
		ShowNpcMenuBottomStyle(uid,msg,"领取(3)",call,"离开(3)")
	elseif ptype == 2 then
		if s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_ALL_REDEEM) < 1000 then
			s_sysInfo(uid,"<p><n>您的充值没有超过</n><n color='GXColorGreen'>10元</n><n>，无法领取礼包。是否立即</n><dialog hotkeyid='15' text='充值'/><book bookid='70007'>[关于金币]</book></p>")
			return
		end
		local msg = "<p><n>   支付</n><n color='GXColorGreen'>1000金币</n><n>，即可获得下列所有道具，每个角色</n><n color='GXColorGreen'>只有一次机会</n><n>是否领取?</n><newline/><n color='GXColorYellow'>  （滚动鼠标，查看所有奖励）</n><newline/><object id='32035' num='1' parameter='quality=0'/></p>"
		--local msg = "<p><n>   支付</n><n color='GXColorGreen'>1000金币</n><n>，即可获得下列所有道具，每个角色</n><n color='GXColorGreen'>只有一次机会</n><n>是否领取?</n><newline/><n color='GXColorYellow'>  （滚动鼠标，查看所有奖励）</n><newline/><object id='26102' num='10' parameter='quality=0'/><newline/><object id='34113' num='2' parameter='quality=0'/><newline/><object id='47001' num='5' parameter='quality=0'/><newline/><object id='26130' num='30' parameter='quality=0'/><newline/><object id='31124' num='3' parameter='quality=2'/></p>"
		local call = "OnGetGoldPresentEvent_1("..uid..","..ptype..")"
		ShowNpcMenuBottomStyle(uid,msg,"领取(3)",call,"离开(3)")
	else
		if s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_ALL_REDEEM) < 3000 then
			s_sysInfo(uid,"<p><n>您的充值没有超过</n><n color='GXColorGreen'>30元</n><n>，无法领取礼包。是否立即</n><dialog hotkeyid='15' text='充值'/><book bookid='70007'>[关于金币]</book></p>")
			return
		end
		local msg = "<p><n>   支付</n><n color='GXColorGreen'>3000金币</n><n>，即可获得下列所有道具，每个角色</n><n color='GXColorGreen'>只有一次机会</n><n>是否领取?</n><newline/><n color='GXColorYellow'>  （滚动鼠标，查看所有奖励）</n><newline/><object id='32036' num='1' parameter='quality=0'/></p>"
		--local msg = "<p><n>   支付</n><n color='GXColorGreen'>3000金币</n><n>，即可获得下列所有道具，每个角色</n><n color='GXColorGreen'>只有一次机会</n><n>是否领取?</n><newline/><n color='GXColorYellow'>  （滚动鼠标，查看所有奖励）</n><newline/><object id='26102' num='30' parameter='quality=0'/><newline/><object id='34113' num='4' parameter='quality=0'/><newline/><object id='47001' num='10' parameter='quality=0'/><newline/><object id='26130' num='50' parameter='quality=0'/><newline/><object id='31145' num='2' parameter='quality=2'/><newline/><object id='29066' num='3' parameter='quality=2'/><newline/><object id='26128' num='30' parameter='quality=0'/></p>"
		local call = "OnGetGoldPresentEvent_1("..uid..","..ptype..")"
		ShowNpcMenuBottomStyle(uid,msg,"领取(3)",call,"离开(3)")
	end
end

function OnGetGoldPresentEvent_1(uid,ptype)
	if ptype == 1 then
		if s_removeMoney(uid,MoneyType_Gold,100,"1元礼包",MoneyActionTypeRemove_Present) == VALUE_FAIL then
			s_sysInfo(uid,"您身上的金币不够")
			return
		end
		s_addVar(uid,114,10,1)
		s_addItem(uid,32034,0,1,0,"1-1","充值礼包")
	elseif ptype == 2 then
		if s_removeMoney(uid,MoneyType_Gold,1000,"10元礼包",MoneyActionTypeRemove_Present) == VALUE_FAIL then
			s_sysInfo(uid,"您身上的金币不够")
			return
		end
		s_addVar(uid,114,10,2)
		s_addItem(uid,32035,0,1,0,"1-1","充值礼包")
	elseif ptype == 3 then
		if s_removeMoney(uid,MoneyType_Gold,3000,"30元礼包",MoneyActionTypeRemove_Present) == VALUE_FAIL then
			s_sysInfo(uid,"您身上的金币不够")
			return
		end
		s_addVar(uid,114,10,3)
		s_addItem(uid,32036,0,1,0,"1-1","充值礼包")
	end
end
function OnRequestMonthGoldPresentEvent(uid,index)
	if s_getVar(uid,6,index) == s_getCurTime(TIME_ALLMONTHS)  then
		s_sysInfo(uid,"您已经兑换过此礼包了",ChatPos_MsgBox)
		return
	end
	local value = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_MONTH_REDEEM)
	if index == 1 and value >= 0 then
		s_addItem(uid,33507,0,1,0,"1-1","充值月礼包")
		s_addVar(uid,6,index,s_getCurTime(TIME_ALLMONTHS))
		s_addCountryVar(13,6,index,s_getCountryVar(13,6,index)+1)
		return
	end
	if index == 2 and value >= 0 then
		if s_removeMoney(uid,MoneyType_Gold,2000,"充值月礼包",MoneyActionTypeRemove_Present) == VALUE_FAIL then
			s_sysInfo(uid,"您身上的金币不够")
			return
		end
		s_addItem(uid,33001,0,1,0,"1-1","充值月礼包")
		s_addVar(uid,6,index,s_getCurTime(TIME_ALLMONTHS))
		s_addCountryVar(13,6,index,s_getCountryVar(13,6,index)+1)
		return
	end
	if index == 3 and value >= 3000 then
		s_addItem(uid,33508,0,1,0,"1-1","充值月礼包")
		s_addVar(uid,6,index,s_getCurTime(TIME_ALLMONTHS))
		s_addCountryVar(13,6,index,s_getCountryVar(13,6,index)+1)
		return
	end
	if index == 4 and value >= 3000 then
		if s_removeMoney(uid,MoneyType_Gold,2000,"充值月礼包",MoneyActionTypeRemove_Present) == VALUE_FAIL then
			s_sysInfo(uid,"您身上的金币不够")
			return
		end
		s_addItem(uid,33001,0,1,0,"1-1","充值月礼包")
		s_addVar(uid,6,index,s_getCurTime(TIME_ALLMONTHS))
		s_addCountryVar(13,6,index,s_getCountryVar(13,6,index)+1)
		return
	end
	if index == 5 and value >= 5000 then
		s_addItem(uid,33509,0,1,0,"1-1","充值月礼包")
		s_addVar(uid,6,index,s_getCurTime(TIME_ALLMONTHS))
		s_addCountryVar(13,6,index,s_getCountryVar(13,6,index)+1)
		return
	end
	if index == 6 and value >= 5000 then
		if s_removeMoney(uid,MoneyType_Gold,2000,"充值月礼包",MoneyActionTypeRemove_Present) == VALUE_FAIL then
			s_sysInfo(uid,"您身上的金币不够")
			return
		end
		s_addItem(uid,33001,0,1,0,"1-1","充值月礼包")
		s_addVar(uid,6,index,s_getCurTime(TIME_ALLMONTHS))
		s_addCountryVar(13,6,index,s_getCountryVar(13,6,index)+1)
		return
	end
	if index == 7 and value >= 10000 then
		s_addItem(uid,33510,0,1,0,"1-1","充值月礼包")
		s_addVar(uid,6,index,s_getCurTime(TIME_ALLMONTHS))
		s_addCountryVar(13,6,index,s_getCountryVar(13,6,index)+1)
		return
	end
	if index == 8 and value >= 10000 then
		if s_removeMoney(uid,MoneyType_Gold,2000,"充值月礼包",MoneyActionTypeRemove_Present) == VALUE_FAIL then
			s_sysInfo(uid,"您身上的金币不够")
			return
		end
		s_addItem(uid,33001,0,1,0,"1-1","充值月礼包")
		s_addVar(uid,6,index,s_getCurTime(TIME_ALLMONTHS))
		s_addCountryVar(13,6,index,s_getCountryVar(13,6,index)+1)
		return
	end
	if index == 9 and value >= 20000 then
		s_addItem(uid,33511,0,1,0,"1-1","充值月礼包")
		s_addVar(uid,6,index,s_getCurTime(TIME_ALLMONTHS))
		s_addCountryVar(13,6,index,s_getCountryVar(13,6,index)+1)
		return
	end
	if index == 10 and value >= 20000 then
		if s_removeMoney(uid,MoneyType_Gold,2000,"充值月礼包",MoneyActionTypeRemove_Present) == VALUE_FAIL then
			s_sysInfo(uid,"您身上的金币不够")
			return
		end
		s_addItem(uid,33001,0,1,0,"1-1","充值月礼包")
		s_addVar(uid,6,index,s_getCurTime(TIME_ALLMONTHS))
		s_addCountryVar(13,6,index,s_getCountryVar(13,6,index)+1)
		return
	end
	if index == 11 and value >= 30000 then
		s_addItem(uid,33512,0,1,0,"1-1","充值月礼包")
		s_addVar(uid,6,index,s_getCurTime(TIME_ALLMONTHS))
		s_addCountryVar(13,6,index,s_getCountryVar(13,6,index)+1)
		return
	end
	if index == 12 and value >= 30000 then
		if s_removeMoney(uid,MoneyType_Gold,2000,"充值月礼包",MoneyActionTypeRemove_Present) == VALUE_FAIL then
			s_sysInfo(uid,"您身上的金币不够")
			return
		end
		s_addItem(uid,33001,0,1,0,"1-1","充值月礼包")
		s_addVar(uid,6,index,s_getCurTime(TIME_ALLMONTHS))
		s_addCountryVar(13,6,index,s_getCountryVar(13,6,index)+1)
		return
	end
	if index == 13 and value >= 50000 then
		s_addItem(uid,33513,0,1,0,"1-1","充值月礼包")
		s_addVar(uid,6,index,s_getCurTime(TIME_ALLMONTHS))
		s_addCountryVar(13,6,index,s_getCountryVar(13,6,index)+1)
		return
	end
	if index == 14 and value >= 50000 then
		if s_removeMoney(uid,MoneyType_Gold,2000,"充值月礼包",MoneyActionTypeRemove_Present) == VALUE_FAIL then
			s_sysInfo(uid,"您身上的金币不够")
			return
		end
		s_addItem(uid,33001,0,1,0,"1-1","充值月礼包")
		s_addVar(uid,6,index,s_getCurTime(TIME_ALLMONTHS))
		s_addCountryVar(13,6,index,s_getCountryVar(13,6,index)+1)
		return
	end
	if index == 15 and value >= 70000 then
		s_addItem(uid,33514,0,1,0,"1-1","充值月礼包")
		s_addVar(uid,6,index,s_getCurTime(TIME_ALLMONTHS))
		s_addCountryVar(13,6,index,s_getCountryVar(13,6,index)+1)
		return
	end
	if index == 16 and value >= 70000 then
		if s_removeMoney(uid,MoneyType_Gold,2000,"充值月礼包",MoneyActionTypeRemove_Present) == VALUE_FAIL then
			s_sysInfo(uid,"您身上的金币不够")
			return
		end
		s_addItem(uid,33001,0,1,0,"1-1","充值月礼包")
		s_addVar(uid,6,index,s_getCurTime(TIME_ALLMONTHS))
		s_addCountryVar(13,6,index,s_getCountryVar(13,6,index)+1)
		return
	end
	if index == 17 and value >= 100000 then
		s_addItem(uid,33515,0,1,0,"1-1","充值月礼包")
		s_addVar(uid,6,index,s_getCurTime(TIME_ALLMONTHS))
		s_addCountryVar(13,6,index,s_getCountryVar(13,6,index)+1)
		return
	end
	if index == 18 and value >= 100000 then
		if s_removeMoney(uid,MoneyType_Gold,2000,"充值月礼包",MoneyActionTypeRemove_Present) == VALUE_FAIL then
			s_sysInfo(uid,"您身上的金币不够")
			return
		end
		s_addItem(uid,33001,0,1,0,"1-1","充值月礼包")
		s_addVar(uid,6,index,s_getCurTime(TIME_ALLMONTHS))
		s_addCountryVar(13,6,index,s_getCountryVar(13,6,index)+1)
		return
	end
	s_sysInfo(uid,"您当前的充值数不能兑换此礼包",ChatPos_MsgBox)
end
function OnRequestWeekGoldPresentEvent(uid,index)
	local value = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_WEEK_REDEEM)
	if s_getVar(uid,7,index) == s_getCurTime(TIME_CURYWEEKS)  then
		s_sysInfo(uid,"您已经兑换过此礼包了",ChatPos_MsgBox)
		return
	end
	if index == 1 and value >= 0 then
		s_addItem(uid,32500,0,1,0,"1-1","充值周礼包")
		s_addVar(uid,7,index,s_getCurTime(TIME_CURYWEEKS))
		s_addCountryVar(13,7,index,s_getCountryVar(13,7,index)+1)
		RefreshTaskDailyInfo(uid, 49203)
		return
	end
	if index == 2 and value >= 0 then
		if s_removeMoney(uid,MoneyType_Gold,1000,"充值周礼包",MoneyActionTypeRemove_Present) == VALUE_FAIL then
			s_sysInfo(uid,"您身上的金币不够")
			return
		end
		s_addItem(uid,33000,0,1,0,"1-1","充值周礼包")
		s_addVar(uid,7,index,s_getCurTime(TIME_CURYWEEKS))
		s_addCountryVar(13,7,index,s_getCountryVar(13,7,index)+1)
		RefreshTaskDailyInfo(uid, 49203)
		return
	end
	if index == 3 and value >= 1000 then
		s_addItem(uid,32501,0,1,0,"1-1","充值周礼包")
		s_addVar(uid,7,index,s_getCurTime(TIME_CURYWEEKS))
		s_addCountryVar(13,7,index,s_getCountryVar(13,7,index)+1)
		RefreshTaskDailyInfo(uid, 49203)
		return
	end
	if index == 4 and value >= 1000 then
		if s_removeMoney(uid,MoneyType_Gold,1000,"充值周礼包",MoneyActionTypeRemove_Present) == VALUE_FAIL then
			s_sysInfo(uid,"您身上的金币不够")
			return
		end
		s_addItem(uid,33000,0,1,0,"1-1","充值周礼包")
		s_addVar(uid,7,index,s_getCurTime(TIME_CURYWEEKS))
		s_addCountryVar(13,7,index,s_getCountryVar(13,7,index)+1)
		RefreshTaskDailyInfo(uid, 49203)
		return
	end
	if index == 5 and value >= 3000 then
		s_addItem(uid,32502,0,1,0,"1-1","充值周礼包")
		s_addVar(uid,7,index,s_getCurTime(TIME_CURYWEEKS))
		s_addCountryVar(13,7,index,s_getCountryVar(13,7,index)+1)
		RefreshTaskDailyInfo(uid, 49203)
		return
	end
	if index == 6 and value >= 3000 then
		if s_removeMoney(uid,MoneyType_Gold,1000,"充值周礼包",MoneyActionTypeRemove_Present) == VALUE_FAIL then
			s_sysInfo(uid,"您身上的金币不够")
			return
		end
		s_addItem(uid,33000,0,1,0,"1-1","充值周礼包")
		s_addVar(uid,7,index,s_getCurTime(TIME_CURYWEEKS))
		s_addCountryVar(13,7,index,s_getCountryVar(13,7,index)+1)
		RefreshTaskDailyInfo(uid, 49203)
		return
	end
	if index == 7 and value >= 10000 then
		s_addItem(uid,32503,0,1,0,"1-1","充值周礼包")
		s_addVar(uid,7,index,s_getCurTime(TIME_CURYWEEKS))
		s_addCountryVar(13,7,index,s_getCountryVar(13,7,index)+1)
		RefreshTaskDailyInfo(uid, 49203)
		return
	end
	if index == 8 and value >= 10000 then
		if s_removeMoney(uid,MoneyType_Gold,1000,"充值周礼包",MoneyActionTypeRemove_Present) == VALUE_FAIL then
			s_sysInfo(uid,"您身上的金币不够")
			return
		end
		s_addItem(uid,33000,0,1,0,"1-1","充值周礼包")
		s_addVar(uid,7,index,s_getCurTime(TIME_CURYWEEKS))
		s_addCountryVar(13,7,index,s_getCountryVar(13,7,index)+1)
		RefreshTaskDailyInfo(uid, 49203)
		return
	end
	if index == 9 and value >= 30000 then
		s_addItem(uid,32504,0,1,0,"1-1","充值周礼包")
		s_addVar(uid,7,index,s_getCurTime(TIME_CURYWEEKS))
		s_addCountryVar(13,7,index,s_getCountryVar(13,7,index)+1)
		RefreshTaskDailyInfo(uid, 49203)
		return
	end
	if index == 10 and value >= 30000 then
		if s_removeMoney(uid,MoneyType_Gold,1000,"充值周礼包",MoneyActionTypeRemove_Present) == VALUE_FAIL then
			s_sysInfo(uid,"您身上的金币不够")
			return
		end
		s_addItem(uid,33000,0,1,0,"1-1","充值周礼包")
		s_addVar(uid,7,index,s_getCurTime(TIME_CURYWEEKS))
		s_addCountryVar(13,7,index,s_getCountryVar(13,7,index)+1)
		RefreshTaskDailyInfo(uid, 49203)
		return
	end
	if index == 11 and value >= 50000 then
		s_addItem(uid,32505,0,1,0,"1-1","充值周礼包")
		s_addVar(uid,7,index,s_getCurTime(TIME_CURYWEEKS))
		s_addCountryVar(13,7,index,s_getCountryVar(13,7,index)+1)
		RefreshTaskDailyInfo(uid, 49203)
		return
	end
	if index == 12 and value >= 50000 then
		if s_removeMoney(uid,MoneyType_Gold,1500,"充值周礼包",MoneyActionTypeRemove_Present) == VALUE_FAIL then
			s_sysInfo(uid,"您身上的金币不够")
			return
		end
		s_addItem(uid,33002,0,1,0,"1-1","充值周礼包")
		s_addVar(uid,7,index,s_getCurTime(TIME_CURYWEEKS))
		s_addCountryVar(13,7,index,s_getCountryVar(13,7,index)+1)
		RefreshTaskDailyInfo(uid, 49203)
		return
	end
	if index == 13 and value >= 100000 then
		s_addItem(uid,32506,0,1,0,"1-1","充值周礼包")
		s_addVar(uid,7,index,s_getCurTime(TIME_CURYWEEKS))
		s_addCountryVar(13,7,index,s_getCountryVar(13,7,index)+1)
		RefreshTaskDailyInfo(uid, 49203)
		return
	end
	if index == 14 and value >= 100000 then
		if s_removeMoney(uid,MoneyType_Gold,1500,"充值周礼包",MoneyActionTypeRemove_Present) == VALUE_FAIL then
			s_sysInfo(uid,"您身上的金币不够")
			return
		end
		s_addItem(uid,33002,0,1,0,"1-1","充值周礼包")
		s_addVar(uid,7,index,s_getCurTime(TIME_CURYWEEKS))
		s_addCountryVar(13,7,index,s_getCountryVar(13,7,index)+1)
		RefreshTaskDailyInfo(uid, 49203)
		return
	end
	if index == 15 and value >= 150000 then
		s_addItem(uid,32507,0,1,0,"1-1","充值周礼包")
		s_addVar(uid,7,index,s_getCurTime(TIME_CURYWEEKS))
		s_addCountryVar(13,7,index,s_getCountryVar(13,7,index)+1)
		RefreshTaskDailyInfo(uid, 49203)
		return
	end
	if index == 16 and value >= 150000 then
		if s_removeMoney(uid,MoneyType_Gold,2500,"充值周礼包",MoneyActionTypeRemove_Present) == VALUE_FAIL then
			s_sysInfo(uid,"您身上的金币不够")
			return
		end
		s_addItem(uid,33003,0,1,0,"1-1","充值周礼包")
		s_addVar(uid,7,index,s_getCurTime(TIME_CURYWEEKS))
		s_addCountryVar(13,7,index,s_getCountryVar(13,7,index)+1)
		RefreshTaskDailyInfo(uid, 49203)
		return
	end
	if index == 17 and value >= 200000 then
		s_addItem(uid,32507,0,1,0,"1-1","充值周礼包")
		s_addVar(uid,7,index,s_getCurTime(TIME_CURYWEEKS))
		s_addCountryVar(13,7,index,s_getCountryVar(13,7,index)+1)
		RefreshTaskDailyInfo(uid, 49203)
		return
	end
	if index == 18 and value >= 200000 then
		if s_removeMoney(uid,MoneyType_Gold,2500,"充值周礼包",MoneyActionTypeRemove_Present) == VALUE_FAIL then
			s_sysInfo(uid,"您身上的金币不够")
			return
		end
		s_addItem(uid,33003,0,1,0,"1-1","充值周礼包")
		s_addVar(uid,7,index,s_getCurTime(TIME_CURYWEEKS))
		s_addCountryVar(13,7,index,s_getCountryVar(13,7,index)+1)
		RefreshTaskDailyInfo(uid, 49203)
		return
	end
	s_sysInfo(uid,"您当前的充值数不能兑换此礼包",ChatPos_MsgBox)
end

function OnSevenDayPresentEvent(uid)
	local talkDialog = 'this:ShowNpcDialog(false)'
	local interfaceDialog = 'this:AddSevenDayDialog()'
	local msg = talkDialog .. interfaceDialog
	s_setMessage(uid,0,msg,0)
end
function OnRequestMonthVipPresentEvent(uid,index)
	if s_getVar(uid,9,index) == s_getCurTime(TIME_ALLMONTHS)  then
		s_sysInfo(uid,"您已经兑换过此礼包了",ChatPos_MsgBox)
		return
	end
	local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
	local value = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_ALL_REDEEM)
	local country = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND)
	if value >= 500000 and index < 6 then
		s_removebuff(SCENE_ENTRY_PLAYER,uid,128)
		s_removebuff(SCENE_ENTRY_PLAYER,uid,129)
		s_removebuff(SCENE_ENTRY_PLAYER,uid,130)
		s_removebuff(SCENE_ENTRY_PLAYER,uid,131)
		s_removebuff(SCENE_ENTRY_PLAYER,uid,132)
		s_addbuff(SCENE_ENTRY_PLAYER,uid,157,1,31 * 86400)
		s_addVar(uid,9,index,s_getCurTime(TIME_ALLMONTHS))
		s_addCountryVar(13,9,index,s_getCountryVar(13,9,index)+1)
		s_setViplevel(uid,index)
		s_incSmallPackNum(uid)
		--s_countryInfo(country,"<p><q buttonid=6005 ownerid=".. uid .. ">" ..name .. "</q><n color=GXColorBlueSky>领取了VIP"..index.."</n><dialog hotkeyid=76 text=福利/></p>",ChatPos_Sys + ChatPos_Honor)
		--s_debugUser(uid,"领取了VIP" .. index .. "级")
		return
	elseif value >= 100000 and index < 5 then
		s_removebuff(SCENE_ENTRY_PLAYER,uid,128)
		s_removebuff(SCENE_ENTRY_PLAYER,uid,129)
		s_removebuff(SCENE_ENTRY_PLAYER,uid,130)
		s_removebuff(SCENE_ENTRY_PLAYER,uid,131)
		s_addbuff(SCENE_ENTRY_PLAYER,uid,127 + index ,1,31 * 86400)
		s_addVar(uid,9,index,s_getCurTime(TIME_ALLMONTHS))
		s_addCountryVar(13,9,index,s_getCountryVar(13,9,index)+1)
		s_setViplevel(uid,index)
		s_incSmallPackNum(uid)
		--s_countryInfo(country,"<p><q buttonid=6005 ownerid=".. uid .. ">" ..name .. "</q><n color=GXColorBlueSky>领取了VIP"..index.."</n><dialog hotkeyid=76 text=福利/></p>",ChatPos_Sys + ChatPos_Honor)
		--s_debugUser(uid,"领取了VIP" .. index .. "级")
		return
	elseif value >= 50000 and index < 4 then
		s_removebuff(SCENE_ENTRY_PLAYER,uid,128)
		s_removebuff(SCENE_ENTRY_PLAYER,uid,129)
		s_removebuff(SCENE_ENTRY_PLAYER,uid,130)
		s_removebuff(SCENE_ENTRY_PLAYER,uid,131)
		s_addbuff(SCENE_ENTRY_PLAYER,uid,127 + index ,1,31 * 86400)
		s_addVar(uid,9,index,s_getCurTime(TIME_ALLMONTHS))
		s_addCountryVar(13,9,index,s_getCountryVar(13,9,index)+1)
		s_setViplevel(uid,index)
		s_incSmallPackNum(uid)
		--s_countryInfo(country,"<p><q buttonid=6005 ownerid=".. uid .. ">" ..name .. "</q><n color=GXColorBlueSky>领取了VIP"..index.."</n><dialog hotkeyid=76 text=福利/></p>",ChatPos_Sys + ChatPos_Honor)
		--s_debugUser(uid,"领取了VIP" .. index .. "级")
		return
	elseif value >= 10000 and index < 3 then
		s_removebuff(SCENE_ENTRY_PLAYER,uid,128)
		s_removebuff(SCENE_ENTRY_PLAYER,uid,129)
		s_removebuff(SCENE_ENTRY_PLAYER,uid,130)
		s_removebuff(SCENE_ENTRY_PLAYER,uid,131)
		s_addbuff(SCENE_ENTRY_PLAYER,uid,127 + index ,1,31 * 86400)
		s_addVar(uid,9,index,s_getCurTime(TIME_ALLMONTHS))
		s_addCountryVar(13,9,index,s_getCountryVar(13,9,index)+1)
		s_setViplevel(uid,index)
		s_incSmallPackNum(uid)
		--s_countryInfo(country,"<p><q buttonid=6005 ownerid=".. uid .. ">" ..name .. "</q><n color=GXColorBlueSky>领取了VIP"..index.."</n><dialog hotkeyid=76 text=福利/></p>",ChatPos_Sys + ChatPos_Honor)
		--s_debugUser(uid,"领取了VIP" .. index .. "级")
		return
	elseif value >= 1000 and index < 2 then
		s_removebuff(SCENE_ENTRY_PLAYER,uid,128)
		s_removebuff(SCENE_ENTRY_PLAYER,uid,129)
		s_removebuff(SCENE_ENTRY_PLAYER,uid,130)
		s_removebuff(SCENE_ENTRY_PLAYER,uid,131)
		s_addbuff(SCENE_ENTRY_PLAYER,uid,127 + index ,1,31 * 86400)
		s_addVar(uid,9,index,s_getCurTime(TIME_ALLMONTHS))
		s_addCountryVar(13,9,index,s_getCountryVar(13,9,index)+1)
		s_setViplevel(uid,index)
		s_incSmallPackNum(uid)
		--s_countryInfo(country,"<p><q buttonid=6005 ownerid=".. uid .. ">" ..name .. "</q><n color=GXColorBlueSky>领取了VIP"..index.."</n><dialog hotkeyid=76 text=福利/></p>",ChatPos_Sys + ChatPos_Honor)
		--s_debugUser(uid,"领取了VIP" .. index .. "级")
		return
	end
	s_sysInfo(uid,"您当前的充值数不能兑换此礼包",ChatPos_MsgBox)
end
function OnRedeemGoldEvent(uid,goldnum)
	--只有在需要的时候才能开放合区补偿
	if goldnum >= 500 then
	--		local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	--			s_sysMail(uid,"充值回馈",0,27108,goldnum * 0.002,"1-1")
	end
	if goldnum >= 1000 then
		--local worldlevel = s_getWorldLevel()
		s_removebuff(SCENE_ENTRY_PLAYER,uid,147)
		s_addbuff(SCENE_ENTRY_PLAYER,uid,147 ,1,7 * 86400)
		local year = s_getCurTime(TIME_CURYEARS)+1900
		local month = s_getCurTime(TIME_CURMONTHS)+1
		local mday = s_getCurTime(TIME_CURMDAYS)
		if year == 2015 and ((month == 4 and mday >= 25) or (month == 5 and mday <= 12)) then

			s_addVar(uid,101,87,s_getVar(uid,101,87)+goldnum)
			if s_getVar(uid,101,87) >= 10*100 and s_getVar(uid,101,86) < 1 then
				s_sysMail(uid,"五一充值乐翻天，每充值10元，额外获得星耀宝箱奖励, 上限10个哦",0,55085,1,"1-1",0, "充值")
				s_addVar(uid,101,86,1)
			end
			if s_getVar(uid,101,87) >= 20*100 and s_getVar(uid,101,86) < 2 then
				s_sysMail(uid,"五一充值乐翻天，每充值10元，额外获得星耀宝箱奖励, 上限10个哦",0,55085,1,"1-1",0, "充值")
				s_addVar(uid,101,86,2)
			end
			if s_getVar(uid,101,87) >= 30*100 and s_getVar(uid,101,86) < 3 then
				s_sysMail(uid,"五一充值乐翻天，每充值10元，额外获得星耀宝箱奖励, 上限10个哦",0,55085,1,"1-1",0, "充值")
				s_addVar(uid,101,86,3)
			end
			if s_getVar(uid,101,87) >= 40*100 and s_getVar(uid,101,86) < 4 then
				s_sysMail(uid,"五一充值乐翻天，每充值10元，额外获得星耀宝箱奖励, 上限10个哦",0,55085,1,"1-1",0, "充值")
				s_addVar(uid,101,86,4)
			end
			if s_getVar(uid,101,87) >= 50*100 and s_getVar(uid,101,86) < 5 then
				s_sysMail(uid,"五一充值乐翻天，每充值10元，额外获得星耀宝箱奖励, 上限10个哦",0,55085,1,"1-1",0, "充值")
				s_addVar(uid,101,86,5)
			end
			if s_getVar(uid,101,87) >= 60*100 and s_getVar(uid,101,86) < 6 then
				s_sysMail(uid,"五一充值乐翻天，每充值10元，额外获得星耀宝箱奖励, 上限10个哦",0,55085,1,"1-1",0, "充值")
				s_addVar(uid,101,86,6)
			end
			if s_getVar(uid,101,87) >= 70*100 and s_getVar(uid,101,86) < 7 then
				s_sysMail(uid,"五一充值乐翻天，每充值10元，额外获得星耀宝箱奖励, 上限10个哦",0,55085,1,"1-1",0, "充值")
				s_addVar(uid,101,86,7)
			end
			if s_getVar(uid,101,87) >= 80*100 and s_getVar(uid,101,86) < 8 then
				s_sysMail(uid,"五一充值乐翻天，每充值10元，额外获得星耀宝箱奖励, 上限10个哦",0,55085,1,"1-1",0, "充值")
				s_addVar(uid,101,86,8)
			end
			if s_getVar(uid,101,87) >= 90*100 and s_getVar(uid,101,86) < 9 then
				s_sysMail(uid,"五一充值乐翻天，每充值10元，额外获得星耀宝箱奖励, 上限10个哦",0,55085,1,"1-1",0, "充值")
				s_addVar(uid,101,86,9)
			end
			if s_getVar(uid,101,87) >= 100*100 and s_getVar(uid,101,86) < 10 then
				s_sysMail(uid,"五一充值乐翻天，每充值10元，额外获得星耀宝箱奖励, 上限10个哦",0,55085,1,"1-1",0, "充值")
				s_addVar(uid,101,86,10)
			end
			if s_getVar(uid,101,87) >= 150*100 and s_getVar(uid,101,88) < 1 then
				s_sysMail(uid,"五一充值乐翻天，充满150元，赐予众神守护",0,63342,1,"1-1",0, "充值")
				s_addVar(uid,101,88,1)
			end
			if s_getVar(uid,101,87) >= 300*100 and s_getVar(uid,101,88) < 2 then
				s_sysMail(uid,"五一充值乐翻天，充满300元，赐予弑神之力",0,63343,1,"1-1",0, "充值")
				s_addVar(uid,101,88,2)
			end
		else
			s_addVar(uid,101,86,0)
			s_addVar(uid,101,87,0)
			s_addVar(uid,101,88,0)
		end
	end
	--圣诞节充值返还活动
	OnRedeemGoldEvent_ChristmasGold(uid,goldnum)
	--9天夺宝增加知名度
	OnNineDayEventRecharge(uid,goldnum)
	local total = s_getVar(uid,1,19)
	if total >= 50000 then
		return VALUE_FAIL
	else
		return VALUE_OK
			--if total + goldnum >= 50000 then
			--	goldnum = 50000 - total
			--end
			--s_addMoney(uid,MoneyType_GoldTicket,goldnum,"合区充值赠点")
			--s_addVar(uid,1,19,total + goldnum)
	end
	return VALUE_OK
end

function ShowBuyLotteryDailyItem(uid)
	if s_getVar(uid,1,21) ~= 0 then
		return VALUE_FAIL
	end
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if level < 21 then
		return VALUE_FAIL
	end
	return VALUE_OK
end
function OnRequestLotteryHistory(uid)
	s_openLotteryHistory(uid)
	return VALUE_OK
end
function OnBuyLotteryDailyItem(uid)
	local curtime = s_getCurTime(TIME_ALLSECONDS)
	if (curtime%86400) > 21 * 3600 then
		s_messageBox(uid,"兑换时间为每日00:01-21:00")
		return VALUE_FAIL
	end
	if s_getVar(uid,1,21) ~= 0 then
		s_messageBox(uid,"一天只能领取一张幸运礼券")
		return VALUE_FAIL
	end
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if level < 21 then
		s_messageBox(uid,"玩家等级至少为21级才可以领取");
		return VALUE_FAIL
	end
	if s_getAutoPackSpace(uid) <= 1 then
		s_messageBox(uid,"包裹已满，无法领取")
		return VALUE_FAIL
	end
	if s_removeMoney(uid,MoneyType_GoldTicket,200,"购买彩票",MoneyActionTypeRemove_Present) == VALUE_FAIL then
		s_messageBox(uid,"赠点不足，无法领取")
		return VALUE_FAIL
	end
	s_addVar(uid,1,21,s_getVar(uid,1,21) + 1)
	s_addItem(uid,29135,3,1,0,"1-1","购买")
	RefreshTaskDailyInfo(uid,49114)
	return VALUE_OK
end
function OnResetMoneyTicketDaily(uid)
	if s_getVar(uid,1,29) ~= 0 then
		s_messageBox(uid,"今天已经清除过使用上限")
		return VALUE_FAIL
	end
	s_setVar(uid,1,29,1)
	s_setVar(uid,1,20,0)
	s_removeMoney(uid,MoneyType_MoneyTicket,1,"清上限")
end
function OnNineDayEventRecharge(uid,goldnum)
	--检查活动日
	local serverstarttime = s_getCountryField(13,CountryVar_ServerStartTime)
	if serverstarttime == 0 or serverstarttime == nil then
		return
	end
	local opentime = s_getCurTime(TIME_ALLSECONDS) - serverstarttime
	if opentime > 86400 * 9 then
		return
	end
	local popularity = s_getVar(uid,116,97)
	if popularity >= 1200 then
		return
	end
	local addPopularity = goldnum * 0.01
	if popularity + addPopularity > 1200 then
		addPopularity = 1200 - popularity
		popularity = 1200
	else
		popularity = popularity + addPopularity
	end
	s_setVar(uid,116,97,popularity)
	s_sysInfo(uid,"知名度增加" .. addPopularity .. "点",ChatPos_Sys)
	s_sendRefreshNineDayState(uid,false)
end
