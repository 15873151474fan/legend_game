-------任务类型--------------------------------------
TaskType_None           = 0			---< 不识别类型 */
TaskType_Normal         = 1			---< 普通主线任务 */
TaskType_Sub 	        = 2			---< 普通支线任务 */
TaskType_Loop           = 3			---< 日常环任务*/
TaskType_Army			= 4			---< 环式任务
TaskType_Achieve		= 5			---< 成就任务*/
-------任务颜色-----------------------------------------
TaskColor_White			= 0			---< 白色 */
TaskColor_Blue			= 1			---< 兰 */
TaskColor_Yellow		= 2			---< 黄 */
TaskColor_Green			= 3			---< 绿 */
TaskColor_Purple		= 4			---< 紫 */
-------任务状态-----------------------------------------
TaskProcess_None        = 0			---< 未接任务 */
TaskProcess_Doing       = 1			---< 正在做 */
TaskProcess_CanDone     = 2			---< 可以交付 */
TaskProcess_Done        = 3			---< 已经完成 */
TaskProcess_Max         = 4			---< 最大值 */
-------任务属性--------------------------------
--以下状态是用s_getTaskValue调用的
TaskValue_State         = 1			--任务状态值
TaskValue_Operate       = 2			--任务操作值
TaskValue_Color         = 3			--任务颜色值
TaskValue_Desc          = 4			--任务描述

TaskValue_Type          = 10			--任务类型
TaskValue_Name          = 11			--任务名称
TaskValue_MinLevel      = 12			--最低等级
TaskValue_MaxLevel      = 13			--最高等级
TaskValue_PreTask       = 14			--前置任务
TaskValue_BegNpc        = 15			--开始NPC
TaskValue_EndNpc        = 16			--结束NPC
TaskValue_InitState     = 17			--初始state值
TaskValue_InitOperate   = 18			--初始operate值
TaskValue_Money         = 19			--奖励银币
TaskValue_MoneyTicket   = 20			--奖励银票
TaskValue_DayNum		= 21			--每日次数(日常任务使用)
TaskValue_Hunter        = 22   			--狩猎任务
TaskValue_GoldTicket	= 23			--奖励赠点
TaskValue_GrowthMedal   = 24			--成长勋章
TaskValue_ExpMedal      = 25			--历练勋章
TaskValue_WarMedal      = 26			--战争勋章
TaskValue_LiLian        = 27           --历练值

TaskValue_Exp           = 30			--经验公式
TaskValue_AwardItem     = 31			--奖励道具
TaskValue_NeedItem      = 32			--工具道具
TaskValue_DescText      = 33			--描述文本
TaskValue_AcceptText    = 34			--接任务文本
TaskValue_FinishText    = 35			--交任务文本
TaskValue_PromptText    = 36			--不可交文本
TaskValue_Tip			= 37			--任务提示
TaskValue_Task			= 38			--任务内容

TaskValue_MoneyGold     = 40           -- 元宝
TaskValue_BindMoneyGold = 41           -- 绑定元宝
TaskValue_JadeFrament   = 42           -- 魔神秘典碎片
TaskValue_DiamondFrament= 43           -- 宝石碎片
TaskValue_PearlFrament  = 44           -- 玄印碎片
TaskValue_RingFrament   = 45           -- 灵戒碎片
TaskValue_MedalFrament  = 46           -- 勋章碎片
TaskValue_TitleFrament  = 47           -- 称号碎片
TaskValue_ShieldFrament  = 48           -- 护盾碎片
TaskValue_Process       = 50			--任务进度状态


--/////////////////////////////////////////////////////////////
--以下状态是用s_getTaskVar调用的,注意别和上面的混淆

------主线任务\环式子任务可选任务变量索引----------------------------------
MvarIndex_Exp			= 1				-- 任务经验
MvarIndex_Money			= 2				-- 任务银币奖励
MvarIndex_Prestige		= 5				-- 奖励声望
MvarIndex_Hourglass		= 25			-- 时之沙漏已使用次数
MvarIndex_Parent		= 100			-- 随机子任务对应的父任务ID
MvarIndex_Level			= 101			-- 接任务时的等级 等级打怪任务用
MvarIndex_Round			= 102			-- 环式任务的环数
MvarIndex_Offer			= 103			-- 团勋章奖励
MvarIndex_Cmoney		= 104			-- 团资金奖励
MvarIndex_Cglory		= 105			-- 团繁荣度奖励
MvarIndex_Chealth		= 106			-- 营养指数奖励
--MvarIndex_AllRound		= 107			-- 环任务总环数
MvarIndex_Child			= 108			-- 随机任务选中的子任务ID
MvarIndex_SubTask		= 109			-- 子任务索引
MvarIndex_AllGlory		= 200			-- 繁荣度贡献奖励
MvarIndex_GrowthMedal	= 201			-- 成长勋章
MvarIndex_EndNpcID		= 202			-- 当前步骤的完成NPCID
MvarIndex_SubTaskNum	= 203			-- 任务的总步骤数

------环式任务\日常任务变量索引-------------------------
TvarIndex_CurRing		= 2				-- 环式任务当前环数
TvarIndex_Day			= 3				-- 上次天数
--TvarIndex_Week			= 4				-- 上次周数
--TvarIndex_Child			= 101			-- 随机任务选中的子任务ID
TvarIndex_CurRound		= 102			-- 环式任务当前轮数
TvarIndex_FinishFlag	= 103			-- 环式任务强制完成标志
TvarIndex_LuckTimes		= 104			-- 剩余刷新次数
TvarIndex_CurRandom		= 107			-- 随机任务当前随机次数
TvarIndex_RandomTaskID	= 108			-- 随机任务随机子任务ID
TvarIndex_LuckyStar		= 109			-- 随机任务运势
TvarIndex_TiledTimes	= 110			-- 体力点倍率
TvarIndex_TiledMode		= 111			-- 体力点奖励类型:1经验;2宝箱
TvarIndex_TiledMoneyReward		= 112	-- 赏金任务选择
TvarIndex_RandomColor   = 113           -- 随机任务颜色
TvarIndex_Lilian        = 114;          -- 任务的历练值
