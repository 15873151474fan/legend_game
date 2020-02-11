function OnShutdownPresentDialog(uid)
	local info =
		{
			talk = "<p><n>    在游戏世界运行中遇到一些小问题时，GM会根据对全体玩家造成困扰的程度，发放一定的补偿。</n><newline/><n color='GXColorGreen'>   该功能只针对21级以上玩家起效。</n></p>",
			button = {
				{"领取临时维护补偿(2)","s_getShutDownPresent($1)"},
			},
		}
	ShowNpcMenuByTable(uid,info,1)
end

--Down机补偿
function OnShutdownPresentEvent(uid,presenttype)
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if level < 21 then
		s_sysInfo(uid,"21级及更高等级玩家可获取经验补偿，补偿经验根据角色等级决定",ChatPos_MsgBox)
		return
	end
	if presenttype == 1 then --20W经验
		s_refreshExp(uid,100 * (50 + 0.1 * math.pow(level,2.2)),ExpType_Item,0)
	elseif presenttype == 2 then --50W经验
		s_refreshExp(uid,301 * (50 + 0.1 * math.pow(level,2.2)),ExpType_Item,0)
	elseif presenttype == 3 then --100W经验
		s_refreshExp(uid,1000 * (50 + 0.1 * math.pow(level,2.2)),ExpType_Item,0)
	elseif presenttype == 4 then --1000增点
		s_addMoney(uid,MoneyType_GoldTicket,1000,"紧急维护补偿")
	elseif presenttype == 5 then --3000增点
		s_addMoney(uid,MoneyType_GoldTicket,3000,"紧急维护补偿")
	elseif presenttype == 6 then --5000增点
		s_addMoney(uid,MoneyType_GoldTicket,5000,"紧急维护补偿")
	elseif presenttype == 7 then --赠送球衣
		local itemid = 20212
		local sex = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SEX)
		if sex == 1 then
			itemid = math.random(20212, 20227)
		else
			itemid = math.random(20228, 20243)
		end
		s_addItem(uid,itemid,0,1,0,"1-1,3-86400","球赛补偿")
	elseif presenttype == 8 then
		s_addMoney(uid,MoneyType_Gold,1000,"紧急维护补偿")
	elseif presenttype == 9 then
		s_addMoney(uid,MoneyType_Gold,3000,"紧急维护补偿")
	elseif presenttype == 10 then
		s_addMoney(uid,MoneyType_Gold,5000,"紧急维护补偿")
	else
		s_sysInfo(uid,"未识别的补偿")
	end
	s_sysInfo(uid,"<p><n color=GXColorBlueSky>领取紧急维护补偿成功</n><book bookid=70015>[关于紧急维护]</book></p>")
end
