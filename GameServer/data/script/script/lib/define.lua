------------------------------------------------------------
----/这里是一些全局常量定义---------------------------------
------------------------------------------------------------

--返回值定义--------------------------------------------------------------------
VALUE_OK					=	 1
VALUE_FAIL					=	 0

--方向定义--------------------------------------------------------------------
DIR_RIGHT		   = 0	  --向右
DIR_UPRIGHT		   = 1	  --右上
DIR_RIGHTUP		   = 1	  --右上
DIR_UP			   = 2	  --向上
DIR_LEFTUP		   = 3	  --左上
DIR_UPLEFT		   = 3	  --左上
DIR_LEFT		   = 4	  --向左
DIR_DOWNLEFT	   = 5	  --左下
DIR_LEFTDOWN	   = 5	  --左下
DIR_DOWN		   = 6	  --向下
DIR_RIGHTDOWN	   = 7	  --右下
DIR_DOWNRIGHT	   = 7	  --右下
DIR_WRONG		   = 8	  --错误

--WALK_ADJUST = { {0, -1}, {1, -1}, {1, 0}, {1, 1}, {0, 1}, {-1, 1}, {-1, 0}, {-1, -1}, {0, 0} }
WALK_ADJUST = { {1, 0}, {1, -1}, {0, -1}, {-1, -1}, {-1, 0}, {-1, 1}, {0, 1}, {1, 1}, {0, 0} }

--场景物件类型定义--------------------------------------------------------------------
SCENE_ENTRY_PLAYER		= 0				--玩家
SCENE_ENTRY_NPC			= 1				--NPC
SCENE_ENTRY_MAP			= 5				--地图

--BUFF清除类型--------------------------------------------------------------------
BUFF_STATE_KJZZ				= 1			--恐惧之咒清除
BUFF_STATE_JHYJ				= 2			--净化药剂清除
BUFF_STATE_NOAT				= 4			--攻击buff清除
BUFF_STATE_WYZZ				= 8			--瘟疫之咒清除
BUFF_STATE_ZLZZ				= 16		--重力之咒清除
BUFF_STATE_IGNO				= 32		--负面buff免疫


--场景物件状态定义--------------------------------------------------------------------
SCENE_ENTRY_STATE_NORMAL		= 0				--正常
SCENE_ENTRY_STATE_DEATH			= 1				--死亡
SCENE_ENTRY_STATE_HIDE			= 2				--隐藏
SCENE_ENTRY_STATE_NOTSHOW		= 4				--场景中不显示
SCENE_ENTRY_STATE_GOD			= 8				--无敌

--攻击类型定义-------------------------------------------------------------------------
ATTACK_TYPE_PH = 1     --物功
ATTACK_TYPE_CH = 2     --化功
ATTACK_TYPE_FO = 4     --重击
ATTACK_TYPE_LU = 8     --致命一击
ATTACK_TYPE_IG = 16    --忽视防御
ATTACK_TYPE_LH = 32    --光波伤害
ATTACK_TYPE_HH = 64    --热能伤害
ATTACK_TYPE_BH = 128   --生化伤害
ATTACK_TYPE_WH = 256   --声波伤害
ATTACK_TYPE_HD = 512   --闪避

--检查是否在npc附近的操作类型
NearNpcOperate_Store = 1   		--保险箱操作
NearNpcOperate_Auction = 2	 	--拍卖操作

--系统时间常量
TIME_CURYEARS						= 1			--当前年份
TIME_CURMONTHS						= 2			--当前月份
TIME_CURYDAYS						= 3			--当前日（一年）
TIME_CURMDAYS						= 4			--当前日(-月)
TIME_CURWDAYS						= 5			--星期
TIME_CURHOURS						= 6			--时
TIME_CURMINUTES						= 7			--分
TIME_CURSECONDS						= 8			--秒
TIME_ALLSECONDS						= 9			--总秒
TIME_CURYWEEKS						= 10		--总周数(某一时间以来)
TIME_ALLMONTHS						= 11		--总月数(某一时间以来)
TIME_ALLDAYS						= 12		--总天数(某一时间以来)
TIME_DAYSEC							= 13		--一天秒数(从零时开始计时)

ActivePointType_None    = 0        --无效活跃度
ActivePointType_Task    = 1        --任务活跃度
ActivePointType_Contri  = 2        --功勋活跃度
ActivePointType_Gold    = 3        --金币活跃度
ActivePointType_Money1  = 4        --银币活跃度
ActivePointType_Money2  = 5        --银币活跃度

--善恶值相关常量
GoodNess_Normal 					= 0    --普通
GoodNess_Rioter 					= 1    --暴徒
GoodNess_Badman 					= 2    --恶人
GoodNess_Evil   					= 3    --魔头
GoodNess_Hero   					= 4    --勇士

GoodNess_RioterTime 				= 2
GoodNess_BadmanTime 				= 30
GoodNess_EvilTime 					= 60
GoodNess_HeroTime 					= 720

--NPC死亡类型
NPC_DEAD_TYPE_NONE      =0     --未知死亡
NPC_DEAD_TYPE_KILL      =1     --谋杀死亡
NPC_DEAD_TYPE_TIME      =2     --定时死亡

--交通类型
TrafficType_None		= 0		--步行
TrafficType_Armyequip   = 3    	--团魔甲
TrafficType_RTLead      = 4     --2人共骑领路
TrafficType_RTFollow    = 5     --2人共骑跟随
TrafficType_Dance       = 6     --跳舞
TrafficType_DanceDouble = 7     --双人跳舞
TrafficType_RideChange  = 8    --临时性骑乘
TrafficType_Horse       = 9    --交通工具骑乘
TrafficType_MagicChange = 10   --临时性变身
TrafficType_SuperWeapon = 11   --超能武器
TrafficType_InGuard     = 12   --镖车合体
TrafficType_InHorse		= 13   --骑战一体
TrafficType_Fish		= 14   --钓鱼
TrafficType_Hug			= 15	--拥抱
TrafficType_Kiss		= 16	--接吻
TrafficType_CarrigeLead		= 17	--双人马车领路
TrafficType_CarrigeFollow	= 18	--双人马车跟随

--玩家职业
Profession_None			= 0		--无职业
Profession_Soldier		= 1		--战士
Profession_Spy			= 2		--特工
Profession_Gunman		= 3		--法师
Profession_Blast		= 4		--爆破
Profession_Freeman		= 5		--道士
Profession_Doctor		= 6		--医生

--社会关系类型
Relation_Friend			= 0 	--好友
Relation_Honey			= 1 	--恋人
Relation_Spouse			= 2 	--夫妻
Relation_Enemy			= 3 	--仇人成员
Relation_Black			= 4 	--黑名单成员
Relation_Soldier		= 5 	--战士
Relation_Team			= 6 	--组队
Relation_Corps			= 7 	--团
Relation_Army			= 8 	--军
Relation_Country		= 9 	--国
Relation_World			= 10	--世界

--社会关系职务定义
FunctionType_Common			= 0 	--百姓
FunctionType_Marshal		= 1 	--国王
FunctionType_ViceMarshal	= 2 	--元帅
FunctionType_Interior		= 3 	--内务大臣
FunctionType_Treasury		= 4 	--财务大臣
FunctionType_Defense		= 5 	--军务大臣
FunctionType_Police			= 6 	--警长
FunctionType_VicePolice		= 7 	--代警长
FunctionType_RoseKnight		= 8		--玫瑰骑士
FunctionType_Commander		= 9		--指挥官
--
FunctionType_CLeader		= 51 	--团长
FunctionType_CInterLeader	= 52 	--内务副官
FunctionType_CExterLeader	= 53 	--外务副官
FunctionType_CBeauty		= 54	--团花
--
FunctionType_ALeader		= 81 	--军长
FunctionType_AViceLeader	= 82 	--副军长

--社会关系权限定义
RightType_CountryFunction	= 100 	--国家官职任免
RightType_CountryBoard		= 101 	--国家公告
RightType_CountryCall		= 102 	--国家召集
RightType_CountryControl	= 103 	--国家抓人
RightType_CountrySilent		= 104 	--国家禁言
RightType_CountryGomap		= 105 	--国家跳转
RightType_CountryQBTask     = 106	--情报任务发布
RightType_CountryYZTask     = 107	--远征任务发布
RightType_CountryGYTask     = 108	--国运任务发布
RightType_CountryWMTask     = 109   --国家文明任务
RightType_CountryJSKB       = 110   --极速狂飙
RightType_CountryWHTask		= 111   --国家舞会

RightType_CorpsRecruit		= 200 	--团招人
RightType_CorpsFunction		= 201 	-- 团职务任免
RightType_CorpsBoard		= 202 	-- 团公告

RightType_ArmyRecruit		= 300 	-- 军招人
RightType_ArmyFunction		= 301 	--军职务任免
RightType_ArmyBoard			= 302 	--军公告

--团建筑
Building_Corps				= 0		--团
Building_Command			= 1		--指挥所
Building_Service                       = 2             --团训练
Building_Science                       = 3             --团建设

CorpsState_Normal			= 0		--正常状态
CorpsState_ToRemove			= 1 	--待删除

MAX_BUILDING_LEVEL			= 20	--最大建筑等级

--社会关系活动及变量定义----------------------------------------------------------------------
WorldEv_CorpsBattle		= 1		--团战时间
WorldEv_OccupyBattleStart = 2	--团占领挑战
WorldEv_ArmyBattle		= 4		--军战时间
WorldEv_CountryOccupyStart = 6	--国王争夺
WorldEv_CountryVoteKingStart = 8 --国王竞选
WorldEv_ArmyOccupyStart	= 9		--军称号争夺
WorldEv_CorpsBattleSign = 1001	--团战报名
WorldEv_OccupySign		= 1002	--团占领报名
WorldEv_LotteryBuy		= 1003	--购买彩票时间
WorldEv_ArmyBattleSign	= 1004	--军战报名
WorldEv_JunXunTime		= 1006	--团突袭时间
CpEv_JunXunPre			= 1007  --团突袭任务准备
CpEv_JunXun				= 10001	--团突袭任务
CpEv_HouQin				= 10002	--团训练任务
CountryEv_QingBao		= 10003	--情报任务
CountryEv_YuanZheng		= 10004	--远征任务
CountryEv_GuoYun		= 10005 --国运任务
WorldEv_RunningPre		= 10007 --长跑报名
WorldEv_Running			= 10008 --比赛开始
CountryEv_RunningPre	= 10009 --长跑报名
CountryEv_Running		= 10010	--开始比赛
CountryEv_Dancing		= 20042	--开始舞会
WorldEv_Time            = 20043 --系统活动时间（舞会、国运、远征、情报）
--皇图活动变量

EventJewelBattle			= 100;		--宝石战场(开启)
EventJewelBattle_Tip1		= 101;		--宝石战场(前5分钟提示)
EventJewelBattle2			= 102;		--宝石战场(开启)
EventJewelBattle_Tip2		= 103;		--宝石战场(前5分钟提示)

EventCaptureFlag1			= 200;		--夺旗战(10点开启)
EventCaptureFlag1_Tip		= 201;		--夺旗战(前5分钟提示)
EventCaptureFlag2			= 202;		--夺旗战(16点开启)
EventCaptureFlag2_Tip		= 203;		--夺旗战(前5分钟提示)
EventCaptureFlag3			= 204;		--夺旗战(23:10点开启)
EventCaptureFlag3_Tip		= 205;		--夺旗战(前5分钟提示)

EventAttackCity				= 300;		--攻城战(开启)
EventAttackCity_Tip1		= 301;		--攻城战tip(前15分钟提示)
EventAttackCity_Tip2		= 302;		--攻城战tip(前10分钟提示)
EventAttackCity_Tip3		= 303;		--攻城战tip(前5分钟提示)

EventMonsterAtkCity1		= 400;		--怪物攻城(开启)
EventMonsterAtkCity1_Tip    = 401;      --怪物攻城tip(前5分钟提示)
EventMonsterAtkCity2		= 402;		--怪物攻城(开启)
EventMonsterAtkCity2_Tip	= 403;		--怪物攻城tip(前5分钟提示)
EventMonsterAtkCity3		= 404;		--怪物攻城(开启)
EventMonsterAtkCity3_Tip	= 405;		--怪物攻城Tip(前5分钟提示)

EventSimulation				= 500;		--竞技场(开启)

EventMonsterCity1			= 600;		--巨兽围城(开启)
EventMonsterCity1_Tip		= 601;		--巨兽围城(前5分钟提示)
EventMonsterCity2			= 602;		--巨兽围城(开启)
EventMonsterCity2_Tip		= 603;		--巨兽围城(前5分钟提示)
EventMonsterCity3			= 604;		--巨兽围城(开启)
EventMonsterCity3_Tip		= 605;		--巨兽围城(前5分钟提示)

EventArena					= 700;		--擂台战(开启)
EventArena_Tip				= 701;		--擂台战(前5分钟提示)
EventArena1                  = 703      --擂台战(开启)
EventArena_Tip1              = 704      --擂台战(前5分钟提示)
EventArena2                  = 705;     --擂台战(开启)
EventArena_Tip2              = 706;     --擂台战(前5分钟提示)

EventHeroIndiana1			= 800;		--群雄夺宝(开启)
EventHeroIndiana1_Tip		= 801;		--群雄夺宝(前5分钟提示)
EventHeroIndiana2			= 802;		--群雄夺宝(开启)
EventHeroIndiana2_Tip		= 803;		--群雄夺宝(前5分钟提示)

EventDoubleExp1				= 900;		--双倍经验(开启)
EventDoubleExp2				= 901;		--双倍经验(开启)
EventDoubleExp3				= 902;		--双倍经验(开启)

EventChallengeBoss			= 1000;		--挑战Boss(开启)
EventChallengeBoss_Tip		= 1001;		--挑战Boss(前5分钟提示)
EventChallengeBoss1          = 1002;     --boss殿堂(开启)
EventChallengeBoss_Tip1      = 1003;     --boss殿堂(前5分钟提示)
EventChallengeBoss2          = 1004;     --boss殿堂(开启)
EventChallengeBoss_Tip2      = 1005;     --boss殿堂(前5分钟提示)

EventFight					= 1100;		--武斗大会(开启)
EventFight_Tip				= 1101;		--武斗大会(前5分钟提示)
EventFight2					= 1103;		--武斗大会(开启)
EventFight_Tip2				= 1104;		--武斗大会(前5分钟提示)

EventVisitMaster1			= 1200;		--瞻仰城主(开启)
EventVisitMaster2			= 1201;		--瞻仰城主(开启)
EventVisitMaster3			= 1202;		--瞻仰城主(开启)

DoubleEscort1               = 1301;     --押镖开始
DoubleEscort1_Tip           = 1302;     --押镖(前5分钟提示)
DoubleEscort2               = 1303;     --押镖开始
DoubleEscort2_Tip           = 1304;     --押镖(前5分钟提示)
DoubleEscort3               = 1305;     --押镖开始
DoubleEscort3_Tip           = 1306;     --押镖(前5分钟提示)


EventManor		           = 1601;     --领地战
EventManor_Sign1		   = 1602;     --领地战（30分钟）
EventManor_Sign2		   = 1603;     --领地战（报名截止1分钟）

EventPreal				   = 1801;		--太妙莲宝
EventPreal_Tip			   = 1802;		--太妙莲宝(一分钟提示)
EventPreal2				   = 1803;		--太妙莲宝
EventPreal2_Tip			   = 1804;		--太妙莲宝(一分钟提示)

EventGinSeng				= 1901 --阴阳妖参

EventMine                   = 2001 --晶源矿洞

EventClanWar				=2401;		--宗门势力战

EventWorldBoss				= 2501;

EVENT_TIME_BEG				= 1  --活动开始时间
EVENT_TIME_END				= 2	 --活动结束时间
EVENT_TIME_REM				= 3	 --活动剩余时间

--皇图活动变量结束

--国家职务操作界面
COUNTRY_FUNAP_VICEMARSHAL	= 1		--任命元帅
COUNTRY_FUNAP_INTERIOR		= 2		--任命内务大臣
COUNTRY_FUNAP_TREASURY		= 3		--任命财务大臣
COUNTRY_FUNAP_DEFENSE		= 4		--任命军务大臣
COUNTRY_FUNAP_POLICE		= 5		--任命警长
COUNTRY_FUNAP_VICEPOLICE	= 6		--任命代警长

COUNTRY_FUNDP_VICEMARSHAL	= 21	--罢免元帅
COUNTRY_FUNDP_INTERIOR		= 22	--罢免内务大臣
COUNTRY_FUNDP_TREASURY		= 23	--罢免财务大臣
COUNTRY_FUNDP_DEFENSE		= 24	--罢免军务大臣
COUNTRY_FUNDP_POLICE		= 25	--罢免警长
COUNTRY_FUNDP_VICEPOLICE	= 26	--罢免代警长

COUNTRY_FUNSP_CONTROL		= 40	--国家抓人
COUNTRY_FUNSP_SLIENT		= 41	--国家禁言
COUNTRY_FUNSP_RENAME		= 60	--国家改名

--获得经验类型
ExpType_Monster         = 0			--打怪经验
ExpType_MainTask        = 1			--主要任务
ExpType_OptionalTask    = 2			--选做任务
ExpType_Exchange        = 3			--兑换获得经验
ExpType_SkillReturn		= 4			--洗技能返还
ExpType_Fate			= 5			--命运房间
ExpType_Dance           = 7			--跳舞
ExpType_GuardCopy       = 8			--守卫副本
ExpType_GatherFlower    = 9			--收集荆棘迷雾之花
ExpType_Answer          = 10		--答题
ExpType_Item            = 11		--道具获得
ExpType_Fish            = 12		--钓鱼
ExpType_Running         = 13		--极速狂飙
ExpType_Nuclear         = 14		-- 核子魔窟
ExpType_DemonChange     = 15         --宠物兑换经验
ExpType_Corps           = 16         -- 团活动
ExpType_Army            = 17         --军活动
ExpType_MedalPresent    = 18        --授勋送礼
ExpType_LevelPresent    = 19        --升级送礼
ExpType_Crystal         = 20        --生命水晶
ExpType_FindTreasure	= 21		--寻宝
ExpType_CountryWar		= 22		--国战
ExpType_MerryPresent	= 23		--结婚送礼
ExpType_FlagBattle      = 24        --夺旗战
ExpType_LoveTask		= 25		--情缘任务
ExpType_EmperorWar		= 26		--帝都战
ExpType_WorshipEmperor	= 27		--膜拜帝皇
ExpType_Babyloncopy	= 28		--巴比伦塔获得经验
ExpType_Offline        = 29         --离线经验
ExpType_Show        = 30         --特效展示经验
ExpType_Stone        = 31         --经验石经验
--消耗经验类型
ExpCostType_BuyItem         = 0            --兑换道具
ExpCostType_StudySkill      = 1            --学习技能
ExpCostType_LevelUp         = 2            --升级
ExpCostType_Max             = 3            --最大值

--装备品质
EquipQuality_White      = 0
EquipQuality_Blue       = 1
EquipQuality_Yellow     = 2
EquipQuality_Green      = 3
EquipQuality_Purple     = 4
--装备前缀
EquipPrefix_Null            =0      --普通型
EquipPrefix_Excellent       =1      --优质型
EquipPrefix_Perfect         =2      --完美型

--NPC类型
NPC_TYPE_NONE			= 0	-- 空类型
NPC_TYPE_CHARLIKE		= 1	-- 人形NPC
NPC_TYPE_FUNCTION		= 2	-- 功能NPC
NPC_TYPE_ARMYEQUIP		= 4	-- 团魔甲
NPC_TYPE_CATCH_PET		= 8	-- 可捕捉的宠物
NPC_TYPE_EQUIPBOSS		= 4096	-- 魔甲BOSS

--团魔甲类型
ARMY_EQUIP_TYPE_FLYER	= 1	--飞车
ARMY_EQUIP_TYPE_TANK	= 2	--坦克
ARMY_EQUIP_TYPE_CANNON	= 3	--火炮

--进度条动作类型
UninterruptActionType_None			= 0   	--无
UninterruptActionType_JSCJ			= 1    	--金属采集
UninterruptActionType_NYCJ			= 2    	--农业采集
UninterruptActionType_TASK 			= 3		-- //做任务
UninterruptActionType_GOHOME 		= 4     -- //回城
UninterruptActionType_DEMON 		= 5     -- 驯化宠物动作
UninterruptActionType_Treasure      = 6     -- 挖宝
UninterruptActionType_QCDT          = 7     -- 采集QCDT宝箱
UninterruptActionType_LOTUS         = 8     -- 采集宝莲
UninterruptActionType_MINERAL         = 9     -- 采集矿石

--事件活动进行状态
EventStep_None			= 0 -- 未发布
EventStep_Wait			= 1	-- 等待开始
EventStep_Run			= 2	-- 进行中
EventStep_End			= 3 -- 结束

--场景类型
CopySceneType_None			= 0		-- 普通场景
CopySceneType_CorpsBase		= 1		-- 团基地
CopySceneType_Fate			= 2		-- 命运房间
CopySceneType_CorpsBattle	= 3		-- 团战
CopySceneType_FlagBattle	= 4		-- 血战到底
CopySceneType_ArmyBattle	= 7		-- 军战
CopySceneType_CorpsCopy		= 8		-- 团副本
CopySceneType_Treasure_21	= 20	-- 血精石副本
CopySceneType_Treasure_61	= 24	-- 血精石副本
CopySceneType_Hero_LV1		= 15	--王者试炼1层
CopySceneType_Hero_LV5		= 19	--王者试炼1层
CopySceneType_FootGame		= 62	--足球场
CopySceneType_HighAdventure	= 63	--高级冒险岛
CopySceneType_Adventure		= 64	--低级冒险岛
CopySceneType_TeamFight		= 65	--组队争夺战
CopySceneType_PriAdventure1 = 66	--初级冒险岛1
CopySceneType_PriAdventure2 = 67	--初级冒险岛2
CopySceneType_PriAdventure3 = 68	--初级冒险岛3
CopySceneType_Simulation    = 69	--1v1模拟战
CopySceneType_Demon			= 70	--欢乐谷
CopySceneType_EquipBoss		= 71	--魔甲BOSS副本
CopySceneType_Raiders		= 72	--奇兵交锋
CopySceneType_EmperorWar	= 73	--帝都战
CopySceneType_BaBieTower	= 74	--巴别塔
CopySceneType_PalaceWar		= 75	--宫殿战
CopySceneType_Challenge		= 104	--无双擂台战选拔战
CopySceneType_Challenge1	= 105	--无双擂台战挑擂战
CopySceneType_Challenge2	= 106	--无双擂台战1/8赛
CopySceneType_Challenge3	= 107	--无双擂台战1/4赛
CopySceneType_Challenge4	= 108	--无双擂台战1/2赛
CopySceneType_Challenge5	= 109	--无双擂台战冠军赛

CopySceneType_CopyTeam  = 181;		--副本队伍副本80级
CopySceneType_CopyTeam2 = 182;		--副本队伍副本飞升2级
CopySceneType_CopyTeam3 = 183;		--副本队伍副本飞升4级

CopySceneType_Manor1	= 191;		-- 领地1
CopySceneType_Manor2	= 192;		-- 领地2
CopySceneType_Manor3	= 193;		-- 领地3
CopySceneType_Manor4	= 194;		-- 领地4
CopySceneType_Manor5	= 195;		-- 领地5
CopySceneType_Manor6	= 196;		-- 领地6

CopySceneType_QCDT      = 197;      -- 传承洞天
CopySceneType_QCDTM     = 198;      -- 传承洞天大型
CopySceneType_JYKM      = 199;      -- 晶源矿脉
CopySceneType_HLSY1		= 228;		--副本队伍副本混乱深渊1层
CopySceneType_HLSY2		= 229;		--副本队伍副本混乱深渊2层
CopySceneType_Exp_231                               = 230;
CopySceneType_Exp_232                               = 231;
CopySceneType_Exp_233                               = 232;
CopySceneType_Exp_234                               = 233;
CopySceneType_Exp_235                               = 234;
CopySceneType_Exp_236                               = 236;

--钱币类型
MoneyType_MoneyTicket       = 1  --1(金币-日常掉落、购买日常物品、可交易、部分强化功能)
MoneyType_Money             = 2  --2绑定元宝-系统赠送、可买少量物品、不可交易
MoneyType_GoldTicket        = 4  --4金票*/
MoneyType_Gold              = 8  --8元宝-RMB充值、可买商城物品、抽奖等)*/

--货币添加操作类型
MoneyActionTypeAdd_TaskAdd 	= 1 --任务奖励
MoneyActionTypeAdd_Mail 	= 2	--邮箱得到
MoneyActionTypeAdd_Tick 	= 3	--点券得到
MoneyActionTypeAdd_Sell 	= 4	---卖商店

--货币删除操作类型
MoneyActionTypeRemove_BuyStore 		= 1			---商店购买
MoneyActionTypeRemove_Present 		= 2			---脚本礼包购买
MoneyActionTypeRemove_Repair 		= 3			---修理

-- 道具、货币变化类型
AddItemAction_Task			= 9		-- 任务
AddItemAction_Mail			= 40	-- 邮件
AddItemAction_UseItem		= 44	-- 使用道具

--阵营类型
COPY_GROUP_A		= 17		-- 阵营A
COPY_GROUP_B		= 18		-- 阵营B
COPY_GROUP_C		= 19		-- 阵营C

--包裹类型
PACKAGETYPE_MAIN        = 1     --**< 1主包裹 */
PACKAGETYPE_EQUIP       = 2     --**< 2装备*/
PACKAGETYPE_SMALL1      = 3     --**< 3小包裹*/
PACKAGETYPE_SMALL2      = 4     --**< 4小包裹*/
PACKAGETYPE_SMALL3      = 5     --**< 5小包裹*/
PACKAGETYPE_DEMON       = 6     --**< 8骑异兽包裹*/
PACKAGETYPE_STORE1      = 8     --**< 保险箱*/
PACKAGETYPE_STORE2      = 9     --**< 保险箱*/
PACKAGETYPE_STORE3 		= 10	--**< 保险箱*/

--装备包裹位置
EQUIP_HAT       = 0;				-- 头盔
EQUIP_BODY      = 1;				-- 服装
EQUIP_HANDR     = 2;				-- 右手(武器)
EQUIP_HONOR     = 3;				-- 项链
EQUIP_MEDAL1    = 4;				-- 勋章
EQUIP_GLOVESL   = 5;				-- 护腕(左)
EQUIP_GLOVESR   = 6;				-- 护腕(右)
EQUIP_ADORNL    = 7;				-- 戒指(左)
EQUIP_ADORNR    = 8;				-- 戒指(右)
EQUIP_BELT      = 9;				-- 腰带
EQUIP_SHOES     = 10;				-- 鞋子
EQUIP_DIAMOND   = 11;               -- 宝石
EQUIP_JADE      = 12;               -- 玉佩
EQUIP_BEAD      = 13;               -- 五行珠

--神装属性
EQUIP_SWORD     = 14;               --宝剑
EQUIP_ARMOUR    = 15;               --神甲
EQUIP_HEADSCARF = 16;               --头巾
EQUIP_SHOULDER  = 17;               --护肩
EQUIP_PENDANT   = 18;               --吊坠
EQUIP_KNEE      = 19;               --护膝
EQUIP_GODADORNL = 20;               --神戒(左)
EQUIP_GODADORNR = 21;               --神戒(右)

--以前的属性
EQUIP_BRACELET  = 22;			-- 手镯
EQUIP_SPECIAL1  = 23;			-- 时装1
EQUIP_MACHINE1  = 24;			-- 仪器1
EQUIP_MACHINE2  = 25;			-- 仪器2
EQUIP_LIFEEQUIP = 26;			-- 生命仪
EQUIP_BACK      = 27;			-- 背部装备
EQUIP_MACHINE5  = 28;			-- 仪器5
EQUIP_MACHINE6  = 29;			-- 仪器6
EQUIP_PACK_1    = 30;			-- 小包裹1
EQUIP_PACK_2    = 31;			-- 小包裹2
EQUIP_PACK_3    = 32;			-- 小包裹3
EQUIP_PACK_4    = 33;			-- 小包裹4
EQUIP_PACK_5    = 34;			-- 小包裹5
EQUIP_SHIELD    = 44;               	-- 护盾
EQUIP_XHALO    = 45;                   -- 修罗魂玉
EQUIP_THALO    = 46;                   -- 地道魂玉
EQUIP_RHALO    = 47;                   -- 人道魂玉
EQUIP_BHALO    = 48;                   -- 傍生魂玉
EQUIP_EHALO    = 49;                   -- 恶鬼魂玉
EQUIP_DHALO    = 50;                   -- 地狱魂玉
EQUIP_Max       = 51;			-- 最大数量

--团养殖变量定义
Breed_Level		= 1		-- 当前养殖等级
Breed_State		= 2		-- 养殖阶段(未开启、白~紫、守护)
--Breed_Mood		= 3		-- 心情
--Breed_Appetite	= 4		-- 胃口
Breed_Growth	= 5		-- 成长值
--Breed_FeedTimes = 6		-- 饱食度
--Breed_LastFood	= 7		-- 上次食物
--Breed_Timer		= 8		-- 下次喂养时间
Breed_LastDays	= 9		-- 当前喂养天
Breed_BossHp	= 10	-- 被杀怪血量
Breed_Killing	= 11	-- 开启击败

--养殖BOSS状态
StateBreedBoss_None		= 0		-- 未开启
StateBreedBoss_White	= 1		-- 白色
StateBreedBoss_Blue		= 2		-- 蓝色
StateBreedBoss_Yellow	= 3		-- 黄色
StateBreedBoss_Green	= 4		-- 绿色
StateBreedBoss_Purple	= 5		-- 紫色
StateBreedBoss_Killed	= 6		-- 已杀

--团种植变量定义
Plant_UserPotNum	= 1		--个人花盆数量
Plant_PubPotNum		= 2		--公共花盆数量
Plant_UsedUserPot	= 3		--已用个人花盆
Plant_UsedPubPot	= 4		--已用公共花盆

--植物信息
PlantInfo_Seed			= 1		-- 对应植物
PlantInfo_Owner			= 2		-- 主人
PlantInfo_Stub			= 3		-- 第几季
PlantInfo_Step			= 4		-- 生长阶段
PlantInfo_EndTime		= 5		-- 生命结束时间
PlantInfo_Health		= 6		-- 营养
PlantInfo_OutPut		= 7		-- 产量/预计产量
PlantInfo_Remain		= 8		-- 剩余
PlantInfo_Water			= 9		-- 浇水次数
PlantInfo_LastWater		= 10	-- 上次浇水时间
PlantInfo_AllowWater	= 11	-- 是否允许浇水

--种植类型
PlantType_User		= 1		-- 个人种植
PlantType_Pub		= 2		-- 公共种植

PlantStep_None		= 0		-- 未种植
PlantStep_Bud		= 1		-- 发芽
PlantStep_Grow		= 2		-- 青苗
PlantStep_Ripe		= 3		-- 成熟
PlantStep_Die		= 4		-- 枯死

--团宠物乐园变量定义
CorpsDemon_Owner		= 1		--主人
CorpsDemon_OwnerLevel	= 2		--主人等级
CorpsDemon_BeginTime	= 3		--开始时间
CorpsDemon_EndTime		= 4		--结束时间
CorpsDemon_TotalExp		= 5		--累积经验
CorpsDemon_ExtExp		= 6		--额外经验
CorpsDemon_PresentOne	= 7		--额外礼物1
CorpsDemon_PresentTwo	= 8		--额外礼物2
CorpsDemon_PresentThree	= 9		--额外礼物3
CorpsDemon_PlayType		= 10	--游玩方式
CorpsDemon_End			= 11	--是否结束
CorpsDemon_ID			= 12	--场景上宠物ID
CorpsDemon_PresentOneNum    = 13	--额外礼物1个数
CorpsDemon_PresentTwoNum    = 14	--额外礼物2个数
CorpsDemon_PresentThreeNum  = 15	--额外礼物3个数
CorpsDemon_Baseid			= 16	--宠物原型
CorpsDemon_NpcID			= 17	--宠物NPCID

--输入框回调附加列表
InputBoxAppendList_Near     = 1     --附近玩家名字
InputBoxAppendList_Friend   = 2     --好友玩家名字
InputBoxAppendList_Enemy    = 4     --仇人列表
InputBoxAppendList_Blank    = 8     --黑名单列表
InputBoxAppendList_Corps    = 16    --团成员列表
InputBoxAppendList_Team     = 32    --队伍成员
InputBoxAppendList_Chat     = 64    --聊天输入

--国家状态
CountryStateNormal  		= 0		--正常
CountryStateWeak    		= 1		--弱国
CountryStateStrong  		= 2		--强国

--工资类型
PayType_Person = 0		--个人工资
PayType_King   = 1		--国王收益
PayType_MidKing= 2		--中立区国王收益

--操作类型
OperateType_Store           = 1     --操作仓库
OperateType_Sale            = 2     --寄售
OperateType_Mail			= 3		--邮件
OperateType_FreshColor		= 4		--刷颜色

--长跑比赛状态
RunningState_Prepare    =   1
RunningState_Start      =   2
RunningState_Over       =   4

--跨区极速狂飙比赛状态
CSRunningState_Prepare	=	1
CSRunningState_Start	=	2
CSRunningState_Over		=	4

--性别
Charbase_Male			= 	1
Charbase_Female			= 	2

--区域定义
ZONE_HOME_SAFE          =   1      --1本国人安全区(本国人在此区域受PK保护,但可以攻击外国人)*/
ZONE_FOREIGN_SAFE       =   2      --2外国人安全区(外国人在此区域受PK保护,但可以攻击本国人)*/
ZONE_PRIVATE_STORE      =   128    --128摆摊区*/
ZONE_DANCE              =   2048   --2048跳舞区*/
ZONE_FISH				=	1024
ZONE_CORP_TREASURY		=	4194304	--团藏宝库
ZONE_ABSOLUTE           =   4096    --绝对安全区


ZONE_THREE_REWARD		= 8192	 --三倍经验奖励区
ZONE_POINT_FIVE			= 16384	 --0.5倍经验奖励区
--宠物类型
DemonType_Follow = 1    --侍宠
DemonType_Ride   = 2    --骑宠
DemonType_Join   = 3    --战宠

--VIP特权
VIP_RIGHT_SELLSHOP              = 1    --摆摊名字高亮
VIP_RIGHT_STORE3                = 2    --第三个仓库
VIP_RIGHT_CHAT                  = 3    --聊天自定义颜色
VIP_RIGHT_FEE                   = 4    --传送，修理费用优惠
VIP_RIGHT_DEMON                 = 5    --不在线不扣除宠物快乐度

--对话框返回确认 取消
Button_Yes			= 3
Button_No			= 4

--系统提示位置
ChatPos_MsgBox      = 0		-- 弹出式对话框
ChatPos_Normal      = 1		-- 普通聊天输出
ChatPos_Sys         = 2		-- 系统提示输出
ChatPos_Tips        = 4		-- 冒泡提示
ChatPos_Pop         = 8		-- 右下角弹出
ChatPos_Private     = 16	-- 私聊输出
ChatPos_Important   = 32	-- 屏幕中央输出(电视^_^)
ChatPos_Honor       = 64	-- 屏幕中央输出(电视^_^)
ChatPos_Gm          = 128	-- GM系统公告输出位置
ChatPos_ImportantDown = 256 -- 下方广播提示

ArmyVar_Name          = -1    --名字

--国家勋章
MedalType_Natural		= 25 --自然勋章
MedalType_Lightning		= 26 --闪电勋章
MedalType_Fire			= 27 --火焰勋章
MedalType_IceMedal		= 28 --冰霜勋章

--设置职位类型
CFOP_USER_SUB			= 1 --国王撤职

--国战状态
Country_War_State_Ready		= 1		--国战准备
Country_War_State_Start		= 2		--国战开始
Country_War_State_Stop		= 3		--国战结束

--边境战神占领
Border_Occupy_Type_Defense		= 1		--防守占领
Border_Occupy_Type_Attack		= 2		--攻击占领

--国战变量
Country_War_Border				= 1		--边境战神
Country_War_Outside				= 2		--外城守卫
Country_War_Inner_Life_Num		= 3		--内城守卫生命值
Country_War_Alter_Life_Num		= 4		--天象祭坛生命值
Country_War_Statue_Life_Num		= 5		--霸者雕像生命值
Country_War_Attack_Kill_Num		= 6		--攻方杀敌数
Country_War_Defense_Kill_Num	= 7		--守方杀敌数
Country_War_Lady				= 9		--戎装公主
Country_War_Palace_Master_Life	= 10	--宫殿主神血量

--国战占领枚举
Country_War_Occupy_Defense		= 1		--守方占领
Country_War_Occupy_Attack		= 2		--攻防占领

--国家活动信息
Country_Activity_Qingbao		= 1		--国家情报
Country_Activity_Yuanzheng		= 2		--国家远征
Country_Activity_Wuhui			= 3		--国家舞会
Country_Activity_Sudi			= 4		--国家速递
Country_Activity_Weishe			= 5		--国家威慑

--名字操作的类型
NameOperateType_Rolename		=0		--玩家角色名操作 */
NameOperateType_Army			=1		--军名称操作 */
NameOperateType_Corps			=2		--团名称操作 */

--PK模式
PKMODE_NORMAL					=1		--和平模式
PKMODE_ENTIRE					=2		--全体模式
PKMODE_GOODNESS					=3		--善恶模式
PKMODE_COUNTRY					=4		--国家模式
PKMODE_ALLY						=5		--盟国模式
PKMODE_TEAM						=6		--小队模式
PKMODE_ENEMY_C					=7		--敌国模式
PKMODE_CORPS					=8		--团模式
PKMODE_ARMY						=9		--军模式
--区域
eAreaType_Right     			= 3
eAreaType_Center    			= 4
eAreaType_Max       			= 5

--消息类型
eHideButtonType_CopyBattle          = 2 --团战
eHideButtonType_JunZhanBattle       = 3 --军战
eHideButtonType_FlagBattle          = 4 --血战到底

eHideButtonType_Invite_Corps        = 5 --拉人，团
eHideButtonType_Invite_Army         = 6 --拉人，军
eHideButtonType_Invite_Country      = 7 --拉人，国王
eHideButtonType_AnswerQueastion     = 8 --答题
eHideButtonType_PropertyPoint       = 9 --属性加点提醒
eHideButtonType_SkillPoint          = 10 --技能加点提醒
eHideButtonType_SevenDay            = 11 --七天闯关
eHideButtonType_GuardHelp_Return    = 12 --救援返回
eHideButtonType_WeiShe_LueDuo       = 13 --威慑与掠夺
eHideButtonType_Ally_Call			= 14 --盟国召集令
eHideButtonType_CountryWar			= 50 --国战召集令
--星之城快传回城点
Star_City_Return_x				= 37	--星之城快传回城点x坐标
Star_City_Return_y				= 82	--星之城快传回城点y坐标

--男性
MALE							= 1		--男性
FEMALE							= 2		--女性

--地图
MAP_JAIL						= 105	--监狱

--帝都战状态
World_War_State_Ready     = 1     --帝都战准备
World_War_State_Start     = 2     --帝都战开始
World_War_State_Stop      = 3     --帝都战结束

--神之守护军
Natural_God_Guard_Army			= 154	--自然女神守护军
Light_God_Guard_Army			= 155	--雷霆巨神守护军
Fire_God_Guard_Army				= 156	--火焰战神守护军
Snow_God_Guard_Army				= 157	--冰雪女神守护军

--飞艇状态
AirshipState_Wait				= 0		--等待
AirshipState_Sailing			= 1		--航行中
AirshipState_Operate			= 2		--操作状态
AirshipState_Finish				= 3		--活动结束

--电竞枚举
eESportType_Blook 		= 1			--血战到底
eESportType_ShiLian 	= 2			--王者试炼
eESportType_CorpsBattle = 3			--团战
eESportType_Fish 		= 4			--钓鱼
eESportType_Rush 		= 5			--极速狂飙
eESportType_OnlineTime	= 6			--在线时间
eESportType_KingWar     = 7			--王者之战

--场景物件状态
SceneEntry_Normal   = 0			--普通状态
SceneEntry_Death    = 1			--死亡状态
SceneEntry_Hide     = 2			--隐藏状态
SceneEntry_NotShow  = 4			--场景中不显示状态
SceneEntry_God      = 8			--无敌状态
SceneEntry_PreDeath = 16		--装死状态
SceneEntry_Benumb   = 32        --麻痹状态

--神值最大值
MAX_GOD_EVIL_VALUE	= 10000

--国家镖车状态
COUNTRY_POSTCAR_STATE_NONE			= 0					--未触发
COUNTRY_POSTCAR_STATE_BEGIN			= 1					--正常押送
COUNTRY_POSTCAR_STATE_NINETY		= 2					--百分之九十
COUNTRY_POSTCAR_STATE_EIGHTY		= 3					--百分之八十
COUNTRY_POSTCAR_STATE_SEVENTY		= 4					--百分之七十
COUNTRY_POSTCAR_STATE_SIXTY			= 5					--百分之六十
COUNTRY_POSTCAR_STATE_FIFTY			= 6					--百分之五十
COUNTRY_POSTCAR_STATE_FORTY			= 7					--百分之四十
COUNTRY_POSTCAR_STATE_THIRTY		= 8					--百分之三十
COUNTRY_POSTCAR_STATE_TWENTY		= 9					--百分之二十
COUNTRY_POSTCAR_STATE_TEN			= 10				--百分之十
COUNTRY_POSTCAR_STATE_KILLED		= 11				--被击败
COUNTRY_POSTCAR_STATE_FINISHED		= 12				--已交付
COUNTRY_POSTCAR_STATE_GOMAP			= 13				--跨图

--团活力任务达成总次数
CORPS_ACTIVITY_33700				= 7					--团训练达成总次数
CORPS_ACTIVITY_33701				= 7					--团BOSS达成总次数
CORPS_ACTIVITY_33702				= 2					--团战达成总次数
CORPS_ACTIVITY_33703				= 1					--团突袭达成总次数
CORPS_ACTIVITY_33704				= 7					--团拓展达成总次数
CORPS_ACTIVITY_33705				= 10				--颁发团奖金
CORPS_ACTIVITY_33706				= 10				--使用团长召唤令
CORPS_ACTIVITY_33707				= 1					--袭击特勤机甲
CORPS_ACTIVITY_33708				= 1					--袭击要人警户
CORPS_ACTIVITY_33709				= 2					--破坏团雕像
CORPS_ACTIVITY_33710				= 1					--击败魔甲BOSS
CORPS_ACTIVITY_33711				= 1					--击败中立区BOSS

COUNTRY_ACTIVITY_33800                = 7                 --国家舞会
COUNTRY_ACTIVITY_33801                = 7                 --国运
COUNTRY_ACTIVITY_33802                = 7                 --国家远征
COUNTRY_ACTIVITY_33803                = 7                 --国家情报
COUNTRY_ACTIVITY_33804                = 7                 --威慑与掠夺
COUNTRY_ACTIVITY_33805                = 1                 --击败魔神将军
COUNTRY_ACTIVITY_33806                = 1                 --击败边境战神
COUNTRY_ACTIVITY_33807                = 1                 --使用帝都战召集令
COUNTRY_ACTIVITY_33808                = 2                 --使用盟国召集令
COUNTRY_ACTIVITY_33809                = 5                 --使用国王召集令
COUNTRY_ACTIVITY_33810                = 2                 --击破神迹
COUNTRY_ACTIVITY_33811                = 1                 --破坏国家水晶兽
COUNTRY_ACTIVITY_33812                = 30                --袭击敌国速递车
COUNTRY_ACTIVITY_33813                = 1                 --侠盗罗宾
COUNTRY_ACTIVITY_33814                = 1                 --核子魔窟
COUNTRY_ACTIVITY_33815                = 15                --国家BOSS
COUNTRY_ACTIVITY_33816                = 5                 --中立BOSS
COUNTRY_ACTIVITY_33817                = 2                 --超级BOSS

CallUpType_Normal					= 1					--普通成员召集 召集令用的是这个，其他不要用这个
CallUpType_Leader   				= 2					--召集下属
CallUpType_Force    				= 3					--强制召集

--副本类型定义
CopySceneType_Hang						= 130	   --普通挂机副本
CopySceneType_VipHang					= 131	   --Vip挂机副本
CopySceneType_JewelBattle               = 132      --宝石战场
CopySceneType_CaptureFlag               = 133      --夺旗战
CopySceneType_EventArena                = 135      --擂台战
CopySceneType_HeroIndiana               = 136      --群雄夺宝
CopySceneType_Fight                     = 137      --武半大会
CopySceneType_BossHome1                 = 138      --boss殿堂一层
CopySceneType_BossHome2                 = 139      --boss殿堂二层
CopySceneType_BossHome3                 = 140      --boss殿堂三层



--每日目标类型定义
--
enumDailySubTargetType_Null             = 0					--默认，防报错
enumDailySubTargetType_RideEvil         = 1					--佣兵任务
enumDailySubTargetType_PostCar          = 2					--运镖
enumDailySubTargetType_Guard            = 3					--守卫王城
enumDailySubTargetType_CopySceneExp     = 4				    --经验副本
enumDailySubTargetType_Prostrate        = 5				    --膜拜
enumDailySubTargetType_EquipRecycle     = 6				    --装备回收
enumDailySubTargetType_CopySceneGold    = 7			        --金币副本
enumDailySubTargetType_CopySceneTower   = 8			        --爬塔副本
enumDailySubTargetType_MoneyTree        = 9				    --摇钱树
enumDailySubTargetType_CopySceneMonster = 10		        --怪物攻城
enumDailySubTargetType_CopyScene        = 11				--巨兽围城
enumDailySubTargetType_JJC              = 12				--竞技场
enumDailySubTargetType_Hope             = 13				--宝藏
enumDailySubTargetType_EquipStrengthen  = 14			    --装备强化
enumDailySubTargetType_CopySceneEquip   = 15			    --装备副本
enumDailySubTargetType_BossActivity     = 16			    --激战boss
enumDailySubTargetType_RobTreasure      = 17				--群雄夺宝
enumDailySubTargetType_RobFlag          = 18				--夺旗战
enumDailySubTargetType_ForceFight       = 19                --武斗大会
enumDailySubTargetType_ArenaFight       = 20                --擂台战
enumDailySubTargetType_JewelFight       = 21                --宝石战场
enumDailySubTargetType_CityFight        = 22                --攻城战
enumDailySubTargetType_Rebirth			= 23				--飞升
enumDailySubTargetType_ClanSign			= 39				--宗门签到
enumDailySubTargetType_CopyTeam			= 40				--副本队伍
enumDailySubTargetType_Treasure			= 41				--宝藏任务
enumDailySubTargetType_ClanDailyTask      = 42;              -- //宗门任务
enumDailySubTargetType_ClanBoss			  = 43;             -- //宗门boss
enumDailySubTargetType_WorldExam          = 44;             -- //科举答题
enumDailySubTargetType_ClanExce		      = 45;             -- //宗门修炼
enumDailySubTargetType_ClanExam           = 46;             -- //宗门答题
enumDailySubTargetType_ClanAttack         = 47;             -- //宗门强盗
enumDailySubTargetType_Mine				= 48;             -- //晶源矿脉
enumDailySubTargetType_Mineral                             = 49;             -- //挖矿
enumDailySubTargetType_xianshi            = 53;			--限时活动
enumDailySubTargetType_Share			= 58;			  		--//每日分享
--开服竞技定义
enumServerSportType_Null			= 0
enumServerSportType_Level			= 1
enumServerSportType_Pkvalue			= 2
enumServerSportType_FindTreasure	= 3
enumServerSportType_Medal			= 4
enumServerSportType_Diamand			= 5
enumServerSportType_DragonBall		= 6
enumServerSportType_GodRing			= 7

--全民狂欢系列
enumPaySubType_Double               = 8		--超高返利
enumPaySubType_JiZiActivity			= 9		--集字活动
enumPaySubType_DoubleMine			= 11	--双倍许愿积分
enumServerSportType_Shield		= 12        --护盾
enumPaySubType_shenshi               = 301       --神石活动
enumPaySubType_longzhu               = 302       --龙珠活动
enumPaySubType_yumao                = 303       --羽毛活动
enumPaySubType_hudun                = 304       --护盾活动
--物品枚举
ItemID_GotoStone                = 10056		-- 传送石
ItemID_TowerScroll              = 10117		-- 爬塔副本卷轴
ItemID_Special_JadeFragment     = 19103		-- 魔神秘典碎片
ItemID_Special_DiamondFragment  = 19104		-- 温神莲碎片
ItemID_Special_PearlFragment    = 19011		-- 玄印碎片
ItemID_Special_RingFragment     = 19012		-- 灵戒碎片
ItemID_Special_AchievementPoint = 19101		-- 成就积分
ItemID_Special_Soul             = 19010		-- 狩魂值
ItemID_Special_RebirthPoint     = 19008		-- 飞升神力
ItemID_Special_TitleFragment    = 19100		-- 佣兵/称号积分
ItemID_Special_SkillPoint       = 19009		-- 技能残页
ItemID_HorseUp_ExpPowder		= 19016		-- 坐骑丹
ItemID_Special_WingExp			= 19017		-- 翅膀经验
ItemID_Special_ShieldFragment  = 19023         -- 护盾碎片
ItemID_Special_HaloExp  = 500004         -- 魂印经验
--CharBase属性值,根据定义时的相关位置
CharBase_ID				= 1                 -- ID
CharBase_Accid			= 2					-- 账号
CharBase_Name			= 3					-- 角色名
CharBase_Level			= 4					-- 等级
CharBase_Type			= 5					-- 职业
CharBase_Sex			= 6					-- 性别


--单次许愿扣除元宝数
MINE_COST		= 20
MINE_POINTS		= 1
