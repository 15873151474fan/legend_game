--仲夏夜之梦
--1是团ID，不可更改
ArSummer_Level5		= 2	--副本第五层NPC是否可点击，初始为1
ArSummer_Level10	= 3	--副本第十层NPC是否可点击，初始为1
ArSummer_Level15	= 4	--副本第十五层NPC是否可点击，初始为1
ArSummer_Level20	= 5	--副本第二十层NPC是否可点击，初始为1
ArSummer_Stop		= 6
ArSummer_LeftTime   = 7 --副本时间
-- 用户变量
ArSummerUser_Level5		= 1	--获得奖励的关卡,5
ArSummerUser_Level10	= 2	--获得奖励的关卡,10
ArSummerUser_Level15    = 3 --获得奖励的关卡,15
ArSummerUser_Level20    = 4 --获得奖励的关卡,20
ArSummerUser_TodayIn	= 5	--进入日期

CopySceneInfo_10 = {
	--副本内NPC刷新坐标
	npcpos = {
		{0,0},
		{{56005,56006,56007}, {{71,185,3},{57,163,6},{36,173,0}}},
		{{56005,56006,56007}, {{68,104,3},{69,89,5},{43,85,0}}},
		{{56005,56006,56007}, {{150,90,4},{138,78,6},{125,90,0}}},
		{{56005,56006,56007,56008}, {{228,97,4},{223,87,6},{213,101,1},{218,91,6}}}, --5
		{{56005,56006,56007}, {{332,99,4},{323,80,6},{305,89,7}}},
		{{56005,56006,56007}, {{425,94,4},{413,82,6},{400,94,0}}},
		{{56005,56006,56007}, {{419,172,4},{408,162,6},{396,172,0}}},
		{{56005,56006,56007}, {{425,249,4},{408,240,6},{398,249,0}}},
		{{56005,56006,56007,56008}, {{429,347,4},{419,332,6},{397,337,0},{409,334,1}}}, --10
		{{56005,56006,56007}, {{424,427,5},{408,421,7},{410,437,1}}},
		{{56005,56006,56007}, {{315,444,2},{315,423,6},{304,433,0}}},
		{{56005,56006,56007}, {{235,400,4},{222,389,6},{210,400,0}}},
		{{56005,56006,56007}, {{151,390,5},{140,387,7},{132,400,0}}},
		{{56005,56006,56007,56008}, {{71,398,4},{60,385,6},{47,398,0},{57,394,6}}}, --15
		{{56005,56006,56007}, {{71,312,3},{70,290,5},{47,311,1}}},
		{{56005,56006,56007}, {{153,299,4},{140,288,6},{129,299,0}}},
		{{56005,56006,56007}, {{236,301,4},{223,289,6},{211,301,0}}},
		{{56005,56006,56007}, {{327,348,3},{313,324,6},{298,353,1}}},
		{{56005,56006,56007,56008}, {{325,244,5},{302,243,7},{302,265,1},{314,260,6}}}, --20
		{{56005,56006,56007}, {{321,167,5},{308,165,7},{310,180,1}}},
		{{56005,56006,56007}, {{227,185,2},{237,167,5},{214,167,7}}},
		{{56005,56006,56007}, {{149,179,4},{137,162,6},{127,179,0}}}, --23
	},
	--精灵和宝箱刷新坐标
	boxspiritpos = {
		{0,0},
		{52,175},
		{49,94},
		{134,94},
		{209,90}, --5
		{322,86},
		{420,88},
		{415,180},
		{419,255},
		{425,342}, --10
		{417,349},
		{308,433},
		{229,405},
		{135,406},
		{66,405}, --15
		{63,304},
		{148,289},
		{229,309},
		{298,330},
		{319,250}, --20
		{318,177},
		{226,184},
		{144,180},--23
	},
	--人的坐标
	userpos = {
		{63,256},
		{55,182},
		{62,96},
		{138,90},
		{213,91}, --5
		{314,89},
		{414,94},
		{403,168},
		{409,258},
		{410,336}, --10
		{416,425},
		{320,439},
		{227,395},
		{145,401},
		{63,393}, --15
		{63,296},
		{136,304},
		{223,301},
		{309,343},
		{309,260}, --20
		{309,174},
		{217,175},
		{135,180},--23
		{138,240},
	},
}

--用户变量
function CopySceneInfo_10:GetUserVar(uid,key)
	return s_getVar(uid,104,key)
end
function CopySceneInfo_10:SetUserVar(uid,key,value)
	s_addVar(uid,104,key,value)
end
--用户变量
function CopySceneInfo_10:GetUserVar(uid,key)
	return s_getVar(uid,104,key)
end
function CopySceneInfo_10:SetUserVar(uid,key,value)
	s_addVar(uid,104,key,value)
end

--全局变量
function CopySceneInfo_10:GetVar(sid,index)
	return s_getSceneVar(sid,0,index)
end
function CopySceneInfo_10:SetVar(sid,index,value)
	s_setSceneVar(sid,0,index,value)
end

function CopySceneInfo_10:InitCopyScene(cid)
	self:SetVar(cid,ArSummer_LeftTime,15*60)
	self:SetVar(cid,ArSummer_Level5,1)
	self:SetVar(cid,ArSummer_Level10,1)
	self:SetVar(cid,ArSummer_Level15,1)
	self:SetVar(cid,ArSummer_Level20,1)
	--召唤NPC
	for i=2,table.getn(self.npcpos) do
		local rand_zone = {1,2,3}
		local npcbuff = {20281,20282,20283}
		for j=1,table.getn(self.npcpos[i][1]) do
			if j < 4 then
				--副本传送
				local rand = math.random(1,table.getn(rand_zone))
				local npcid = s_sysSummon(self.npcpos[i][1][j],cid,self.npcpos[i][2][rand_zone[rand]][1],
					self.npcpos[i][2][rand_zone[rand]][2])
				if npcid == 0 or npcid == nil then
					s_debug("仲夏夜副本传送NPC召唤失败:%u,%u",i,self.npcpos[i][1][j])
				else
					s_debug("仲夏夜第%u层召唤NPC：%u",i,self.npcpos[i][1][j])
					--增加变量记录当前岛
					s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MIDDLESUMMER_LEVEL,i)
					s_addbuff(SCENE_ENTRY_NPC,npcid,npcbuff[rand],1,15*60+20)
					s_setNpcDir(npcid,self.npcpos[i][2][rand_zone[rand]][3])
				end
				table.remove(rand_zone,rand)
				table.remove(npcbuff,rand)
			else
				--魔化士兵
				local npcid = s_sysSummon(self.npcpos[i][1][j],cid,self.npcpos[i][2][j][1],self.npcpos[i][2][j][2])
				if npcid == 0 or npcid == nil then
					s_debug("仲夏夜副本魔化士兵召唤失败:%u,%u",i,self.npcpos[i][1][j])
				else
					--增加变量记录当前岛
					s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MIDDLESUMMER_LEVEL,i)
					s_setNpcDir(npcid,self.npcpos[i][2][j][3])
				end
			end
		end
	end
	--召唤箱子
	for i=1,4 do
		local rand = math.random(2,23)
		local npcid = s_sysSummon(56010,cid,self.boxspiritpos[rand][1],self.boxspiritpos[rand][2])
		if npcid == 0 or npcid == nil then
			s_debug("仲夏夜副本宝箱召唤失败")
		else
			s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MIDDLESUMMER_LEVEL,rand)
		end
	end

	--召唤精灵
	local rand = math.random(2,23)
	local npcid = s_sysSummon(56011,cid,self.boxspiritpos[rand][1],self.boxspiritpos[rand][2])
	if npcid == 0 or npcid == nil then
		s_debug("仲夏夜副本森林蓝精灵召唤失败")
	else
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MIDDLESUMMER_LEVEL,rand)
	end
end
function CopySceneInfo_10:OnPlayerIntoCopyScene(cid,uid)
	local lefttime = self:GetVar(cid,ArSummer_LeftTime)
	s_sendCopyInfo(cid,1,lefttime,"仲夏夜之梦")
	local today = s_getCurTime(TIME_ALLDAYS)
	if self:GetUserVar(uid,ArSummerUser_TodayIn) ~= today then
		self:SetUserVar(uid,ArSummerUser_TodayIn,today)
		self:SetUserVar(uid,ArSummerUser_Level5,0)
		self:SetUserVar(uid,ArSummerUser_Level10,0)
		self:SetUserVar(uid,ArSummerUser_Level15,0)
		self:SetUserVar(uid,ArSummerUser_Level20,0)
	end
	s_goto(SCENE_ENTRY_PLAYER,uid,self.userpos[1][1],self.userpos[1][2])
end
function CopySceneInfo_10:OnPlayerLeaveCopyScene(cid,uid)
	if s_getVar(uid,130,5) == 0 then
		s_addVar(uid,130,5,1)
		s_addVar(uid,130,100,s_getVar(uid,130,100)+1)
		s_debugUser(uid,"团活力，团拓展，参与度：1")
	end
end
function OnLoopCopyScene_1Sec_10(ctype,cid)
	local lefttime = CopySceneInfo_10:GetVar(cid,ArSummer_LeftTime)
	if lefttime == 20 then
		local npclist = s_getNpcByBaseID(cid, 56012)
		if #npclist ~= 0 then
			s_clearNpc(npclist[1])
		end
		local caton = 0
		if CopySceneInfo_10:GetVar(cid,ArSummer_Stop) == 0 then
			caton = 14
		else
			caton = 13
		end
		local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
		for i=1,table.getn(list),2 do
			s_playClientLua(list[i+1],caton)
		end
	end
	if lefttime <= 20 then
		s_copyInfo(cid,"结束倒计时:" .. lefttime)
	end
	if lefttime == 0 then
		local today = s_getCurTime(TIME_ALLDAYS)
		local ret = 0
		local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
		for i=1,table.getn(list),2 do
			local color_rate = {1,1.5,2,3,6}
			local corps = s_getCorpsId(list[i+1])
			if corps ~= 0 then
				local color = s_getCorpsVar(corps,1,36)
				if ret == 0 then
					local rand = math.random(1,100)
					if color == 1 and rand <= 30 then
						ret =2
					elseif color == 2 and rand <= 40 then
						ret = 2
					elseif color == 3 and rand <= 50 then
						ret = 2
					elseif color == 4 and rand <= 80 then
						ret = 2
					elseif color == 5 then
						ret = 2
					else
						ret = 1
					end
				end
				if ret == 2 then
					s_addItem(list[i+1],55059,0,1,0,"1-1","OnLoopCopyScene_1Sec_10")
				end
				local level = s_getValue(list[i],list[i+1],VALUE_TYPE_LEVEL)
				if CopySceneInfo_10:GetVar(cid,ArSummer_Stop) == 1  then
					local exp = math.floor(150* (50+0.1*level^2.2)*color_rate[color])
					s_refreshExp(list[i+1],exp,ExpType_Corps,0)
					s_addField(list[i+1],UserVar_CooperationPoint,10)
				else
					local exp = math.floor(75* (50+0.1*level^2.2)*color_rate[color])
					s_refreshExp(list[i+1],exp,ExpType_Corps,0)
					s_addField(list[i+1],UserVar_CooperationPoint,5)
				end
				s_addCorpsVar(corps,1,38,today)
			end
			s_resetTrafficType(list[i+1])
			s_relive(list[i],list[i+1])
			ReturnUserHome(list[i+1],"OnLoopCopyScene_1Sec_10")
		end
		CopySceneInfo_10:SetVar(cid,ArSummer_LeftTime,lefttime-1)
		s_clearCopy(cid)
		return
	end
	CopySceneInfo_10:SetVar(cid,ArSummer_LeftTime,lefttime-1)
end

function CopySceneInfo_10:GoToLevel(uid,level,oldlevel)
	if level > 24 then return end
	if level == 1 then
		local rand = math.random(1,100)
		if rand < 11 then
			s_addbuff(SCENE_ENTRY_PLAYER,uid,10205,1,10)
		end
		s_sysInfo(uid,"糟糕，中了黑魔的陷阱，返回出发点！")
	elseif level > oldlevel then
		s_sysInfo(uid,"成功进入下一个岛："..level.."号岛！")
	else
		s_sysInfo(uid,"不妙，退回上个岛："..level.."号岛！")
	end
	s_goto(SCENE_ENTRY_PLAYER,uid,self.userpos[level][1],self.userpos[level][2])
end
