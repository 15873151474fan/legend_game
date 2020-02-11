--宠物魔法阵
function OnHotKeyID_8(uid) ShowSimpleBookInterface(uid,70246) return VALUE_OK end

--团购说明
function OnHotKeyID_10(uid) ShowSimpleBookInterface(uid,70249) return VALUE_OK end

--地宫挂机
function OnHotKeyID_11(uid) ShowSimpleBookInterface(uid,70141)  return VALUE_OK end

--战友
function OnHotKeyID_12(uid) ShowSimpleBookInterface(uid,70020)  return VALUE_OK end

--恋人
function OnHotKeyID_13(uid) ShowSimpleBookInterface(uid,70010)  return VALUE_OK end

--银币
function OnHotKeyID_14(uid) ShowSimpleBookInterface(uid,70008)  return VALUE_OK end

--赠点
function OnHotKeyID_15(uid) ShowSimpleBookInterface(uid,70013)  return VALUE_OK end

--绑银
function OnHotKeyID_16(uid) ShowSimpleBookInterface(uid,70009)  return VALUE_OK end

--充值优惠说明
function OnHotKeyID_17(uid) ShowSimpleBookInterface(uid,70253)  return VALUE_OK end



--
--充值优惠说明
function OnHotKeyID_18(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if level >  0 and level < 21 then
		ShowSimpleBookInterface(uid,70195)
	elseif level >  20 and level < 31 then
		ShowSimpleBookInterface(uid,70196)
	elseif level >  30 and level < 41 then
		ShowSimpleBookInterface(uid,70197)
	elseif level >  40 and level < 51 then
		ShowSimpleBookInterface(uid,70198)
	elseif level >  50 and level < 61 then
		ShowSimpleBookInterface(uid,70199)
	elseif level >  60 and level < 71 then
		ShowSimpleBookInterface(uid,70202)
	elseif level >  70 and level < 81 then
		ShowSimpleBookInterface(uid,70203)
	end
	return VALUE_OK
end

--帝都战说明
function OnHotKeyID_19(uid) ShowSimpleBookInterface(uid,70258)  return VALUE_OK end

--情缘任务（罗密欧与朱丽叶任务说明）
function OnHotKeyID_20(uid) ShowSimpleBookInterface(uid,70629)  return VALUE_OK end

--“存金砖，送赠点”活动说明
function OnHotKeyID_21(uid) ShowSimpleBookInterface(uid,70270)  return VALUE_OK end

--“一马当先”活动说明
function OnHotKeyID_22(uid) ShowSimpleBookInterface(uid,70273)  return VALUE_OK end

--“王者金库”活动说明
function OnHotKeyID_23(uid) ShowSimpleBookInterface(uid,70274)  return VALUE_OK end

--“充值排行榜”说明
function OnHotKeyID_26(uid) ShowSimpleBookInterface(uid,70278)  return VALUE_OK end

--id27  book-76001-“等级金砖”说明
function OnHotKeyID_27(uid) ShowSimpleBookInterface(uid,76001)  return VALUE_OK end

--id28  book-76002-“每周金砖”说明
function OnHotKeyID_28(uid) ShowSimpleBookInterface(uid,76002)  return VALUE_OK end

--id29  book-76005-“跨区巡游”说明
function OnHotKeyID_29(uid) ShowSimpleBookInterface(uid,76005)  return VALUE_OK end

--id30  book-70133-“坐骑纹章”说明
function OnHotKeyID_30(uid) ShowSimpleBookInterface(uid,70133)  return VALUE_OK end

--id31  book-76006-“跨区国战”说明
function OnHotKeyID_31(uid) ShowSimpleBookInterface(uid,76006)  return VALUE_OK end

--id64  book-70300 “绝世武器”活动说明
function OnHotKeyID_64(uid) ShowSimpleBookInterface(uid,70300)  return VALUE_OK end

--id65  book-70301 “坐骑”活动说明
function OnHotKeyID_65(uid) ShowSimpleBookInterface(uid,70301)  return VALUE_OK end

--id66  book-70302 “装备合成”活动说明
function OnHotKeyID_66(uid) ShowSimpleBookInterface(uid,70302)  return VALUE_OK end

--id67  book-70303 “宠物”活动说明
function OnHotKeyID_67(uid) ShowSimpleBookInterface(uid,70054)  return VALUE_OK end

--id68  book-70304 “仓库”活动说明
function OnHotKeyID_68(uid) ShowSimpleBookInterface(uid,70304)  return VALUE_OK end

--id69  book-70305 “光明城”活动说明
function OnHotKeyID_69(uid) ShowSimpleBookInterface(uid,70305)  return VALUE_OK end

--id70  book-70306 “入团”活动说明
function OnHotKeyID_70(uid) ShowSimpleBookInterface(uid,70306)  return VALUE_OK end

--id71  book-70307 “生活技能”活动说明
function OnHotKeyID_71(uid) ShowSimpleBookInterface(uid,70307)  return VALUE_OK end

--id72  book-70308 “命运大厅”活动说明
function OnHotKeyID_72(uid) ShowSimpleBookInterface(uid,70308)  return VALUE_OK end

--id73  book-70309 “战宠”活动说明
function OnHotKeyID_73(uid) ShowSimpleBookInterface(uid,70309)  return VALUE_OK end

--id74  book-70311 “升星”活动说明
function OnHotKeyID_74(uid) ShowSimpleBookInterface(uid,70311)  return VALUE_OK end

--id75  book-70312 “生命仪”活动说明
function OnHotKeyID_75(uid) ShowSimpleBookInterface(uid,70312)  return VALUE_OK end

--id76  book-70312 “轻灵羽翼”说明
function OnHotKeyID_76(uid) ShowSimpleBookInterface(uid,70313)  return VALUE_OK end

--id77  book-70312 “授勋军衔”说明
function OnHotKeyID_77(uid) ShowSimpleBookInterface(uid,70314)  return VALUE_OK end

--id78  book-70312 “新潮时装”说明
function OnHotKeyID_78(uid) ShowSimpleBookInterface(uid,70315)  return VALUE_OK end

--id79  book-70312 “武器升级”说明
function OnHotKeyID_79(uid) ShowSimpleBookInterface(uid,70316)  return VALUE_OK end

--id80  book-70312 “荣誉威名”说明
function OnHotKeyID_80(uid) ShowSimpleBookInterface(uid,70317)  return VALUE_OK end

--id81  book-70312 “魔导器”说明
function OnHotKeyID_81(uid) ShowSimpleBookInterface(uid,70318)  return VALUE_OK end

--id82  book-70324 “ 3V3” 名次奖励
function OnHotKeyID_82(uid) ShowSimpleBookInterface(uid,70324)  return VALUE_OK end

--id83  book-70322 “3V3”晋级赛规则
function OnHotKeyID_83(uid) ShowSimpleBookInterface(uid,70322)  return VALUE_OK end

--id84  book-76007 坐骑驯养
function OnHotKeyID_84(uid) ShowSimpleBookInterface(uid,76007)  return VALUE_OK end

--id85  book-70051宠物寄养
function OnHotKeyID_85(uid) ShowSimpleBookInterface(uid,70051)  return VALUE_OK end

--id86  book-76009传世护甲
function OnHotKeyID_86(uid) ShowSimpleBookInterface(uid,76009)  return VALUE_OK end

--id87  book-76010技能符文
function OnHotKeyID_87(uid) ShowSimpleBookInterface(uid,76010)  return VALUE_OK end

--周回馈
function OnHotKeyID_4(uid)
	s_openGoldReturn(uid,1)
	return VALUE_OK
end

--月回馈
function OnHotKeyID_5(uid)
	s_openGoldReturn(uid,2)
	return VALUE_OK
end

--VIP奖励
function OnHotKeyID_6(uid)
	s_openGoldReturn(uid,3)
	return VALUE_OK
end

--工资
function OnHotKeyID_7(uid)
	NpcMenuInfo135:DealGetPay(uid)
	return VALUE_OK
end

--VIP奖励
function OnHotKeyID_9(uid)
	GetPayGoldBox(uid)
	return VALUE_OK
end

--查看中奖
function OnHotKeyID_24(uid)
	OnRequestLotteryHistory(uid)
	return VALUE_OK
end

--购买奖券
function OnHotKeyID_25(uid)
	OnBuyLotteryDailyItem(uid)
	return VALUE_OK
end

--9天夺宝活动领取
function OnHotKeyID_330(uid,param)
	--检查活动日
	local serverstarttime = s_getCountryField(13,CountryVar_ServerStartTime)
	if serverstarttime == 0 or serverstarttime == nil then
		s_messageBox(uid,"现在不是活动日")
		return
	end

	local opentime = s_getCurTime(TIME_ALLSECONDS) - serverstarttime
	if opentime > 86400 * 9 then
		s_messageBox(uid,"该活动已结束")
		return
	end

	if param > 9 or param < 1 then
		s_messageBox(uid,"申请的礼包不对")
		return
	end

	local buff = {20379,20380,20381,20382,20383,20384,20385,20386,20387}
	local needpopularity = {35,95,160,250,400,600,800,1000,1200}
	local popularity = s_getVar(uid,116,97)
	local gift = s_getVar(uid,10020,param)

	if gift == 1 then
		s_messageBox(uid,"每个礼包只能领取一次哦")
		return
	end
	if popularity < needpopularity[param] then
		s_messageBox(uid,"知名度不够，充值可以增加知名度哦")
		return
	end
	if param == 1 then
		s_addItem(uid,55181,0,1,0,"1-1","9天夺宝活动:35知名度")	--“小有名气”宝盒*1
	elseif param == 2 then
		s_addItem(uid,55182,0,1,0,"1-1","9天夺宝活动:95知名度")	--“名声大振”宝盒*1
	elseif param == 3 then
		s_addItem(uid,55183,0,1,0,"1-1","9天夺宝活动:160知名度") --“大名鼎鼎”宝盒*1
	elseif param == 4 then
		s_addItem(uid,55184,0,1,0,"1-1","9天夺宝活动:250知名度") --“如雷贯耳”宝盒*1
	elseif param == 5 then
		s_addItem(uid,55185,0,1,0,"1-1","9天夺宝活动:400知名度") --“远近闻名”宝盒*1
	elseif param == 6 then
		s_addItem(uid,55186,0,1,0,"1-1","9天夺宝活动:600知名度") --“家喻户晓”宝盒*1
	elseif param == 7 then
		s_addItem(uid,55187,0,1,0,"1-1","9天夺宝活动:800知名度") --“威名远扬”宝盒*1
	elseif param == 8 then
		s_addItem(uid,55188,0,1,0,"1-1","9天夺宝活动:1000知名度") --“闻名遐迩”宝盒*1
	elseif param == 9 then
		s_addItem(uid,55189,0,1,0,"1-1","9天夺宝活动:1200知名度") --“声名显赫”宝盒*1
	end
	local addnewbuff = true
	for i=table.getn(buff),param+1,-1 do
		if s_getbufflevel(SCENE_ENTRY_PLAYER,uid,buff[i]) ~= 0 then
			addnewbuff = false
		end
	end
	if addnewbuff then
		for i=1,param-1 do
			if s_getbufflevel(SCENE_ENTRY_PLAYER,uid,buff[i]) ~= 0 then
				s_removebuff(SCENE_ENTRY_PLAYER,uid,buff[i])
			end
		end
		if param <= 3 then
			s_addbuff(SCENE_ENTRY_PLAYER,uid,buff[param],1,3*86400)
		else
			s_addbuff(SCENE_ENTRY_PLAYER,uid,buff[param],1,15*86400)
		end
	end
	s_setVar(uid,10020,param,1)
	s_sendRefreshNineDayState(uid,false)
end

--封测区补偿
function OnHotKeyID_10000(uid)
	--Compensation_10000(uid)
	return VALUE_OK
end

function Compensation_10000(uid)
	local info =
		{
			talk = "<p><n>    尊敬的玩家，因上周末帝都战未能正常开启，由此产生的损失，将以一定数量的</n><n color='GXColorGreen'>帝都战勋章</n><n>进行补偿，给您带来的不便，敬请谅解！</n><newline/><n>   感谢您一直以来对我们的支持^_^</n></p>",
			button = {
			--{"帝都战补偿(2)","DealCompensation_10000($1)","ShowCompensation_10000($1)"},
			},
		}
	ShowNpcMenuByTable(uid,info,1)
end

function ShowCompensation_10000(uid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if s_getVar(uid,116,50) ~= 0 then
		s_sysInfo(uid,"您已经领取过帝都战补偿")
		return VALUE_FAIL
	end
	if level < 70 then
		return VALUE_FAIL
	end
	return VALUE_OK
end

function DealCompensation_10000(uid)
	if s_getVar(uid,116,50) ~= 0 then
		s_sysInfo(uid,"您已经领取过帝都战补偿")
		return VALUE_FAIL
	end
	s_addVar(uid,116,50,1)
	s_sysInfo(uid,"获得帝都战补偿100帝都战勋章",ChatPos_MsgBox)
	s_addItem(uid,31547,3,100,0,"1-1","补偿帝都战勋章")
	return VALUE_OK
end

local EXP_BALL_NUM = { 100000, 150000, 250000, 450000, 750000, 1200000, 1800000, 2600000, 3750000, 5000000}
local MEDAL_EXP_NUM = {150000, 300000, 500000, 750000, 1200000, 2000000, 3000000, 4500000, 6500000, 9000000}
local TRADE_STONE_NUM = {150000, 250000, 400000, 600000, 800000, 1000000, 1400000, 2100000, 3100000,50000000}

--等级封印
function OnHotKeyID_1(userid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_LEVEL)
	if level < 60 then
		return
	end
	local needlevel = (math.floor(level/10)-6)*10 + 45
	local msg3 = "兑换无双斗气石[物攻],需"..TRADE_STONE_NUM[math.floor(level/10)-5]/10000 .."万经验(2)"
	local msg4 = "兑换魔神斗气石[魔攻],需"..TRADE_STONE_NUM[math.floor(level/10)-5]/10000 .."万经验(2)"
	local msg5 = "兑换圣盾斗气石[物防],需"..TRADE_STONE_NUM[math.floor(level/10)-5]/10000 .."万经验(2)"
	local msg6 = "兑换神光斗气石[魔防],需"..TRADE_STONE_NUM[math.floor(level/10)-5]/10000 .."万经验(2)"
	local msg7 = "兑换不灭斗气石[血量],需"..TRADE_STONE_NUM[math.floor(level/10)-5]/10000 .."万经验(2)"
	local msg8 = "兑换10个无双斗气石[物攻],需"..TRADE_STONE_NUM[math.floor(level/10)-5]/1000 .."万经验(2)"
	local msg9 = "兑换10个魔神斗气石[魔攻],需"..TRADE_STONE_NUM[math.floor(level/10)-5]/1000 .."万经验(2)"
	local msg10 = "兑换10个圣盾斗气石[物防],需"..TRADE_STONE_NUM[math.floor(level/10)-5]/1000 .."万经验(2)"
	local msg11 = "兑换10个神光斗气石[魔防],需"..TRADE_STONE_NUM[math.floor(level/10)-5]/1000 .."万经验(2)"
	local msg12 = "兑换10个不灭斗气石[血量],需"..TRADE_STONE_NUM[math.floor(level/10)-5]/1000 .."万经验(2)"
	local msg2 = "兑换10枚历练勋章,需要"..MEDAL_EXP_NUM[math.floor(level/10)-5]/10000 .."万经验(2)"
	local msg1 = "兑换" .. EXP_BALL_NUM[math.floor(level/10)-5]/10000 .. "万经验胶囊,需要"..EXP_BALL_NUM[math.floor(level/10)-5]*2/10000 .."万经验(2)"
	local info =
		{
			talk = "当前升级受到封印限制,需要人类进程进阶.超额经验可以兑换:",
			button = {
				{msg3,"OnPlayerLevelUpTradeStone($1,27501)"},
				{msg4,"OnPlayerLevelUpTradeStone($1,27511)"},
				{msg5,"OnPlayerLevelUpTradeStone($1,27521)"},
				{msg6,"OnPlayerLevelUpTradeStone($1,27531)"},
				{msg7,"OnPlayerLevelUpTradeStone($1,27541)"},
				{msg8,"OnPlayerLevelUpTradeStone1($1,27501)"},
				{msg9,"OnPlayerLevelUpTradeStone1($1,27511)"},
				{msg10,"OnPlayerLevelUpTradeStone1($1,27521)"},
				{msg11,"OnPlayerLevelUpTradeStone1($1,27531)"},
				{msg12,"OnPlayerLevelUpTradeStone1($1,27541)"},
				{msg2,"OnPlayerLevelUpTrade2($1)","OnPlayerLevelUpShowTrade($1)"},
				{msg1,"OnPlayerLevelUpTrade1($1)","OnPlayerLevelUpShowTrade($1)"},
			},
		}
	ShowNpcMenuByTable(userid,info,1)
end
function OnPlayerLevelUpShowTrade(userid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_LEVEL)
	if level < 60 then
		return VALUE_FAIL
	end
	local world_level = s_getWorldLevel()
	if level ~= 50 + world_level * 10 then
		return VALUE_FAIL
	end
	return VALUE_OK
end
function OnPlayerLevelUpTrade1(userid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_LEVEL)
	if level < 60 then return end
	local num = EXP_BALL_NUM[math.floor(level/10)-5]*2
	if num ~= nil and s_deductExp(userid,num,ExpCostType_BuyItem,"兑换封印经验丹") == VALUE_OK then
		s_addItem(userid,34101+math.floor(level/10)-6,0,1,0,"","封印兑换")
	end
end
function OnPlayerLevelUpTrade2(userid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_LEVEL)
	if level < 60 then return end
	local num = MEDAL_EXP_NUM[math.floor(level/10)-5]
	if num ~= nil and s_deductExp(userid,num,ExpCostType_BuyItem,"兑换封印历练勋章") == VALUE_OK then
		s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_EXP_MEDAL,10)
	end
end

function OnPlayerLevelUpTradeStone(userid,baseid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_LEVEL)
	if level < 60 then return end
	local num = TRADE_STONE_NUM[math.floor(level/10)-5]
	if num ~= nil and s_deductExp(userid,num,ExpCostType_BuyItem,"兑换封印历练勋章") == VALUE_OK then
		local itemid = baseid + math.floor(level/10) - 6
		s_addItem(userid,itemid,0,1,0,"1-1","封印兑换")
	end
end

function OnPlayerLevelUpTradeStone1(userid,baseid)
	local level = s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_LEVEL)
	if level < 60 then return end
	local num = TRADE_STONE_NUM[math.floor(level/10)-5]
	if num ~= nil and s_deductExp(userid,10*num,ExpCostType_BuyItem,"兑换封印历练勋章") == VALUE_OK then
		local itemid = baseid + math.floor(level/10) - 6
		s_addItem(userid,itemid,0,10,0,"1-1","封印兑换")
	end
end

--贡献换经验
function OnHotKeyID_2(uid)
	local msg3 = "兑换1倍经验,需50功勋(2)"
	local msg4 = "兑换2倍经验,需250功勋(2)"
	local msg5 = "兑换4倍经验,需1250功勋(2)"
	local msg6 = "兑换8倍经验,需6250功勋(2)"
	local msg7 = "领取上周奖励(2)"
	local info =
		{
			talk = "功勋兑换经验，每天可兑换8次，每周可兑换20次，请注意兑换次数:",
			button = {
				{msg3,"GetGongXun($1,50)"},
				{msg4,"GetGongXun($1,250)"},
				{msg5,"GetGongXun($1,1250)"},
				{msg6,"GetGongXun($1,6250)"},
				{msg7,"GetLsatWeekGongXun($1)"},
			},
		}
	ShowNpcMenuByTable(uid,info,1)
end


function GetGongXun(uid,gongxun)
	if s_getVar(uid,101,37) >= 8 then
		s_sysInfo(uid,"功勋兑换经验每日最多8次");
		return
	end

	local week = s_getCurTime(TIME_CURYWEEKS)
	if week ~= s_getVar(uid,101,39) then
		s_setVar(uid,101,39,week)
		s_setVar(uid,101,38,1)
	elseif s_getVar(uid,101,38) >= 20 then
		s_sysInfo(uid,"功勋兑换经验每周最多20次");
		return
	else
		s_setVar(uid,101,38,s_getVar(uid,101,38)+1)
	end

	s_setVar(uid,101,37,s_getVar(uid,101,37)+1)
	local cur = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_CONTRI)
	if cur < gongxun then
		s_sysInfo(uid,"您当前功勋不够兑换,去战斗吧，建功立业后再来找我")
		return
	end
	local multi = gongxun
	if gongxun == 50 then multi = 125
	elseif gongxun == 250 then multi = 250
	elseif gongxun == 1250 then multi = 500
	elseif gongxun == 6250 then multi = 1000
	end
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local exp = math.floor(1.4*multi*(0.05*math.pow(level,2.2) - 60))
	s_refreshExp(uid,exp,ExpType_Exchange,60000)
	s_subValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_CONTRI,gongxun)
	RefreshTaskDailyInfo(uid, 49204)
end

function GetLsatWeekGongXun(uid)
	local lastGongXun=s_getVar(uid,101,40)
	if lastGongXun == 0 then
		s_sysInfo(uid,"无功勋可兑换")
		return
	end
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local exp = math.floor(0.168*lastGongXun*(0.05*math.pow(level,2.2) - 60))
	s_refreshExp(uid,exp,ExpType_Exchange,60000)
	s_setVar(uid,101,40,0)
end

--命运女神的垂青
function OnHotKeyID_3(uid)
	OnRefreshLuckyGoddessTask(uid)
	return VALUE_OK
end
