--领取新手礼物

--礼物信息
FreshPresentInfo =
{
	{
		id = 1, time = 2, tip = "新兵补给1线", moneyticket = 0,
		itemlist =
		{
			{31195,3,1,0,"1-1"},
			{6,3,1,0,"1-1"},
			{23051,3,2,0,"1-1"},
		},
	},
	{
		id = 2, time = 5, tip = "新兵补给2线", moneyticket = 0,
		itemlist =
		{
			{23001,3,1,0,"1-1"},
			{23011,3,1,0,"1-1"},
			{6,3,2,0,"1-1"},
			{30030,3,2,0,"1-1"},
		},
	},
	{
		id = 3, time = 10, tip = "新兵补给3线", moneyticket = 0,
		itemlist =
		{
			{34005,3,1,0,"1-1"},
			{6,3,3,0,"1-1"},
			{23051,3,2,0,"1-1"},
			{30031,3,2,0,"1-1"},
		},
	},
	{
		id = 4, time = 15, tip = "新兵补给4线", moneyticket = 0,
		itemlist =
		{
			{55152,3,2,0,"1-1"},
			{6,3,4,0,"1-1"},
			{43011,3,2,0,"1-1"},
			{30018,3,2,0,"1-1"},
		},
	},
	{
		id = 5, time = 30, tip = "新兵补给5线", moneyticket = 0,
		itemlist =
		{
			{29001,3,1,0,"1-1"},
			{55158,3,2,0,"1-1"},
			{47001,3,1,0,"1-1,7-2"},
			{6,3,5,0,"1-1"},
			{30017,3,2,0,"1-1"},
		},
	},
}


--领取礼物
function OnGetFreshPresentEvent(uid)
	--检查当前是否可以领取
	local bufflevel = s_getbufflevel(SCENE_ENTRY_PLAYER,uid,33)
	if bufflevel > 0 then
		s_sysInfo(uid,"时间没到就想领取礼物")
		CheckHaveLeftPresent(uid,presentid)
		return
	end
	local presentid = 0
	for i = 1 , table.getn(FreshPresentInfo) do
		if s_getVar(uid,111,i) < 2 then
			presentid = i
			break
		end
	end
	if presentid  == 0 or presentid > table.getn(FreshPresentInfo) then
		s_sysInfo(uid,"新手礼物已经领完")
		return
	end
	local info = FreshPresentInfo[presentid]
	if info == nil then return end
	local item = info.itemlist
	for i=1, table.getn(item), 1 do
		s_addItem(uid,item[i][1],item[i][2],item[i][3],item[i][4],item[i][5],"领取新手礼物")
	end
	if info.moneyticket ~= nil  and info.moneyticket > 0 then
		s_addMoney(uid,MoneyType_MoneyTicket,info.moneyticket,"新手奖励")
	end
	CloseGiftButton(uid,1)
	s_addVar(uid,111,presentid,2)
	CheckHaveLeftPresent(uid,presentid+1)
end

--检查是否还有领取可领
function CheckHaveLeftPresent(uid,presentid)
	if presentid == nil then
		for i = 1, table.getn(FreshPresentInfo) do
			if s_getVar(uid,111,i) < 2 then
				presentid = i
				break
			end
		end
	end
	if presentid == nil then
		return
	end
	if s_getVar(uid,111,presentid) >= 2 then
		return
	end
	if presentid > table.getn(FreshPresentInfo) then
		return
	end
	local info = FreshPresentInfo[presentid]
	if s_getVar(uid,111,presentid) == 0 and s_getbufflevel(SCENE_ENTRY_PLAYER,uid,33) == 0 then
		s_addbuff(SCENE_ENTRY_PLAYER,uid,33,1,info.time*60 - 10,presentid)
	end
	local time = info.time * 60
	if s_getbufflevel(SCENE_ENTRY_PLAYER,uid,33) > 0 then
		time = s_getbufftime(SCENE_ENTRY_PLAYER,uid,33)
	end
	if s_getVar(uid,111,presentid) == 1 then
		time = 0
	end
	local list = {}
	for i=1, table.getn(info.itemlist), 1 do
		table.insert(list,info.itemlist[i][1])
		table.insert(list,info.itemlist[i][3])
	end
	s_sendFreshPresent(uid,presentid,time,info.tip,info.moneyticket,table.getn(info.itemlist),list)
end

