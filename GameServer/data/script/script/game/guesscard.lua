--猜牌游戏
GuessCard =
{
	--exp = 0,	--携带经验
	syscard = 0,--系统牌
	cards = {0, 0, 0},	--玩家底牌
	beginning = 0,		--游戏开始状态
	event_call = nil,    --结束回调
	giveup_call = nil,	 --放弃回调
}

--创建新对象
function GuessCard:New()
	local o = {}
	setmetatable(o,self)
	self.__index = self
	return o
end

--开始游戏(对外接口)
--参数tip1,tip2 为猜牌界面提示语
--胜率success: 1表示30%, 2表示60%, 3表示100%
function GuessCard:Start(uid,tip1,tip2,success)
	if success == nil then
		success = 1
	end
	if GuessCards == nil then
		GuessCards = {}
	end
	if GuessCards[uid] == nil then
		GuessCards[uid] = GuessCard:New(exp)
	end
	local card = GuessCards[uid]
	card:init(success)
	s_startGuessCard(uid,card.syscard,tip1,tip2)
	return card
end

--初始化
--1-13<==>2..13,A
--胜率success: 1表示30%, 2表示60%, 3表示100%
function GuessCard:init(success)
	if success == 2 then		--60%
		self.syscard = math.random(1,11)
		--先保证出一张比系统牌大的底牌,和一张小的底牌
		self.cards = {}
		local c = math.random(self.syscard+1,13)
		local s, r
		while true do
			s = math.random(self.syscard+1,13)
			if s ~= self.syscard and s ~= c then
				break
			end
		end
		while true do
			r = math.random(1,13)
			if r ~= self.syscard and r ~= c and r ~= s then
				break
			end
		end
		table.insert(self.cards,c)
		local pos = math.random(1,2)
		table.insert(self.cards,pos,s)
		pos = math.random(1,3)
		table.insert(self.cards,pos,r)
	elseif success == 3 then	--100%
		self.syscard = math.random(1,10)
		--先保证出一张比系统牌大的底牌,和一张小的底牌
		self.cards = {}
		local c = math.random(self.syscard+1,13)
		table.insert(self.cards, c)
		while true do
			local r = math.random(self.syscard+1,13)
			if r ~= self.syscard and r ~= self.cards[1] then
				table.insert(self.cards, r)
				break
			end
		end
		while true do
			local r = math.random(self.syscard+1,13)
			if r ~= self.syscard and r ~= self.cards[1] and r ~= self.cards[2] then
				table.insert(self.cards, r)
				break
			end
		end
	else		--30%
		self.syscard = math.random(2,12)
		--先保证出一张比系统牌大的底牌,和一张小的底牌
		self.cards = {}
		local c = math.random(self.syscard+1,13)
		local s = math.random(1,self.syscard-1)
		while true do
			local r = math.random(1,13)
			if r ~= self.syscard and r ~= c and r ~= s then
				table.insert(self.cards,r)
			end
			if table.getn(self.cards) >= 1 then
				break
			end
		end
		table.insert(self.cards,s)
		local pos = math.random(1,3)
		table.insert(self.cards,pos,c)
	end

	self.beginning = 1
	self.event_call = nil
	self.giveup_call = nil
end

--猜牌
function GuessCard:guess(uid,num)
	if self.beginning == 0 then
		s_sysInfo(uid,"猜牌游戏还未初始化")
		return
	end
	self.beginning = 0
	local result = 0
	local tip = "很抱歉，本次猜牌输了^_^"
	if self.syscard < self.cards[num] then
		result = 1
		tip = "恭喜您，本次猜牌赢了!"
	end
	s_outputGuessCard(uid,result,self.cards[1],self.cards[2],self.cards[3])
	if self.event_call ~= nil then
		self.event_call.param_ext = { result}
		self.event_call:Exec()
	end
	s_sysInfo(uid,tip)
end

--放弃比赛
function GuessCard:giveup(uid)
	if self.beginning ~= 0 then
		self.beginning = 0
		if self.giveup_call ~= nil then
			self.giveup_call.param_ext = {}
			self.giveup_call:Exec()
		end
		s_sysInfo(uid,"放弃本次猜牌游戏")
	end
end

--注册猜牌游戏事件
function GuessCard:registerOverEvent(call)
	self.event_call = call
end

--注册猜牌放弃事件
function GuessCard:registerGiveupEvent(call)
	self.giveup_call = call
end
