--帝都战
-- 进入副本后区分阵营模式 17-阵营A(红方-攻方) 18-阵营B(蓝方-守方)

--///////////////////////////////////////////////////////////////////
-- 副本场景变量定义
--0_101 开始时间
--0_102 西门守将
--0_103 南门守将
--0_104 东门守将
--0_105 女武神
--0_106 帝皇雕像
--0_107 皇权马车
--0_108 攻方杀敌数
--0_109 守方杀敌数
--0_110	西门守将击败者
--0_111	南门守将击败者
--0_112	东门守将击败者
--0_113 女武神击败者
--0_114 雕像击败者
--0_115 英灵召唤次数
--0_116 马车召唤时间
--0_117 是否设置马车
--0_118 马车到达指定位置
--0_119 结束标记
--0_120 马车召唤
--0_121 守将击败次数
--0_122 马车死亡次数

--各国家属性
--CountryID_0			攻守方,1攻方，2守方
--CountryID_2			复活点

--角色数据
ArUser_Gindex           = 1     -- 阵营索引
ArUser_KillNum			= 2		-- 杀敌数
ArUser_WarPoint			= 3		-- 战功
ArUser_Junfu			= 4		-- 军服

--水晶数据
ArCrystal_Npc		= 1		-- 水晶NPC
ArCrystal_Group		= 2		-- 当前阵营

--马车数据
ArCar_Npc			= 1		-- 马车NPC
ArCar_True			= 2		-- 马车真假,1真，0假
ArCar_King			= 3		-- 设置的国王

CopySceneInfo_73 = {
	--阵营BUFF
	groupID = {17,18},
	--初始进入区
	initZone = {
		{{64,364},{139,648},{378,700},{623,687},{721,362},{378,468}}, --红，前5个坐标为初始坐标
		{{379,349},{377,97}},  --蓝，第一个坐标为初始坐标
	},
	--NPC坐标
	crytal = {
		{60898,x =147, y =364},		--1号水晶
		{60899,x =243, y =524},		--2号水晶
		{60900,x =378, y =617},		--3号水晶
		{60901,x =526, y =526},		--4号水晶
		{60902,x =638, y =362},		--5号水晶
		{60903,x=72, y=375},		--1号旌旗
		{60904,x=150, y=630},		--2号旌旗
		{60905,x=368, y=692},		--3号旌旗
		{60906,x=617, y=676},		--4号旌旗
		{60907,x=710, y=353}		--5号旌旗
	},
	girlgod = {
		{60890, x=270, y=365},
		{60891, x=378, y=489},
		{60892, x=491, y=365},
	},
	wushen = {60893, x=378, y=366},
	cars = {
		{60895, x=370, y=264},
		{60896, x=379, y=264},
		{60897, x=388, y=264},
	},
	warinfo= {
		log = {},						--战史记录
		scorerank1 = {},				--火国战功排行
		scorerank2 = {},				--风国战功排行
		scorerank3 = {},				--花国战功排行
		scorerank4 = {},				--水国战功排行
		scorerank5 = {},				--天国战功排行
		scorerank6 = {},				--沙国战功排行
		cscore = {},
		cars = {},						--马车
	},
}

--用户变量
function CopySceneInfo_73:GetUserVar(uid,key)
	return s_getVar(uid,104,key)
end
function CopySceneInfo_73:SetUserVar(uid,key,value)
	s_addVar(uid,104,key,value)
end

--水晶变量
function CopySceneInfo_73:GetCrystalVar(cid,index,key)
	return s_getSceneVar(cid,20,index*100+key)
end
function CopySceneInfo_73:SetCrystalVar(cid,index,key,value)
	s_setSceneVar(cid,20,index*100+key,value)
end

--马车变量
function CopySceneInfo_73:GetCarVar(cid,index,key)
	return s_getSceneVar(cid,30,index*100+key)
end
function CopySceneInfo_73:SetCarVar(cid,index,key,value)
	s_setSceneVar(cid,30,index*100+key,value)
end

--增加战功
function CopySceneInfo_73:AddWarScore(uid,score)
	local uscore = CopySceneInfo_73:GetUserVar(uid,ArUser_WarPoint)
	CopySceneInfo_73:SetUserVar(uid,ArUser_WarPoint,uscore+score)
	uscore = CopySceneInfo_73:GetUserVar(uid,ArUser_WarPoint)
	local homeland = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND)
	local ret = 0
	for i=1,table.getn(self.warinfo.cscore) do
		if homeland == self.warinfo.cscore[i][1] then
			self.warinfo.cscore[i][2] = self.warinfo.cscore[i][2]+score
			ret = 1
			break
		end
	end
	if ret == 0 then
		table.insert(self.warinfo.cscore,{homeland,uscore})
	end
	if homeland == 2 then
		if table.getn(self.warinfo.scorerank5) <= 10 then
			local ret = 0
			for i=1,table.getn(self.warinfo.scorerank5) do
				if self.warinfo.scorerank5[i][1] == uid then
					self.warinfo.scorerank5[i][2] = uscore
					ret = 1
				end
			end
			if ret == 0 then
				local t = {uid,uscore}
				table.insert(self.warinfo.scorerank5,t)
			end
			table.sort(self.warinfo.scorerank5,function(t1,t2)return t1[2] > t2[2] end)
		end
		for i=11,table.getn(self.warinfo.scorerank5) do
			table.remove(self.warinfo.scorerank5,i)
		end
	elseif homeland == 3 then
		if table.getn(self.warinfo.scorerank1) <= 10 then
			local ret = 0
			for i=1,table.getn(self.warinfo.scorerank1) do
				if self.warinfo.scorerank1[i][1] == uid then
					self.warinfo.scorerank1[i][2] = uscore
					ret = 1
				end
			end
			if ret == 0 then
				local t = {uid,uscore}
				table.insert(self.warinfo.scorerank1,t)
			end
			table.sort(self.warinfo.scorerank1,function(t1,t2)return t1[2] > t2[2] end)
		end
		for i=11,table.getn(self.warinfo.scorerank1) do
			table.remove(self.warinfo.scorerank1,i)
		end
	elseif homeland == 4 then
		if table.getn(self.warinfo.scorerank4) <= 10 then
			local ret = 0
			for i=1,table.getn(self.warinfo.scorerank4) do
				if self.warinfo.scorerank4[i][1] == uid then
					self.warinfo.scorerank4[i][2] = uscore
					ret = 1
				end
			end
			if ret == 0 then
				local t = {uid,uscore}
				table.insert(self.warinfo.scorerank4,t)
			end
			table.sort(self.warinfo.scorerank4,function(t1,t2)return t1[2] > t2[2] end)
		end
		for i=11,table.getn(self.warinfo.scorerank4) do
			table.remove(self.warinfo.scorerank4,i)
		end
	elseif homeland == 5 then
		if table.getn(self.warinfo.scorerank6) <= 10 then
			local ret = 0
			for i=1,table.getn(self.warinfo.scorerank6) do
				if self.warinfo.scorerank6[i][1] == uid then
					self.warinfo.scorerank6[i][2] = uscore
					ret = 1
				end
			end
			if ret == 0 then
				local t = {uid,uscore}
				table.insert(self.warinfo.scorerank6,t)
			end
			table.sort(self.warinfo.scorerank6,function(t1,t2)return t1[2] > t2[2] end)
		end
		for i=11,table.getn(self.warinfo.scorerank6) do
			table.remove(self.warinfo.scorerank6,i)
		end
	elseif homeland == 6 then
		if table.getn(self.warinfo.scorerank2) <= 10 then
			local ret = 0
			for i=1,table.getn(self.warinfo.scorerank2) do
				if self.warinfo.scorerank2[i][1] == uid then
					self.warinfo.scorerank2[i][2] = uscore
					ret = 1
				end
			end
			if ret == 0 then
				local t = {uid,uscore}
				table.insert(self.warinfo.scorerank2,t)
			end
			table.sort(self.warinfo.scorerank2,function(t1,t2)return t1[2] > t2[2] end)
		end
		for i=11,table.getn(self.warinfo.scorerank2) do
			table.remove(self.warinfo.scorerank2,i)
		end
	elseif homeland == 7 then
		if table.getn(self.warinfo.scorerank3) <= 10 then
			local ret = 0
			for i=1,table.getn(self.warinfo.scorerank3) do
				if self.warinfo.scorerank3[i][1] == uid then
					self.warinfo.scorerank3[i][2] = uscore
					ret = 1
				end
			end
			if ret == 0 then
				local t = {uid,uscore}
				table.insert(self.warinfo.scorerank3,t)
			end
			table.sort(self.warinfo.scorerank3,function(t1,t2)return t1[2] > t2[2] end)
		end
		for i=11,table.getn(self.warinfo.scorerank3) do
			table.remove(self.warinfo.scorerank3,i)
		end
	end
end

--攻守方消息
function CopySceneInfo_73:SendGroupInfo(gi,cid,msg,info_type)
	if info_type == nil then
		info_type = ChatPos_Sys
	end
	local clist = pack(s_getCountryList())
	for i=1,table.getn(clist) do
		if clist[i] ~= 13 then
			if s_getSceneVar(cid,clist[i],0) == gi then
				s_countryInfo(clist[i],msg,info_type)
			end
		end
	end
end

--刷新客户端副本信息
--1西门，2南门，3东门，4女武神，5雕像，6马车，7攻方杀敌数，8守方杀敌数，9剩余时间，10-14当前5个水晶占领点被占情况(0无,1红,2篮)，15守方国
function CopySceneInfo_73:SendCopyInfo(cid,uid,ckey,cvalue)
	local vlist = {}
	local size = 1
	if ckey == 0 then
		table.insert(vlist, 1)
		table.insert(vlist, s_getSceneVar(cid,0,102))
		table.insert(vlist, 2)
		table.insert(vlist, s_getSceneVar(cid,0,103))
		table.insert(vlist, 3)
		table.insert(vlist, s_getSceneVar(cid,0,104))
		table.insert(vlist, 4)
		table.insert(vlist, s_getSceneVar(cid,0,105))
		table.insert(vlist, 5)
		table.insert(vlist, s_getSceneVar(cid,0,106))
		table.insert(vlist, 6)
		table.insert(vlist, s_getSceneVar(cid,0,107))
		table.insert(vlist, 7)
		table.insert(vlist, s_getSceneVar(cid,0,108))
		table.insert(vlist, 8)
		table.insert(vlist, s_getSceneVar(cid,0,109))
		local start = s_getSceneVar(cid,0,101)
		local cursec = s_getCurTime(TIME_ALLSECONDS)
		table.insert(vlist,9)
		table.insert(vlist,5400-(cursec-start))
		for i=1,5 do
			table.insert(vlist,9+i)
			table.insert(vlist,CopySceneInfo_73:GetCrystalVar(cid,i,ArCrystal_Group))
		end
		table.insert(vlist,15)
		table.insert(vlist,s_getCountryVar(13,11,4))
		size = 15
	else
		table.insert(vlist,ckey)
		table.insert(vlist,cvalue)
		if ckey == 1 and cvalue == 100 then
			table.insert(self.warinfo.log, {s_getCurTime(TIME_ALLSECONDS),"在命运之线的交织下，西门的守卫女神诗蔻迪复活了，帝都的防御又增强了。"})
		elseif ckey == 2 and cvalue == 100 then
			table.insert(self.warinfo.log, {s_getCurTime(TIME_ALLSECONDS),"在命运之线的交织下，南门的守卫女神贝露丹迪复活了，帝都的防御又增强了。"})
		elseif ckey == 3 and cvalue == 100 then
			table.insert(self.warinfo.log, {s_getCurTime(TIME_ALLSECONDS),"在命运之线的交织下，东门的守卫女神兀尔德复活了，帝都的防御又增强了。"})
		end
	end
	s_sendCopyVar(CopySceneType_EmperorWar, cid,uid,size,vlist)
end

function CopySceneInfo_73:GetMengJiangTan(cid,uid,bend)
	if s_getSceneVar(cid,0,119) == 1 and bend == 0 then
		return
	end
	--战功
	local list = {}
	if uid == 0 then
		table.insert(list,0)
	else
		table.insert(list,CopySceneInfo_73:GetUserVar(uid,ArUser_WarPoint))
	end
	local num = 1
	local countrynum = 0
	local clist = pack(s_getCountryList())
	for i=1,table.getn(clist) do
		if clist[i] ~= 13 then
			table.insert(list,clist[i])
			table.insert(list,s_getSceneVar(cid,clist[i],0))
			local size = 2
			if bend == 1 then
				for j=1,table.getn(self.warinfo.cscore) do
					if clist[i] == self.warinfo.cscore[j][1] then
						table.insert(list,self.warinfo.cscore[j][2])
						size = 3
						break
					end
				end
			end
			if size == 2 then
				table.insert(list,0)
				size = 3
			end
			local tmp = {}
			if clist[i] == 2 then
				tmp = self.warinfo.scorerank5
			elseif clist[i] == 3 then
				tmp = self.warinfo.scorerank1
			elseif clist[i] == 4 then
				tmp = self.warinfo.scorerank4
			elseif clist[i] == 5 then
				tmp = self.warinfo.scorerank6
			elseif clist[i] == 6 then
				tmp = self.warinfo.scorerank2
			elseif clist[i] == 7 then
				tmp = self.warinfo.scorerank3
			end
			if table.getn(tmp) > 10 then
				for k=1,10 do
					table.insert(list,tmp[k][1])
					table.insert(list,tmp[k][2])
					size = size+2
				end
			else
				for k=1,table.getn(tmp) do
					table.insert(list,tmp[k][1])
					table.insert(list,tmp[k][2])
					size = size+2
				end
			end
			if size ~= 23 then
				for l=1,(20-table.getn(tmp)),2 do
					table.insert(list,0)
					table.insert(list,0)
					size = size+2
					if size == 23 then
						break
					end
				end
			end
			countrynum = countrynum+1
			num = num + 23
		end
	end
	--杰出表现
	table.insert(list,s_getSceneVar(cid,0,110))
	table.insert(list,s_getSceneVar(cid,0,111))
	table.insert(list,s_getSceneVar(cid,0,112))
	table.insert(list,s_getSceneVar(cid,0,113))
	table.insert(list,s_getSceneVar(cid,0,114))
	num = num+5
	--记史
	for i=1,table.getn(self.warinfo.log) do
		table.insert(list,self.warinfo.log[i][1])
		table.insert(list,self.warinfo.log[i][2])
		num = num+2
	end
	if bend == 0 then
		s_sendDiduCopyInfo(CopySceneType_EmperorWar,cid,uid,num,countrynum,list)
	else
		s_sendDiduCopyInfo(CopySceneType_EmperorWar,0,uid,num,countrynum,list)
	end
end

function CopySceneInfo_73:InitCopyScene(cid)
	if s_getSceneVar(cid,0,119) == 1 then
		return
	end
	if s_getCountryVar(13,11,5) ~= World_War_State_Ready then
		return
	end
	s_setSceneVar(cid,0,101,s_getCurTime(TIME_ALLSECONDS))--开始时间
	-- 国家数据初始化
	self.warinfo.log = {}
	self.warinfo.scorerank1 = {}
	self.warinfo.scorerank2 = {}
	self.warinfo.scorerank3 = {}
	self.warinfo.scorerank4 = {}
	self.warinfo.scorerank5 = {}
	self.warinfo.scorerank6 = {}
	self.warinfo.cscore = {}
	self.warinfo.cars = {}
	s_addCountryVar(13,11,5,World_War_State_Start)
	local defense = s_getCountryVar(13,11,4)
	local reliveZone = {}
	for i=1,5 do
		table.insert(reliveZone,{i,self.initZone[1][i]})
	end
	local attack = {}
	local friend = {}
	local list = pack(s_getCountryList())
	for i=1,table.getn(list) do
		if list[i] ~= 13 then
			if s_isFriendCountry(defense,list[i]) == VALUE_OK
				or defense == list[i] then
				s_setSceneVar(cid,list[i],0,2)
				s_setSceneVar(cid,list[i],2,1)
				if s_isFriendCountry(defense,list[i]) == VALUE_OK then
					local cname = s_getCountryName(list[i])
					table.insert(friend,cname)
				end
			else
				s_setSceneVar(cid,list[i],0,1)
				local rand = math.random(1,table.getn(reliveZone))
				s_setSceneVar(cid,list[i],2,reliveZone[rand][1])
				table.remove(reliveZone,rand)
				local cname = s_getCountryName(list[i])
				table.insert(attack,cname)
			end
		end
	end
	local msg = ""
	for i=1,table.getn(attack) do
		if i ~= 1 then
			msg = msg .."、".. attack[i]
		else
			msg = attack[i]
		end
	end
	if table.getn(friend) == 1 then
		msg = msg.."联合向帝皇国发起进攻，"..friend[1].."协防。"
	else
		msg = msg.."联合向帝皇国发起进攻。"
	end
	table.insert(self.warinfo.log, {s_getCurTime(TIME_ALLSECONDS),msg})
	-- NPC数据初始化
	for i=1,table.getn(self.crytal) do
		local npcid = s_sysSummon(self.crytal[i][1],cid,self.crytal[i].x,self.crytal[i].y,1045,1)
		if npcid == 0 then
			s_debug("帝都战传送水晶初始化失败:%u",self.flag[i][1])
		elseif i <= 5 then
			self:SetCrystalVar(cid,i,ArCrystal_Npc,npcid)
			self:SetCrystalVar(cid,i,ArCrystal_Group,2)
			s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER,i)
			s_addbuff(SCENE_ENTRY_NPC, npcid, 20363, 1, 5400)
		elseif i > 5 then
			self:SetCrystalVar(cid,i,ArCrystal_Npc,npcid)
			self:SetCrystalVar(cid,i,ArCrystal_Group,1)
			s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER,i)
			s_addGroup(SCENE_ENTRY_NPC, npcid, 17)
		end
	end
	--三个卖火柴的小女神
	--[[
	for i=1,table.getn(self.girlgod) do
	local npcid = s_sysSummon(self.girlgod[i][1],cid,self.girlgod[i].x,self.girlgod[i].y,1045)
	if npcid == 0 then
	s_debug("帝都战三女神初始化失败:%u",self.flag[i][1])
	end
	s_setSceneVar(cid,0,101+i,100)
	end
	]]
	for i=1,table.getn(self.girlgod) do
		s_setSceneVar(cid,0,101+i,100)
	end
	s_setSceneVar(cid,0,102,100)
	s_setSceneVar(cid,0,103,100)
	s_setSceneVar(cid,0,104,100)
	s_setSceneVar(cid,0,105,-1)
	s_setSceneVar(cid,0,106,-1)
	s_setSceneVar(cid,0,107,-1)
end

function CopySceneInfo_73:OnPlayerIntoCopyScene(cid,uid)
	CopySceneInfo_73:SetUserVar(uid,ArUser_Gindex,0)
	CopySceneInfo_73:SetUserVar(uid,ArUser_KillNum,0)
	CopySceneInfo_73:SetUserVar(uid,ArUser_WarPoint,0)
	CopySceneInfo_73:SetUserVar(uid,ArUser_Junfu,0)
	local homeland = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND)
	if s_getSceneVar(cid,homeland,0) == 1 then
		--攻方
		s_addGroup(SCENE_ENTRY_PLAYER, uid, 17)
		self:SetUserVar(uid,ArUser_Gindex,1)
		local posx = self.initZone[1][s_getSceneVar(cid,homeland,2)][1]
		local posy = self.initZone[1][s_getSceneVar(cid,homeland,2)][2]
		s_goto(SCENE_ENTRY_PLAYER,uid,posx,posy)
	else
		s_addGroup(SCENE_ENTRY_PLAYER, uid, 18)
		self:SetUserVar(uid,ArUser_Gindex,2)
		local posx = self.initZone[2][s_getSceneVar(cid,homeland,2)][1]
		local posy = self.initZone[2][s_getSceneVar(cid,homeland,2)][2]
		s_goto(SCENE_ENTRY_PLAYER,uid,posx,posy)
	end
	s_addbuff(SCENE_ENTRY_PLAYER,uid,122,1,5*30)
	self:SendCopyInfo(cid,uid,0,0)
end

function CopySceneInfo_73:OnPlayerLeaveCopyScene(cid,uid)
	for i=17,18 do--清理buff
		s_removebuff(SCENE_ENTRY_PLAYER,uid,i)
	end
	s_removebuff(SCENE_ENTRY_PLAYER,uid,122)
end

function CopySceneInfo_73:gameOver(cid,group)
	if s_getSceneVar(cid,0,119) == 1 then
		return
	end
	local defanse = s_getCountryVar(13,11,4)
	local defansename = s_getCountryName(defanse)
	local cursec = s_getCurTime(TIME_ALLSECONDS)
	table.sort(self.warinfo.cscore,function(t1,t2)return t1[2] > t2[2] end)
	if group == 1 then
		-- 帝皇产生
		local emeror = 0
		local country = 0
		for j=1,table.getn(self.warinfo.cscore) do
			if s_getSceneVar(cid,self.warinfo.cscore[j][1],0) == 1 then
				country = self.warinfo.cscore[j][1]
				local king = s_getCountryField(self.warinfo.cscore[j][1],CountryVar_Marshal)
				if king ~= 0 then
					emeror = king
					s_setup(SCENE_ENTRY_PLAYER,king,1)
					--s_sysMail(king,"恭喜您成为新一代帝皇！获得了至高无上的坐骑“帝皇霸龙神”！",0,52040,1,"1-1")
				end
				s_setCountryField(13, CountryVar_Emperor, country)
				break
			end
		end
		if country ~= 0 then
			local countryname = s_getCountryName(country)
			local name = s_getValue(SCENE_ENTRY_PLAYER,emeror,VALUE_TYPE_NAME)
			if name ~= nil then
				s_worldInfo(countryname.."国王"..name.."与诸国协力，推翻"..defansename.."帝都霸权，成为新一代帝皇！",
					ChatPos_Sys + ChatPos_Honor)
				table.insert(self.warinfo.log, {s_getCurTime(TIME_ALLSECONDS),countryname.."国王"..name.."与诸国协力，推翻"..defansename.."帝都霸权，成为新一代帝皇！"})
			else
				s_worldInfo(countryname.."国获得了帝皇争夺战的胜利，夺取了帝皇！",ChatPos_Sys + ChatPos_Honor)
				table.insert(self.warinfo.log, {s_getCurTime(TIME_ALLSECONDS),countryname.."国与诸国协力，推翻"..defansename.."帝都霸权，成为新一代帝皇！"})
			end
		end
	elseif group == 2 then
		s_setCountryField(13, CountryVar_Emperor, defanse)
		local king = s_getCountryField(defanse,CountryVar_Marshal)
		if king ~= 0 then
			s_setup(SCENE_ENTRY_PLAYER,king,1)
			--s_sysMail(king,"恭喜您成为新一代帝皇！获得了至高无上的坐骑“帝皇霸龙神”！",0,52040,1,"1-1")
		end
		s_worldInfo(defansename.."成功抵御诸国的联合进攻，再展帝皇之威，令诸国臣服！",
			ChatPos_Sys + ChatPos_Honor)
		table.insert(self.warinfo.log, {s_getCurTime(TIME_ALLSECONDS),defansename.."成功抵御诸国的联合进攻，再展帝皇之威，令诸国臣服！"})
	end
	s_addCountryVar(13,11,1,0)
	s_addCountryVar(13,11,2,0)
	s_addCountryVar(13,11,3,0)
	s_addCountryVar(13,11,4,0)
	s_addCountryVar(13,11,5,0)
	s_addCountryVar(13,11,6,0)
	s_setSceneVar(cid,0,119,1)
	--发奖
	local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
	for i=1,table.getn(list) do
		if list[i+1] ~= 0 or list[i+1] ~= nil then
			if self:GetUserVar(list[i+1],ArUser_Gindex) == group then
				local level = s_getValue(SCENE_ENTRY_PLAYER,list[i+1],VALUE_TYPE_LEVEL)
				local fun = s_getFunction(list[i+1],Relation_Country)
				--经验公式=1.5*750*(30+角色等级^1.5)*1.5
				if fun == FunctionType_Marshal or fun == FunctionType_ViceMarshal then
					s_refreshExp(list[i+1],math.floor(1.5*750*(30+(level^1.5))*1.5),ExpType_EmperorWar,0)
					--经验公式=1.5*750*(30+角色等级^1.5)*1.5
				elseif fun ~= 0 then
					s_refreshExp(list[i+1],math.floor(1.5*750*(30+(level^1.5))*1.2),ExpType_EmperorWar,0)
				else
					s_refreshExp(list[i+1],math.floor(1.5*750*(30+(level^1.5))),ExpType_EmperorWar,0)
				end
				if self:GetUserVar(list[i+1],ArUser_KillNum) > 10 then
					s_addValue(SCENE_ENTRY_PLAYER,list[i+1],VALUE_TYPE_WAR_MEDAL,30)
				else
					s_addValue(SCENE_ENTRY_PLAYER,list[i+1],VALUE_TYPE_WAR_MEDAL,15)
				end
			elseif self:GetUserVar(list[i+1],ArUser_Gindex) ~= 0 then
				local level = s_getValue(SCENE_ENTRY_PLAYER,list[i+1],VALUE_TYPE_LEVEL)
				if level ~= 0 and level ~= nil then
					--经验公式=1.5*550*(30+角色等级^1.5)
					s_refreshExp(list[i+1],math.floor(1.5*550*(30+(level^1.5))),ExpType_EmperorWar,0)
				end
				if self:GetUserVar(list[i+1],ArUser_KillNum)~= nil then
					if self:GetUserVar(list[i+1],ArUser_KillNum) > 10 then
						s_addValue(SCENE_ENTRY_PLAYER,list[i+1],VALUE_TYPE_WAR_MEDAL,15)
					else
						s_addValue(SCENE_ENTRY_PLAYER,list[i+1],VALUE_TYPE_WAR_MEDAL,8)
					end
				end
			end
		end
	end
	CopySceneInfo_73:GetMengJiangTan(cid,0,1)
	self.warinfo.log = {}
	self.warinfo.scorerank1 = {}
	self.warinfo.scorerank2 = {}
	self.warinfo.scorerank3 = {}
	self.warinfo.scorerank4 = {}
	self.warinfo.scorerank5 = {}
	self.warinfo.scorerank6 = {}
	self.warinfo.cscore = {}
	self.warinfo.cars = {}
	s_clearCopy(cid)
end

function CopySceneInfo_73:OnPlayerDie(cid,uid,murder,dtype)
	if murder == 0 or murder == nil then return end
	if table.getn(murder) == 0 then return end
	if s_getTrafficType(murder[1]) == TrafficType_Armyequip then
		return
	end
	local ulevel = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local mlevel = s_getValue(SCENE_ENTRY_PLAYER,murder[1],VALUE_TYPE_LEVEL)
	if ulevel >= mlevel+5 then
		s_addItem(murder[1],31547,3,3,0,"1-1","CopySceneInfo_73:OnPlayerDie")
		CopySceneInfo_73:AddWarScore(murder[1],3)
	elseif ulevel > mlevel then
		s_addItem(murder[1],31547,3,2,0,"1-1","CopySceneInfo_73:OnPlayerDie")
		CopySceneInfo_73:AddWarScore(murder[1],2)
	elseif ulevel >= mlevel-10 then
		s_addItem(murder[1],31547,3,1,0,"1-1","CopySceneInfo_73:OnPlayerDie")
		CopySceneInfo_73:AddWarScore(murder[1],1)
	end
	--0_108 攻方杀敌数
	--0_109 守方杀敌数
	local attacknum = s_getSceneVar(cid,0,108)
	local defensenum = s_getSceneVar(cid,0,109)
	if self:GetUserVar(murder[1],ArUser_Gindex) == 1 then
		s_setSceneVar(cid,0,108,attacknum+1)
		if attacknum == 1000 then
			table.insert(self.warinfo.log, {s_getCurTime(TIME_ALLSECONDS),"攻方将士奋勇突进，已斩杀1000名敌方士兵，尸横遍野，血流成河。"})
		elseif attacknum == 3000 then
			table.insert(self.warinfo.log, {s_getCurTime(TIME_ALLSECONDS),"3000守方士兵已斩杀于帝都，用敌人的鲜血将进攻的旌旗染的更加红艳吧！"})
		elseif attacknum == 5000 then
			table.insert(self.warinfo.log, {s_getCurTime(TIME_ALLSECONDS),"在攻方将士的猛攻下，5000敌方士兵已身首异处，此时的帝都已如同人间地狱一般……"})
		end
	else
		s_setSceneVar(cid,0,109,defensenum+1)
		if defensenum == 1000 then
			table.insert(self.warinfo.log, {s_getCurTime(TIME_ALLSECONDS),"守方将士奋起御敌，已斩杀1000名敌方士兵，杀声震天，枪林箭羽。"})
		elseif defensenum == 3000 then
			table.insert(self.warinfo.log, {s_getCurTime(TIME_ALLSECONDS),"3000攻方士兵已葬身于帝都，让帝皇的权威在敌人的惶恐中更加坚定吧！"})
		elseif defensenum == 5000 then
			table.insert(self.warinfo.log, {s_getCurTime(TIME_ALLSECONDS),"在血肉之躯组成的防线前，已堆积着5000具攻方士兵的尸体，无数亡魂涌入英灵殿的大门……"})
		end
	end
	self:SetUserVar(murder[1],ArUser_KillNum,self:GetUserVar(murder[1],ArUser_KillNum)+1)
end

function CopySceneInfo_73:OnPlayerRelive(uid,rtype)
	local homeland = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND)
	local cid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
	if s_getSceneVar(cid,homeland,0) == 1 then
		--攻方
		--		s_addGroup(SCENE_ENTRY_PLAYER, uid, 17)
		--		self:SetUserVar(uid,ArUser_Gindex,1)
		local posx = self.initZone[1][s_getSceneVar(cid,homeland,2)][1]
		local posy = self.initZone[1][s_getSceneVar(cid,homeland,2)][2]
		s_goto(SCENE_ENTRY_PLAYER,uid,posx,posy)
	else
		--		s_addGroup(SCENE_ENTRY_PLAYER, uid, 18)
		--		self:SetUserVar(uid,ArUser_Gindex,2)
		local posx = self.initZone[2][s_getSceneVar(cid,homeland,2)][1]
		local posy = self.initZone[2][s_getSceneVar(cid,homeland,2)][2]
		s_goto(SCENE_ENTRY_PLAYER,uid,posx,posy)
	end
end

function OnLoopCopyScene_1Sec_73(ctype,cid)
	CopySceneInfo_73:Loop_1Sec(ctype,cid)
end
function CopySceneInfo_73:Loop_1Sec(ctype,cid)
	if s_getSceneVar(cid,0,119) == 1 then
		return
	end
	local start = s_getSceneVar(cid,0,101)
	local cursec = s_getCurTime(TIME_ALLSECONDS)
	if cursec - start >= 5400 then
		self:gameOver(cid,2)
	else
		if cursec > s_getSceneVar(cid,0,116)+10 and s_getSceneVar(cid,0,116) ~= 0
			and s_getSceneVar(cid,0,117) == 0 then
			local rand = math.random(1,3)
			CopySceneInfo_73:SetCarVar(cid,rand,ArCar_True,1)
			table.sort(self.warinfo.cscore,function(t1,t2)return t1[2] > t2[2] end)
			for j=1,table.getn(self.warinfo.cscore) do
				if s_getSceneVar(cid,self.warinfo.cscore[j][1],0) == 1 then
					local funuser = s_getCountryField(self.warinfo.cscore[j][1],CountryVar_Marshal)
					if funuser ~= nil and funuser ~= 0 then
						self:SetCarVar(cid,rand,ArCar_King,funuser)
						s_debug("国王:"..funuser..",设置了真马车")
						break
					end
				end
			end
			s_addbuff(SCENE_ENTRY_NPC,self.warinfo.cars[rand][1],20365,1,5400)
			local clist = pack(s_getCountryList())
			for i=1,table.getn(clist) do
				if clist[i] ~= 13 then
					if s_getSceneVar(cid,clist[i],0) == 1 then
						local king = s_getCountryField(clist[i],CountryVar_Marshal)
						if king ~= 0 then
							s_sysInfo(king,"系统将帝权之杖放置在马车中，保护其安全到达奥丁神使处，国民战功总和最高的国王将成为新帝皇！",ChatPos_Pop)
						end
					end
				end
			end
			for i=1,table.getn(self.warinfo.cars) do
				if self.warinfo.cars[i][2] == 60895 then
					s_setHorseCarHome(self.warinfo.cars[i][1],274,306)
				elseif self.warinfo.cars[i][2] == 60896 then
					s_setHorseCarHome(self.warinfo.cars[i][1],485,314)
				elseif self.warinfo.cars[i][2] == 60897 then
					s_setHorseCarHome(self.warinfo.cars[i][1],510,365)
				end
			end
			s_setSceneVar(cid,0,117,1)
		end
	end
end
function CopySceneInfo_73:FlagDead(cid,thisid)
	if s_getSceneVar(cid,0,105) == 0 then
		return
	end
	local master = 0
	for i=6,10 do
		if CopySceneInfo_73:GetCrystalVar(cid,i,ArCrystal_Npc) == thisid then
			CopySceneInfo_73:SetCrystalVar(cid,i,ArCrystal_Group,2)
			master = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_MASTER)
		end
	end
	local baserelive = 0
	local list = pack(s_getCountryList())
	for i=1,table.getn(list) do
		if s_getSceneVar(cid,list[i],0) == 1 then
			if s_getSceneVar(cid,list[i],2) ~= (master-5)
				and s_getSceneVar(cid,list[i],2) ~= 0 then
				baserelive = s_getSceneVar(cid,list[i],2)
			end
		end
	end
	if baserelive == 0 then
		return
	end
	for i=1,table.getn(list) do
		if s_getSceneVar(cid,list[i],0) == 1 then
			if s_getSceneVar(cid,list[i],2) == (master-5) then
				s_setSceneVar(cid,list[i],2,baserelive)
			end
		end
	end
end
function CopySceneInfo_73:GirlGodDead(mid,thisid)
	local cid = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_ID)
	if cid == 0 then
		return
	end
	local npclist1 = s_getNpcByBaseID(cid, 60890)
	local npclist2 = s_getNpcByBaseID(cid, 60891)
	local npclist3 = s_getNpcByBaseID(cid, 60892)
	local pos = 0
	if #npclist1 ~= 0 and npclist1[1] == thisid then
		s_setSceneVar(cid,0,102,0)
		s_setSceneVar(cid,0,110,mid)
		pos = 1
	end
	if #npclist2 ~= 0 and npclist2[1] == thisid then
		s_setSceneVar(cid,0,103,0)
		s_setSceneVar(cid,0,111,mid)
		pos = 2
	end
	if #npclist3 ~= 0 and npclist3[1] == thisid then
		s_setSceneVar(cid,0,104,0)
		s_setSceneVar(cid,0,112,mid)
		pos = 3
	end
	local num = s_getSceneVar(cid,0,121)
	s_setSceneVar(cid,0,121,num+1)
	local cursec = s_getCurTime(TIME_ALLSECONDS)
	if pos == 1 then
		CopySceneInfo_73:SendCopyInfo(cid,0,1,0)
		CopySceneInfo_73:SendGroupInfo(1,cid,"西门守将诗蔻迪已被我军击倒，5分钟内必须击倒其他两命运女神，否则命运之线将会使其再次复活！",ChatPos_Sys)
		CopySceneInfo_73:SendGroupInfo(2,cid,"西门守将诗蔻迪被敌军击倒，只要集中力量保护剩余的任意女神5分钟，命运之线的力量将会使其再次复活！",ChatPos_Sys)
		table.insert(self.warinfo.log,{cursec,"攻方将士成功击倒了女神诗蔻迪，帝都城的西门畅通无阻了。"})
	elseif pos == 2 then
		CopySceneInfo_73:SendCopyInfo(cid,0,2,0)
		CopySceneInfo_73:SendGroupInfo(1,cid,"南门守将贝露丹迪已被我军击倒，5分钟内必须击倒其他两命运女神，否则命运之线将会使其再次复活！",ChatPos_Sys)
		CopySceneInfo_73:SendGroupInfo(2,cid,"南门守将贝露丹迪被敌军击倒，只要集中力量保护剩余的任意女神5分钟，命运之线的力量将会使其再次复活！",ChatPos_Sys)
		table.insert(self.warinfo.log,{cursec,"攻方将士成功击倒了女神贝露丹迪，帝都城的南门畅通无阻了。"})
	elseif pos == 3 then
		CopySceneInfo_73:SendCopyInfo(cid,0,3,0)
		CopySceneInfo_73:SendGroupInfo(1,cid,"东门守将兀尔德已被我军击倒，5分钟内必须击倒其他两命运女神，否则命运之线将会使其再次复活！",ChatPos_Sys)
		CopySceneInfo_73:SendGroupInfo(2,cid,"东门守将兀尔德被敌军击倒，只要集中力量保护剩余的任意女神5分钟，命运之线的力量将会使其再次复活！",ChatPos_Sys)
		table.insert(self.warinfo.log,{cursec,"攻方将士成功击倒了女神兀尔德，帝都城的东门畅通无阻了。"})
	end
	if num+1 == 3 then
		--召唤女武神
		local npcid = s_sysSummon(self.wushen[1],cid,self.wushen.x,self.wushen.y,1045)
		if npcid == 0 then
			s_debug("帝都战召唤女神失败，女神在忙")
		end
		s_addGroup(SCENE_ENTRY_NPC, npcid, 18)
		s_setSceneVar(cid,0,105,100)
		CopySceneInfo_73:SendCopyInfo(cid,0,4,100)
		local list = pack(s_getCountryList())
		for i=1,table.getn(list) do
			if s_getSceneVar(cid,list[i],0) == 2 then
				s_setSceneVar(cid,list[i],2,2)
			end
		end
		CopySceneInfo_73:SendGroupInfo(2,cid,"野蛮的敌人攻破了命运三女神的城门防线，向帝都城内杀来！我军不得不将主阵撤至帝都城北，教皇已将女武神唤醒，她将协防帝都城！",ChatPos_Sys+ChatPos_Honor)
		CopySceneInfo_73:SendGroupInfo(1,cid,"我军成功击破了命运三女神的防守！敌军的城防已经突破了，请诸君加速冲锋！斩杀女武神！"
			,ChatPos_Sys+ChatPos_Honor)
		table.insert(self.warinfo.log,{cursec,"攻方势如破竹，强行突破了命运三女神防守的帝都城门，潮水般涌向城内的女武神。"})
	end
	CopySceneInfo_73:AddWarScore(mid,100)
end
function CopySceneInfo_73:WomanGodDead(mid,thisid)
	local cid = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_ID)
	if cid == 0 then
		return
	end
	local list = pack(s_getCountryList())
	for i=1,table.getn(list) do
		if s_getSceneVar(cid,list[i],0) == 1 then
			s_setSceneVar(cid,list[i],2,6)
		elseif s_getSceneVar(cid,list[i],0) == 2 then
			local call = "CopySceneInfo_73:WomanSummon($1,$2)"
			local buttons = "确定|3|Enter|取消|4|Esc"
			local msg = "女武神被击败，最后时刻施法召唤您突入帝都，保护帝皇雕像！您是否前去增援？"
			s_registerRelationMsgBox(0,Relation_Country,list[i],70,call,buttons,msg,300)
		end
	end
	local npcid = s_sysSummon(60894,cid,357,254,1045)
	if npcid == 0 then
		s_debug("帝都战召唤雕像，女神在忙")
	end
	s_addGroup(SCENE_ENTRY_NPC, npcid, 18)
	s_setSceneVar(cid,0,105,0)
	s_setSceneVar(cid,0,106,100)
	s_setSceneVar(cid,0,113,mid)
	CopySceneInfo_73:SendCopyInfo(cid,0,4,0)
	CopySceneInfo_73:SendCopyInfo(cid,0,5,100)
	CopySceneInfo_73:SendGroupInfo(2,cid,"敌人突破了女武神的防线，占据了城内复活点，帝皇雕像完全暴露了，请加强防守！",ChatPos_Sys)
	CopySceneInfo_73:SendGroupInfo(1,cid,"我军成功突破女武神防线，占领城内复活点，集结后向帝皇雕像突击！",ChatPos_Sys)
	CopySceneInfo_73:AddWarScore(mid,250)
	table.insert(self.warinfo.log,{s_getCurTime(TIME_ALLSECONDS),"攻方将士骁勇善战，突入万军丛中斩杀了女武神，解除了帝皇雕像的守护结界。"})
end
function CopySceneInfo_73:StatueDead(mid,thisid)
	local cid = s_getValue(SCENE_ENTRY_NPC,thisid,VALUE_TYPE_SCENE_ID)
	if cid == 0 then
		return
	end
	self.warinfo.cars = {}
	for i=1,table.getn(self.cars) do
		CopySceneInfo_73:SetCarVar(cid,i,ArCar_Npc,0)
		CopySceneInfo_73:SetCarVar(cid,i,ArCar_True,0)
		CopySceneInfo_73:SetCarVar(cid,i,ArCar_King,0)
		local npcid = s_sysSummon(self.cars[i][1],cid,self.cars[i].x,self.cars[i].y,1046)
		if npcid == 0 then
			s_debug("帝都战召唤马车失败:%u", self.cars[i][1])
		else
			s_addGroup(SCENE_ENTRY_NPC, npcid, 17)
			table.insert(self.warinfo.cars,{npcid,self.cars[i][1]})
			CopySceneInfo_73:SetCarVar(cid,i,ArCar_Npc,npcid)
		end
		s_setSceneVar(cid,0,122,0)
		s_setSceneVar(cid,0,117,0)
	end
	s_setSceneVar(cid,0,107,1)
	local cursec = s_getCurTime(TIME_ALLSECONDS)
	s_setSceneVar(cid,0,116,cursec)

	--寻找第一名的攻方国家(要有国王)
	table.sort(self.warinfo.cscore,function(t1,t2)return t1[2] > t2[2] end)
	local funuser = 0
	for j=1,table.getn(self.warinfo.cscore) do
		if s_getSceneVar(cid,self.warinfo.cscore[j][1],0) == 1 then
			funuser = s_getCountryField(self.warinfo.cscore[j][1],CountryVar_Marshal)
			if funuser ~= nil and funuser ~= 0 then
				break
			end
		end
	end

	if funuser == 0 then
		s_debug("攻方战功第一名的国家无国王，由系统指定马车")
		local rand = math.random(1,table.getn(self.warinfo.cars))
		CopySceneInfo_73:SetCarVar(cid,rand,ArCar_True,1)
		s_addbuff(SCENE_ENTRY_NPC,self.warinfo.cars[rand][1],20365,1,5400)
		local clist = pack(s_getCountryList())
		for i=1,table.getn(clist) do
			if clist[i] ~= 13 then
				if s_getSceneVar(cid,clist[i],0) == 1 then
					local king = s_getCountryField(clist[i],CountryVar_Marshal)
					if king ~= 0 then
						s_sysInfo(king,"系统将帝权之杖放置在马车中，保护其安全到达奥丁神使处，国民战功总和最高的国王将成为新帝皇！",ChatPos_Pop)
					end
				end
			end
		end
		for i=1,table.getn(self.warinfo.cars) do
			if self.warinfo.cars[i][2] == 60895 then
				s_setHorseCarHome(self.warinfo.cars[i][1],274,306)
			elseif self.warinfo.cars[i][2] == 60896 then
				s_setHorseCarHome(self.warinfo.cars[i][1],485,314)
			elseif self.warinfo.cars[i][2] == 60897 then
				s_setHorseCarHome(self.warinfo.cars[i][1],510,365)
			end
		end
		s_setSceneVar(cid,0,117,1)
	else
		SelectHorseCarInterface(funuser)
	end
	s_setSceneVar(cid,0,106,0)
	s_setSceneVar(cid,0,114,mid)
	CopySceneInfo_73:SendCopyInfo(cid,0,5,0)
	CopySceneInfo_73:SendCopyInfo(cid,0,6,1)
	CopySceneInfo_73:SendGroupInfo(1,cid,"帝皇雕像被我军击破，请护送放置帝皇权杖的马车到达奥丁神使处，即可获得本次战斗胜利！（战功和最高的国家国王将成为新的帝皇）",ChatPos_Sys)
	CopySceneInfo_73:SendGroupInfo(2,cid,"帝皇雕像被敌军击破，敌方企图将掠夺的帝皇权杖用马车运向神使！请务必阻击，否则将战败，失去帝皇权利！（注意：三辆马车中只有一辆是真的）",ChatPos_Sys)
	table.insert(self.warinfo.log,{s_getCurTime(TIME_ALLSECONDS),"攻方将士浴血奋战，成功破坏了帝皇雕像，取得皇权之杖，准备将其护送至奥丁神使。"})
	local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
	for i=1,table.getn(list) do
		if self:GetUserVar(list[i+1],ArUser_Gindex) == 2 then
			s_addbuff(SCENE_ENTRY_PLAYER,list[i+1],122,1,5*60)
		end
	end
	CopySceneInfo_73:AddWarScore(mid,500)
end
function CopySceneInfo_73:CarDead(mid,thisid)
	if mid == 0 or mid == nil then
		return
	end
	s_setSceneVar(cid,0,122,s_getSceneVar(cid,0,122)+1)
	local cid = s_getValue(SCENE_ENTRY_PLAYER,mid,VALUE_TYPE_SCENE_ID)
	local summon = 0
	for i=1,3 do
		if thisid == CopySceneInfo_73:GetCarVar(cid,i,ArCar_Npc)
			and CopySceneInfo_73:GetCarVar(cid,i,ArCar_True) == 1 then
			CopySceneInfo_73:SendGroupInfo(2,cid,"成功阻击敌军的马车，帝皇雕像再次复活，守护它，防止权杖再被夺取！",ChatPos_Sys)
			CopySceneInfo_73:SendGroupInfo(1,cid,"运送皇权之杖的马车被击破，敌方的帝皇雕像再次复活，看来需要重新攻破它，夺取权杖！"
				,ChatPos_Sys)
			s_setSceneVar(cid,0,107,0)
			CopySceneInfo_73:SendCopyInfo(cid,0,6,0)
			CopySceneInfo_73:SendCopyInfo(cid,0,5,100)
			local npcid = s_sysSummon(60894,cid,357,254,1045)
			if npcid == 0 then
				s_debug("帝都战召唤雕像，女神在忙")
			end
			s_addGroup(SCENE_ENTRY_NPC, npcid, 18)
			summon = 1
			local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
			for i=1,table.getn(list) do
				if self:GetUserVar(list[i+1],ArUser_Gindex) == 1 then
					s_addbuff(SCENE_ENTRY_PLAYER,list[i+1],122,1,5*60)
				end
			end
			s_setSceneVar(cid,0,106,100)
			local list = pack(s_getCountryList())
			for i=1,table.getn(list) do
				if s_getSceneVar(cid,list[i],0) == 1 then
					local call = "CopySceneInfo_73:CarDeadSummon($1,$2)"
					local buttons = "确定|3|Enter|取消|4|Esc"
					local msg = "运送皇权之杖的马车被击破，敌方的帝皇雕像再次复活，立即前往，再次进攻，夺取权杖！"
					s_registerRelationMsgBox(0,Relation_Country,list[i],70,call,buttons,msg,300)
				elseif s_getSceneVar(cid,list[i],0) == 2 then
					local call = "CopySceneInfo_73:CarDeadSummon($1,$2)"
					local buttons = "确定|3|Enter|取消|4|Esc"
					local msg = "成功阻击敌军的马车，帝皇雕像再次复活，立即前往守护它，防止权杖再被夺取！"
					s_registerRelationMsgBox(0,Relation_Country,list[i],70,call,buttons,msg,300)
				end
			end
			s_addItem(mid,24077,0,1,0,"","杀马车")
			s_setSceneVar(cid,0,118,0)
			table.insert(self.warinfo.log,{s_getCurTime(TIME_ALLSECONDS),"守方将士识破了诡计，成功将攻方运送皇权之杖的马车阻击，帝皇雕像再次重组起来镇守权杖。"})
		end
	end
	if summon == 0 then
		CopySceneInfo_73:SendGroupInfo(2,cid,"很遗憾，我军击毁了一辆掩护的假马车，请加速阻击剩余的马车！",ChatPos_Sys)
		CopySceneInfo_73:SendGroupInfo(1,cid,"一辆掩护的马车被击毁了，敌人很快会发现真马车，请加速保护撤离！",ChatPos_Sys)
		table.insert(self.warinfo.log,{s_getCurTime(TIME_ALLSECONDS),"守方将士英勇不屈，成功阻击一辆马车，可惜发现只是掩护的假马车。"})
	end
	if summon == 1 then
		for i=1,3 do
			local npcid = CopySceneInfo_73:GetCarVar(cid,i,ArCar_Npc)
			s_clearNpc(npcid)
		end
	end
	if summon == 0 and s_getSceneVar(cid,0,122) == 3 then
		CopySceneInfo_73:SendGroupInfo(2,cid,"成功阻击敌军的马车，帝皇雕像再次复活，守护它，防止权杖再被夺取！",ChatPos_Sys)
		CopySceneInfo_73:SendGroupInfo(1,cid,"运送皇权之杖的马车被击破，敌方的帝皇雕像再次复活，看来需要重新攻破它，夺取权杖！"
			,ChatPos_Sys)
		s_setSceneVar(cid,0,107,0)
		CopySceneInfo_73:SendCopyInfo(cid,0,6,0)
		CopySceneInfo_73:SendCopyInfo(cid,0,5,100)
		local npcid = s_sysSummon(60894,cid,357,254,1045)
		if npcid == 0 then
			s_debug("帝都战召唤雕像，女神在忙")
		end
		s_addGroup(SCENE_ENTRY_NPC, npcid, 18)
		summon = 1
		local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
		for i=1,table.getn(list) do
			if self:GetUserVar(list[i+1],ArUser_Gindex) == 1 then
				s_addbuff(SCENE_ENTRY_PLAYER,list[i+1],122,1,5*60)
			end
		end
		s_setSceneVar(cid,0,106,100)
		local list = pack(s_getCountryList())
		for i=1,table.getn(list) do
			if s_getSceneVar(cid,list[i],0) == 1 then
				local call = "CopySceneInfo_73:CarDeadSummon($1,$2)"
				local buttons = "确定|3|Enter|取消|4|Esc"
				local msg = "运送皇权之杖的马车被击破，敌方的帝皇雕像再次复活，立即前往，再次进攻，夺取权杖！"
				s_registerRelationMsgBox(0,Relation_Country,list[i],70,call,buttons,msg,300)
			elseif s_getSceneVar(cid,list[i],0) == 2 then
				local call = "CopySceneInfo_73:CarDeadSummon($1,$2)"
				local buttons = "确定|3|Enter|取消|4|Esc"
				local msg = "成功阻击敌军的马车，帝皇雕像再次复活，立即前往守护它，防止权杖再被夺取！"
				s_registerRelationMsgBox(0,Relation_Country,list[i],70,call,buttons,msg,300)
			end
		end
		s_addItem(mid,24077,0,1,0,"","杀马车")
		s_setSceneVar(cid,0,118,0)
	end
	CopySceneInfo_73:AddWarScore(mid,250)
end

function CopySceneInfo_73:CarArrive(baseid,npcid,cid,stype)
	s_debug("脚本马车到达终点,%u,%u,%u,%u",baseid,npcid,cid,stype)
	if baseid == 60897 then
		local posx = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSX)
		local posy = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSY)
		if math.abs(510 - posx) <=10 and math.abs(365 - posy) <= 10 then
			for i=1,table.getn(self.warinfo.cars) do
				if CopySceneInfo_73:GetCarVar(cid,i,ArCar_Npc) == npcid then
					s_setHorseCarHome(self.warinfo.cars[i][1],600,238)
					return
				end
			end
		end
	elseif baseid == 60895 then
		local posx = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSX)
		local posy = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSY)
		if math.abs(274 - posx) <=10 and math.abs(306 - posy) <= 10 then
			for i=1,table.getn(self.warinfo.cars) do
				if CopySceneInfo_73:GetCarVar(cid,i,ArCar_Npc) == npcid then
					s_setHorseCarHome(self.warinfo.cars[i][1],224,210)
					return
				end
			end
		end
	elseif baseid == 60896 then
		local posx = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSX)
		local posy = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSY)
		if math.abs(485 - posx) <=10 and math.abs(314 - posy) <= 10 then
			for i=1,table.getn(self.warinfo.cars) do
				if CopySceneInfo_73:GetCarVar(cid,i,ArCar_Npc) == npcid then
					s_setHorseCarHome(self.warinfo.cars[i][1],585,201)
					return
				end
			end
		end
	end
	for i=1,3 do
		if CopySceneInfo_73:GetCarVar(cid,i,ArCar_Npc) == npcid
			and CopySceneInfo_73:GetCarVar(cid,i,ArCar_True) == 1 then
			s_debug("马车成功到达")
			s_setSceneVar(cid,0,118,1)
		end
		s_debug("马车:%u,%u,%u",i,CopySceneInfo_73:GetCarVar(cid,i,ArCar_Npc),
			CopySceneInfo_73:GetCarVar(cid,i,ArCar_True))
	end
end
-- --旌旗
-- RegisterCopyNpcDeadEvent(60903,73,0,"CopySceneInfo_73:FlagDead($1,$2)")
-- RegisterCopyNpcDeadEvent(60904,73,0,"CopySceneInfo_73:FlagDead($1,$2)")
-- RegisterCopyNpcDeadEvent(60905,73,0,"CopySceneInfo_73:FlagDead($1,$2)")
-- RegisterCopyNpcDeadEvent(60906,73,0,"CopySceneInfo_73:FlagDead($1,$2)")
-- RegisterCopyNpcDeadEvent(60907,73,0,"CopySceneInfo_73:FlagDead($1,$2)")
-- --三女神
-- RegisterMyNpcDeadEvent(60890,"CopySceneInfo_73:GirlGodDead($1,$2)")
-- RegisterMyNpcDeadEvent(60891,"CopySceneInfo_73:GirlGodDead($1,$2)")
-- RegisterMyNpcDeadEvent(60892,"CopySceneInfo_73:GirlGodDead($1,$2)")

-- --女武神
-- RegisterMyNpcDeadEvent(60893,"CopySceneInfo_73:WomanGodDead($1,$2)")

-- --雕像
-- RegisterMyNpcDeadEvent(60894,"CopySceneInfo_73:StatueDead($1,$2)")

-- --马车
-- RegisterMyNpcDeadEvent(60895,"CopySceneInfo_73:CarDead($1,$2)")
-- RegisterMyNpcDeadEvent(60896,"CopySceneInfo_73:CarDead($1,$2)")
-- RegisterMyNpcDeadEvent(60897,"CopySceneInfo_73:CarDead($1,$2)")

--碉堡
--RegisterMyNpcDeadEvent(44325,73,0,"CopySceneInfo_73:ArmyEquipDie($1,$2)")
------------------------------------------------------------------------------------
function OnSelectHorseCar(uid,result)
	if result == 0 or result == nil
		or result > 3 then
		return
	end
	if s_getSceneVar(cid,0,117) == 1 then
		s_sysInfo(uid,"已选定了放置权杖的马车，不可重复进行操作，请打开大地图进行查看")
		return
	end
	local cid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
	CopySceneInfo_73:SetCarVar(cid,result,ArCar_True,1)
	CopySceneInfo_73:SetCarVar(cid,result,ArCar_King,uid)
	s_addbuff(SCENE_ENTRY_NPC,CopySceneInfo_73.warinfo.cars[result][1],20365,1,5400)
	local homeland = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND)
	local countryname = s_getCountryName(homeland)
	local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
	local clist = pack(s_getCountryList())
	for i=1,table.getn(clist) do
		if clist[i] ~= 13 then
			if s_getSceneVar(cid,clist[i],0) == 1 then
				local king = s_getCountryField(clist[i],CountryVar_Marshal)
				if king ~= 0 then
					s_sysInfo(king,countryname.."国王"..name.."将帝权之杖放置在马车中，保护其安全到达奥丁神使处，国民战功总和最高的国王将成为新帝皇！",ChatPos_Pop)
				end
			end
		end
	end
	--设置车的轨迹
	for i=1,table.getn(CopySceneInfo_73.warinfo.cars) do
		if CopySceneInfo_73.warinfo.cars[i][2] == 60895 then
			s_setHorseCarHome(CopySceneInfo_73.warinfo.cars[i][1],274,306)
		elseif CopySceneInfo_73.warinfo.cars[i][2] == 60896 then
			s_setHorseCarHome(CopySceneInfo_73.warinfo.cars[i][1],485,314)
		elseif CopySceneInfo_73.warinfo.cars[i][2] == 60897 then
			s_setHorseCarHome(CopySceneInfo_73.warinfo.cars[i][1],510,365)
		end
	end
	s_debug("国王:"..uid..",设置了真马车")
	s_setSceneVar(cid,0,117,1)
end

function CopySceneInfo_73:WomanSummon(uid,ret)
	if ret ~= Button_Yes then
		return
	end
	local ctype = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE)
	if ctype ~= CopySceneType_EmperorWar then
		s_intoCopy(uid,73)
	end
	--坐标待定
	s_goto(SCENE_ENTRY_PLAYER,uid,357,254)
end

function CopySceneInfo_73:CarSummon(uid,ret,posx,posy)
	if ret ~= Button_Yes then
		return
	end
	local ctype = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE)
	if ctype ~= CopySceneType_EmperorWar then
		s_intoCopy(uid,73)
	end
	s_goto(SCENE_ENTRY_PLAYER,uid,posx,posy)
end

function CopySceneInfo_73:CarDeadSummon(uid,ret)
	if ret ~= Button_Yes then
		return
	end
	local ctype = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE)
	if ctype ~= CopySceneType_EmperorWar then
		s_intoCopy(uid,73)
	end
	local cid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
	local homeland = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND)
	if s_getSceneVar(cid,homeland,0) == 1 then
		s_goto(SCENE_ENTRY_PLAYER,uid,380,272)
	elseif s_getSceneVar(cid,homeland,0) == 2 then
		s_goto(SCENE_ENTRY_PLAYER,uid,357,254)
	end
end

--团魔甲死亡
--[[function CopySceneInfo_73:ArmyEquipDie(sid,thisid)
	local murder = GetMurderList(SCENE_ENTRY_NPC,thisid)
	if murder == nil or #murder == 0 then
		return
	end
	for i=1,#murder do
		local killnum = self:GetUserVar(murder[i],CpUser_KillEquip)
		killnum = killnum + 1
		self:SetUserVar(murder[i],CpUser_KillEquip,killnum)
		s_debug("----------------:KillEquip:" .. murder[i] .. "," .. killnum)
	end
end]]--
