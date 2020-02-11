--小队翻牌获得奖励(命运房间)

TeamCard =
{
	--teamlist = {},	--小队队伍
	cid = 0,		--副本ID
	fatetype = nil, --奖励列表
	roomtype = 0,   --房间类型
	gotuser = {},   --已经领过的玩家列表
	gotcard = {},   --已经领取过的卡片(1-10)
	time = 0,		--开始后计时
	start = 0,		--是否开始
	fate20 =
	{
		--game =1 普通小怪
		{
			{9,4},{9,5}, {9,6}, {9,8}, {9,9},
			{34111,4},{34111,5}, {34111,6}, {34111,7}, {34111,8}
		},
		--game =2 精英怪
		{
			{6,2}, {6,3}, {34112,2}, {34112,3}, {34112,4},
			{31145,2},{31145,1,"7-1"},{29049,3},{29049,5},{29049,7},
		},
		--game =3 boss房间
		{
			{34112,5},{34112,6},{34112,7},{29049,6},{29049,9},
			{27108,3},{27108,4},{27108,5},{27108,6},{29066,1,"7-2"},
		},
		--game =4 终极BOSS
		{
			{6,4},{6,5},{29049,8}, {29049,12}, {27108,5},
			{27108,6},{27108,7},{27108,8},{27108,9},{29066,2,"7-2"},
		},
	},
	fate40 =
	{
		--game =1 普通小怪
		{
			{6,2},{6,2}, {6,3}, {6,3}, {6,4},
			{34111,6},{34111,7}, {34111,8}, {34111,10}, {34111,12}
		},
		--game =2 精英怪
		{
			{6,4}, {6,5}, {34112,3}, {34112,4}, {34112,5},
			{31145,2},{31145,1,"7-1"},{29049,3},{29049,5},{29049,7},
		},
		--game =3 boss房间
		{
			{34113,2},{34113,3},{34113,4},{29066,2,"7-2"},{27108,7},
			{27108,8},{27108,9},{27108,10},{27108,11},{27108,12},
		},
		--game =4 终极BOSS
		{
			{7,2},{7,3},{29066,2,"7-2"}, {27108,12}, {27108,16},
			{27110,5,"2-1"},{27110,10,"2-1"},{27201,1},{27201,2},{27201,3},
		},
	},
	fate60 =
	{
		--game =1 普通小怪
		{
			{6,3},{6,3}, {6,4}, {6,5}, {6,6},
			{34111,8},{34111,10}, {34112,3}, {34112,4}, {34112,5}
		},
		--game =2 精英怪
		{
			{6,6}, {6,7}, {34112,5}, {34112,6}, {34112,7},
			{31145,2},{31145,1,"7-1"},{29049,3},{29049,5},{29049,7},
		},
		--game =3 boss房间
		{
			{34113,3},{34113,4},{34113,5},{29066,2,"7-2"},{27108,7},
			{27108,8},{27108,9},{27108,10},{27108,11},{27108,12},
		},
		--game =4 终极BOSS
		{
			{7,3},{7,4},{29066,2,"7-2"}, {27108,12}, {27108,16},
			{27110,5,"2-1"},{27110,10,"2-1"},{27201,1},{27201,2},{27201,3},
		},
	},
}

--cid 副本ID
function TeamCard:GetObject(cid)
	if TeamCard[cid] == nil then
		TeamCard[cid] = {}
		TeamCard[cid].cid = cid
		setmetatable(TeamCard[cid],self)
		self.__index = self
	end
	return TeamCard[cid]
end

--roottype (1-普通小乖，2-精英怪,3-Boss房间，4-终极BOSS)
function TeamCard:Start(teamlist,whichfate,roomtype)
	if teamlist == nil or type(teamlist) ~= "table" then
		return VALUE_FAIL
	end
	if whichfate == nil or type(whichfate) ~= "table" then
		return VALUE_FAIL
	end
	if roomtype == nil or type(roomtype) ~= "number" or roomtype < 0 or roomtype > 4 then
		return VALUE_FAIL
	end
	--[[
	for i = 1, table.getn(whichfate) do
	local n = table.getn(self.fatetype)
	if n == 0 then n = 1 end
	local rand = math.random(1,n)
	table.insert(self.fatetype,rand,whichfate[i])
	end
	]]
	awardlist = whichfate[roomtype]
	--奖励列表随机打乱
	self.fatetype = { awardlist[1] }
	for i = 2, table.getn(awardlist) do
		local n = table.getn(self.fatetype)
		local rand = math.random(1,n)
		table.insert(self.fatetype,rand,awardlist[i])
	end
	--self.teamlist = teamlist
	self.roomtype = roomtype
	self.gotuser = {}
	self.gotcard = {}
	self.start = 1
	self.time = 0
	for i = 1, table.getn(teamlist), 2 do
		ShowTeamCardDialog(teamlist[i+1])
	end
	return VALUE_OK
end

--cardid 牌编号
function TeamCard:OnChooseCard(uid,cardid)
	if self.start == 0 then
		return
	end
	local teamlist = s_getCopyEntry(self.cid,SCENE_ENTRY_PLAYER)
	--验证玩家是否在命运房间，是否已经领过
	local find = VALUE_FAIL
	for i = 1, table.getn(teamlist), 2 do
		if teamlist[i+1] == uid then
			find = VALUE_OK
			break
		end
	end
	if find == VALUE_FAIL then
		s_sysInfo(uid,"没有在命运房间，还想冒领奖励")
		return
	end
	find = VALUE_FAIL
	for i = 1, table.getn(self.gotuser) do
		if self.gotuser[i] == uid then
			find = VALUE_OK
			break
		end
	end
	if find == VALUE_OK then
		s_sysInfo(uid,"已经领取过奖励")
		return
	end
	if FindInTable(self.gotcard,cardid) == VALUE_OK then
		s_sysInfo(uid,"该牌已经被人翻过")
		return
	end
	--给予奖励
	if cardid > table.getn(self.fatetype) then
		return
	end
	award = self.fatetype[cardid]
	local itemid = award[1]
	local itemnum = award[2]
	local buff = award[3]
	if buff == nil then buff = "" end
	buff = "1-1," .. buff
	if itemid == 27201 then	--宝石的话随机下
		local stonelist = {27201, 27211, 27221, 27231, 27241}
		local rand = math.random(1, table.getn(stonelist))
		itemid = stonelist[rand]
	end
	s_addItem(uid,itemid,0,itemnum,0,buff,"命运翻牌所得")

	table.insert(self.gotuser,uid)
	table.insert(self.gotcard,cardid)
	--通知所有人翻牌结果
	for i = 1, table.getn(teamlist), 2 do
		s_sendCardChooseToUser(teamlist[i+1],uid,cardid,award)
	end
end

--每秒轮训
function TeamCard:Loop()
	if self.start == 0 then
		return self.time
	end
	if self.time > 30 then
		return self.time
	end
	if self.time == 25 then
		self.OnTimeOut(self)
	end
	if self.time == 30 then
		--CloseTeamCardDialog(uid);
		self.start = 0
		return self.time
	end
	self.time = self.time + 1
	return self.time
end

--时间到，给未选择玩家随机选择一个
function TeamCard:OnTimeOut()
	local award = self.fatetype
	if award == nil or type(award) ~= "table" then
		return
	end
	local teamlist = s_getCopyEntry(self.cid,SCENE_ENTRY_PLAYER)
	local n = table.getn(award)
	for i = 1,table.getn(teamlist),2 do
		local uid = teamlist[i+1]
		if FindInTable(self.gotuser,uid) ~= VALUE_OK then
			local rand = math.random(1,n)
			for i = 1,100,1 do
				if FindInTable(self.gotcard,rand) == VALUE_OK then
					rand = rand + 1
					if rand > n then
						rand = 1
					end
				else
					self.OnChooseCard(self,uid,rand)
					break
				end
			end
		end
		--CloseTeamCardDialog(uid);
	end
	--self.start = 0
end

--系统事件回调
function OnTeamCardChooseEvent(uid,cardid)
	local mapid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_CURRENT_MAP)
	if mapid ~= 107 then
		return
	end
	local cid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
	local teamcard = TeamCard:GetObject(cid)
	teamcard:OnChooseCard(uid,cardid)
end
