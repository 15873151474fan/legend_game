-- 团基地副本
-- 进入副本后区分阵营模式 17-阵营A(本方及友方) 18-阵营B(敌方)
-- 团种植 花盆编号唯一索引 植物数据和NPC
--///////////////////////////////////////////////////////////////////
-- 副本场景变量定义
-- 1-1 BOSS的npcid
-- 1-2 团守护npcid
-- 2-1~ 2-200 预留植物npcid 1-100 对应个人花盆 101-200 对应公共花盆

--////////////////////////////////////////////////////////////////////
-- 宠物乐园
--////////////////////////////////////////////////////////////////////
CopySceneInfo_1 =
{
	----------------- 养殖可配置数据 ------------------------------------------
	--养殖区域
	breedZone	= {x=18, y=80, width=6, height=5},
	--养殖NPC
	breedNpc	= { {45301,45302,45303,45304,45305},
		{45306,45307,45308,45309,45310},
		{45311,45312,45313,45314,45315},
		{45316,45317,45318,45319,45320},
		{45321,45322,45323,45324,45325},
		{45326,45327,45328,45329,45330},
		{45331,45332,45333,45334,45335},
		{45336,45337,45338,45339,45340},
		{45341,45342,45343,45344,45345},
		{45346,45347,45348,45349,45350},},
	--喂养作用
	foodValue	=
	{
		--各颜色种成长
		3, 5, 7, 10, 15
	},
	--成长度范围
	growthRange = {[0]=0, 300, 600, 1000, 1500, 10000},
	--心情加成
	moodAdd		= {{0,0},{5,0}, {15,20}, {25,40}, {35,60}, {45,80}, {50,100}},
	--胃口加成
	appetAdd	= {{0,0},{5,0}, {10,20}, {20,40}, {30,60}, {40,80}, {50,100}},
	--捕捉BUFF
	killBuff = 20100,feedBuff = 20099,
	--
	----------------- 种植可配置数据 ------------------------------------------
	--花盆位置
	--[[
	plantPos ={
	--个人花盆(28个) 索引 1-100
	[1]={{101,100},{103,99},{105,96},{106,92},{105,88},{103,86},{101,85},{96,85},{94,86},{92,88},{91,91},{91,94},
	{92,96},{94,99},{154,85},{152,87},{151,89},{149,93},{149,96},{150,99},{154,100},{159,99},{161,99},{163,96},
	{164,94},{164,90},{162,88},{159,85},{97,100},{97,85},{156,100},{151,94}},
	--公共花盆(14个) 索引 101-200
	[2]={{104,92},{102,97},{102,88},{96,87},{93,92},{95,98},{151,91},{153,97},{154,87},{159,87},{161,96},{163,92},{98,98},{156,98}}
	},--]]
	plantPos = {[1]={},[2]={}},
	--种植数据
	plantBase = {
		--名字，stub=茬数，ilk=种类，level=等级，life=成熟时间，userlv=玩家等级，output=产出, olevel=附件产出等级
		-- ilk 类型：1 银币花 2 四叶草 3 蘑菇 4 刺手 5 玫瑰花 6 喇叭花 7 绑银花  8 芍药花  9 晶石果 10 宠物零食花 11 鉴定石花
		[44021] = {name="银币花",stub=1,times=2,ilk=1,level=1,life=4,userlv=21,activity=0,output={20,40},unit="枚"},
		[44022] = {name="银币花",stub=1,times=2,ilk=1,level=2,life=4,userlv=41,activity=50,output={30,60},unit="枚"},
		[44023] = {name="银币花",stub=1,times=2,ilk=1,level=3,life=4,userlv=61,activity=70,output={70,140},unit="枚"},
		[44024] = {name="银币花",stub=1,times=2,ilk=1,level=4,life=4,userlv=61,activity=70,output={100,200},unit="枚"},
		[44025] = {name="银币花",stub=1,times=2,ilk=1,level=5,life=4,userlv=71,activity=70,output={150,300},unit="枚"},
		[44026] = {name="银币花",stub=1,times=2,ilk=1,level=6,life=4,userlv=71,activity=80,output={200,400},unit="枚"},
		[44027] = {name="银币花",stub=1,times=2,ilk=1,level=7,life=4,userlv=81,activity=90,output={300,600},unit="枚"},
		[44028] = {name="银币花",stub=1,times=2,ilk=1,level=8,life=4,userlv=81,activity=100,output={400,800},unit="枚"},
		[44029] = {name="银币花",stub=1,times=2,ilk=1,level=9,life=4,userlv=91,activity=100,output={500,1000},unit="枚"},
		[44030] = {name="银币花",stub=1,times=2,ilk=1,level=10,life=4,userlv=91,activity=100,output={600,1200},unit="枚"},
		[44031] = {name="蘑菇",  stub=1,times=2,ilk=3,level=1,life=2,userlv=21,activity=0,output={13500,40500},unit="经验"},
		[44032] = {name="蘑菇",  stub=1,times=2,ilk=3,level=2,life=2,userlv=21,activity=0,output={30000,90000},unit="经验"},
		[44033] = {name="蘑菇",  stub=1,times=2,ilk=3,level=3,life=2,userlv=31,activity=0,output={60000,180000},unit="经验"},
		[44034] = {name="蘑菇",  stub=1,times=2,ilk=3,level=4,life=2,userlv=41,activity=0,output={120000,360000},unit="经验"},
		[44035] = {name="蘑菇",  stub=1,times=2,ilk=3,level=5,life=2,userlv=51,activity=0,output={210000,630000},unit="经验"},
		[44036] = {name="蘑菇",  stub=1,times=2,ilk=3,level=6,life=2,userlv=61,activity=0,output={330000,990000},unit="经验"},
		[44037] = {name="蘑菇",  stub=1,times=2,ilk=3,level=7,life=2,userlv=71,activity=0,output={495000,1470000},unit="经验"},
		[44038] = {name="蘑菇",  stub=1,times=2,ilk=3,level=8,life=2,userlv=81,activity=0,output={615000,1845000},unit="经验"},
		[44039] = {name="蘑菇",  stub=1,times=2,ilk=3,level=9,life=2,userlv=91,activity=0,output={750000,2265000},unit="经验"},
		[44040] = {name="蘑菇",  stub=1,times=2,ilk=3,level=10,life=2,userlv=101,activity=0,output={915000,2745000},unit="经验"},
		[44041] = {name="四叶草",stub=1,times=2,ilk=2,level=1,life=2,userlv=21,activity=0,output={80,160},unit="精力"},
		[44042] = {name="四叶草",stub=1,times=2,ilk=2,level=3,life=2,userlv=21,activity=0,output={120,240},unit="精力"},
		[44043] = {name="四叶草",stub=1,times=2,ilk=2,level=6,life=2,userlv=21,activity=0,output={160,320},unit="精力"},
		[44044] = {name="四叶草",stub=1,times=2,ilk=2,level=8,life=2,userlv=21,activity=0,output={190,380},unit="精力"},
		[44045] = {name="四叶草",stub=1,times=2,ilk=2,level=10,life=2,userlv=21,activity=0,output={230,460},unit="精力"},
		[44051] = {name="喇叭花",stub=1,times=24,ilk=6,level=3,life=16,userlv=21,activity=0,output={5,10},unit="朵"},
		[44052] = {name="喇叭花",stub=1,times=24,ilk=6,level=4,life=16,userlv=21,activity=0,output={2,5},unit="朵"},
		[44053] = {name="喇叭花",stub=1,times=24,ilk=6,level=6,life=16,userlv=21,activity=0,output={2,5},unit="朵"},
		[44054] = {name="喇叭花",stub=1,times=24,ilk=6,level=8,life=16,userlv=21,activity=0,output={2,5},unit="朵"},
		[44055] = {name="喇叭花",stub=1,times=24,ilk=6,level=10,life=16,userlv=21,activity=0,output={2,5},unit="朵"},
		[44061] = {name="玫瑰花",stub=1,times=24,ilk=5,level=3,life=16,userlv=21,activity=0,output={5,10},unit="朵"},
		[44062] = {name="玫瑰花",stub=1,times=24,ilk=5,level=4,life=16,userlv=21,activity=0,output={3,10},unit="朵"},
		[44063] = {name="玫瑰花",stub=1,times=24,ilk=5,level=6,life=16,userlv=21,activity=0,output={3,10},unit="朵"},
		[44064] = {name="玫瑰花",stub=1,times=24,ilk=5,level=8,life=16,userlv=21,activity=0,output={3,10},unit="朵"},
		[44065] = {name="玫瑰花",stub=1,times=24,ilk=5,level=10,life=16,userlv=21,activity=0,output={3,10},unit="朵"},
		[44071] = {name="刺手",  stub=1,times=24,ilk=4,level=1,life=2,userlv=21,activity=0,output={24,120},unit=""},
		[44072] = {name="刺手",  stub=1,times=24,ilk=4,level=3,life=2,userlv=21,activity=0,output={48,168},unit=""},
		[44073] = {name="刺手",  stub=1,times=24,ilk=4,level=6,life=2,userlv=21,activity=0,output={72,240},unit=""},
		[44074] = {name="刺手",  stub=1,times=24,ilk=4,level=8,life=2,userlv=21,activity=0,output={96,360},unit=""},
		[44075] = {name="刺手",  stub=1,times=24,ilk=4,level=10,life=2,userlv=21,activity=0,output={120,480},unit=""},
		[44081] = {name="绑银花",stub=1,times=2,ilk=7,level=1,life=1,userlv=21,activity=0,output={1000,1400},unit=""},
		[44082] = {name="绑银花",stub=1,times=2,ilk=7,level=2,life=1,userlv=21,activity=0,output={1250,1750},unit=""},
		[44083] = {name="绑银花",stub=1,times=2,ilk=7,level=3,life=1,userlv=21,activity=0,output={1500,2100},unit=""},
		[44084] = {name="绑银花",stub=1,times=2,ilk=7,level=4,life=1,userlv=21,activity=0,output={1750,2450},unit=""},
		[44085] = {name="绑银花",stub=1,times=2,ilk=7,level=5,life=1,userlv=21,activity=0,output={2000,2800},unit=""},
		[44086] = {name="绑银花",stub=1,times=2,ilk=7,level=6,life=1,userlv=21,activity=0,output={2300,3200},unit=""},
		[44087] = {name="绑银花",stub=1,times=2,ilk=7,level=7,life=1,userlv=21,activity=0,output={2600,3600},unit=""},
		[44088] = {name="绑银花",stub=1,times=2,ilk=7,level=8,life=1,userlv=21,activity=0,output={2900,4000},unit=""},
		[44089] = {name="绑银花",stub=1,times=2,ilk=7,level=9,life=1,userlv=21,activity=0,output={3200,4500},unit=""},
		[44090] = {name="绑银花",stub=1,times=2,ilk=7,level=10,life=1,userlv=21,activity=0,output={3500,5000},unit=""},
		[44091] = {name="普通的圣诞树种子",stub=1,times=6,ilk=8,level=1,life=1,userlv=21,activity=0,output={5,10},unit="",olevel=1},
		[44092] = {name="芍药花",stub=1,times=1,ilk=8,level=3,life=4,userlv=41,activity=0,output={30,60},unit="",olevel=1},
		[44093] = {name="芍药花",stub=1,times=1,ilk=8,level=6,life=4,userlv=61,activity=0,output={50,100},unit="",olevel=2},
		[44094] = {name="芍药花",stub=1,times=1,ilk=8,level=8,life=4,userlv=81,activity=0,output={70,140},unit="",olevel=2},
		[44095] = {name="芍药花",stub=1,times=1,ilk=8,level=10,life=4,userlv=101,activity=0,output={100,200},unit="",olevel=3},
		[44101] = {name="华丽的圣诞树种子",stub=1,times=6,ilk=9,level=1,life=0.25,userlv=21,activity=0,output={20,40},unit="",olevel=1},
		[44102] = {name="晶石果",stub=1,times=1,ilk=9,level=3,life=4,userlv=41,activity=0,output={30,60},unit="",olevel=1},
		[44103] = {name="晶石果",stub=1,times=1,ilk=9,level=6,life=4,userlv=61,activity=0,output={50,100},unit="",olevel=2},
		[44104] = {name="晶石果",stub=1,times=1,ilk=9,level=8,life=4,userlv=81,activity=0,output={70,140},unit="",olevel=2},
		[44105] = {name="晶石果",stub=1,times=1,ilk=9,level=10,life=4,userlv=101,activity=0,output={100,200},unit="",olevel=3},

		--新增鉴定石和宠物零食的产出
		[44111] = {name="龙葵花",stub=1,times=1,ilk=10,level=1,life=4,userlv=21,activity=0,output={8,16},unit="份"},
		[44112] = {name="龙葵花",stub=1,times=1,ilk=10,level=3,life=4,userlv=61,activity=0,output={12,24},unit="份"},
		[44113] = {name="龙葵花",stub=1,times=1,ilk=10,level=6,life=4,userlv=81,activity=0,output={16,32},unit="份"},
		[44114] = {name="龙葵花",stub=1,times=1,ilk=10,level=8,life=4,userlv=101,activity=0,output={20,40},unit="份"},
		[44115] = {name="龙葵花",stub=1,times=1,ilk=10,level=10,life=4,userlv=121,activity=0,output={24,48},unit="份"},
		[44121] = {name="景天花",stub=1,times=1,ilk=11,level=1,life=4,userlv=21,activity=0,output={24,48},unit="颗"},
		[44122] = {name="景天花",stub=1,times=1,ilk=11,level=3,life=4,userlv=61,activity=0,output={24,48},unit="颗"},
		[44123] = {name="景天花",stub=1,times=1,ilk=11,level=6,life=4,userlv=81,activity=0,output={36,72},unit="颗"},
		[44124] = {name="景天花",stub=1,times=1,ilk=11,level=8,life=4,userlv=101,activity=0,output={36,72},unit="颗"},
		[44125] = {name="景天花",stub=1,times=1,ilk=11,level=10,life=4,userlv=121,activity=0,output={48,96},unit="颗"},

	},
	--种植NPC(区分个人与公共)
	plantNpc = {  -- 个人 公共
		[0]		= {{45201,45201,45201},	{45251,45251,45251}},
		[44021] = {{45202,45203,45204}, {45252,45253,45254}},
		[44022] = {{45202,45203,45204}, {45252,45253,45254}},
		[44023] = {{45202,45203,45204}, {45252,45253,45254}},
		[44024] = {{45202,45203,45204}, {45252,45253,45254}},
		[44025] = {{45202,45203,45204}, {45252,45253,45254}},
		[44026] = {{45202,45203,45204}, {45252,45253,45254}},
		[44027] = {{45202,45203,45204}, {45252,45253,45254}},
		[44028] = {{45202,45203,45204}, {45252,45253,45254}},
		[44029] = {{45202,45203,45204}, {45252,45253,45254}},
		[44030] = {{45202,45203,45204}, {45252,45253,45254}},
		[44031] = {{45208,45209,45210}, {45258,45259,45260}},
		[44032] = {{45208,45209,45210}, {45258,45259,45260}},
		[44033] = {{45208,45209,45210}, {45258,45259,45260}},
		[44034] = {{45208,45209,45210}, {45258,45259,45260}},
		[44035] = {{45208,45209,45210}, {45258,45259,45260}},
		[44036] = {{45208,45209,45210}, {45258,45259,45260}},
		[44037] = {{45208,45209,45210}, {45258,45259,45260}},
		[44038] = {{45208,45209,45210}, {45258,45259,45260}},
		[44039] = {{45208,45209,45210}, {45258,45259,45260}},
		[44040] = {{45208,45209,45210}, {45258,45259,45260}},
		[44041] = {{45205,45206,45207}, {45255,45256,45257}},
		[44042] = {{45205,45206,45207}, {45255,45256,45257}},
		[44043] = {{45205,45206,45207}, {45255,45256,45257}},
		[44044] = {{45205,45206,45207}, {45255,45256,45257}},
		[44045] = {{45205,45206,45207}, {45255,45256,45257}},
		[44051] = {{45217,45218,45219}, {45267,45268,45269}},
		[44052] = {{45217,45218,45219}, {45267,45268,45269}},
		[44053] = {{45217,45218,45219}, {45267,45268,45269}},
		[44054] = {{45217,45218,45219}, {45267,45268,45269}},
		[44055] = {{45217,45218,45219}, {45267,45268,45269}},
		[44061] = {{45214,45215,45216}, {45264,45265,45266}},
		[44062] = {{45214,45215,45216}, {45264,45265,45266}},
		[44063] = {{45214,45215,45216}, {45264,45265,45266}},
		[44064] = {{45214,45215,45216}, {45264,45265,45266}},
		[44065] = {{45214,45215,45216}, {45264,45265,45266}},
		[44071] = {{45211,45212,45213}, {45261,45262,45263}},
		[44072] = {{45211,45212,45213}, {45261,45262,45263}},
		[44073] = {{45211,45212,45213}, {45261,45262,45263}},
		[44074] = {{45211,45212,45213}, {45261,45262,45263}},
		[44075] = {{45211,45212,45213}, {45261,45262,45263}},
		[44081] = {{45220,45221,45222}, {45270,45271,45272}},
		[44082] = {{45220,45221,45222}, {45270,45271,45272}},
		[44083] = {{45220,45221,45222}, {45270,45271,45272}},
		[44084] = {{45220,45221,45222}, {45270,45271,45272}},
		[44085] = {{45220,45221,45222}, {45270,45271,45272}},
		[44086] = {{45220,45221,45222}, {45270,45271,45272}},
		[44087] = {{45220,45221,45222}, {45270,45271,45272}},
		[44088] = {{45220,45221,45222}, {45270,45271,45272}},
		[44089] = {{45220,45221,45222}, {45270,45271,45272}},
		[44090] = {{45220,45221,45222}, {45270,45271,45272}},
		[44091] = {{45223,45224,45225}, {45273,45274,45275}},
		[44092] = {{45223,45224,45225}, {45273,45274,45275}},
		[44093] = {{45223,45224,45225}, {45273,45274,45275}},
		[44094] = {{45223,45224,45225}, {45273,45274,45275}},
		[44095] = {{45223,45224,45225}, {45273,45274,45275}},
		[44101] = {{45226,45227,45228}, {45276,45277,45278}},
		[44102] = {{45226,45227,45228}, {45276,45277,45278}},
		[44103] = {{45226,45227,45228}, {45276,45277,45278}},
		[44104] = {{45226,45227,45228}, {45276,45277,45278}},
		[44105] = {{45226,45227,45228}, {45276,45277,45278}},
		--新增鉴定石和宠物零食的产出
		[44111] = {{45229,45230,45231}, {45279,45280,45281}},
		[44112] = {{45229,45230,45231}, {45279,45280,45281}},
		[44113] = {{45229,45230,45231}, {45279,45280,45281}},
		[44114] = {{45229,45230,45231}, {45279,45280,45281}},
		[44115] = {{45229,45230,45231}, {45279,45280,45281}},
		[44121] = {{45232,45233,45234}, {45282,45283,45284}},
		[44122] = {{45232,45233,45234}, {45282,45283,45284}},
		[44123] = {{45232,45233,45234}, {45282,45283,45284}},
		[44124] = {{45232,45233,45234}, {45282,45283,45284}},
		[44125] = {{45232,45233,45234}, {45282,45283,45284}},


	},
	--水壶数据
	jugBase = {
		-- 等级，  营养增加范围， 时间减少
		[29051] = { level = 2, add = {8,18}, sub = 0.125},
		[29052] = { level = 7, add = {18,28},sub = 0.15},
	},
	--铲子数据
	scoopBase = {
		[29053] = {level=1,},
		[29054] = {level=1,},
	},
	-- 资金花产出团资金
	addticket = {100,150,200,250,300,350,400,450,500,550},
	--浇水冷却 单位：秒
	waterCold = 600,
	--植物操作距离
	maxDistance = 3,
	--宠物乐园，最大宠物数量
	maxDemonNum = 45,
}

--基地副本初始
function CopySceneInfo_1:InitCopyScene(sid)
	local ownerid = s_getSceneVar(sid,0,1)
	if ownerid == 0 then
		return
	end
	--初始养殖
	self:InitCorpsBreed(sid,ownerid)
	--初始种植
	self:InitCorpsPlant(sid,ownerid)
	--初始宠物乐园
	self:InitDemonPark(sid,ownerid)
	--初始团藏宝库
	self:InitCorpTreasury(sid)
	local step = s_getEvent(Relation_Corps,ownerid,1009)
	if step == EventStep_Run then
		local npclist = s_getNpcByBaseID(sid, 60161)
		if #npclist == 0 then
			local x = s_getVar(corps, 1, 27)
			local y = s_getVar(corps, 1, 28)
			s_sysSummon(60161, sid, x, y,0,1)
		end
	end
end

--基地副本销毁
function CopySceneInfo_1:FinalCopyScene(sid)
	local corps = s_getSceneVar(sid,0,1)
	if corps == 0 then
		return
	end
	local killing = GetBreedVar(corps,Breed_Killing)
	local npcid = s_getSceneVar(sid,1,1)
	if npcid > 0 and killing == 1 then
		local curhp = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP)
		SetBreedVar(corps,Breed_BossHp, curhp)
	end
end

--进入场景
function CopySceneInfo_1:OnPlayerIntoCopyScene(sid,uid)
	local ownerid = s_getSceneVar(sid,0,1)
	if ownerid == 0 then
		return
	end
	s_removeGroup(SCENE_ENTRY_PLAYER,uid)
	local corps = s_getCorpsId(uid)
	if corps == 0 then
		s_debug("没有团的玩家进入团基地,cid:" .. ownerid .. ",uid:" .. uid)
		s_gomap(uid,1,1,0,0,1)
		return
	end
	local enemy = s_getCorpsField(corps,CorpVar_Enemy)	-- 我的敌人
	local ally = s_getCorpsField(ownerid,CorpVar_Friend)  -- 基地的友团
	if ownerid == enemy then
		s_addGroup(SCENE_ENTRY_PLAYER,uid,COPY_GROUP_B)
		--场景中随机位置
		s_goto(SCENE_ENTRY_PLAYER,uid,0,0,99)
		--保证不在跳转点处
		local myy = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSY)
		if myy > 170 then
			s_debug("进入跳转区域重新随机到其他区域:%u",myy)
			local posx = 100 + math.random(1,50)
			local posy = 80 + math.random(1,20)
			s_goto(SCENE_ENTRY_PLAYER,uid,posx,posy,0)
		end
	end
	if corps == ally or corps == ownerid then
		s_addGroup(SCENE_ENTRY_PLAYER,uid,COPY_GROUP_A)
		if corps == ownerid then
			self:ReqCorpsPlantTip(corps,uid, 1)
		end
	end
	--杀人数置空
	s_addVar(uid,103,8,0)
end

--死亡
function CopySceneInfo_1:OnPlayerDie(sid,uid,murder,dtype)
	if murder == nil or #murder == 0 then
		return
	end
	local ownerid = s_getSceneVar(sid,0,1)
	for i=1,#murder do
		local corps = s_getCorpsId(murder[i])
		if corps == ownerid then
			local num = s_getVar(uid,103,8)
			num = num + 1
			local name = s_getValue(SCENE_ENTRY_PLAYER,murder[i],VALUE_TYPE_NAME)
			if name ~= nil and name ~= "" then
				s_sysNews(Relation_Corps, corps, "成员" .. name .. "击败" .. num .."名入侵我基地的恐怖分子")
			end
		end
	end
end

-------------------------------------------------------------------------------------------
--初始养殖
function CopySceneInfo_1:InitCorpsBreed(sid, corps)
	local days = s_getCurTime(TIME_ALLDAYS)
	local lastdays = GetBreedVar(corps, Breed_LastDays)
	if days == lastdays then
		--招出现有BOSS
		local npcid = self:SummonBossNpc(sid, corps)
		local killing = GetBreedVar(corps,Breed_Killing)
		if npcid > 0 and killing > 0 then
			s_removebuff(SCENE_ENTRY_NPC,npcid,self.feedBuff)
			s_addbuff(SCENE_ENTRY_NPC, npcid, self.killBuff, 1, 3600*24)
			local curhp = GetBreedVar(corps, Breed_BossHp)
			if curhp == 0 then curhp = 1000 end
			s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP,curhp)
		end
		return
	end

	--开启每日新养殖
	self:ResetAllBreedInfo(corps)
	local clevel = s_getCorpsField(corps,CorpVar_Level)
	if clevel > #self.breedNpc then
		clevel = self.breedNpc
	end
	SetBreedVar(corps,Breed_Level,clevel)
	SetBreedVar(corps,Breed_State,1)
	if self:SummonBossNpc(sid,corps) == 0 then
		SetBreedVar(corps,Breed_Level,0)
		SetBreedVar(corps,Breed_State,0)
		s_debug("开启团养殖失败:%u,%u", corps,days)
		return
	end
	SetBreedVar(corps,Breed_LastDays,days)
end

--重置所有数据
function CopySceneInfo_1:ResetAllBreedInfo(corps)
	SetBreedVar(corps,Breed_Level,0)
	SetBreedVar(corps,Breed_State,0)
	SetBreedVar(corps,Breed_Growth,0)
	SetBreedVar(corps,Breed_BossHp,0)
	SetBreedVar(corps,Breed_Killing,0)
end

--更新BOSSNPC
function CopySceneInfo_1:SummonBossNpc(sid, corps)
	local bstate = GetBreedVar(corps, Breed_State)
	if bstate == 0 or bstate == StateBreedBoss_Killed then
		return 0
	end
	local blevel = GetBreedVar(corps, Breed_Level)
	if blevel == 0 then
		blevel = s_getCorpsField(corps,CorpVar_Level)
		if blevel > #self.breedNpc then
			blevel = self.breedNpc
		end
		SetBreedVar(corps,Breed_Level,blevel)
	end
	local bossnpc = s_getSceneVar(sid,1,1)
	if bossnpc > 0 then
		s_killnpc(bossnpc,1)
	end
	local baseid = self.breedNpc[blevel][bstate]
	local posx = self.breedZone.x + math.random(1,self.breedZone.width)
	local posy = self.breedZone.y + math.random(1,self.breedZone.height)
	local npcid = s_sysSummon(baseid,sid,posx,posy)
	if npcid == 0 then
		s_debug("团养殖召唤时失败" .. corps .. "," .. baseid)
		return 0
	end
	SetBreedVar(corps, Breed_State, bstate)
	s_setSceneVar(sid,1,1,npcid)
	s_addbuff(SCENE_ENTRY_NPC, npcid, self.feedBuff, 1, 24*3600)
	s_debug("团怪物成功进入场景:" .. corps .. "," .. baseid)
	return npcid
end

--查看BOSS状态
function CopySceneInfo_1:ShowBossState(uid)
	local corps = s_getCorpsId(uid)
	if corps == 0 then return end
	if CopySceneCheck(uid,CopySceneType_CorpsBase,corps) == VALUE_FAIL then
		return
	end
	local bstate = GetBreedVar(corps, Breed_State)
	local curgrowth = GetBreedVar(corps,Breed_Growth)
	local cursec = s_getCurTime(TIME_ALLSECONDS)
	local leftsec = 24*3600 - (cursec%(24*3600))
	local days = s_getCurTime(TIME_ALLDAYS)
	local last = s_getVar(uid,103,2)
	local beedtimes = s_getVar(uid,103,9)
	if last ~= days then
		beedtimes = 0
		s_addVar(uid,103,2,days)
		s_addVar(uid,103,9,beedtimes)
		s_addVar(uid,107,6,0)
	end
	if beedtimes >= 10 then
		beedtimes = 0
	else
		beedtimes = 10 - beedtimes
	end
	local curlevel = GetBreedVar(corps,Breed_Level)
	local curstep = 0
	if GetBreedVar(corps,Breed_Killing) == 1 then
		curstep = 1
	end
	if GetBreedVar(corps, Breed_State) == StateBreedBoss_Killed then
		curstep = 2
	end

	local refreshtimes = s_getVar(uid,107,5)
	if refreshtimes >= 10 then
		refreshtimes = 0
	else
		refreshtimes = 10 - refreshtimes
	end
	local beedval = s_getVar(uid,107,6)
	local foodcolor = s_getVar(uid,107,7)

	local talkDialog =  'this:ShowNpcDialog(false)'
	local interfaceDialog= 'this:AddCorpsBossFeedDialog('..curstep ..','..curlevel..','..curgrowth ..
		','..leftsec..','..beedtimes..','..refreshtimes..','..beedval..','..foodcolor..')'
	local message = talkDialog .. interfaceDialog
	s_setMessage(uid,0,message,0)
end

--食物鉴定
function CopySceneInfo_1:BossFoodJudge(uid,operater)
	local corps = s_getCorpsId(uid)
	if corps == 0 then
		return
	end
	if s_getVar(uid,107,7) >= 4 then
		s_messageBox(uid,"已经刷新到紫色品质了")
		return
	end
	if operater == 0 then
		if s_getVar(uid,107,5) >= 10 then
			s_messageBox(uid,"今日免费刷新次数已达上限")
			return
		end
		s_addVar(uid,107,5,s_getVar(uid,107,5)+1)
	else
		if s_removeMoney(uid,MoneyType_Money,25,"刷食物颜色") ~= VALUE_OK then
			s_messageBox(uid,"您的金额不足以支付团boss刷新费用")
			return
		end
	end
	local perinfo = {{370,0},{350,1},{200,2},{65,3},{15,4}}
	local quality = self:SelectByPercent(perinfo,1000)
	--15次必绿
	if quality >= 3 then
		s_addVar(uid,116,60,0)
	end
	s_addVar(uid,116,60,s_getVar(uid,116,60)+1)
	if s_getVar(uid,116,60) >= 5 and s_getVar(uid,116,60) < 15 then
		s_sysInfo(uid,"还有".. 15 -  s_getVar(uid,116,60) .. "次必定刷新绿色食物")
	elseif s_getVar(uid,116,60) >= 15 then
		s_addVar(uid,116,60,0)
		quality = 3
	end
	if quality == 3 then
		s_sysInfo(uid,"成功刷新到绿品质食物！")
	elseif quality == 4 then
		s_sysInfo(uid,"成功刷新到紫品质食物！")
	end
	s_addVar(uid,107,7,quality)
	self:SummonBossNpc(sid,corps)
	self:ShowBossState(uid)
end

--BOSS喂养
function CopySceneInfo_1:FeedBossFood(sid,uid,operate)
	local corps = s_getCorpsId(uid)
	if corps == 0 then
		return
	end
	local bstate = GetBreedVar(corps, Breed_State)
	if bstate == StateBreedBoss_Killed or bstate == StateBreedBoss_None then
		s_sysInfo(uid,"目前没有怪物如何喂养？",ChatPos_Sys + ChatPos_Important)
		return
	end
	local killing = GetBreedVar(corps, Breed_Killing)
	if killing == 1 then
		s_sysInfo(uid,"已开启击败，不可喂养",ChatPos_Sys + ChatPos_Important)
		return
	end
	local bstate = GetBreedVar(corps, Breed_State)
	local curgrowth = GetBreedVar(corps,Breed_Growth)
	local allgrowth = self.growthRange[bstate]
	if curgrowth >= allgrowth and bstate == 5 then
		s_sysInfo(uid, "怪物已经达到满级，不可再被喂养！")
		return
	end
	if operate == 2 then
		local days = s_getCurTime(TIME_ALLDAYS)
		local last = s_getVar(uid,103,2)
		local times = s_getVar(uid,103,9)
		if last ~= days then
			times = 0
			s_addVar(uid,103,2,days)
			s_addVar(uid,103,9,0)
			s_addVar(uid,107,6,0)
		end
		if times >= 10 then
			s_messageBox(uid,"每人每天最多只能喂养10次")
			return
		end
		local foodcolor = s_getVar(uid,107,7)
		local addgrow = self.foodValue[foodcolor+1]
		curgrowth = curgrowth + addgrow
		if curgrowth > allgrowth then
			curgrowth = allgrowth;
		end
		local exp = self:GetAddExp(uid,foodcolor+1)
		s_refreshExp(uid,exp,ExpType_Corps,0)
		SetBreedVar(corps,Breed_Growth, curgrowth)
		times = times + 1
		s_addVar(uid,103,9,times)
		s_addVar(uid,107,7,0)
		s_addVar(uid,107,6,s_getVar(uid,107,6)+addgrow)
		RefreshTaskDailyInfo(uid, 30070)
		RefreshTaskDailyInfo(uid, 49106)
		s_sysInfo(uid, "成功喂养，当前喂养次数" ..times .. "/10，当前喂养度："..s_getVar(uid,107,6))
		s_debugUser(uid, "成功喂养团BOSS，当前喂养次数" ..times .. "/10，当前喂养度："..s_getVar(uid,107,6))
		s_addVar(uid,116,60,0)--喂养清除必绿次数
		self:ShowBossState(uid)
		if curgrowth < allgrowth then
			return
		elseif bstate == 5 then
			return
		end
		bstate = bstate + 1
	else
		if s_removeMoney(uid,MoneyType_Gold,100,"团BOSS一键喂养") == false then
			s_sysInfo(uid,"金币不足100，喂养失败！ ")
			return
		end
		bstate = 5
		allgrowth = self.growthRange[bstate]
		SetBreedVar(corps,Breed_Growth, allgrowth)
		self:ShowBossState(uid)
	end
	SetBreedVar(corps,Breed_State,bstate)
	self:SummonBossNpc(sid,corps)
	local colorstr = {"白色", "蓝色", "黄色", "绿色", "紫色"}
	s_corpsInfo(corps,"本团养殖的怪物已经成长为" .. colorstr[bstate] .."品质",ChatPos_Sys + ChatPos_Important)
	s_debug("BOSS成长到" ..colorstr[bstate].. "，团ID：" ..corps)
end

--BOSS 被杀
function CopySceneInfo_1:BossDeadEvent(sid,thisid)
	s_setSceneVar(sid,1,1,0)
	local corps = s_getSceneVar(sid,0,1)
	if corps == 0 then
		return
	end
	local bstate = GetBreedVar(corps, Breed_State)
	local growth = GetBreedVar(corps,Breed_Growth)
	self:ResetAllBreedInfo(corps)
	SetBreedVar(corps,Breed_State,StateBreedBoss_Killed)
	SetBreedVar(corps,Breed_Growth,growth)
	local murder = GetMurderList(SCENE_ENTRY_NPC,thisid)
	if murder == nil or #murder == 0 then
		s_debug("BOSS被击败时找不到杀人者:%u",corps)
		return
	end
	s_debug("团养殖结束:%u,%u",corps,murder[1])
	if s_getbufflevel(SCENE_ENTRY_PLAYER,murder[1],COPY_GROUP_B) > 0 then
		s_corpsInfo(corps,"本团怪物被击败，养殖失败",ChatPos_Sys + ChatPos_Important)
		local enemy = s_getCorpsId(murder[1])
		if enemy > 0 then
			local cname = s_getCorpsField(enemy,CorpVar_Name)
			if cname ~= nil and cname ~= "" then
				s_sysNews(Relation_Corps,corps,"本团怪物被" .. cname .. "团击败")
			end
		end
	else
		if bstate >= StateBreedBoss_Blue then
			s_corpsAchieve(corps, 4)
		end
		s_corpsInfo(corps,"成功击败农场饲养的怪物，怪物将于00：00后重生！注意：怪物品质越高，击败的奖励越丰厚！",ChatPos_Sys + ChatPos_Important)
		local list = s_getNineEntry(SCENE_ENTRY_NPC,thisid,10)
		for i = 1,table.getn(list), 2 do
			if list[i] == SCENE_ENTRY_PLAYER and s_getCorpsId(list[i+1]) == corps then
				if s_getVar(list[i+1],130,2) == 0 then
					s_addVar(list[i+1],130,2,1);
					s_addVar(list[i+1],130,100,s_getVar(list[i+1],130,100)+1)
					s_debugUser(list[i+1],"团活力，团BOSS，参与度：1")
				end
			end
		end
	end
	local baseid = 29546
	if bstate > StateBreedBoss_White then
		if bstate == StateBreedBoss_Blue then
			baseid = 29546
		elseif bstate == StateBreedBoss_Yellow then
			baseid = 29547
		elseif bstate == StateBreedBoss_Green then
			baseid = 29548
		elseif bstate == StateBreedBoss_Purple then
			baseid = 29549
		end
		s_addCorpsVar(corps,6,3,baseid)
		s_addCorpsVar(corps,6,4,s_getCurTime(TIME_ALLDAYS))
		local list = s_getCorpsEntry(0,0,0,corps)
		for i = 1,table.getn(list), 2 do
			local num = 0
			local growth = s_getVar(list[i+1],107,6)
			num = BOSSchestevent(growth)
			s_addVar(list[i+1],107,6,0)
			if num ~= 0 then
				--s_sysMail(list[i+1],"击败团boss奖励！",0,baseid,num,"1-1")
			end
		end
	end
end

--开启BOSS捕获
function CopySceneInfo_1:BossBloodShare(sid,corps,uid)
	local bstate = GetBreedVar(corps, Breed_State)
	if bstate == StateBreedBoss_Killed then
		s_sysInfo(uid,"今天的团怪物已经被击败",ChatPos_Sys + ChatPos_Important)
		return
	end
	if bstate < StateBreedBoss_Blue then
		s_sysInfo(uid,"蓝色以上品质的怪物才可开启击败",ChatPos_Sys + ChatPos_Important)
		return
	end
	local killing = GetBreedVar(corps, Breed_Killing)
	if killtype == 1 then
		s_sysInfo(uid,"已经开启,请勿重复操作",ChatPos_Sys + ChatPos_Important)
		return
	end
	if s_checkRight(uid,Relation_Corps,204) ~= VALUE_OK then
		s_sysInfo(uid,"只有团长和内务副官才可以开启",ChatPos_Sys + ChatPos_Important)
		return
	end
	local npcid = s_getSceneVar(sid,1,1)
	if npcid == 0 then
		return
	end
	local curhp = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP)
	SetBreedVar(corps,Breed_Killing,1)
	s_removebuff(SCENE_ENTRY_NPC,npcid,self.feedBuff)
	s_addbuff(SCENE_ENTRY_NPC, npcid, self.killBuff, 1, 24*3600)
	SetBreedVar(corps,Breed_BossHp, curhp)
	local fun,funstr = s_getFunction(uid,Relation_Corps)
	if funstr == nil or funstr == "" then
		funstr = "未知职务"
	end
	local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
	if name == nil or name == "" then
		name = "未知角色"
	end
	local msg = funstr .. name ..  "选择了击败本团怪物,成功击败团怪物将获得大量宝石和道具奖励,团等级越高,击败团怪物获得的奖励就越丰厚"
	s_corpsInfo(corps, msg,ChatPos_Sys + ChatPos_Important)

	local call = "BackToCorpsEvent($1,$2)"
	local buttons = "确定|3|Enter|取消|4|Esc|稍后|5|Esc"
	msg = funstr .. name .. "选择了击败本团怪物,成功击败团怪物将获得大量宝石和道具奖励,是否前往击败?"
	local list = s_getCorpsEntry(0,0,0,corps)
	for i = 1,table.getn(list), 2 do
		s_registerMsgBox(list[i+1],call,buttons,msg,300)
	end
	if s_getCorpsVar(corps,1,44) < CORPS_ACTIVITY_33701 then
		s_addCorpsVar(corps,1,44,s_getCorpsVar(corps,1,44)+1)
	end
	s_debug("开启捕杀:%u,%u", corps, uid)
end

--喂养加成
function CopySceneInfo_1:GetAddPercent(mood, appet)
	local ml = 0
	local al = 0
	for i=2,#self.moodAdd do
		if mood > self.moodAdd[i-1][1] and mood <= self.moodAdd[i][1] then
			ml = self.moodAdd[i][2]
			break
		end
	end
	for i=2,#self.appetAdd do
		if appet > self.appetAdd[i-1][1] and appet <= self.appetAdd[i][1] then
			al = self.appetAdd[i][2]
			break
		end
	end
	return (100+ml+al)/100.0
end

--10*0.025*人物等级^2.5*食物颜色倍率
function CopySceneInfo_1:GetAddExp(uid,color)
	local crate = {1,1.5,2,3,5}
	local userlevel = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	return math.floor(10 * 0.025 * userlevel^2.5 * crate[color])
end

--概率计算
function CopySceneInfo_1:SelectByPercent(info, all)
	local percent = 0
	local rand = math.random(1,all)
	for i=1, #info do
		percent = percent + info[i][1]
		if percent > all then
			s_debug("概率配置表有问题")
			percent = all
		end
		if rand <= percent then
			return info[i][2]
		end
	end
	return info[1][2]
end

--注册怪物死亡事件
for i = 45301,45350 do
	RegisterCopyNpcDeadEvent(i,1,0,"CopySceneInfo_1:BossDeadEvent($1,$2)")
end

--------------------------------------------------------------------------------------------------
--GM指令用
function CopySceneInfo_1:GmBreedBoss(gmtype,corps,uid,value,mood,appet)
	local sid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
	local stype = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE)
	if stype ~= CopySceneType_CorpsBase then
		s_sysInfo(uid,"非副本场景不可使用",ChatPos_Sys + ChatPos_Important)
		return
	end
	local ownerid = s_getSceneVar(sid,0,1)
	if ownerid ~= corps then
		s_sysInfo(uid,"非本团副本",ChatPos_Sys + ChatPos_Important)
		return
	end
	-- 1 喂养
	if gmtype == 1 then
		local bstate = GetBreedVar(corps, Breed_State)
		if bstate == StateBreedBoss_Killed then
			s_sysInfo(uid,"怪物已经被击败",ChatPos_Sys + ChatPos_Important)
			return
		end
		local killing = GetBreedVar(corps, Breed_Killing)
		if killing > 0 then
			s_sysInfo(uid,"已经开启击败",ChatPos_Sys + ChatPos_Important)
			return
		end
		if value == 0 then
			value = 6
		end
		local curgrowth = GetBreedVar(corps,Breed_Growth)
		curgrowth = curgrowth + value
		if curgrowth > 2000 then
			curgrowth = 2000
		end
		SetBreedVar(corps,Breed_Growth, curgrowth)

		if mood > 0 then
			if mood > 50 then mood = 50 end
			SetBreedVar(corps,Breed_Mood,mood)
		end
		if appet > 0 then
			if appet > 50 then appet = 50 end
			SetBreedVar(corps,Breed_Appetite,appet)
		end
		if curgrowth >= self.growthRange[bstate] then
			bstate = bstate + 1
			SetBreedVar(corps,Breed_State,bstate)
			self:SummonBossNpc(sid,corps)
		end
		return
	end
	-- 2 清除所有
	if gmtype == 2 then
		if sid > 0 then
			local bossnpc = s_getSceneVar(sid,1,1)
			if bossnpc > 0 then
				s_killnpc(bossnpc,1)
			end
			s_setSceneVar(sid,1,1,0)
		end
		SetBreedVar(corps,Breed_LastDays,0)
		self:InitCorpsBreed(sid,corps)
		return
	end
	-- 3 清除喂养冷却
	if gmtype == 3 then
		s_addVar(uid,103,2,0)
		return
	end
	-- 4 清除消化冷却
	if gmtype == 4 then
		SetBreedVar(corps,Breed_Timer,0)
		return
	end
end

--GM指令用
function CopySceneInfo_1:GmSeedPlant(gmtype,corps,uid,sid,num)
	local sctype = s_getValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_SCENE_TYPE)
	if sctype ~= CopySceneType_CorpsBase then
		s_sysInfo(uid,"只能在团基地中使用")
		return
	end
	if gmtype == 3 then
		for t=1,2 do
			for i=1,#self.plantPos[t] do
				local index = (t-1)*100 + i
				self:DoResetPlant(sid,corps,index,0,PlantStep_Die)
			end
		end
		return
	end
	if gmtype == 5 then
		for i = 1, 9 do
			s_addVar(uid, 103, 50+i,0)
		end
		s_sysInfo(uid,"指令清除每日种植次数限制",ChatPos_Sys + ChatPos_Important)
		return
	end
	local etype,eid = s_getSelect(uid)
	if etype ~= SCENE_ENTRY_NPC then
		s_sysInfo(uid,"请选中植物",ChatPos_Sys + ChatPos_Important)
		return
	end
	local index = s_getValue(etype,eid,VALUE_TYPE_POT_INDEX)
	if index == 0 then
		s_sysInfo(uid,"请选中植物",ChatPos_Sys + ChatPos_Important)
		return
	end
	local seed = GetPlantInfo(corps,index,PlantInfo_Seed)
	if seed == 0 then
		s_sysInfo(uid,"花儿好像已经不在了",ChatPos_Sys + ChatPos_Important)
		return
	end
	local baseVal = self.plantBase[seed]
	local curtime = s_getCurTime(TIME_ALLSECONDS)
	if baseVal == nil then
		s_debug("种植数据配置有误:%u,%u",uid,seed)
		return
	end
	if gmtype == 4 then
		SetPlantInfo(corps,index,PlantInfo_LastWater,curtime-self.waterCold-1)
		s_sysInfo(uid,"指令清除浇水冷却",ChatPos_Sys + ChatPos_Important)
		self:SetPlantWaterCold(sid,index,curtime-self.waterCold-1)
		self:FreshPlantTip(corps, index, sid)
		return
	end
	local health = GetPlantInfo(corps,index,PlantInfo_Health)
	if gmtype == 1 then
		local step = GetPlantInfo(corps,index,PlantInfo_Step)
		if step ~= PlantStep_Bud and step ~= PlantStep_Grow then
			s_sysInfo(uid, "只有在成长阶段才可设置", ChatPos_Sys + ChatPos_Important)
			return
		end
		health = health + num
		if health > 100 then
			health = 100
		end
		s_sysInfo(uid,"GM指令种植设置营养指数:" .. health,ChatPos_Sys + ChatPos_Important)
		self:FreshPlantTip(corps, index, sid)
	end
	local endtime = GetPlantInfo(corps,index,PlantInfo_EndTime)
	if gmtype == 2 then
		if num > 1200 then
			num = 1200
		end
		endtime = endtime - num * 60
		s_sysInfo(uid,"GM指令种植时间减少:" .. self:GetPlantTimeStr(num*60),ChatPos_Sys + ChatPos_Important)
		self:FreshPlantTip(corps, index, sid)
	end
	SetPlantInfo(corps,index,PlantInfo_Health,health)
	SetPlantInfo(corps,index,PlantInfo_EndTime,endtime)

	self:OnePlantGrowth(corps,index,sid,1)
	self:SetPlantHealth(sid,index,health)
end

--------------------------------------------------------------------------------------------------
--初始种植
function CopySceneInfo_1:InitCorpsPlant(sid,corps)
	for t=1,2 do
		for i=1,#self.plantPos[t] do
			local index = (t-1)*100 + i
			local seed = GetPlantInfo(corps,index,PlantInfo_Seed)
			local step = PlantStep_Bud
			if seed > 0 then
				step = GetPlantInfo(corps,index,PlantInfo_Step)
			end
			self:DoResetPlant(sid,corps,index,seed,step)
		end
	end
	self:PlantGrowth(corps,sid)
end

-- 索引类型转换
function CopySceneInfo_1:IndexToType(index)
	if index == nil or index == 0 then
		return 0,0
	end
	if index > 100 then
		return PlantType_Pub,index-100
	end
	return PlantType_User,index
end

--播种
function CopySceneInfo_1:ToSeedPlant(uid,seed,itemid,potnpc)
	if potnpc == nil or potnpc == 0 then
		return VALUE_FAIL
	end
	local corps = s_getCorpsId(uid)
	if corps == 0 then
		return VALUE_FAIL
	end
	local sid = CopySceneCheck(uid,CopySceneType_CorpsBase,corps)
	if sid == VALUE_FAIL then
		s_sysInfo(uid,"非本团基地,不可种植",ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end
	local traffic = s_getTrafficType(uid)
	if traffic ~= TrafficType_None then
		s_resetTrafficType(uid)
	end
	local baseid = s_getValue(SCENE_ENTRY_NPC,potnpc,VALUE_TYPE_BASE_ID)
	if baseid ~= 45201 and baseid ~= 45251 then
		s_sysInfo(uid,"只能在空花盆里播种!",ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end
	local baseVal = self.plantBase[seed]
	if baseVal == nil then
		return VALUE_FAIL
	end
	if GetDayPlantTimes(uid, baseVal.ilk) >= baseVal.times then
		s_sysInfo(uid,"每天只能种植" .. baseVal.times .. "次", ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end
	local userlevel = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if userlevel < baseVal.userlv then
		s_sysInfo(uid, "使用该种子需要等级达到" .. baseVal.userlv .. "级", ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end
	local index = s_getValue(SCENE_ENTRY_NPC,potnpc,VALUE_TYPE_POT_INDEX)
	local ptype,pi = self:IndexToType(index)
	if ptype == PlantType_User then
		local myseed = s_getVar(uid,103,3) -- 个人种植编号
		if myseed > 0 then
			local owner = GetPlantInfo(corps,myseed,PlantInfo_Owner)
			if owner == uid then
				s_sysInfo(uid,"只能在个人种植区种植一朵花",ChatPos_Sys + ChatPos_Important)
				return VALUE_FAIL
			else
				--花被偷或者铲掉了
				s_addVar(uid,103,3,0)
			end
		end
	else
		local clevel = s_getCorpsField(corps,CorpVar_Level)
		local allNum = 4 + clevel*2
		local usedPubNum = GetPlantVar(corps,Plant_UsedPubPot)
		if usedPubNum >= allNum then
			s_sysInfo(uid,"本团目前只允许使用" .. allNum .. "个公共花盆", ChatPos_Sys + ChatPos_Important)
			return VALUE_FAIL
		end
		local myseed = s_getVar(uid,103,4) -- 公共编号1
		local pubnum = 0
		if myseed > 0 then
			local owner = GetPlantInfo(corps,myseed,PlantInfo_Owner)
			if owner == uid then
				pubnum = pubnum + 1
			else
				--花被偷或者铲掉了
				s_addVar(uid,103,4,0)
			end
		end
		myseed = s_getVar(uid,103,5) -- 公共编号2
		if myseed > 0 then
			local owner = GetPlantInfo(corps,myseed,PlantInfo_Owner)
			if owner == uid then
				pubnum = pubnum + 1
			else
				--花被偷或者铲掉了
				s_addVar(uid,103,5,0)
			end
		end
		if pubnum == 2 then
			s_sysInfo(uid,"只能在公共种植区种植2朵花",ChatPos_Sys + ChatPos_Important)
			return VALUE_FAIL
		end
	end
	local x = s_getValue(SCENE_ENTRY_NPC,potnpc,VALUE_TYPE_POSX)
	local y = s_getValue(SCENE_ENTRY_NPC,potnpc,VALUE_TYPE_POSY)
	local myx = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSX)
	local myy = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSY)
	if math.abs(x-myx) > self.maxDistance or math.abs(y-myy) > self.maxDistance then
		s_sysInfo(uid,"请靠近一点再使用",ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end

	--蘑菇，检查体力值
	if baseVal.ilk == 3 then
		if s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_USABLE_TILED_POINT) < 45 then
			s_sysInfo(uid,"体力值不够，需要45点",ChatPos_Sys + ChatPos_Important)
			return VALUE_FAIL
		end
	end

	local callback = "CopySceneInfo_1:DoSeedPlant(" .. uid .. "," .. seed .. "," .. itemid .. "," .. potnpc .. ")"
	s_showbar(uid,10000,callback,UninterruptActionType_TASK,1)
	return VALUE_OK
end

--播种
function CopySceneInfo_1:DoSeedPlant(uid, seed, itemid, npcid)
	local sid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
	local corps = s_getCorpsId(uid)
	if sid == 0 or corps == 0 then
		return
	end
	local index = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POT_INDEX)
	if index == 0 then
		return
	end
	if GetPlantInfo(corps,index,PlantInfo_Seed) > 0 then
		s_sysInfo(uid,"慢了一点，被别人先占用了",ChatPos_Sys + ChatPos_Important)
		return
	end

	local baseVal = self.plantBase[seed]
	if baseVal == nil then
		s_debug("种植数据配置有误:" .. seed)
		return
	end

	--蘑菇，检查体力值
	if baseVal.ilk == 3 then
		if s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_USABLE_TILED_POINT) < 45 then
			s_sysInfo(uid,"体力值不够，需要45点",ChatPos_Sys + ChatPos_Important)
			return
		end

		--扣体力点
		s_subValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_USABLE_TILED_POINT, 45)
	end

	local ptype,pi = self:IndexToType(index)
	if ptype == 0 then
		return
	end
	if s_deleteItemByThisID(uid,itemid,1,"播种删除") ~= VALUE_OK then
		return
	end

	local etime = s_getCurTime(TIME_ALLSECONDS)
	SetPlantInfo(corps,index,PlantInfo_LastWater,etime-self.waterCold-1)
	local plantnpc = self:DoResetPlant(sid,corps,index,seed,PlantStep_Bud)
	if plantnpc > 0 then
		s_setValue(SCENE_ENTRY_NPC,plantnpc,VALUE_TYPE_MASTER,uid)
		s_refreshNpc(plantnpc)
	end
	self:SetPlantWaterCold(uid,index,etime-self.waterCold-1)
	SetPlantInfo(corps,index,PlantInfo_Seed,seed)
	SetPlantInfo(corps,index,PlantInfo_Owner,uid)
	SetPlantInfo(corps,index,PlantInfo_Stub,1)
	SetPlantInfo(corps,index,PlantInfo_Step,PlantStep_Bud)
	SetPlantInfo(corps,index,PlantInfo_EndTime, etime + baseVal.life * 3600)
	SetPlantInfo(corps,index,PlantInfo_Health,0)
	SetPlantInfo(corps,index,PlantInfo_OutPut,baseVal.output[1])
	SetPlantInfo(corps,index,PlantInfo_Remain,baseVal.output[1])
	SetPlantInfo(corps,index,PlantInfo_Water,0)
	if ptype == PlantType_User then
		s_addVar(uid,103,3,index)
	elseif ptype == PlantType_Pub then
		if s_getVar(uid,103,4) == 0 then
			s_addVar(uid,103,4,index)
		else
			s_addVar(uid,103,5,index)
		end
		local usedPubNum = GetPlantVar(Plant_UsedPubPot)
		usedPubNum = usedPubNum + 1
		SetPlantVar(corps,Plant_UsedPubPot,usedPubNum)
	end
	self:FreshPlantTip(corps, index, sid)
	s_debug("团种植成功:" .. uid .. "," .. seed)
	AddDayPlantTimes(uid, baseVal.ilk)
	RefreshTaskDailyInfo(uid, 49107)
	--引导任务处理
	local process = s_getTaskValue(uid,10988,TaskValue_Process)
	if process == TaskProcess_Doing then
		AddRoleTaskOperate(uid,10988)
	end
end

function CopySceneInfo_1:GetPlantTimeStr(seconds)
	if seconds == nil or seconds <= 0 then
		return "0分钟"
	end
	local str = ""
	local hours = 0
	local mins = 0
	local secs = 0
	hours = math.floor(seconds/3600)
	seconds = seconds % 3600
	mins = math.ceil(seconds/60)
	if hours > 0 then
		str = str .. hours .. "小时"
	end
	if mins > 0 then
		str = str .. mins .. "分钟"
	end
	return str
end

function CopySceneInfo_1:GetOutPutStr(seed,num)
	local str = ""
	local baseVal = self.plantBase[seed]
	if baseVal == nil then
		return str
	end
	if baseVal.ilk == 4 then  -- 刺手特殊处理
		num = num * 3600
		str = self:GetPlantTimeStr(num)
	else
		str = str .. num .. self.plantBase[seed].unit
	end
	return str
end

--浇水
function CopySceneInfo_1:ToWaterPlant(uid,baseid,itemid,plantnpc)
	if plantnpc == nil or plantnpc == 0 then
		return VALUE_FAIL
	end
	local sid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
	local corps = s_getSceneVar(sid,0,1)
	if corps == 0 then
		return VALUE_FAIL
	end
	local traffic = s_getTrafficType(uid)
	if traffic ~= TrafficType_None then
		s_resetTrafficType(uid)
	end
	local index = s_getValue(SCENE_ENTRY_NPC,plantnpc,VALUE_TYPE_POT_INDEX)
	if index == 0 then
		s_sysInfo(uid,"你确定浇的是花吗？",ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end
	local mycorps = s_getCorpsId(uid)
	local enemy = s_getCorpsField(mycorps,CorpVar_Enemy)	-- 我的敌人
	if enemy == corps then
		s_sysInfo(uid,"不可以给敌对团的花浇水",ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end

	local seed = GetPlantInfo(corps,index,PlantInfo_Seed)
	local baseVal = self.plantBase[seed]
	if baseVal == nil then
		return VALUE_FAIL
	end
	local step = GetPlantInfo(corps,index,PlantInfo_Step)
	if step ~= PlantStep_Bud and step ~= PlantStep_Grow then
		s_sysInfo(uid, "只有在成长阶段才可浇水", ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end
	local allow = GetPlantInfo(corps,index,PlantInfo_AllowWater)
	if allow ~= 0 then
		local owner = GetPlantInfo(corps,index,PlantInfo_Owner)
		if owner ~= uid then
			s_sysInfo(uid, "花的主人不允许别人浇水", ChatPos_Sys + ChatPos_Important)
			return VALUE_FAIL
		end
	end
	local wtimes = GetPlantInfo(corps,index,PlantInfo_Water)
	local maxw = 4
	if baseVal.ilk == 7 then
		maxw = 1
	end
	if wtimes >= maxw then
		s_sysInfo(uid,"已经浇水" .. wtimes .. "次，不可再浇！",ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end
	--经验花每人只能交1次
	if baseVal.ilk == 3 then
		local owner = GetPlantInfo(corps,index,PlantInfo_Owner)
		if GetWaterVar(corps,index,uid) ~= nil and owner ~= uid then
			s_sysInfo(uid, "别人的蘑菇你只能浇水1次",ChatPos_Sys + ChatPos_Important)
			return
		end
	end
	local lasttime = GetPlantInfo(corps,index,PlantInfo_LastWater)
	local curtime = s_getCurTime(TIME_ALLSECONDS)
	if baseid ~= 29052 and curtime > lasttime and curtime - lasttime <= self.waterCold then
		s_sysInfo(uid,"浇水冷却中，冷却时间:" .. self:GetPlantTimeStr(lasttime+self.waterCold - curtime),ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end
	local x = s_getValue(SCENE_ENTRY_NPC,plantnpc,VALUE_TYPE_POSX)
	local y = s_getValue(SCENE_ENTRY_NPC,plantnpc,VALUE_TYPE_POSY)
	local myx = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSX)
	local myy = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSY)
	if math.abs(x-myx) > self.maxDistance or math.abs(y-myy) > self.maxDistance then
		s_sysInfo(uid,"请靠近一点再使用",ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end

	local callback = "CopySceneInfo_1:DoWaterPlant(" .. uid .. "," .. baseid .. "," .. itemid .. "," .. plantnpc .. ")"
	s_showbar(uid,10000,callback,UninterruptActionType_TASK,1)
	return VALUE_OK
end
--浇水
function CopySceneInfo_1:DoWaterPlant(uid,baseid,itemid,plantnpc)
	local sid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
	local corps = s_getSceneVar(sid,0,1)
	if corps == 0 then
		return
	end
	local index = s_getValue(SCENE_ENTRY_NPC,plantnpc,VALUE_TYPE_POT_INDEX)
	if index == 0 then
		s_sysInfo(uid,"你确定浇的是花吗？",ChatPos_Sys + ChatPos_Important)
		return
	end
	local seed = GetPlantInfo(corps,index,PlantInfo_Seed)
	if seed == 0 then
		s_sysInfo(uid,"花儿好像已经不在了",ChatPos_Sys + ChatPos_Important)
		return
	end
	local baseVal = self.plantBase[seed]
	if baseVal == nil then
		s_debug("种植数据配置有误:" .. seed)
		return
	end
	local step = GetPlantInfo(corps,index,PlantInfo_Step)
	if step ~= PlantStep_Bud and step ~= PlantStep_Grow then
		s_sysInfo(uid, "只有在成长阶段才可浇水", ChatPos_Sys + ChatPos_Important)
		return
	end
	local lasttime = GetPlantInfo(corps,index,PlantInfo_LastWater)
	local curtime = s_getCurTime(TIME_ALLSECONDS)
	if baseid ~= 29052 and curtime > lasttime and curtime - lasttime <= self.waterCold then
		s_sysInfo(uid,"浇水冷却中，冷却时间:" .. self:GetPlantTimeStr(lasttime+self.waterCold - curtime),ChatPos_Sys + ChatPos_Important)
		return
	end
	local wtimes = GetPlantInfo(corps,index,PlantInfo_Water)
	local maxw = 4
	local addmod = 1
	if baseVal.ilk == 7 then
		maxw = 1
		addmod = 4
	end
	if wtimes >= maxw then
		return
	end
	local jugVal = self.jugBase[baseid]
	if jugVal == nil then
		s_debug("水壶数据配置有误:" ..baseid)
		return
	end
	local count = s_getItemValue(uid,itemid,Item_Attribute_UseCount)
	if count >= 4 then
		s_deleteItemByThisID(uid,itemid,1,"耐久用完")
	else
		s_setItemValue(uid,itemid,Item_Attribute_UseCount,count+1)
		s_refreshItem(uid,itemid)
	end

	local health = GetPlantInfo(corps,index,PlantInfo_Health)
	local hadd = math.random(jugVal.add[1], jugVal.add[2]) * addmod
	if hadd + health > 100 then
		hadd = 100 - health
	end
	health = health + hadd
	wtimes = wtimes + 1
	local endtime = GetPlantInfo(corps,index,PlantInfo_EndTime)
	local curtime = s_getCurTime(TIME_ALLSECONDS)
	local subtime = math.floor(3600 * (baseVal.life * jugVal.sub)) * addmod
	if curtime + subtime >= endtime then
		endtime = curtime
	else
		endtime = endtime - subtime
	end
	local lastwater = curtime
	if wtimes == maxw then
		lastwater = curtime + baseVal.life * 3600
	end
	SetPlantInfo(corps,index,PlantInfo_Health,health)
	SetPlantInfo(corps,index,PlantInfo_EndTime,endtime)

	--金水壶没有耐久
	if baseid ~= 29052 or wtimes == maxw then
		SetPlantInfo(corps,index,PlantInfo_LastWater,lastwater)
	end

	SetPlantInfo(corps,index,PlantInfo_Water,wtimes)
	local addoutput = math.floor((baseVal.output[2] - baseVal.output[1])*hadd/100.0)
	s_sysInfo(uid,"由于你的辛勤劳作，成长时间减少" .. self:GetPlantTimeStr(subtime) .. "，产量增加" .. addoutput, ChatPos_Sys + ChatPos_Important)
	if health > 90 then
		local owner = GetPlantInfo(corps,index,PlantInfo_Owner)
		s_plantInfo(owner, 2, baseVal.name)
	end

	local lastadd = GetWaterVar(corps,index,uid)
	if lastadd == nil then
		lastadd = 0
	end
	lastadd = lastadd + hadd
	SetWaterVar(corps,index,uid,lastadd)
	self:SetPlantWaterCold(sid,index,lastwater)
	self:OnePlantGrowth(corps,index,sid,1)
	self:SetPlantHealth(sid,index,health)
	self:FreshPlantTip(corps, index, sid)

	local owner = GetPlantInfo(corps,index,PlantInfo_Owner)
	if owner ~= uid then
		AddAchieveTaskOperate(uid,43008,1)
	end
end

--铲除
function CopySceneInfo_1:ToCutPlant(uid,baseid,itemid,plantnpc)
	if plantnpc == nil or plantnpc == 0 then
		return VALUE_FAIL
	end
	local sid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
	local corps = s_getSceneVar(sid,0,1)
	if corps == 0 then
		return VALUE_FAIL
	end
	local traffic = s_getTrafficType(uid)
	if traffic ~= TrafficType_None then
		s_resetTrafficType(uid)
	end
	local index = s_getValue(SCENE_ENTRY_NPC,plantnpc,VALUE_TYPE_POT_INDEX)
	if index == 0 then
		s_sysInfo(uid,"你确定铲除的是花吗？",ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end
	local seed = GetPlantInfo(corps,index,PlantInfo_Seed)
	if seed == 0 then
		s_sysInfo(uid,"花儿好像已经不在了",ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end
	local baseVal = self.plantBase[seed]
	if baseVal == nil then
		s_debug("铲除种植数据配置有误:" .. seed)
		return
	end
	local owner = GetPlantInfo(corps,index,PlantInfo_Owner)
	if baseid == 29053 then
		if owner ~= uid then
			s_sysInfo(uid,"白铲只能铲除自己的植物",ChatPos_Sys + ChatPos_Important)
			return VALUE_FAIL
		end
	end
	local x = s_getValue(SCENE_ENTRY_NPC,plantnpc,VALUE_TYPE_POSX)
	local y = s_getValue(SCENE_ENTRY_NPC,plantnpc,VALUE_TYPE_POSY)
	local myx = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSX)
	local myy = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSY)
	if math.abs(x-myx) > self.maxDistance or math.abs(y-myy) > self.maxDistance then
		s_sysInfo(uid,"请靠近一点再使用",ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end

	local callback = "CopySceneInfo_1:DoCutPlant(" .. uid .. "," .. baseid .. "," .. itemid .. "," .. plantnpc .. ")"
	s_showbar(uid,5000,callback,UninterruptActionType_TASK,1)
	return VALUE_OK
end

--铲除
function CopySceneInfo_1:DoCutPlant(uid,baseid,itemid,plantnpc)
	local sid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
	local corps = s_getSceneVar(sid,0,1)
	if corps == 0 then
		return
	end
	local index = s_getValue(SCENE_ENTRY_NPC,plantnpc,VALUE_TYPE_POT_INDEX)
	if index == 0 then
		return
	end
	local seed = GetPlantInfo(corps,index,PlantInfo_Seed)
	if seed == 0 then
		s_sysInfo(uid,"花儿好像已经不在了",ChatPos_Sys + ChatPos_Important)
		return
	end
	local owner = GetPlantInfo(corps,index,PlantInfo_Owner)
	if s_useItem(uid,itemid) ~= VALUE_OK then
		s_debug("铲除删除道具失败:" .. uid .. "," .. itemid)
		return
	end
	self:DoResetPlant(sid,corps,index,0,PlantStep_Die)
	if baseid == 29054 then
		local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
		if name == "" or name == nil then
			name = "未知角色名"
		end
		local corpsname = s_getCorpsField(corps,CorpVar_Name)
		if corpsname == nil or corpsname == "" then
			corpsname = "未知团名"
		end
		s_worldInfo(name .. "在" .. corpsname .. "团铲除一颗植物")
	end
	s_debug("铲除植物成功:" .. uid .. "," .. owner .. "," .. seed)
end

--重置某个植物
function CopySceneInfo_1:DoResetPlant(sid,corps,index,seed,step)
	if index == nil or index == 0 then return end
	local ptype,pi = self:IndexToType(index)
	local npcid = s_getSceneVar(sid,2,index)
	if npcid > 0 then
		s_killnpc(npcid,1)
	end
	local owner = GetPlantInfo(corps,index,PlantInfo_Owner)
	if step == PlantStep_Die then
		SetPlantInfo(corps,index,PlantInfo_Step,0)
		self:FreshPlantTip(corps, index, sid)
		SetPlantInfo(corps,index,PlantInfo_Seed,0)
		SetPlantInfo(corps,index,PlantInfo_Owner,0)
		SetPlantInfo(corps,index,PlantInfo_Stub,0)
		SetPlantInfo(corps,index,PlantInfo_EndTime,0)
		SetPlantInfo(corps,index,PlantInfo_Health,0)
		SetPlantInfo(corps,index,PlantInfo_OutPut,0)
		SetPlantInfo(corps,index,PlantInfo_Remain,0)
		SetPlantInfo(corps,index,PlantInfo_Water,0)
		SetPlantInfo(corps,index,PlantInfo_LastWater,0)
		ResetWaterVar(corps,index)
		ResetStealVar(corps,index)
	else
		if owner > 0 then
			self:FreshPlantTip(corps, index, sid)
		end
	end

	if sid == 0 then
		return
	end
	if step == PlantStep_None or step == PlantStep_Die then
		step = PlantStep_Bud
	end
	local baseid = self.plantNpc[seed][ptype][step]
	local pos = self.plantPos[ptype][pi]
	local plantnpc = s_sysSummon(baseid,sid,pos[1],pos[2])
	if plantnpc == 0 then
		s_debug("植物重置失败" .. ptype .. "," .. index)
	else
		s_setValue(SCENE_ENTRY_NPC,plantnpc,VALUE_TYPE_POT_INDEX,index)
		if seed > 0 then
			s_setValue(SCENE_ENTRY_NPC,plantnpc,VALUE_TYPE_MASTER,owner)
			s_refreshNpc(plantnpc)
		end
	end
	s_setSceneVar(sid,2,index,plantnpc)
	local health = GetPlantInfo(corps,index,PlantInfo_Health)
	self:SetPlantHealth(sid,index,health)
	local wcold = GetPlantInfo(corps,index,PlantInfo_LastWater)
	self:SetPlantWaterCold(sid,index,wcold)
	return plantnpc
end

--所有植物成长
function CopySceneInfo_1:PlantGrowth(corps,sid)
	for t=1,2 do
		for i=1,#self.plantPos[t] do
			local index = (t-1)*100 + i
			self:OnePlantGrowth(corps,index,sid)
		end  -- for i
	end
end

function CopySceneInfo_1:OnePlantGrowth(corps,index,sid,newhealth)
	local seed = GetPlantInfo(corps,index,PlantInfo_Seed)
	local baseVal = self.plantBase[seed]
	if baseVal ~= nil then
		local curtime = s_getCurTime(TIME_ALLSECONDS)
		step = GetPlantInfo(corps,index,PlantInfo_Step)
		local oldstep = step
		local endtime = GetPlantInfo(corps,index,PlantInfo_EndTime)
		local owner = GetPlantInfo(corps,index,PlantInfo_Owner)
		local output = GetPlantInfo(corps,index,PlantInfo_OutPut)
		if endtime <= curtime then
			-- 成熟
			if step == PlantStep_Bud or step == PlantStep_Grow then
				-- step == PlantStep_Bud 一般情况下不会出现 服务器停机维护时间过长
				step = PlantStep_Ripe
				if baseVal.ilk == 4 then -- 刺手特殊处理
					endtime = curtime + output * 3600
				else
					endtime = curtime + 24*3600
				end
				SetPlantInfo(corps,index,PlantInfo_LastWater, curtime+baseVal.life*3600)
				newhealth = 1
				-- 枯死/重生
			elseif step == PlantStep_Ripe then
				step = PlantStep_Die
			end
		else
			-- 青苗
			if step == PlantStep_Bud then
				if endtime - curtime <= (baseVal.life *2*3600/3) then
					step = PlantStep_Grow
				end
			end
		end

		if newhealth ~= nil then
			local health = GetPlantInfo(corps,index,PlantInfo_Health)
			local addper = health / 100.0
			output = baseVal.output[1] + math.floor(addper * (baseVal.output[2] - baseVal.output[1]))
			SetPlantInfo(corps,index,PlantInfo_Remain,output)
			SetPlantInfo(corps,index,PlantInfo_OutPut,output)
		end

		if oldstep ~= step then
			if step ~= PlantStep_Die then
				SetPlantInfo(corps,index,PlantInfo_EndTime,endtime)
				SetPlantInfo(corps,index,PlantInfo_Step,step)
				self:DoResetPlant(sid,corps,index,seed,step)
			else
				self:DoResetPlant(sid,corps,index,0,PlantStep_Die)
			end
		end
	end -- if seed
end
--设置是否可浇水
function CopySceneInfo_1:SetPlantAllowWater(uid,index,allow)
	if index == 0 then
		return VALUE_FAIL
	end
	if s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE) ~= CopySceneType_CorpsBase then
		return VALUE_FAIL
	end
	local mycorps = s_getCorpsId(uid)
	if mycorps == 0 then
		return VALUE_FAIL
	end
	local sid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
	local corps = s_getSceneVar(sid,0,1)
	if corps == 0 then
		return VALUE_FAIL
	end
	local plantnpc = s_getSceneVar(sid, 2, index)
	if plantnpc == 0 or plantnpc == nil then
		s_sysInfo(uid,"请选中植物",ChatPos_Sys + ChatPos_Important)
		return
	end
	local owner = GetPlantInfo(corps,index,PlantInfo_Owner)
	local ptype,pi = self:IndexToType(index)
	if ptype == PlantType_User then
		if mycorps == corps and uid ~= owner then
			s_sysInfo(uid,"此花儿你不可设置",ChatPos_Sys + ChatPos_Important)
			return VALUE_FAIL
		end
	end
	SetPlantInfo(corps,index,PlantInfo_AllowWater,allow)
end
--采摘/偷窃
function CopySceneInfo_1:ToHarvestPlant(uid, index)
	if index == 0 then
		return VALUE_FAIL
	end
	if s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE) ~= CopySceneType_CorpsBase then
		return VALUE_FAIL
	end
	local mycorps = s_getCorpsId(uid)
	if mycorps == 0 then
		return VALUE_FAIL
	end
	local sid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
	local corps = s_getSceneVar(sid,0,1)
	if corps == 0 then
		return VALUE_FAIL
	end
	local plantnpc = s_getSceneVar(sid, 2, index)
	if plantnpc == 0 or plantnpc == nil then
		s_sysInfo(uid,"请选中植物",ChatPos_Sys + ChatPos_Important)
		return
	end
	local traffic = s_getTrafficType(uid)
	if traffic ~= TrafficType_None then
		s_resetTrafficType(uid)
	end
	local seed = GetPlantInfo(corps,index,PlantInfo_Seed)
	if seed == 0 then
		s_sysInfo(uid,"花儿好像已经不在了",ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end
	local baseVal = self.plantBase[seed]
	if baseVal == nil then
		s_debug("采摘数据配置有误:" .. seed)
		return VALUE_FAIL
	end
	if baseVal.ilk == 4 then  -- 刺手
		s_sysInfo(uid,"刺手不可采摘",ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end
	local step = GetPlantInfo(corps,index,PlantInfo_Step)
	if step ~= PlantStep_Ripe then
		s_sysInfo(uid,"还未成熟，不可采摘",ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end
	local owner = GetPlantInfo(corps,index,PlantInfo_Owner)
	local ptype,pi = self:IndexToType(index)
	if ptype == PlantType_User then
		if mycorps == corps and uid ~= owner then
			s_sysInfo(uid,"此花儿你不可采",ChatPos_Sys + ChatPos_Important)
			return VALUE_FAIL
		end
		local friends = s_getCorpsField(corps,CorpVar_Friend)
		if friends == mycorps then
			s_sysInfo(uid,"朋友的花你也敢采",ChatPos_Sys + ChatPos_Important)
			return VALUE_FAIL
		end
	end
	local x = s_getValue(SCENE_ENTRY_NPC,plantnpc,VALUE_TYPE_POSX)
	local y = s_getValue(SCENE_ENTRY_NPC,plantnpc,VALUE_TYPE_POSY)
	local myx = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSX)
	local myy = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSY)
	if math.abs(x-myx) > self.maxDistance or math.abs(y-myy) > self.maxDistance then
		s_sysInfo(uid,"请靠近一点",ChatPos_Sys + ChatPos_Important)
		return VALUE_FAIL
	end

	if uid ~= owner then
		if GetStealVar(corps,index,uid) ~= nil then
			s_sysInfo(uid,"只能偷摘一次哦",ChatPos_Sys + ChatPos_Important)
			return VALUE_FAIL
		end
	end

	local callback = "CopySceneInfo_1:DoHarvestPlant(" .. uid .. "," .. sid .. "," .. plantnpc .. ")"
	s_showbar(uid,10000,callback,UninterruptActionType_TASK,1)
	return VALUE_OK
end

--采摘/偷窃
function CopySceneInfo_1:DoHarvestPlant(uid,sid,plantnpc)
	local index = s_getValue(SCENE_ENTRY_NPC,plantnpc,VALUE_TYPE_POT_INDEX)
	if index == 0 then
		return
	end
	local corps = s_getSceneVar(sid,0,1)
	if corps == 0 then
		return
	end
	local seed = GetPlantInfo(corps,index,PlantInfo_Seed)
	if seed == 0 then
		s_sysInfo(uid,"花儿好像已经不在了",ChatPos_Sys + ChatPos_Important)
		return
	end
	local baseVal = self.plantBase[seed]
	if baseVal == nil then
		s_debug("种植数据配置有误:" .. seed)
		return
	end
	if baseVal.ilk == 1 and s_getVar(uid,1,44) < 3600 then  --银币花
		s_messageBox(uid,"今日累计在线1小时后才可收获银币花")
		return
	end
	if s_getVigorPoint(uid) < baseVal.activity then
		s_messageBox(uid, "活力点达到" .. baseVal.activity .. "才能收获该植物")
		return
	end
	local step = GetPlantInfo(corps,index,PlantInfo_Step)
	if step ~= PlantStep_Ripe then
		return
	end
	local owner = GetPlantInfo(corps,index,PlantInfo_Owner)
	local output = GetPlantInfo(corps,index,PlantInfo_OutPut)
	local remain = GetPlantInfo(corps,index,PlantInfo_Remain)
	local addoutput = baseVal.output[2] - baseVal.output[1]
	local lrate = remain / output
	if owner == uid then -- 自己采摘
		local wlist = GetWaterList(corps, index)
		local health = GetPlantInfo(corps, index, PlantInfo_Health)
		local hadd = GetWaterVar(corps, index, uid)
		if hadd == nil then hadd = 0 end
		local icanget = math.floor((baseVal.output[1] + addoutput * (((health-hadd)/2+hadd)/100.0)) * lrate)
		if baseVal.ilk == 7 then
			-- 资金花产出不分配
			icanget = remain
		end
		if self:GetPlantHarvest(uid,baseVal,icanget) == VALUE_OK then
			s_debug("植物收获成功:%u,%u,%u,%u", uid, seed, remain, icanget)
			-- 资金花附加产出
			if baseVal.ilk == 7 then
				s_addField(uid,UserVar_Donate,self.addticket[baseVal.level])
				local mycorps = s_getCorpsId(uid)
				if mycorps > 0 then
					s_addCorpsField(mycorps, CorpVar_Money, self.addticket[baseVal.level])
				end
			else
				for i = 1, #wlist, 2 do
					if wlist[i] ~= owner then
						icanget = math.ceil(wlist[i+1]/200.0 * addoutput * lrate)
						if icanget > 0 then
							self:GetPlantHarvest(wlist[i],baseVal,icanget)
						end
					end
				end
			end
			remain = 0
		end
	else  -- 被偷
		if baseVal.ilk == 1 then
			s_messageBox(uid,"银币花不能被偷")
			return
	end
	local getnum = math.floor(math.random(20, 40)/100.0 * baseVal.output[1])
	local maxget = 0
	if remain > baseVal.output[1] * 0.75 then
		maxget = remain - baseVal.output[1] * 0.75
	end
	if getnum > maxget then
		getnum = maxget
	end
	if getnum <= 0 then
		s_sysInfo(uid, "此花不能再被偷摘了", ChatPos_Sys + ChatPos_Important)
		return
	end
	if self:GetPlantHarvest(uid,baseVal,getnum) == VALUE_OK then
		if remain > getnum then
			remain = remain - getnum
		else
			remain = 0
		end
		s_debug("植物偷取成功:" .. uid .. "," .. owner .. "," .. seed .. "," .. getnum)
	end
	SetStealVar(corps,index,uid,getnum)
	end
	SetPlantInfo(corps,index,PlantInfo_Remain,remain)
	if remain <= 0 then
		local curtime = s_getCurTime(TIME_ALLSECONDS)
		SetPlantInfo(corps,index,PlantInfo_EndTime,curtime)
		self:OnePlantGrowth(corps,index,sid,1)
	end
end

function CopySceneInfo_1:GetPlantHarvest(uid,baseVal,num)
	if num == 0 then
		s_sysInfo(uid,"什么都没有收获",ChatPos_Sys + ChatPos_Important)
		return VALUE_OK
	end
	if baseVal.ilk == 1 then  --银币花
		s_addMoneyMe(uid,MoneyType_Money,num,"银币花产出")
		return VALUE_OK
	end

	if baseVal.ilk == 2 then  --四叶草
		local str = Item_Attribute_EnergyValue .. "-" .. num
		s_addItem(uid,29030,0,1,0,str,"团种植收获")
		return VALUE_OK
	end

	if baseVal.ilk == 3 then  --蘑菇
		s_refreshExp(uid,num,ExpType_Corps,0)
		return VALUE_OK
	end

	if baseVal.ilk == 5 then  --玫瑰花
		s_addItem(uid,29031,0,num,0,"1-1","团种植收获")
		return VALUE_OK
	end

	if baseVal.ilk == 6 then  --喇叭花
		s_addItem(uid,29032,0,num,0,"1-1","团种植收获")
		return VALUE_OK
	end

	if baseVal.ilk == 7 then	-- 资金花
		s_addMoney(uid,MoneyType_MoneyTicket, num,"资金花收获")
		return VALUE_OK
	end

	if baseVal.ilk == 8 then	-- 药材花
		--local str = Item_Attribute_Level .. "-" .. baseVal.olevel
		s_addItem(uid,55242,0,num,0,"1-1","普通的圣诞树种子收获")
		return VALUE_OK
	end

	if baseVal.ilk == 9 then	-- 矿石花
		--local str = Item_Attribute_Level .. "-" .. baseVal.olevel
		s_addItem(uid,55242,0,num,0,"1-1","华丽的圣诞树种子收获")
		return VALUE_OK
	end

	--[[if baseVal.ilk == 11 then	-- 鉴定石花
	if baseVal.level == 1 then
	s_addItem(uid,27101,0,num,0,"1-1","团种植收获")
	elseif baseVal.level == 3 then
	s_addItem(uid,27102,0,num,0,"1-1","团种植收获")
	elseif baseVal.level == 6 then
	s_addItem(uid,27102,0,num,0,"1-1","团种植收获")
	elseif baseVal.level == 8 then
	s_addItem(uid,27103,0,num,0,"1-1","团种植收获")
	elseif baseVal.level == 10 then
	s_addItem(uid,27103,0,num,0,"1-1","团种植收获")
	else
	s_debug("团等级错误，无法得到奖励:" .. baseVal.level)
	end
	return VALUE_OK
	end]]--

	if baseVal.ilk == 10 then   -- 鉴定石花
		s_addItem(uid,43002,0,num,0,"1-1","团种植收获")
		return VALUE_OK
	end
end

--退团移除花
function CopySceneInfo_1:RemoveCorpsUser(corps,sid,uid)
	for t=1,2 do
		for i=1,#self.plantPos[t] do
			local index = (t-1)*100 + i
			local owner = GetPlantInfo(corps,index,PlantInfo_Owner)
			if owner == uid then
				self:DoResetPlant(sid,corps,index,0,PlantStep_Die)
			end
		end  -- for i
	end
end

function CopySceneInfo_1:ShowPlantGrowth(uid)
	local sid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
	local corps = s_getSceneVar(sid,0,1)
	if corps == 0 then return end
	local etype,eid = s_getSelect(uid)
	if etype ~= SCENE_ENTRY_NPC then
		s_sysInfo(uid,"请选中植物",ChatPos_Sys + ChatPos_Important)
		return
	end
	local index = s_getValue(etype,eid,VALUE_TYPE_POT_INDEX)
	if index == 0 then
		s_sysInfo(uid,"请选中植物",ChatPos_Sys + ChatPos_Important)
		return
	end
	local wlist = GetWaterList(corps, index)
	local slist = GetStealList(corps, index)
	local msg = "body(成长过程... newline()"
	for i = 1, #wlist, 2 do
		msg = msg .. "浇水:" .. wlist[i] .. "--:" .. wlist[i+1] .. " newline()"
	end
	for i = 1, #slist, 2 do
		msg = msg .. "偷摘:" .. slist[i] .. "--:" .. slist[i+1] .. " newline()"
	end
	msg = msg .. ")"

	msg = parseToDesc(msg)
	ShowNpcMenuBottomStyle(uid,msg,"确定(3)")
end

-- 刷新植物NPC营养
function CopySceneInfo_1:SetPlantHealth(sid, index, health)
	if sid == nil or sid == 0 then
		return
	end
	local plantnpc = s_getSceneVar(sid,2,index)
	if plantnpc > 0 then
		s_setValue(SCENE_ENTRY_NPC,plantnpc, VALUE_TYPE_PLANT_HEALTH, health)
	end
end

-- 刷新植物NPC冷却
function CopySceneInfo_1:SetPlantWaterCold(sid, index, cold)
	if sid == nil or sid == 0 then
		return
	end
	local plantnpc = s_getSceneVar(sid,2,index)
	if plantnpc > 0 then
		s_setValue(SCENE_ENTRY_NPC,plantnpc,VALUE_TYPE_PLANT_COLD,cold)
	end
end

-- 发送植物信息
function CopySceneInfo_1:SendPlantInfo(uid,npcid)
	local stype = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_TYPE)
	local sid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
	if stype ~= CopySceneType_CorpsBase or sid == 0 then
		return
	end
	local corps = s_getSceneVar(sid,0,1)
	if corps == 0 then
		return
	end
	local index = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POT_INDEX)
	if index == 0 then
		return
	end
	local seed = GetPlantInfo(corps, index, PlantInfo_Seed)
	local baseVal = self.plantBase[seed]
	if baseVal == nil then
		return
	end
	local vlist = {}
	table.insert(vlist, 0)	-- 植物信息
	table.insert(vlist, 0)	-- 成长浇水
	table.insert(vlist, 0)	-- 成长偷取
	table.insert(vlist, 0)	-- 产出分配 将获得
	table.insert(vlist, 0)	-- 产出分配 已获得

	table.insert(vlist, GetPlantInfo(corps,index,PlantInfo_AllowWater))
	table.insert(vlist, index)
	table.insert(vlist, seed)
	table.insert(vlist, baseVal.ilk)
	table.insert(vlist, baseVal.output[1])
	local owner = GetPlantInfo(corps,index,PlantInfo_Owner)
	table.insert(vlist, owner)
	local waters = GetPlantInfo(corps, index, PlantInfo_Water)
	table.insert(vlist, waters)
	local maxw = 4
	if baseVal.ilk == 7 then
		maxw = 1
	end
	local coldtime = 0
	local lasttime = GetPlantInfo(corps,index,PlantInfo_LastWater)
	local curtime = s_getCurTime(TIME_ALLSECONDS)
	if curtime >= lasttime and curtime - lasttime <= self.waterCold then
		coldtime = lasttime + self.waterCold - curtime
	end
	local step = GetPlantInfo(corps,index,PlantInfo_Step)
	local endtime = GetPlantInfo(corps,index,PlantInfo_EndTime)
	local curtime = s_getCurTime(TIME_ALLSECONDS)
	local ripetime = 0
	if endtime > curtime then
		ripetime = endtime - curtime
	end
	table.insert(vlist, coldtime)
	local output = GetPlantInfo(corps, index, PlantInfo_OutPut)
	table.insert(vlist, output)
	local remain = GetPlantInfo(corps, index, PlantInfo_Remain)
	table.insert(vlist, remain)
	local addhealth = GetPlantInfo(corps, index, PlantInfo_Health)
	table.insert(vlist, addhealth)
	table.insert(vlist, ripetime)
	table.insert(vlist, maxw)
	local addoutput = baseVal.output[2] - baseVal.output[1]
	local lrate = remain / output
	local madd = GetWaterVar(corps, index, owner)
	if madd == nil then madd = 0 end
	local ownerget = math.floor((baseVal.output[1] + addoutput * (((addhealth-madd)/2+madd)/100.0)) * lrate)
	local curget = 0
	if uid == owner then
		curget = ownerget
	else
		madd = GetWaterVar(corps, index, uid)
		if madd == nil then madd = 0 end
		curget = math.ceil(madd/200.0 * addoutput * lrate)
	end
	-- 资金花用户只主人有产出团资金
	local getticket = 0
	if baseVal.ilk == 7 then
		curget = 0
		getticket = self.addticket[baseVal.level]
		if uid == owner then
			curget = remain
		end
	end
	local permod = (baseVal.output[2]-baseVal.output[1])/baseVal.output[1]
	table.insert(vlist, curget)
	table.insert(vlist, 100 + math.floor(permod * addhealth))
	table.insert(vlist, step)
	table.insert(vlist, getticket)
	vlist[1] = #vlist - 5

	local wlist = GetWaterList(corps, index)
	local slist = GetStealList(corps, index)
	vlist[2] = #wlist
	vlist[3] = #slist
	vlist[4] = #wlist
	vlist[5] = #slist

	for i = 1, #wlist, 2 do
		table.insert(vlist, wlist[i])
		table.insert(vlist, math.floor(wlist[i+1]*permod))
	end

	for i = 1, #slist, 2 do
		table.insert(vlist, slist[i])
		table.insert(vlist, math.ceil(slist[i+1]/output))
	end

	if baseVal.ilk == 7 then
		vlist[4] = 2
		table.insert(vlist, owner)
		table.insert(vlist, remain)
	else
		for i = 1, #wlist, 2 do
			local myget = 0
			if wlist[i] == owner then
				myget = ownerget
			else
				myget = math.ceil(wlist[i+1]/200.0 * addoutput * lrate)
			end
			table.insert(vlist, wlist[i])
			table.insert(vlist, myget)
		end
	end

	for i = 1, #slist, 2 do
		table.insert(vlist, slist[i])
		table.insert(vlist, slist[i+1])
	end
	s_sendCopyList(3,0,uid, #vlist, 1, vlist)
end

-- 请求植物提示
function CopySceneInfo_1:ReqCorpsPlantTip(corps, uid, intobase)
	local plist = {}
	local nums = 0
	local sid = CopySceneCheck(uid,CopySceneType_CorpsBase,corps)
	if sid == VALUE_FAIL then
		sid = 0
	end
	local wtip = VALUE_FAIL
	local curtime = s_getCurTime(TIME_ALLSECONDS)
	for t=1,2 do
		for i=1,#self.plantPos[t] do
			local index = (t-1)*100 + i
			local owner = GetPlantInfo(corps,index,PlantInfo_Owner)
			if uid == owner and  self:GetCorpsPlantTip(sid,corps,index,plist) == VALUE_OK then
				nums = nums + 1
			end
			if intobase == 1 and wtip == VALUE_FAIL then
				local seed = GetPlantInfo(corps,index,PlantInfo_Seed)
				local baseVal = self.plantBase[seed]
				if baseVal ~= nil then
					local lasttime = GetPlantInfo(corps,index,PlantInfo_LastWater)
					local maxw = 4
					if baseVal.ilk == 7 then
						maxw = 1
					end
					local wtimes = GetPlantInfo(corps,index,PlantInfo_Water)
					if wtimes < maxw and  curtime > lasttime and curtime - lasttime >= self.waterCold then
						local allow = GetPlantInfo(corps,index,PlantInfo_AllowWater)
						if allow == 0 then
							wtip = VALUE_OK
						end
					end
				end
			end
		end
	end
	if wtip == VALUE_OK and intobase == 1 then
		s_sysInfo(uid, "本团团员的作物需要浇水了",ChatPos_Sys + ChatPos_Important)
	end
	if nums > 0 then
		s_setPlantTips(uid, nums, 0, plist)
	end
end

function CopySceneInfo_1:OnClientReqTip(corps, uid, index)
	local seed = GetPlantInfo(corps,index,PlantInfo_Seed)
	local baseVal = self.plantBase[seed]
	if baseVal == nil then
		return
	end
	local owner = GetPlantInfo(corps,index,PlantInfo_Owner)
	if owner ~= uid then
		return
	end
	local sid = CopySceneCheck(uid,CopySceneType_CorpsBase,corps)
	self:FreshPlantTip(corps, index, sid)
end

--刷新植物提示
function CopySceneInfo_1:FreshPlantTip(corps, index, sid)
	if index == nil or index == 0 then return end
	local owner = GetPlantInfo(corps,index,PlantInfo_Owner)
	if owner == nil or owner == 0 then
		return
	end
	if sid == nil then
		sid = 0
	end
	local plist = {}
	if self:GetCorpsPlantTip(sid,corps,index,plist) == VALUE_OK then
		s_setPlantTips(owner, 1, 1,plist)
	end
end

-- 取得的植物提示
function CopySceneInfo_1:GetCorpsPlantTip(sid,corps, index, vlist)
	if index == nil or index == 0 then return end
	local seed = GetPlantInfo(corps,index,PlantInfo_Seed)
	local baseVal = self.plantBase[seed]
	if baseVal == nil then
		return VALUE_FAIL
	end
	table.insert(vlist, index)
	table.insert(vlist, GetPlantInfo(corps, index, PlantInfo_Step))
	table.insert(vlist, GetPlantInfo(corps, index, PlantInfo_Water))
	local maxw = 4
	if baseVal.ilk == 7 then
		maxw = 1
	end
	table.insert(vlist, maxw)
	table.insert(vlist, seed)
	local curtime = s_getCurTime(TIME_ALLSECONDS)
	local endtime = GetPlantInfo(corps,index,PlantInfo_EndTime)
	local lasttime = GetPlantInfo(corps,index,PlantInfo_LastWater)
	table.insert(vlist, endtime - curtime)
	table.insert(vlist, baseVal.life * 3600)
	local coldtime = 0
	if curtime >= lasttime and curtime - lasttime <= self.waterCold then
		coldtime = lasttime + self.waterCold - curtime
	end
	table.insert(vlist, coldtime)
	local addhealth = GetPlantInfo(corps, index, PlantInfo_Health)
	table.insert(vlist, 100 + math.floor((baseVal.output[2]-baseVal.output[1])/baseVal.output[1] * addhealth))
	if sid == 0 then
		table.insert(vlist,0)
		table.insert(vlist,0)
	else
		local plantnpc = s_getSceneVar(sid,2,index)
		if plantnpc > 0 then
			local x = s_getValue(SCENE_ENTRY_NPC,plantnpc,VALUE_TYPE_POSX)
			local y = s_getValue(SCENE_ENTRY_NPC,plantnpc,VALUE_TYPE_POSY)
			table.insert(vlist,x)
			table.insert(vlist,y)
		end
	end
	table.insert(vlist, GetPlantInfo(corps,index,PlantInfo_AllowWater))
	return VALUE_OK
end

--注册函数
local clickfun = [[
	function OnClickNpc_$1(uid,npcid)
		CopySceneInfo_1:SendPlantInfo(uid,npcid)
	end
]]

for i = 45202, 45234 do
	RegistetFunction(FormatString(clickfun,i))
end

for i = 45252, 45284 do
	RegistetFunction(FormatString(clickfun,i))
end

-- 空花盆提示
function OnClickNpc_45201(uid, npcid)
	local curcountry = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_CURRENT_COUNTRY)
	local homeland = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND)
	if curcountry ~= homeland then
		s_sysInfo(uid, "不可访问他国NPC");
		return
	end
	s_sysInfo(uid, "在后勤保障官处购买种子后可种植于花盆中")
end
function OnClickNpc_45251(uid, npcid)
	local curcountry = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_CURRENT_COUNTRY)
	local homeland = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND)
	if curcountry ~= homeland then
		s_sysInfo(uid, "不可访问他国NPC");
		return
	end
	s_sysInfo(uid, "在后勤保障官处购买种子后可种植于花盆中")
end
--BOSS喂养宝箱数
function BOSSchestevent(growth)
	local num = 0
	if growth >= 16 and growth < 56 then
		num = 1
	elseif growth >= 56 and growth < 76 then
		num = 2
	elseif growth >= 76 and growth < 96 then
		num = 3
	elseif growth >= 96 and growth < 111 then
		num = 5
	elseif growth >= 111 then
		num = 7
	end
	return num
end
--------------------------------------------------------------------------------------
--宠物乐园 begin

--初始
function CopySceneInfo_1:InitDemonPark(sid,corps)
	for i=1,self.maxDemonNum do
		local owner = GetDemonParkInfo(corps,i,CorpsDemon_Owner)
		local ownerlevel = GetDemonParkInfo(corps,i,CorpsDemon_OwnerLevel)
		local endflag = GetDemonParkInfo(corps,i,CorpsDemon_End)
		if owner ~= 0 and owner ~= nil then
			local cursec = s_getCurTime(TIME_ALLSECONDS)
			local endsec = GetDemonParkInfo(corps,i,CorpsDemon_EndTime)
			local beginsec = GetDemonParkInfo(corps,i,CorpsDemon_BeginTime)
			local playtype = GetDemonParkInfo(corps,i,CorpsDemon_PlayType)
			local baseid = GetDemonParkInfo(corps,i,CorpsDemon_Baseid)
			local rate = {1,1.5,2,3,4,5}
			if ownerlevel ~= 0 and ownerlevel ~= nil and playtype ~= 0 and playtype ~= nil then
				if endsec <= cursec then
					SetDemonParkInfo(corps,i,CorpsDemon_End,1)
					local exp = math.floor(350*(50+0.1*ownerlevel^2.2)*rate[playtype]*((endsec-beginsec)/3600))
					SetDemonParkInfo(corps,i,CorpsDemon_TotalExp,exp)
				else
					local exp = math.floor(350*(50+0.1*ownerlevel^2.2)*rate[playtype]*((cursec-beginsec)/3600))
					SetDemonParkInfo(corps,i,CorpsDemon_TotalExp,exp)
					local npcid = s_sysSummon(60999,sid,127,139,1050)
					if npcid == 0 then
						s_debug("宠物乐园召唤时失败" .. corps .. "," .. baseid)
						return 0
					end
					s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER,owner)
					s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_DEMON_PARK_RAND_TIME,cursec)
					s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_DEMON_PARK_BASEID,baseid)
					s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_DEMON_PARK_INDEX,i)
					SetDemonParkInfo(corps,i,CorpsDemon_NpcID,npcid)
				end
			end
		end
	end
end

function CopySceneInfo_1:DemonPlay(corps,sid)
	for index=1,self.maxDemonNum do
		self:OneDemonPlay(corps,index,sid)
	end
end

function CopySceneInfo_1:OneDemonPlay(corps,index,sid)
	local owner = GetDemonParkInfo(corps,index,CorpsDemon_Owner)
	local endflag = GetDemonParkInfo(corps,index,CorpsDemon_End)
	if owner == 0 or owner == nil then return end
	if endflag == 1 then return end
	if endflag == 2 then
		SetDemonParkInfo(corps,index,CorpsDemon_Owner,0)
		SetDemonParkInfo(corps,index,CorpsDemon_OwnerLevel,0)
		SetDemonParkInfo(corps,index,CorpsDemon_BeginTime,0)
		SetDemonParkInfo(corps,index,CorpsDemon_EndTime,0)
		SetDemonParkInfo(corps,index,CorpsDemon_TotalExp,0)
		SetDemonParkInfo(corps,index,CorpsDemon_ExtExp,0)
		SetDemonParkInfo(corps,index,CorpsDemon_PresentOne,0)
		SetDemonParkInfo(corps,index,CorpsDemon_PresentTwo,0)
		SetDemonParkInfo(corps,index,CorpsDemon_PresentThree,0)
		SetDemonParkInfo(corps,index,CorpsDemon_PlayType,0)
		SetDemonParkInfo(corps,index,CorpsDemon_End,0)
		SetDemonParkInfo(corps,index,CorpsDemon_ID,0)
		SetDemonParkInfo(corps,index,CorpsDemon_PresentOneNum,0)
		SetDemonParkInfo(corps,index,CorpsDemon_PresentTwoNum,0)
		SetDemonParkInfo(corps,index,CorpsDemon_PresentThreeNum,0)
		return
	end
	local cursec = s_getCurTime(TIME_ALLSECONDS)
	local beginsec = GetDemonParkInfo(corps,index,CorpsDemon_BeginTime)
	local endsec = GetDemonParkInfo(corps,index,CorpsDemon_EndTime)
	local ownerlevel = GetDemonParkInfo(corps,index,CorpsDemon_OwnerLevel)
	local playtype = GetDemonParkInfo(corps,index,CorpsDemon_PlayType)
	local rate = {1,1.5,2,3,4,5}
	if endsec <= cursec then
		if GetDemonParkInfo(corps,index,CorpsDemon_End) ~= 0 then
			s_sysInfo(owner,"您在游乐园的宠物，已经可以领回了！")
			return
		end
		SetDemonParkInfo(corps,index,CorpsDemon_End,1)
		local exp = math.floor(350*(50+0.1*ownerlevel^2.2)*rate[playtype]*((endsec-beginsec)/3600))
		SetDemonParkInfo(corps,index,CorpsDemon_TotalExp,exp)
		local npcid = GetDemonParkInfo(corps,index,CorpsDemon_NpcID)
		s_clearNpc(npcid)
	else
		local exp = math.floor(350*(50+0.1*ownerlevel^2.2)*rate[playtype]*((cursec-beginsec)/3600))
		SetDemonParkInfo(corps,index,CorpsDemon_TotalExp,exp)
		local npcid = GetDemonParkInfo(corps,index,CorpsDemon_NpcID)
		if npcid == 0 then return end
		local randtime = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_DEMON_PARK_RAND_TIME)
		if cursec >= randtime+15*60 then
			if s_getbufflevel(SCENE_ENTRY_NPC,npcid,20270) >0 then
				s_goto(SCENE_ENTRY_NPC,npcid,127,139)
				s_refreshAdditionData(npcid)
			end
			s_removebuff(SCENE_ENTRY_NPC,npcid,20267)
			s_removebuff(SCENE_ENTRY_NPC,npcid,20268)
			s_removebuff(SCENE_ENTRY_NPC,npcid,20269)
			s_removebuff(SCENE_ENTRY_NPC,npcid,20270)

			local rand = math.random(1,100)
			if rand <= 20 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,20267,1,15*60)
			elseif rand <= 40 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,20268,1,15*60)
			elseif rand <= 60 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,20269,1,15*60)
			elseif rand <= 70 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,20270,1,15*60)
				s_goto(SCENE_ENTRY_NPC,npcid,128,168)
				s_refreshAdditionData(npcid)
			elseif rand <= 80 then
				s_sysSummon(60993,sid,127,139)
			end
			s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_DEMON_PARK_RAND_TIME,cursec)
		end
	end
end

function CopySceneInfo_1:DemonParkRegister(uid,demonid,hour,playtype,baseid)
	local corps = s_getCorpsId(uid)
	if corps == 0 then return end
	local cursec = s_getCurTime(TIME_ALLSECONDS)
	local uindex = 0
	for index=1,self.maxDemonNum do
		if GetDemonParkInfo(corps,index,CorpsDemon_Owner) == 0 then
			SetDemonParkInfo(corps,index,CorpsDemon_Owner,uid)
			local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
			SetDemonParkInfo(corps,index,CorpsDemon_OwnerLevel,level)
			SetDemonParkInfo(corps,index,CorpsDemon_BeginTime,cursec)
			SetDemonParkInfo(corps,index,CorpsDemon_EndTime,cursec+hour*3600)
			SetDemonParkInfo(corps,index,CorpsDemon_TotalExp,0)
			SetDemonParkInfo(corps,index,CorpsDemon_ExtExp,0)
			SetDemonParkInfo(corps,index,CorpsDemon_PresentOne,0)
			SetDemonParkInfo(corps,index,CorpsDemon_PresentTwo,0)
			SetDemonParkInfo(corps,index,CorpsDemon_PresentThree,0)
			SetDemonParkInfo(corps,index,CorpsDemon_PlayType,playtype)
			SetDemonParkInfo(corps,index,CorpsDemon_End,0)
			SetDemonParkInfo(corps,index,CorpsDemon_ID,demonid)
			SetDemonParkInfo(corps,index,CorpsDemon_PresentOne,0)
			SetDemonParkInfo(corps,index,CorpsDemon_PresentTwo,0)
			SetDemonParkInfo(corps,index,CorpsDemon_PresentThree,0)
			SetDemonParkInfo(corps,index,CorpsDemon_Baseid,baseid)
			uindex = index
			break
		end
	end
	if uindex ~= 0 then
		for i=1,3 do
			if s_getVar(uid,119,i) == 0 then
				s_addVar(uid,119,i,uindex)
				break
			end
		end
		s_addVar(uid,120,1,s_getVar(uid,120,1)+1)
		local sid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
		local npcid = s_sysSummon(60999,sid,127,139,1050)
		if npcid == 0 then
			s_debug("宠物乐园召唤时失败" .. corps)
			return
		end
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER,uid)
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_DEMON_PARK_RAND_TIME,cursec)
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_DEMON_PARK_BASEID,baseid)
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_DEMON_PARK_INDEX,uindex)
		SetDemonParkInfo(corps,uindex,CorpsDemon_NpcID,npcid)
	end
end

NpcMenuInfo60999 = {
	talk="",
	button = {
		{"喂它吃点东西吧(2)","NpcMenuInfo60999:DealMenu($1)","NpcMenuInfo60999:ShowMenu($1)"},
		{"爱抚这只宠物(2)","NpcMenuInfo60999:DealMenu1($1)","NpcMenuInfo60999:ShowMenu1($1)"},
		{"猜猜这是什么(2)","NpcMenuInfo60999:DealMenu2($1)","NpcMenuInfo60999:ShowMenu2($1)"},
		{"把它送回宠物乐园(2)","NpcMenuInfo60999:DealMenu3($1)","NpcMenuInfo60999:ShowMenu3($1)"}
	},
}

function OnClickNpc_60999(uid,npcid)
	local str=""
	if s_getbufflevel(SCENE_ENTRY_NPC,npcid,20267) > 0 then
		str=str.."这个小家伙垂头丧气的，似乎是饿了吧，看看弄点什么好吃的给它......（酌情挑选喂的食物，越美味的食物，获得的奖励越多）"
	elseif s_getbufflevel(SCENE_ENTRY_NPC,npcid,20268) > 0 then
		str=str.."这个小家伙朝你撒娇呢，快爱抚下它吧！（请选择要摸的位置，摸错了可是会惹怒这个小家伙的哦）"
	elseif s_getbufflevel(SCENE_ENTRY_NPC,npcid,20269) > 0 then
		str=str.."这个小家伙似乎在游乐场里发现了什么东西，含在嘴里......（请选择那是什么，会美梦成真的哟）"
	elseif s_getbufflevel(SCENE_ENTRY_NPC,npcid,20270) > 0 then
		str=str.."这个小家伙好像迷路了，在团基地里乱逛......"
	else
		str=str.."在乐园中快乐玩耍的宠物，一定有个很照顾它的主人吧？（注意它的状态，可能会有些奇妙的事发生吧！）"
	end
	s_addVar(uid,120,2,npcid)
	NpcMenuInfo60999.talk = FormatString(str)
	ShowNpcMenuByTable(uid,NpcMenuInfo60999)
end

function NpcMenuInfo60999:DealMenu(uid)
	local info = {
		talk = "",
		button = {
			{"土豆泥-50银(2)","NpcMenuInfo60999:DealMenu0_1($1)"},
			{"奶酪三明治-100银(2)","NpcMenuInfo60999:DealMenu0_2($1)"},
			{"超级无敌五层汉堡-300银(2)","NpcMenuInfo60999:DealMenu0_3($1)"},
		},
	}
	ShowNpcMenuByTable(uid,info)
end

function NpcMenuInfo60999:ShowMenu(uid)
	local npcid = s_getVar(uid,120,2)
	if s_getbufflevel(SCENE_ENTRY_NPC,npcid,20267) == 0 then
		return VALUE_FAIL
	end
	local corps = s_getCorpsId(uid)
	if corps == 0 then
		return VALUE_FAIL
	end
	if CopySceneCheck(uid,CopySceneType_CorpsBase,corps) == VALUE_FAIL then
		return VALUE_FAIL
	end
	return VALUE_OK
end

function NpcMenuInfo60999:DealMenu0_1(uid)
	local npcid = s_getVar(uid,120,2)
	if s_getbufflevel(SCENE_ENTRY_NPC,npcid,20267) == 0 then
		s_sysInfo(uid,"每次只能喂一次")
		return
	end
	local callback = "NpcMenuInfo60999:DealMenu0_1_1("..uid..")"
	s_showbar(uid,3000,callback,0,4)
end

function NpcMenuInfo60999:DealMenu0_1_1(uid)
	local npcid = s_getVar(uid,120,2)
	if s_getbufflevel(SCENE_ENTRY_NPC,npcid,20267) == 0 then
		s_sysInfo(uid,"每次只能喂一次")
		return
	end
	local corps = s_getCorpsId(uid)
	if corps == 0 then return end
	if s_removeMoney(uid,MoneyType_Money,50,"土豆泥") ~= VALUE_OK then
		s_sysInfo(uid, "银币不足，不可购买食物喂养宠物");
		return VALUE_FAIL
	end
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local exp = math.floor(20*(50+0.1*level^2.2))
	s_refreshExp(uid,exp,ExpType_Corps,0)
	local exp1 = math.floor(25*(50+0.1*level^2.2))
	local index = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_DEMON_PARK_INDEX)
	local extexp = GetDemonParkInfo(corps,index,CorpsDemon_ExtExp)
	SetDemonParkInfo(corps,index,CorpsDemon_ExtExp,extexp+exp1)
	local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
	local master = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER)
	local mastername = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_NAME)
	if mastername ~= nil then
		s_corpsInfo(corps,name.."喂食了"..mastername.."的宠物，获得经验奖励！",ChatPos_Sys)
	end
	s_addbuff(SCENE_ENTRY_NPC,npcid,20271,1,10)
	s_removebuff(SCENE_ENTRY_NPC,npcid,20267)
	return VALUE_OK
end

function NpcMenuInfo60999:DealMenu0_2(uid)
	local npcid = s_getVar(uid,120,2)
	if s_getbufflevel(SCENE_ENTRY_NPC,npcid,20267) == 0 then
		s_sysInfo(uid,"每次只能喂一次")
		return
	end
	local callback = "NpcMenuInfo60999:DealMenu0_2_1("..uid..")"
	s_showbar(uid,3000,callback,0,4)
end

function NpcMenuInfo60999:DealMenu0_2_1(uid)
	local npcid = s_getVar(uid,120,2)
	if s_getbufflevel(SCENE_ENTRY_NPC,npcid,20267) == 0 then
		s_sysInfo(uid,"每次只能喂一次")
		return
	end
	local corps = s_getCorpsId(uid)
	if corps == 0 then return end
	if s_removeMoney(uid,MoneyType_Money,100,"奶酪三明治") ~= VALUE_OK then
		s_sysInfo(uid, "银币不足，不可购买食物喂养宠物");
		return VALUE_FAIL
	end
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local exp = math.floor(35*(50+0.1*level^2.2))
	s_refreshExp(uid,exp,ExpType_Corps,0)
	local exp1 = math.floor(50*(50+0.1*level^2.2))
	local index = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_DEMON_PARK_INDEX)
	local extexp = GetDemonParkInfo(corps,index,CorpsDemon_ExtExp)
	SetDemonParkInfo(corps,index,CorpsDemon_ExtExp,extexp+exp1)
	local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
	local master = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER)
	local mastername = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_NAME)
	if mastername ~= nil then
		s_corpsInfo(corps,name.."喂食了"..mastername.."的宠物，获得经验奖励！",ChatPos_Sys)
	end
	s_addbuff(SCENE_ENTRY_NPC,npcid,20271,1,10)
	s_removebuff(SCENE_ENTRY_NPC,npcid,20267)
	return VALUE_OK
end

function NpcMenuInfo60999:DealMenu0_3(uid)
	local npcid = s_getVar(uid,120,2)
	if s_getbufflevel(SCENE_ENTRY_NPC,npcid,20267) == 0 then
		s_sysInfo(uid,"每次只能喂一次")
		return
	end
	local callback = "NpcMenuInfo60999:DealMenu0_3_1("..uid..")"
	s_showbar(uid,3000,callback,0,4)
end

function NpcMenuInfo60999:DealMenu0_3_1(uid)
	local npcid = s_getVar(uid,120,2)
	if s_getbufflevel(SCENE_ENTRY_NPC,npcid,20267) == 0 then
		s_sysInfo(uid,"每次只能喂一次")
		return
	end
	local corps = s_getCorpsId(uid)
	if corps == 0 then return end
	if s_removeMoney(uid,MoneyType_Money,300,"超级无敌五层汉堡") ~= VALUE_OK then
		s_sysInfo(uid, "银币不足，不可购买食物喂养宠物");
		return VALUE_FAIL
	end
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local exp = math.floor(80*(50+0.1*level^2.2))
	s_refreshExp(uid,exp,ExpType_Corps,0)
	local exp1 = math.floor(150*(50+0.1*level^2.2))
	local index = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_DEMON_PARK_INDEX)
	local extexp = GetDemonParkInfo(corps,index,CorpsDemon_ExtExp)
	SetDemonParkInfo(corps,index,CorpsDemon_ExtExp,extexp+exp1)
	local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
	local master = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER)
	local mastername = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_NAME)
	if mastername ~= nil then
		s_corpsInfo(corps,name.."喂食了"..mastername.."的宠物，获得经验奖励！",ChatPos_Sys)
	end
	s_addbuff(SCENE_ENTRY_NPC,npcid,20271,1,10)
	s_removebuff(SCENE_ENTRY_NPC,npcid,20267)
	return VALUE_OK
end

function NpcMenuInfo60999:DealMenu1(uid)
	local info = {
		talk="",
		button={
			{"摸摸尾巴（如果有的话）(2)","NpcMenuInfo60999:DealMenu1_1($1)"},
			{"摸摸耳朵(2)","NpcMenuInfo60999:DealMenu1_2($1)"},
			{"摸摸脑袋(2)","NpcMenuInfo60999:DealMenu1_3($1)"},
		},
	}
	ShowNpcMenuByTable(uid,info)
end

function NpcMenuInfo60999:DealMenu1_1(uid)
	local npcid = s_getVar(uid,120,2)
	if s_getbufflevel(SCENE_ENTRY_NPC,npcid,20268) == 0 then
		s_sysInfo(uid,"每次只能爱抚一次")
		return VALUE_FAIL
	end
	local callback = "NpcMenuInfo60999:DealMenu1_1_1("..uid..")"
	s_showbar(uid,10000,callback,0,4)
	return VALUE_OK
end

function NpcMenuInfo60999:DealMenu1_1_1(uid)
	local npcid = s_getVar(uid,120,2)
	if s_getbufflevel(SCENE_ENTRY_NPC,npcid,20268) == 0 then
		s_sysInfo(uid,"每次只能爱抚一次")
		return VALUE_FAIL
	end
	local corps = s_getCorpsId(uid)
	if corps == 0 then return end
	local rand = math.random(1,100)
	if rand <= 50 then
		local hp = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HP)
		local hprate = math.random(1,80)
		s_setValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HP,math.floor(hp*hprate*0.01))
		local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
		local master = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER)
		local mastername = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_NAME)
		if mastername == nil then
			mastername = ""
		end
		s_corpsInfo(corps,name.."惹怒了"..mastername.."的宠物，被它狠狠咬了一口！（很疼的啊T_T）")
	else
		local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
		local exp = math.floor(10*(50+0.1*level^2.2))
		s_refreshExp(uid,exp,ExpType_Corps,0)
		local exp1 = math.floor(5*(50+0.1*level^2.2))
		local index = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_DEMON_PARK_INDEX)
		local extexp = GetDemonParkInfo(corps,index,CorpsDemon_ExtExp)
		SetDemonParkInfo(corps,index,CorpsDemon_ExtExp,extexp+exp1)
		local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
		local master = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER)
		local mastername = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_NAME)
		if mastername ~= nil then
			s_corpsInfo(corps,name.."爱抚了"..mastername.."的宠物，获得经验奖励！",ChatPos_Sys)
		end
		s_addbuff(SCENE_ENTRY_NPC,npcid,20271,1,10)
		s_removebuff(SCENE_ENTRY_NPC,npcid,20268)
	end
end

function NpcMenuInfo60999:DealMenu1_2(uid)
	local npcid = s_getVar(uid,120,2)
	if s_getbufflevel(SCENE_ENTRY_NPC,npcid,20268) == 0 then
		s_sysInfo(uid,"每次只能爱抚一次")
		return VALUE_FAIL
	end
	local callback = "NpcMenuInfo60999:DealMenu1_2_1("..uid..")"
	s_showbar(uid,10000,callback,0,4)
	return VALUE_OK
end

function NpcMenuInfo60999:DealMenu1_2_1(uid)
	local npcid = s_getVar(uid,120,2)
	if s_getbufflevel(SCENE_ENTRY_NPC,npcid,20268) == 0 then
		s_sysInfo(uid,"每次只能爱抚一次")
		return VALUE_FAIL
	end
	local corps = s_getCorpsId(uid)
	if corps == 0 then return end
	local rand = math.random(1,100)
	if rand <= 50 then
		local hp = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HP)
		local hprate = math.random(1,80)
		s_setValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HP,math.floor(hp*hprate*0.01))
		local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
		local master = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER)
		local mastername = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_NAME)
		if mastername == nil then
			mastername = ""
		end
		s_corpsInfo(corps,name.."惹怒了"..mastername.."的宠物，被它狠狠咬了一口！（很疼的啊T_T）")
	else
		local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
		local exp = math.floor(10*(50+0.1*level^2.2))
		s_refreshExp(uid,exp,ExpType_Corps,0)
		local exp1 = math.floor(5*(50+0.1*level^2.2))
		local index = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_DEMON_PARK_INDEX)
		local extexp = GetDemonParkInfo(corps,index,CorpsDemon_ExtExp)
		SetDemonParkInfo(corps,index,CorpsDemon_ExtExp,extexp+exp1)
		local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
		local master = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER)
		local mastername = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_NAME)
		if mastername ~= nil then
			s_corpsInfo(corps,name.."爱抚了"..mastername.."的宠物，获得经验奖励！",ChatPos_Sys)
		end
		s_addbuff(SCENE_ENTRY_NPC,npcid,20271,1,10)
		s_removebuff(SCENE_ENTRY_NPC,npcid,20268)
	end
end

function NpcMenuInfo60999:DealMenu1_3(uid)
	local npcid = s_getVar(uid,120,2)
	if s_getbufflevel(SCENE_ENTRY_NPC,npcid,20268) == 0 then
		s_sysInfo(uid,"每次只能爱抚一次")
		return VALUE_FAIL
	end
	local callback = "NpcMenuInfo60999:DealMenu1_3_1("..uid..")"
	s_showbar(uid,10000,callback,0,4)
	return VALUE_OK
end

function NpcMenuInfo60999:DealMenu1_3_1(uid)
	local npcid = s_getVar(uid,120,2)
	if s_getbufflevel(SCENE_ENTRY_NPC,npcid,20268) == 0 then
		s_sysInfo(uid,"每次只能爱抚一次")
		return VALUE_FAIL
	end
	local corps = s_getCorpsId(uid)
	if corps == 0 then return end
	local rand = math.random(1,100)
	if rand <= 50 then
		local hp = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HP)
		local hprate = math.random(1,80)
		s_setValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HP,math.floor(hp*hprate*0.01))
		local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
		local master = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER)
		local mastername = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_NAME)
		if mastername == nil then
			mastername = ""
		end
		s_corpsInfo(corps,name.."惹怒了"..mastername.."的宠物，被它狠狠咬了一口！（很疼的啊T_T）")
	else
		local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
		local exp = math.floor(10*(50+0.1*level^2.2))
		s_refreshExp(uid,exp,ExpType_Corps,0)
		local exp1 = math.floor(5*(50+0.1*level^2.2))
		local index = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_DEMON_PARK_INDEX)
		local extexp = GetDemonParkInfo(corps,index,CorpsDemon_ExtExp)
		SetDemonParkInfo(corps,index,CorpsDemon_ExtExp,extexp+exp1)
		local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
		local master = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER)
		local mastername = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_NAME)
		if mastername ~= nil then
			s_corpsInfo(corps,name.."爱抚了"..mastername.."的宠物，获得经验奖励！",ChatPos_Sys)
		end
		s_addbuff(SCENE_ENTRY_NPC,npcid,20271,1,10)
		s_removebuff(SCENE_ENTRY_NPC,npcid,20268)
	end
end

function NpcMenuInfo60999:ShowMenu1(uid)
	local npcid = s_getVar(uid,120,2)
	if s_getbufflevel(SCENE_ENTRY_NPC,npcid,20268) == 0 then
		return VALUE_FAIL
	end
	local corps = s_getCorpsId(uid)
	if corps == 0 then
		return VALUE_FAIL
	end
	if CopySceneCheck(uid,CopySceneType_CorpsBase,corps) == VALUE_FAIL then
		return VALUE_FAIL
	end
	return VALUE_OK
end

function NpcMenuInfo60999:DealMenu2(uid)
	local info = {
		talk="",
		button={
			{"平常的物品-100银(2)","NpcMenuInfo60999:DealMenu2_1($1)"},
			{"罕见的宝贝-200银(2)","NpcMenuInfo60999:DealMenu2_2($1)"},
			{"稀世珍宝-500银(2)","NpcMenuInfo60999:DealMenu2_3($1)"},
		},
	}
	ShowNpcMenuByTable(uid,info)
end

function NpcMenuInfo60999:DealMenu2_1(uid)
	local npcid = s_getVar(uid,120,2)
	if s_getbufflevel(SCENE_ENTRY_NPC,npcid,20269) == 0 then
		s_sysInfo(uid,"每次只能操作一次")
		return VALUE_FAIL
	end
	local callback = "NpcMenuInfo60999:DealMenu2_1_1("..uid..")"
	s_showbar(uid,3000,callback,0,4)
	return VALUE_OK
end

function NpcMenuInfo60999:DealMenu2_1_1(uid)
	local npcid = s_getVar(uid,120,2)
	if s_getbufflevel(SCENE_ENTRY_NPC,npcid,20269) == 0 then
		s_sysInfo(uid,"每次只能操作一次")
		return VALUE_FAIL
	end
	local corps = s_getCorpsId(uid)
	if corps == 0 then return end
	if s_removeMoney(uid,MoneyType_Money,100,"普通的东西") ~= VALUE_OK then
		s_sysInfo(uid, "银币不足")
		return
	end
	s_addItem(uid,55091,3,1,0,"1-1","宠物小礼盒")
	local index = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_DEMON_PARK_INDEX)
	SetDemonParkInfo(corps,index,CorpsDemon_PresentOne,55091)
	local presentnum = GetDemonParkInfo(corps,index,CorpsDemon_PresentOneNum)
	SetDemonParkInfo(corps,index,CorpsDemon_PresentOneNum,presentnum+1)
	local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
	local master = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER)
	local mastername = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_NAME)
	if mastername ~= nil then
		s_corpsInfo(corps,mastername.."的宠物在游乐场中发现了好东西，悄悄交给了"..name.."！",ChatPos_Sys)
	end
	s_addbuff(SCENE_ENTRY_NPC,npcid,20271,1,10)
	s_removebuff(SCENE_ENTRY_NPC,npcid,20269)
end

function NpcMenuInfo60999:DealMenu2_2(uid)
	local npcid = s_getVar(uid,120,2)
	if s_getbufflevel(SCENE_ENTRY_NPC,npcid,20269) == 0 then
		s_sysInfo(uid,"每次只能操作一次")
		return VALUE_FAIL
	end
	local callback = "NpcMenuInfo60999:DealMenu2_2_1("..uid..")"
	s_showbar(uid,3000,callback,0,4)
	return VALUE_OK
end

function NpcMenuInfo60999:DealMenu2_2_1(uid)
	local npcid = s_getVar(uid,120,2)
	if s_getbufflevel(SCENE_ENTRY_NPC,npcid,20269) == 0 then
		s_sysInfo(uid,"每次只能操作一次")
		return VALUE_FAIL
	end
	local corps = s_getCorpsId(uid)
	if corps == 0 then return end
	if s_removeMoney(uid,MoneyType_Money,200,"罕见的东西") ~= VALUE_OK then
		s_sysInfo(uid, "银币不足")
		return
	end
	s_addItem(uid,55092,3,1,0,"1-1","宠物中礼盒")
	local index = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_DEMON_PARK_INDEX)
	SetDemonParkInfo(corps,index,CorpsDemon_PresentTwo,55092)
	local presentnum = GetDemonParkInfo(corps,index,CorpsDemon_PresentTwoNum)
	SetDemonParkInfo(corps,index,CorpsDemon_PresentTwoNum,presentnum+1)
	local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
	local master = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER)
	local mastername = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_NAME)
	if mastername ~= nil then
		s_corpsInfo(corps,mastername.."的宠物在游乐场中发现了好东西，悄悄交给了"..name.."！",ChatPos_Sys)
	end
	s_addbuff(SCENE_ENTRY_NPC,npcid,20271,1,10)
	s_removebuff(SCENE_ENTRY_NPC,npcid,20269)
end

function NpcMenuInfo60999:DealMenu2_3(uid)
	local npcid = s_getVar(uid,120,2)
	if s_getbufflevel(SCENE_ENTRY_NPC,npcid,20269) == 0 then
		s_sysInfo(uid,"每次只能操作一次")
		return VALUE_FAIL
	end
	local callback = "NpcMenuInfo60999:DealMenu2_3_1("..uid..")"
	s_showbar(uid,3000,callback,0,4)
	return VALUE_OK
end

function NpcMenuInfo60999:DealMenu2_3_1(uid)
	local npcid = s_getVar(uid,120,2)
	if s_getbufflevel(SCENE_ENTRY_NPC,npcid,20269) == 0 then
		s_sysInfo(uid,"每次只能操作一次")
		return VALUE_FAIL
	end
	local corps = s_getCorpsId(uid)
	if corps == 0 then return end
	if s_removeMoney(uid,MoneyType_Money,500,"稀世珍宝") ~= VALUE_OK then
		s_sysInfo(uid, "银币不足")
		return
	end
	s_addItem(uid,55093,3,1,0,"1-1","宠物大礼盒")
	local index = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_DEMON_PARK_INDEX)
	SetDemonParkInfo(corps,index,CorpsDemon_PresentThree,55093)
	local presentnum = GetDemonParkInfo(corps,index,CorpsDemon_PresentThreeNum)
	SetDemonParkInfo(corps,index,CorpsDemon_PresentThreeNum,presentnum+1)
	local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
	local master = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER)
	local mastername = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_NAME)
	if mastername ~= nil then
		s_corpsInfo(corps,mastername.."的宠物在游乐场中发现了好东西，悄悄交给了"..name.."！",ChatPos_Sys)
	end
	s_addbuff(SCENE_ENTRY_NPC,npcid,20271,1,10)
	s_removebuff(SCENE_ENTRY_NPC,npcid,20269)
end

function NpcMenuInfo60999:ShowMenu2(uid)
	local npcid = s_getVar(uid,120,2)
	if s_getbufflevel(SCENE_ENTRY_NPC,npcid,20269) == 0 then
		return VALUE_FAIL
	end
	local corps = s_getCorpsId(uid)
	if corps == 0 then
		return VALUE_FAIL
	end
	if CopySceneCheck(uid,CopySceneType_CorpsBase,corps) == VALUE_FAIL then
		return VALUE_FAIL
	end
	return VALUE_OK
end

function NpcMenuInfo60999:DealMenu3(uid)
	local npcid = s_getVar(uid,120,2)
	if s_getbufflevel(SCENE_ENTRY_NPC,npcid,20270) == 0 then
		s_sysInfo(uid,"每次只能操作一次")
		return VALUE_FAIL
	end
	local callback = "NpcMenuInfo60999:DealMenu3_1("..uid..")"
	s_showbar(uid,15000,callback,0,4)
	return VALUE_OK
end

function NpcMenuInfo60999:DealMenu3_1(uid)
	local corps = s_getCorpsId(uid)
	if corps == 0 then return end
	local npcid = s_getVar(uid,120,2)
	if s_getbufflevel(SCENE_ENTRY_NPC,npcid,20270) == 0 then
		s_sysInfo(uid,"每次只能操作一次")
		return VALUE_FAIL
	end
	s_goto(SCENE_ENTRY_NPC,npcid,127,139)
	s_refreshAdditionData(npcid)
	local name = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
	local master = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER)
	local mastername = s_getValue(SCENE_ENTRY_PLAYER,master,VALUE_TYPE_NAME)
	if mastername == nil then
		mastername = ""
	end
	if mastername ~= nil then
		s_corpsInfo(corps,mastername.."的宠物迷路了，热情的"..name.."将它送回了宠物乐园^_^")
	end
	s_addbuff(SCENE_ENTRY_NPC,npcid,20271,1,10)
	s_removebuff(SCENE_ENTRY_NPC,npcid,20270)
end

function NpcMenuInfo60999:ShowMenu3(uid)
	local npcid = s_getVar(uid,120,2)
	if s_getbufflevel(SCENE_ENTRY_NPC,npcid,20270) == 0 then
		return VALUE_FAIL
	end
	local corps = s_getCorpsId(uid)
	if corps == 0 then
		return VALUE_FAIL
	end
	if CopySceneCheck(uid,CopySceneType_CorpsBase,corps) == VALUE_FAIL then
		return VALUE_FAIL
	end
	return VALUE_OK
end
--宠物乐园 end
--------------------------------------------------------------------------------------
--团藏宝库 begin
--初始
function CopySceneInfo_1:InitCorpTreasury(sid)
	local corps = s_getSceneVar(sid,0,1)
	if corps == 0 then
		return
	end
	local num = s_getCorpsVar(corps,110,3)
	for i=1,num do
		local baseid = s_getCorpsVar(corps,109,1+(i-1)*100)
		if baseid ~= 0 and baseid ~= nil then
			local posx = s_getCorpsVar(corps,109,8+(i-1)*100)
			local posy = s_getCorpsVar(corps,109,9+(i-1)*100)
			local npcid = s_sysSummon(baseid,sid,posx,posy,1061)
			if npcid ~= nil and npcid ~= 0 then
				local newposx = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSX)
				local newposy = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_POSY)
				s_addCorpsVar(corps,109,2+(i-1)*100,npcid)
				s_addCorpsVar(corps,109,8+(i-1)*100,newposx)
				s_addCorpsVar(corps,109,9+(i-1)*100,newposy)
				s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER,s_getCorpsVar(corps,109,11+(i-1)*100))
				s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_BIRTH_TIME,s_getCorpsVar(corps,109,10+(i-1)*100))
				s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NPC_CORPS,corps)
				s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SIMULATION_PDAM,s_getCorpsVar(corps,109,3+(i-1)*100))
				s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SIMULATION_MDAM,s_getCorpsVar(corps,109,4+(i-1)*100))
				s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SIMULATION_PDEF,s_getCorpsVar(corps,109,5+(i-1)*100))
				s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SIMULATION_MDEF,s_getCorpsVar(corps,109,6+(i-1)*100))
				s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_SIMULATION_MAXHP,s_getCorpsVar(corps,109,7+(i-1)*100))
				s_getCorpsVar(corps,109,8+(i-1)*100)

			end
		end
	end
end
--团藏宝库 end
