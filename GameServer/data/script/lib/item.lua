Item_Attribute_Bind					= 1	--绑定标志
Item_Attribute_Level 				= 2	--道具等级
Item_Attribute_Dur					= 3	--道具耐久
Item_Attribute_Judge				= 4	--基础鉴定见enumJudgeBase
Item_Attribute_SoulJudge			= 5	--灵魂鉴定见enumJudgeSoul
Item_Attribute_Prefix				= 6	--前缀
Item_Attribute_Quality				= 7	--品质
Item_Attribute_MaxDur				= 8	--最大耐久
Item_Attribute_BuyBackPrice			= 9	--回购价格

--基本属性(白装属性+鉴定属性+升星)
Item_Attribute_Pdam					= 10	--物攻增加
Item_Attribute_Mdam					= 11	--化攻(魔攻)增加
Item_Attribute_Phit					= 12	--物命中增加
Item_Attribute_Mhit					= 13	--化命中增加
Item_Attribute_Pdef					= 14   --物防增加
Item_Attribute_Mdef					= 15	--化防(魔防)增加
Item_Attribute_Maxhp				= 16	--生命值上限增加
--抗性定为绑定属性
Item_Attribute_RNdam				= 17	--火焰攻击
Item_Attribute_GBdam				= 18	--闪电攻击
Item_Attribute_SBdam				= 19	--自然攻击
Item_Attribute_SHdam				= 20	--冰霜攻击
Item_Attribute_RNdef				= 21	--火焰防御
Item_Attribute_GBdef				= 22	--闪电防御
Item_Attribute_SBdef				= 23	--自然防御
Item_Attribute_SHdef				= 24	--冰霜防御

Item_Attribute_Mvspd				= 25	--移动速度(万) 蓝色属性

Item_Attribute_StrengthenLv			= 26	--强化等级

--灵魂属性
Item_Attribute_SoulFive				= 27	--灵魂五行
Item_Attribute_SoulNeedFive			= 28	--激活需要的五行
Item_Attribute_SoulNeedID			= 29	--激活需要的id
Item_Attribute_SoulMaxhp			= 30	--灵魂生命增加
Item_Attribute_SoulLucky			= 31	--致命一击
Item_Attribute_SoulIgnoredef		= 32	--忽视防御
Item_Attribute_SoulBang				= 33	--灵魂重击
Item_Attribute_SoulHurtecho			= 34	--伤害反射
Item_Attribute_SoulPhurtsub			= 35	--物理伤害减少
Item_Attribute_SoulMhurtsub			= 36	--化学伤害减少

--/宝石镶嵌属性
Item_Attribute_HoleNum				= 37	--孔的数量
Item_Attribute_HoleColor1			= 38	--孔的颜色EnumHoleColor
Item_Attribute_HoleColor2			= 39	--
Item_Attribute_HoleColor3			= 40	--
Item_Attribute_HoleColor4			= 41	--
Item_Attribute_HoleColor5			= 42	--
Item_Attribute_HoleColor6			= 43	--
Item_Attribute_HoleColor7			= 44	--
Item_Attribute_HoleStone1			= 45	--孔上宝石id
Item_Attribute_HoleStone2			= 46	--
Item_Attribute_HoleStone3			= 47	--
Item_Attribute_HoleStone4			= 48	--
Item_Attribute_HoleStone5			= 49	--
Item_Attribute_HoleStone6			= 50	--
Item_Attribute_HoleStone7			= 51	--

--/镶嵌的石头属性
Item_Attribute_StonePdam			= 52	--物攻增加 Item_Attribute_StoneRNdam
Item_Attribute_StoneMdam			= 53	--魔攻追加 Item_Attribute_StoneGBdam
Item_Attribute_StonePdef			= 54	--物防追加 Item_Attribute_StoneSBdam
Item_Attribute_StoneMdef			= 55	--冰霜伤害追加 Item_Attribute_StoneSHdam
Item_Attribute_StoneMaxhp			= 56	--生命值追加

--/宝石激活属性
Item_Attribute_HolePdam1			= 57	--物理攻击力追加
Item_Attribute_HoleMdam1			= 58	--化学攻击追加
Item_Attribute_HolePdef1			= 59	--物理防御追加
Item_Attribute_HoleMdef1			= 60	--化学防御追加
Item_Attribute_HolePhit1			= 61	--物理命中
Item_Attribute_HoleMhit1			= 62	--化学命中
Item_Attribute_HoleMaxhp1			= 63	--最大生命追加

Item_Attribute_HolePdam2			= 64   --物理攻击力追加
Item_Attribute_HoleMdam2			= 65   --化学攻击追加
Item_Attribute_HolePdef2			= 66   --物理防御追加
Item_Attribute_HoleMdef2			= 67   --化学防御追加
Item_Attribute_HolePhit2			= 68   --物理命中
Item_Attribute_HoleMhit2			= 69   --化学命中
Item_Attribute_HoleMaxhp2			= 70	--最大生命追加

Item_Attribute_HolePdam3			= 71   --物理攻击力追加
Item_Attribute_HoleMdam3			= 72   --化学攻击追加
Item_Attribute_HolePdef3			= 73   --物理防御追加
Item_Attribute_HoleMdef3			= 74   --化学防御追加
Item_Attribute_HolePhit3			= 75   --物理命中
Item_Attribute_HoleMhit3			= 76   --化学命中
Item_Attribute_HoleMaxhp3			= 77	--最大生命追加
--以下是蓝色属性 begin
--/附加攻防属性（+c）
Item_Attribute_ExtPdam				= 78	--物理攻击附加
Item_Attribute_ExtMdam				= 79	--化学攻击附加
Item_Attribute_ExtPdef				= 80	--物理防御附加
Item_Attribute_ExtMdef				= 81	--化学防御附加
Item_Attribute_ExtMaxhp				= 82	--最大生命附加
Item_Attribute_ExtMaxsp				= 83	--最大CGuiStartDialog值附加
Item_Attribute_ExtPhit				= 84	--物理命中附加
Item_Attribute_ExtMhit				= 85	--化学命中附加
Item_Attribute_ExtHide				= 86	--闪避率增加(10000)

--特殊属性
Item_Attribute_AddHp				= 90	--杀怪增加血量
Item_Attribute_AddSp				= 91	--杀怪增加CGuiStartDialog
Item_Attribute_AddExp				= 92	--杀怪增加经验
--以上是蓝色属性
Item_Attribute_AddMaxDam			= 93	--增加最大值输出几率
Item_Attribute_LostCoin				= 94	--绑银掉落几率
Item_Attribute_SubCostSp			= 95	--减少CGuiStartDialog消耗
Item_Attribute_AddCureHp			= 96	--吃药效果提升
Item_Attribute_Lottery_Code			= 97	--幸运号码
Item_Attribute_LockTime				= 98	--装备锁

Item_Attribute_Demon_Type 			= 101	--灵异兽类型
Item_Attribute_Demon_Level 			= 102	--等级
Item_Attribute_Demon_Exp			= 103	--经验
Item_Attribute_Demon_Pdam			= 104	--物攻
Item_Attribute_Demon_Mdam			= 105	--化攻(魔攻)
Item_Attribute_Demon_Pdef			= 106	--物防
Item_Attribute_Demon_Mdef			= 107	--化防(魔防)
Item_Attribute_Demon_Maxhp			= 108	--生命
Item_Attribute_Demon_BottomZ		= 109	--资质下限
Item_Attribute_Demon_Liliang		= 110	--力量
Item_Attribute_Demon_Zhili			= 111 	--智力
Item_Attribute_Demon_Minjie			= 112	--敏捷
Item_Attribute_Demon_Tizhi	 		= 113	--体质
Item_Attribute_Demon_Jingshen   	= 114 	--精神
Item_Attribute_Demon_LiliangZ	  	= 115 	--力量资质
Item_Attribute_Demon_ZhiliZ			= 116 	--智力
Item_Attribute_Demon_MinjieZ		= 117 	--敏捷
Item_Attribute_Demon_TizhiZ			= 118	--体质
Item_Attribute_Demon_JingshenZ		= 119	--精神
Item_Attribute_Demon_Grade			= 120 	--品阶
Item_Attribute_Demon_GrowthRate		= 122	--成长率
Item_Attribute_Demon_Potential		= 123	--潜能（原来的骑宠用，废弃）
Item_Attribute_Demon_MaxPotential	= 124	--潜能上限（原来的骑宠用，废弃）
Item_Attribute_Demon_Loyalty		= 125 	--忠诚度
Item_Attribute_Demon_MaxLoyalty		= 126	--忠诚度上限
--Item_Attribute_Demon_Life	 		= 127	--寿命
--Item_Attribute_Demon_MaxLife		= 128	--寿命上限
Item_Attribute_Demon_Scholar		= 129	--奖学金
Item_Attribute_Demon_FosterExp		= 130	--领养经验
Item_Attribute_Demon_NewPoint		= 131	--未分配的属性点
Item_Attribute_Demon_OldPoint		= 132	--已经分配的属性点
Item_Attribute_Demon_State			= 133	--出战标志1-出战2-合体，3-骑乘 4-游乐园（现在只有游园再用，请谨慎使用）
Item_Attribute_Demon_EvolveTime		= 134	--进化次数
Item_Attribute_Demon_Tool1			= 135	--宠物道具1（baseid）
Item_Attribute_Demon_Tool2			= 136	--
Item_Attribute_Demon_Tool3			= 137	--
Item_Attribute_Demon_Tool4			= 138	--
Item_Attribute_Demon_ToolTime1		= 139	--道具1的时间
Item_Attribute_Demon_ToolTime2		= 140	--
Item_Attribute_Demon_ToolTime3		= 141	--
Item_Attribute_Demon_ToolTime4		= 142	--
--Item_Attribute_Demon_FollowAbility	= 143	--融合度
Item_Attribute_Demon_FeedTime1		= 144	--喂养时间(快乐度)
Item_Attribute_Demon_FeedTime2		= 145	--喂养时间(潜能)（原来的骑宠用，废弃）
Item_Attribute_Demon_JudgeDay		= 146	--鉴定时间(天)
Item_Attribute_Demon_JudgeTimes		= 147	--鉴定技能次数
Item_Attribute_Demon_RepairDay		= 148	--修理时间(天)
Item_Attribute_Demon_RepairTimes	= 149	--修理技能使用次数
Item_Attribute_Demon_GohomeDay		= 150	--回城技能时间
Item_Attribute_Demon_GohomeTimes	= 151	--回城技能使用次数
Item_Attribute_Demon_PotentialTime	= 152	--上次修改潜能时间（原来的骑宠用，废弃）
Item_Attribute_Demon_Relive_Times	= 153	--宠物重生次数
Item_Attribute_Demon_Breed_Times	= 154	--宠物繁殖次数
Item_Attribute_Demon_Total_Scores	= 155	--宠物繁殖次数
Item_Attribute_Demon_Adopt_Id		= 156	--领养者
--奇异兽技能开始(161-200预留给奇异兽技能)
Item_Attribute_Demon_Skill1			= 161	--主动技能１
Item_Attribute_Demon_Skill2			= 162	--技能２
Item_Attribute_Demon_Skill3			= 163	--
Item_Attribute_Demon_Skill4			= 164	--
Item_Attribute_Demon_Skill5			= 165	--
Item_Attribute_Demon_Skill6			= 166	--
Item_Attribute_Demon_Skill7			= 167	--
Item_Attribute_Demon_Skill8			= 168	--
Item_Attribute_Demon_Skill9			= 169	--
Item_Attribute_Demon_Skill10		= 170	--
Item_Attribute_Demon_Skill11		= 171	--
Item_Attribute_Demon_Skill12		= 172	--
Item_Attribute_Demon_Skill13		= 173	--
Item_Attribute_Demon_Skill14		= 174	--
Item_Attribute_Demon_Skill15		= 175	--
Item_Attribute_Demon_SkillMax		= 176  --技能最大值

--/镶嵌的水晶属性
Item_Attribute_PerSubEcho			= 185	--反伤减免

--额外其他属性
Item_Attribute_StarMax				= 188	--升星上限
Item_Attribute_Order_Power_History  = 189  --本件装备的历史最大战力数值
Item_Attribute_Order_Power			= 190	--装备战斗力排行数值
Item_Attribute_StarUpOkTimes		= 191	--升星连续成功次数
Item_Attribute_ZFB_Type				= 192	--ZFB类型
Item_Attribute_ZFB_Num				= 193	--ZFB携带数量
Item_Attribute_WB_Type				= 194	--微币类型
Item_Attribute_WB_Num				= 195	--微币携带数量
Item_Attribute_QQ_Num				= 196	--QQ币携带数量
Item_Attribute_Rebind_Level			= 197	--重绑等级
Item_Attribute_Rebind_Value			= 198	--重绑等级
Item_Attribute_StarUp_Wish			= 199	--升星祝福标志
Item_Attribute_LifeTime				= 200	--记录一个时间
Item_Attribute_Hair					= 201	--头发id
Item_Attribute_Face					= 202	--脸型id
Item_Attribute_PosCountry			= 203	--记录位置国家
Item_Attribute_PosMap				= 204	--记录位置地图
Item_Attribute_PosX					= 205	--记录位置x坐标
Item_Attribute_PosY					= 206	--记录位置y坐标
Item_Attribute_GuardBoxNeedMoney    = 207  --团训练宝箱需要资金
Item_Attribute_GuardBoxMoney        = 208  --团训练宝箱当前资金
Item_Attribute_FoodMood				= 209	--养殖道具心情属性
Item_Attribute_FoddAppet			= 210	--养殖道具胃口属性
Item_Attribute_EnergyValue			= 211	--精力携带值
Item_Attribute_OccupyID				= 212	--传送胶囊占领ID
Item_Attribute_MinLevel				= 213	--星星合金需要等级下限
Item_Attribute_MaxLevel				= 214	--星星合金需要等级上限
Item_Attribute_LotteryID			= 215	--彩票编号
Item_Attribute_LotteryMultiNum		= 216	--彩票多选号码
Item_Attribute_LotteryExtraNum		= 217	--彩票额外号码
Item_Attribute_LotteryAmount		= 218	--彩票组数
Item_Attribute_LotteryExpiry		= 219	--彩票过期时间
Item_Attribute_LotteryBuyTime		= 220	--彩票购买时间
Item_Attribute_DataDay				= 221	--道具使用日期
Item_Attribute_DataTimes			= 222	--道具当日使用次数
Item_Attribute_Source				= 223	--产出地来源(地图ID)
Item_Attribute_LeftHPSP				= 224	--氧疗药剂剩余量
Item_Attribute_TakeExp				= 225	--携带经验
Item_Attribute_TakeOffer			= 226	--携带团勋章
Item_Attribute_UseCount				= 227	--道具次数
Item_Attribute_LastUseTime			= 228	--上次道具时间
Item_Attribute_QQ_Type				= 229	--QQ币类型

--属性点属性(卡片1卡片使用)
Item_Attribute_Liliang1				= 230	--力量
Item_Attribute_Zhili1				= 231	--智力
Item_Attribute_Minjie1				= 232	--敏捷
Item_Attribute_Tizhi1				= 233	--体质
Item_Attribute_Jingshen1			= 234	--精神

--属性点属性(卡片2)
Item_Attribute_Liliang2             = 235  --力量
Item_Attribute_Zhili2               = 236  --智力
Item_Attribute_Minjie2              = 237  --敏捷
Item_Attribute_Tizhi2               = 238  --体质
Item_Attribute_Jingshen2            = 239  --精神

--属性点属性(卡片3)
Item_Attribute_Liliang3             = 240  --力量
Item_Attribute_Zhili3               = 241  --智力
Item_Attribute_Minjie3              = 242  --敏捷
Item_Attribute_Tizhi3               = 243  --体质
Item_Attribute_Jingshen3            = 244  --精神

--特殊属性(时装卡片组合属性)
Item_Attribute_Hadd_Lucky			= 245	--致命时伤害增加
Item_Attribute_Hadd_Force			= 246	--重击时伤害增加
Item_Attribute_Hadd_Ignore			= 247	--忽视时伤害增加
Item_Attribute_Subh_Lucky			= 248	--被致命时伤害减少
Item_Attribute_Subh_Force			= 249	--被致命时伤害减少
Item_Attribute_Subh_Ignore			= 250	--被忽视时伤害减少

--时装3个孔
Item_Attribute_HoleCard1			= 251	--第一个孔卡片ID
Item_Attribute_HoleCard2			= 252	--
Item_Attribute_HoleCard3			= 253	--

--/幻化(外形baseid)
Item_Attribute_ModelCurrentid       = 258  -- 当前显示外观id
Item_Attribute_ModelBaseid			= 259	--幻化id

Item_Attribute_Horse_Equip_Num		= 260	--马匹装备栏数量
Item_Attribute_Horse_Equip_Level	= 261	--马匹骑乘需要等级
Item_Attribute_Horse_Passenger		= 262	--马匹搭载乘客数量
Item_Attribute_Horse_Fighting		= 263	--马匹能否战斗

Item_Attribute_PerPdam				= 270	--物攻增加百分比
Item_Attribute_PerMdam				= 271	--化攻(魔攻)增加百分比
Item_Attribute_PerPdef				= 272	--物防增加百分比
Item_Attribute_PerMdef				= 273	--化防(魔防)增加百分比
Item_Attribute_PerMaxhp				= 274	--生命增加百分比

--魂玉精炼
Item_Attribute_HaloRefine			= 276	--精炼等级
Item_Attribute_HaloExp                       = 277   --精炼经验

--神兵魔武专用属性
Item_Attribute_Shenbing_PerDef				= 281	--防御力增加百分比
Item_Attribute_Shenbing_PerDam				= 282	--攻击力增加百分比
Item_Attribute_Shenbing_PerMaxhp			= 283	--生命值增加百分比
Item_Attribute_Shenbing_Liliang				= 284	--力量属性点增加
Item_Attribute_Shenbing_Zhili				= 285	--智力属性点增加
Item_Attribute_Shenbing_Minjie				= 286	--敏捷属性点增加
Item_Attribute_Shenbing_Tizhi				= 287	--体质属性点增加
Item_Attribute_Shenbing_Jingshen			= 288	--精神属性点增加

--镶嵌宝石进阶等级
Item_Attribute_HoleStone1Level      = 290  --第一孔宝石进阶等级
Item_Attribute_HoleStone2Level      = 291  --第二孔宝石进阶等级
Item_Attribute_HoleStone3Level      = 292  --第三孔宝石进阶等级
Item_Attribute_HoleStone4Level      = 293  --第四孔宝石进阶等级
Item_Attribute_HoleStone5Level      = 294  --第五孔宝石进阶等级
Item_Attribute_HoleStone6Level      = 295  --第六孔宝石进阶等级
Item_Attribute_HoleStone7Level      = 296  --第七孔宝石进阶等级

Item_Attribute_Accid				= 297	--保存玩家accid角色交易道具上用
Item_Attribute_Crystal_Country		= 298	--生命水晶所属国家
Item_Attribute_Crystal_Time			= 299	--生命水晶剩余时间

Item_Attribute_WuShuang				= 300  --无双斗气值
Item_Attribute_MoShen				= 301  --魔神斗气值
Item_Attribute_ShengDun				= 302  --神盾斗气值
Item_Attribute_ShenGuang			= 303  --圣光斗气值
Item_Attribute_BuMie				= 304  --不灭斗气值

--升星熔炼
Item_Attribute_EquipSmelt_Star		= 310	-- 升星熔炼当前等级 1白2蓝3黄4，绿 5紫
--宠物游园
Item_Attribute_Demon_PlayDay		= 311	-- 宠物游乐园最近一次进入日期
Item_Attribute_Demon_PlayTime		= 312	-- 宠物游乐园当日游玩时间

--按二进制位确定是否已经领取对应奖励 从低位开始 依次是由低到高的奖励是否领取
Item_Attribute_Old_Soldier_Reward	= 313	-- 老兵逆袭奖励领取状态
Item_Attribute_Vigor_Point_Item_Award	= 314	-- 活力点奖励领取状态

Item_Attribute_HorsePerPdam			= 320	--物攻增加百分比
Item_Attribute_HorsePerMdam			= 321  --化攻(魔攻)增加百分比
Item_Attribute_HorsePerPdef			= 322  --物防增加百分比
Item_Attribute_HorsePerMdef			= 323  --化防(魔防)增加百分比
Item_Attribute_HorsePerMaxHp		= 324  --生命增加百分比

-- 特殊属性(百分比)
Item_Attribute_PerAddHP				= 330	--生命增加百分比
Item_Attribute_PerHide				= 331	--闪避
Item_Attribute_SubPH				= 332	--被攻击物理减伤
Item_Attribute_SubMH				= 333	--被攻击化学减伤
Item_Attribute_Force				= 334	--重击
Item_Attribute_ForceDef				= 335	--抗重击
Item_Attribute_Lucky				= 336	--致命一击(暴击)
Item_Attribute_LuckyDef				= 337	--抗致命一击(暴击)
Item_Attribute_IgnoreDef			= 338	--忽视防御
Item_Attribute_IgnoreDefDef			= 339	--抗忽视防御
Item_Attribute_HurtEcho				= 340	--伤害反射
Item_Attribute_HurtEchoDef			= 341	--抗伤害反射

Item_Attribute_HolePdam4			= 351   --物理攻击力追加
Item_Attribute_HoleMdam4			= 352   --化学攻击追加
Item_Attribute_HolePdef4			= 353   --物理防御追加
Item_Attribute_HoleMdef4			= 354   --化学防御追加
Item_Attribute_HolePhit4			= 355   --物理命中
Item_Attribute_HoleMhit4			= 356   --化学命中
Item_Attribute_HoleMaxhp4			= 357	--最大生命追加

--/坐骑纹章属性
Item_Attribute_Horse_HoleStone1		= 360	--纹章1孔宝石id
Item_Attribute_Horse_HoleStone2		= 361	--纹章2孔宝石id
Item_Attribute_Horse_HoleStone3		= 362	--纹章3孔宝石id
Item_Attribute_Horse_HoleStone4		= 363	--纹章4孔宝石id
Item_Attribute_Horse_HoleStone5		= 364	--纹章5孔宝石id
Item_Attribute_Horse_HoleStone6		= 365	--纹章6孔宝石id
Item_Attribute_Horse_HoleStone7		= 366	--纹章7孔宝石id

--坐骑驯养技能开始(370-399预留给坐骑驯养技能)
Item_Attribute_Horse_Skill1         = 370  --技能1
Item_Attribute_Horse_Skill2         = 371  --技能２
Item_Attribute_Horse_Skill3         = 372  --
Item_Attribute_Horse_Skill4         = 373  --
Item_Attribute_Horse_Skill5         = 374  --
Item_Attribute_Horse_Skill6         = 375  --
Item_Attribute_Horse_Skill7         = 376  --
Item_Attribute_Horse_Skill8         = 377  --
Item_Attribute_Horse_Skill1Max		= 378

--升星保底
Item_Attribute_Level_Max			= 400	--本装备最高星数
Item_Attribute_Level_MaxTime		= 401	--最后一次挑战本装备最高星的时间
Item_Attribute_Level_BadTimes		= 402	--本次失败次数
Item_Attribute_Level_AddRate        = 403  --升星失败增加成功率
Item_Attribute_Level_LastBadTimes   = 404  --最后一次升星失败时间

--坐骑装备
Item_Attribute_Refine_Level			= 410	--坐骑装备炼化等级
Item_Attribute_Horse_Level			= 411	--坐骑装备强化等级
Item_Attribute_Refine_Level_BadTimes= 412	--坐骑装备炼化失败次数

--坐骑资质
Item_Attribute_Horse_LevelZ			= 420	--坐骑资质等级
Item_Attribute_Horse_PdamZ			= 421  --坐骑物理攻击资质
Item_Attribute_Horse_MdamZ			= 422	--坐骑化学攻击资质
Item_Attribute_Horse_PdefZ			= 423	--坐骑物理防御资质
Item_Attribute_Horse_MdefZ			= 424	--坐骑化学防御资质
Item_Attribute_Horse_MaxhpZ			= 425  --坐骑最大生命资质

Item_Attribute_Horse_CurrentExp		= 426  --坐骑当前升级经验

-- 控制属性
Item_Attribute_Silent					= 430		--静默(**预留**)
Item_Attribute_SilentDef				= 431		--抗静默
Item_Attribute_Frozen					= 432		--冰冻
Item_Attribute_FrozenDef				= 433		--抗冰冻
Item_Attribute_Change					= 434		--变形
Item_Attribute_ChangeDef				= 435		--抗变形
Item_Attribute_Faint					= 436		--眩晕
Item_Attribute_FaintDef					= 437		--抗眩晕
Item_Attribute_SpeedSub					= 438		--减速
Item_Attribute_SpeedSubDef				= 439		--抗减速
Item_Attribute_KnockDown				= 440		--击倒
Item_Attribute_KnockDownDef				= 441		--抗击倒
Item_Attribute_Repel					= 442		--击退
Item_Attribute_RepelDef					= 443		--抗击退

--/足球
Item_Attribute_FootBall_ID			= 450  --下注场次
Item_Attribute_FootBall_BetType		= 451  --下注类型
Item_Attribute_FootBall_Score		= 452  --下注积分

--装备养成
Item_Attribute_Equip_Feed			= 500	--装备养成当前值
Item_Attribute_Equip_Feed_Max		= 501	--装备养成最大值

--装备合成度
Item_Attribute_Equip_Compose		= 502	--装备合成度当前值
Item_Attribute_Equip_Compose_Max	= 503	--装备合成度最大值

--羽翼
Item_Attribute_Wing_Refine_Level	= 510	--羽翼炼化等级（灵性）
Item_Attribute_Wing_Level			= 511  --羽翼强化等级（升星）
Item_Attribute_Wing_Soul_Level		= 512	--羽翼通灵等级

--羽翼魂点
Item_Attribute_Wing_Spirit_Piece    = 513	--羽翼魂点魂性
Item_Attribute_Wing_Spirit_Liliang  = 514	--羽翼魂点-力量
Item_Attribute_Wing_Spirit_Zhili	= 515	--羽翼魂点-智力
Item_Attribute_Wing_Spirit_Minjie   = 516	--羽翼魂点-敏捷
Item_Attribute_Wing_Spirit_Tizhi    = 517	--羽翼魂点-体质
Item_Attribute_Wing_Spirit_Jingshen = 518	--羽翼魂点-精神
Item_Attribute_Wing_Spirit_Nature   = 519	--羽翼魂点-自然
Item_Attribute_Wing_Spirit_Light    = 520	--羽翼魂点-闪电
Item_Attribute_Wing_Spirit_Fire     = 521	--羽翼魂点-火焰
Item_Attribute_Wing_Spirit_Ice      = 522	--羽翼魂点-冰霜

Item_Attribute_Wing_Soul_Value		= 523	--羽翼通灵点值

--羽翼神谕
Item_Attribute_Wing_Oracle1			= 551	--神谕1id
Item_Attribute_Wing_Oracle2			= 552	--神谕2id
Item_Attribute_Wing_Oracle3			= 553	--神谕3id
Item_Attribute_Wing_Oracle4			= 554	--神谕4id

--魔法阵经验
Item_Attribute_MagicLineExp			= 560	--魔法阵经验

--/幻化(外形baseid)
Item_Attribute_Model_MaxDur			= 600	--幻化最大耐久
Item_Attribute_Model_Dur			= 601	--幻化耐久
Item_Attribute_Model_LifeTime		= 602	--幻化耐久记录一个时间
Item_Attribute_Model_Pdam			= 603	--幻化效果物理攻击提升
Item_Attribute_Model_Mdam			= 604	--幻化效果魔法攻击
Item_Attribute_Model_Pdef			= 605	--幻化效果物理防御
Item_Attribute_Model_Mdef			= 606	--幻化效果魔法防御
Item_Attribute_Model_Hp				= 607	--幻化效果生命提升

-- 神魂
Item_Attribute_GodSoul_Grade		= 610	-- 神魂阶数
Item_Attribute_GodSoul_Level		= 611	-- 神魂星数
Item_Attribute_GodSoul_Star1		= 612	-- 神魂1星
Item_Attribute_GodSoul_Star2		= 613	-- 神魂2星
Item_Attribute_GodSoul_Star3		= 614	-- 神魂3星
Item_Attribute_GodSoul_Star4		= 615	-- 神魂4星
Item_Attribute_GodSoul_Star5		= 616	-- 神魂5星
Item_Attribute_GodSoul_Star6		= 617	-- 神魂6星
Item_Attribute_GodSoul_Times		= 618	-- 本阶神魂已点次数
Item_Attribute_GodSoul_Awake_Level	= 619	-- 神魂觉醒等级
Item_Attribute_GodSoul_Swallow_Level= 620	-- 当前幻魔吞噬等级
Item_Attribute_GodSoul_Swallow_Num	= 621	-- 当前等级幻魔吞噬次数
Item_Attribute_GodSoul_Swallow_Add	= 622	-- 最近一次幻魔吞噬增加属性值
Item_Attribute_GodSoul_Swallow_Quality = 623	-- 最近一次幻魔吞噬使用的净血品质
Item_Attribute_GodSoul_Swallow_Total= 624	-- 幻魔吞噬总增加属性值


--镖车掉落物
Item_Attribute_Guard_Owner			= 650	--道具的属主
Item_Attribute_Guard_Foregift		= 651	--押金
Item_Attribute_Guard_Exp			= 652	--经验

--宫殿战旗帜
Item_Attribute_Flag					= 653	--旗帜

--烙印传奇
Item_Attribute_Brand_MaxDur			= 654	--烙印最大耐久
Item_Attribute_Brand_Dur			= 655	--烙印耐久
Item_Attribute_Brand_LifeTime		= 656	--烙印耐久记录一个时间
Item_Attribute_Brand_Quality		= 657	--烙印品质

--宠物
Item_Attribute_Demon_ExpBall_Time	= 660	--宠物最后吃奇幻球的时间
Item_Attribute_Demon_ExpBall_Num	= 661	--宠物同一天吃奇幻球的次数
Item_Attribute_Demon_Generation		= 662	--宠物的代数，0表示1代；1表示2代

--卡牌道具
Item_Attribute_Card_Show_Quality	= 665	--卡牌道具的显示品质：0表示白色，1表示蓝色...，4表示紫色

Item_Attribute_Dword_Max			= 666	--整数索引最大值
--50000以下的索引保留为字符串用
Item_Attribute_Demon_Name 			= 5001				--奇异兽名称
Item_Attribute_Maker				= 5002				--装备签名
Item_Attribute_LotteryBuyer			= 5003				--彩票购买者
Item_Attribute_Owner				= 5004				--装备所有者
Item_Attribute_String_Max 			= 50000			--字符串索引最大值


ItemType_Horse						= 57	--马匹
ItemType_LimitTimeGift              = 119   --限时礼包
ItemType_GiftReward					= 120	--礼包

Item_Attribute_Fashion_Level			= 701  --时装强化等级

--脚本增加道具相关值
AddItemAction_Normal			= 0		-- 未知
AddItemAction_Load				= 1		-- 加载
AddItemAction_Refresh			= 2		-- 刷新道具属性
AddItemAction_User				= 3		-- 从其它玩家处得到(交易;摆摊;收购 ...)
AddItemAction_Npc				= 4		-- npc买卖
AddItemAction_Script			= 5		-- 脚本获得
AddItemAction_Scene				= 6		-- 地上拣到
AddItemAction_Make				= 7		-- 打造;改造..添加
AddItemAction_Split				= 8		-- 拆分
AddItemAction_Task				= 9		-- 任务
AddItemAction_Palace			= 10	-- 九宫格宝箱
AddItemAction_SysGive			= 11	-- 系统赠送
AddItemAction_BuyBack			= 12	-- 回购道具
AddItemAction_Country			= 13	-- 国家活动，国战等
AddItemAction_Task_Add			= 14	-- 接任务需求道具
AddItemAction_Mine				= 15	-- 挖宝得到道具

AddItemAction_Target			= 20	-- 每日目标
AddItemAction_Welfare			= 21	-- 福利
AddItemAction_TodayFeedback		= 22	-- 今日回馈
AddItemAction_PreferentialGift	= 23	-- 超值礼包
AddItemAction_VIP				= 24	-- VIP
AddItemAction_RechargeRebate	= 25	-- 充值返利
AddItemAction_Revelry			= 26	-- 全民狂欢
AddItemAction_MonthCard			= 27	-- 月卡-尊贵特权
AddItemAction_OffLine			= 28	-- 挂机
AddItemAction_MineLottery		= 29	-- 许愿
AddItemAction_Achievement		= 30	-- 成就
AddItemAction_Trade				= 31	-- 交易
AddItemAction_Stall				= 32	-- 摆摊
AddItemAction_SysCompensate		= 33	-- 系统补偿
AddItemAction_RedPacket			= 34	-- 红包
AddItemAction_AttackCity		= 35	-- 攻城战
AddItemAction_GM				= 36	-- GM命令
AddItemAction_Sell				= 37	-- 道具回收（出售）
AddItemAction_Advanced			= 38	-- 道具进阶（包括灵戒兑换）
AddItemAction_Recharge			= 39	-- 充值
AddItemAction_Mail				= 40	-- 邮件
AddItemAction_Shop				= 41	-- 商城
AddItemAction_Repair			= 42	-- 修理
AddItemAction_Clan				= 43	-- 宗门
AddItemAction_UseItem			= 44	-- 使用道具
AddItemAction_Investment		= 45	-- 投资返利
AddItemAction_100FirstPay		= 46	-- 百元首充
AddItemAction_ClanSign			= 47	-- 宗门签到
AddItemAction_RebirthGift		= 48	-- 飞升礼包
AddItemAction_RedPacketClan		= 49	-- 公会红包
AddItemAction_MergeServer		= 50	-- 合服礼包
AddItemAction_EquipCompose		= 51	-- 装备合成
AddItemAction_SuperPond			= 52	-- 超级奖池
AddItemAction_TreeWater			= 53	-- 帮会神树灌溉
AddItemAction_LevelGiftBag      = 54   -- 等级大礼包
AddItemAction_Power				= 55	-- 战力奖励
AddItemAction_OfflineBack		= 56	-- 离线找回
AddItemAction_ChuanGuang		= 57	-- 闯关奖励


Item_Attribute_Polished_addhp = 1001   --//洗练血量
Item_Attribute_Polished_addsp = 1002   --//洗练法力值
Item_Attribute_Polished_minpdam = 1003 	--//洗练最小物理攻击
Item_Attribute_Polished_maxpdam = 1004 	--//洗练最大物理攻击
Item_Attribute_Polished_minmdam = 1005 	--//洗练最小法术攻击
Item_Attribute_Polished_maxmdam = 1006 	--//洗练最大法术攻击
Item_Attribute_Polished_mintdam = 1007 	--//洗练最小道术攻击
Item_Attribute_Polished_maxtdam = 1008 	--//洗练最大道术攻击
Item_Attribute_Polished_minpdef = 1009 	--//洗练最小物理防御
Item_Attribute_Polished_maxpdef = 1010 	--//洗练最大物理防御
Item_Attribute_Polished_minmdef = 1011 	--//洗练最小法术防御
Item_Attribute_Polished_maxmdef = 1012 	--//洗练最大法术防御
Item_Attribute_Polished_luckyvalue = 1013      --//洗练暴击值
Item_Attribute_Polished_luckyper = 1014                --//洗练暴击率
Item_Attribute_Polished_luckydefvalue = 1015   --//洗练暴击抵抗值
Item_Attribute_Polished_luckydef = 1016        --//洗练暴击抵抗万分比
Item_Attribute_Polished_pdefper = 1017         --//洗练物理伤害吸收
Item_Attribute_Polished_mdefper = 1018         --//洗练法术伤害吸收
Item_Attribute_Polished_intervaldef = 1019     --//洗练内功防御
Item_Attribute_Polished_intervalvalue = 1020   --//洗练内力值
Item_Attribute_Polished_intervaldam = 1021             --//洗练内功攻击
Item_Attribute_Polished_intervalrecover = 1022         --//洗练内功恢复
Item_Attribute_Polished_intervalvalueaddper = 1023     --//洗练内力百分比
Item_Attribute_Polished_hpaddper = 1024        --//洗练血量百分比
Item_Attribute_Polished_spaddper = 1025        --//洗练魔力上限百分比
Item_Attribute_Polished_maxmonsteratt = 1026   --//洗练最小对怪攻击
Item_Attribute_Polished_minmonsteratt = 1027   --//洗练最大对怪攻击
Item_Attribute_Polished_maxmonsterdef = 1028   --//洗练对怪最大防御
Item_Attribute_Polished_minmonsterdef = 1029   --//洗练对怪最小防御
Item_Attribute_Polished_hurtper = 1030         --//洗练伤害加成万分比
Item_Attribute_Polished_Final_Num = 1031       --//最终洗练属性条数
Item_Attribute_Polished_Bind_Num = 1032        --//绑定属性条数
Item_Attribute_Polished_Bind_Type1 = 1033      --//
Item_Attribute_Polished_Bind_Type2 = 1034
Item_Attribute_Polished_Bind_Type3 = 1035
Item_Attribute_Polished_Bind_Type4 = 1036
Item_Attribute_Polished_Bind_Type5 = 1037
Item_Attribute_Polished_Bind_Type6 = 1038

Item_Attribute_Polished_Temp_Type1 = 1041	--//洗练类型临时保存
Item_Attribute_Polished_Temp_Type2 = 1042
Item_Attribute_Polished_Temp_Type3 = 1043
Item_Attribute_Polished_Temp_Type4 = 1044
Item_Attribute_Polished_Temp_Type5 = 1045
Item_Attribute_Polished_Temp_Type6 = 1046
Item_Attribute_Polished_Temp_Type7 = 1047
Item_Attribute_Polished_Temp_Type8 = 1048
Item_Attribute_Polished_Temp_Type9 = 1049
Item_Attribute_Polished_Temp_Type10 = 1050

Item_Attribute_Polished_Temp_Data1 = 1051	--//洗练数值临时保存
Item_Attribute_Polished_Temp_Data2 = 1052
Item_Attribute_Polished_Temp_Data3 = 1053
Item_Attribute_Polished_Temp_Data4 = 1054
Item_Attribute_Polished_Temp_Data5 = 1055
Item_Attribute_Polished_Temp_Data6 = 1056
Item_Attribute_Polished_Temp_Data7 = 1057
Item_Attribute_Polished_Temp_Data8 = 1058
Item_Attribute_Polished_Temp_Data9 = 1059
Item_Attribute_Polished_Temp_Data10 = 1060
Item_Attribute_Polished_Horse_Speed = 1061
Item_Attribute_Polished_TotalScore = 1062
Item_Attribute_Polished_TempScore = 1063
Item_Attribute_expstone = 1080
