--0点清除变量集
function OnZeroHourCallBack(uid,clearday,curday)
	s_setVar(uid,1,29,0)
	s_setVar(uid,1,45,0)
	s_setVar(uid,1,89,0)
	s_setVar(uid,10008,16,0)
	s_setVar(uid,10008,34008,0)
	s_setVar(uid,102,12,0)
	s_setVar(uid,102,18,0)
	s_setVar(uid,102,19,0)
	s_setVar(uid,102,22,0)
	s_setVar(uid,116,41,0) --人生转轮次数
	s_setVar(uid,116,120,0) --人生转轮当前已经获得的故事书总数
	s_setVar(uid,1,36,0)
	s_setVar(uid,101,34,0)
	s_setVar(uid,1,48,0)
	s_setVar(uid,101,61,0) --团拓展特勤机甲目标国家ID
	s_setVar(uid,101,62,0) --团拓展特勤机甲，交付水晶可获得经验次数,每日已消耗次数
	s_setVar(uid,1,300,0)	--是否充值推送
	--神恩祈福
	if s_getVar(uid,101,77) == 2 then
		for i = 77, 84 do
			s_setVar(uid,101,i,0)
		end
	end
	s_setVar(uid,101,79,0)
	s_setVar(uid,116,42,0)--回忆（达芬奇）次数
	s_setVar(uid,116,43,0)--安吉里之战（达芬奇）进入次数
	s_setVar(uid,116,44,0)--彩狐铃铛（达芬奇）次数
	s_setVar(uid,101,37,0)--功勋兑换次数
	s_setVar(uid,101,51,0)--团建设刷新次数每日清零
	s_setVar(uid,102,20,0)--冒险岛复活盾兑换次数
	s_setVar(uid,102,34,0)--冒险岛骑魂残影兑换次数
	s_addVar(uid,116,48,0)--清除每日福利宝箱领取次数
	s_setVar(uid,10001,23,0)--清除最牛指挥官奖励
	s_addVar(uid,116,49,0)--清除指挥棒每日使用次数
	s_addVar(uid,1,41,0)--清除炼金材料每日兑换次数
	s_setVar(uid,117,3,0)--清除每日奇兵交锋次数
	s_addVar(uid,102,30,0)--清除帝都召集令使用次数
	s_setVar(uid,117,4,0)--清除每日膜拜帝皇次数
	s_setVar(uid,107,5,0)--清除免费刷新次数
	s_setVar(uid,116,53,0)--清除帝都战预备战泉水交付次数
	s_setVar(uid,116,59,0)--清除人生转轮打折购买
	s_setVar(uid,116,61,0)--清除矮人的锤炼石购买次数
	s_addVar(uid,11,501,0)--典当升级宝石中
	s_addVar(uid,12,27108,0)--捡取升级宝石中
	s_addVar(uid,13,27108,0)--捡取不绑定升级宝石中
	s_addVar(uid,116,64,0)--清除每日赏金救援经验选择
	s_addVar(uid,116,65,0)--清除每日赏金救援卷轴选择
	s_addVar(uid,116,100,0)--清除玩家领取特权奖励的状态
	s_addVar(uid,116,66,0)--清除每日瑞恩日记兑换次数
	s_addVar(uid,116,67,0)--清除每日瑞恩天地宝库每人每日进入次数
	s_addVar(uid,10007,5,0)--清除每日化妆舞会次数，万圣节
	s_addVar(uid,101,49,0)--清除巴别塔每日连续挑战成功的层数
	s_setVar(uid,116,60,0)--BOSS喂养刷新次数
	s_setVar(uid,116,51,0)--圣诞神之水滴
	s_setVar(uid,101,8,0)--清除要人警护 汇报次数
	s_setVar(uid,116,73,0)--视察报告每日清除
	s_addVar(uid,116,74,0)--清除宠物玩耍每日次数
	s_setVar(uid,116,75,0)--清除今日军衔领取次数
	s_setVar(uid,1,50,0) --委托任务每日发布次数
	s_setVar(uid,116,50,0)--春节烟花每日次数
	s_setVar(uid,116,45,0)--春节堆雪人每日次数
	s_setVar(uid,10009,1,0)--春节堆雪人领取奖励
	s_setVar(uid,10009,2,0)--春节新年爆竹领取奖励
	s_setVar(uid,101,52,0)--玩家当日在飞跃彩虹谷副本中成功操作的次数
	s_setVar(uid,101,53,0)--玩家当日是否可见他国金库情报
	s_setVar(uid,101,54,0)--金库奇袭时，玩家召唤出的罗宾ID
	s_setVar(uid,101,55,0)--金库奇袭时，玩家召唤出的金库ID
	s_setVar(uid,116,80,0)--每日魔汁兑换次数
	s_setVar(uid,10013,3,0)--每日小丑翻牌次数
	s_setVar(uid,14,16,0) --今日A矿已开采数量
	s_setVar(uid,14,17,0) --今日B矿已开采数量
	s_setVar(uid,14,18,0) --今日C矿已开采数量
	s_setVar(uid,14,19,0) --今日A药已开采数量
	s_setVar(uid,14,20,0) --今日B药已开采数量
	s_setVar(uid,14,21,0) --今日C药已开采数量
	s_setVar(uid,125,8,0) --押注金额
	s_setVar(uid,125,9,0) --押注国
	s_setVar(uid,125,10,0) --押注区
	s_setVar(uid,125,11,0) --是否获得跨区国战包
	--s_setVar(uid,116,52,0)--春节烟花每次冷却
	s_setVar(uid,116,98,0) --当天在线时间累积的知名度
	s_setVar(uid,10013,6,0) --七夕礼盒每日
	s_setVar(uid,116,133,0)	--帝都押运今日参加次数
	s_setVar(uid,116,179,0) --感恩节火鸡盛宴每日清空次数
	s_setVar(uid,116,180,0) --感恩节火鸡盛宴每次冷却时间
	s_setVar(uid,116,181,0) --感恩节烧焦鸡毛兑换次数每日清空
	s_setVar(uid,116,207,0) --圣诞节活动兑换装备礼包次数每日清空
	s_setVar(uid,116,208,0) --圣诞节活动兑换斗气石礼包次数每日清空
	s_setVar(uid,116,209,0) --圣诞节活动兑换血脉升级宝次数每日清空
	s_setVar(uid,116,210,0) --圣诞节活动兑换玉髓礼盒次数每日清空
	s_setVar(uid,116,211,0) --圣诞节活动兑换炼金材料券次数每日清空
	s_setVar(uid,116,212,0) --圣诞节活动兑换上古神魂印记次数每日清空
	s_setVar(uid,116,213,0) --圣诞节活动领取圣诞老人礼盒每日清空
	s_setVar(uid,116,214,0) --圣诞节活动充值返还每日清空
	s_setVar(uid,116,215,0) --圣诞节活动前线速递变量每日清空
	s_setVar(uid,116,223,0) --春节拜年NPC变量
	s_setVar(uid,116,224,0) --春节拜年NPC变量
	s_setVar(uid,116,225,0) --春节拜年NPC变量
	s_setVar(uid,116,226,0) --春节拜年NPC变量
	s_setVar(uid,116,227,0) --春节拜年NPC变量
	s_setVar(uid,116,228,0) --春节拜年NPC变量
	s_setVar(uid,116,404,0) --劳动节100级以上变量
	s_setVar(uid,116,431,0) --暑期活动拉镖给种子变量
	s_setVar(uid,116,443,0) --领取对应等级奖励次数
	s_setVar(uid,100,57,0)	--宫殿战杀敌数
	s_setVar(uid,16,4,0)	--国家BOSS每日积分
	s_setVar(uid,16,5,0)    --中立区BOSS每日积分
	s_setVar(uid,16,6,0)    --世界BOSS每日积分
	s_setVar(uid,8,114,0)	--水晶押运兽领取复活盾时间
	s_setVar(uid,8,115,0)	--水晶押运兽每日领取复活盾次数
	s_setVar(uid,101,42,0)	--欢乐谷持续时间
	s_setVar(uid,101,33,0)	--骑魂谷持续时间
	s_setVar(uid,101,10,0)	--探险者地宫持续时间
	s_setVar(uid,1,94,0)	--活力领金币每日标记
	s_setVar(uid,1,98,0)	--每日杀人职业精修度
	s_setVar(uid,103,103,0) --前哨掌旗官当日国战积分
	s_setVar(uid,103,104,0) --天象祭坛当日国战积分
	s_setVar(uid,103,105,0) --魔神将军当日国战积分
	s_setVar(uid,103,106,0) --霸者雕像当日国战积分
	s_setVar(uid,103,107,0) --主神当日国战积分
	s_setVar(uid,114,22,0)	--救援镖车当日奖励次数清0
	s_setVar(uid,114,22,0)	--救援镖车当日奖励次数清0
	s_setVar(uid,116,451,0) --端午打折卡兑换3级合成材料
	s_setVar(uid,116,452,0) --端午打折卡兑换幸运宝石
	s_setVar(uid,116,453,0) --端午打折卡兑换升级宝石
	s_setVar(uid,116,454,0) --端午打折卡兑换血精石
	s_setVar(uid,116,455,0) --端午打折卡兑换重铸材料
	s_setVar(uid,116,456,0) --端午打折卡兑换命运骰子
	s_setVar(uid,116,457,0) --端午打折卡兑换金刚钻
	s_setVar(uid,116,459,0) --暑期活动兑换马鞭
	s_setVar(uid,116,460,0) --暑期活动兑换1级宝石盒


	--重用型
	s_setVar(uid,116,46,0)--重用变量
	s_setVar(uid,116,116,0)--鹊字每日上限清除
	s_setVar(uid,116,117,0)--桥字每日上限清除
	s_setVar(uid,116,118,0)--相字每日上限清除
	s_setVar(uid,116,119,0)--会字每日上限清除
	s_setVar(uid,116,165,0)--南瓜藏宝箱上限清零
	s_setVar(uid,116,449,0)--儿童节绑银兑换次数清零
	s_setVar(uid,16,2,0)   --签到每日清零
	s_setVar(uid,17,2,0)   --开服七天豪礼每日清零

	--月处理
	if s_getVar(uid,16,3) ~= s_getCurTime(TIME_CURMONTHS)+1 then
		monthclear(uid)
		investmentclear(uid)
		s_setVar(uid,16,3,s_getCurTime(TIME_CURMONTHS)+1)
	end
	if s_getVar(uid,16,7) ~= s_getCurTime(TIME_CURYWEEKS) and s_getCurTime(TIME_CURWDAYS) ~= 0 then
		weekclear(uid)
		s_setVar(uid,16,7,s_getCurTime(TIME_CURYWEEKS))
	end
    --以下是皇图的相关清理
    s_setVar(uid,160,1,0) --佣兵每天次数清零
    s_setVar(uid,160,7,0) --佣兵每天购买次数清零
    s_setVar(uid,161,7,0) --押镖每天购买次数清零
    s_setVar(uid,161,1,0) --押镖任务清零
    s_setVar(uid,161,8,0) --每日劫镖次数
    s_setVar(uid,162,2,0) --守卫王者每日次数清零
    s_setVar(uid,140,12,5) --惊奇副本每日次数
    s_setVar(uid,140,15,5) --英雄副本每日次数
    s_setVar(uid,140,16,5) --惊奇副本每日购买次数
    s_setVar(uid,140,17,5) --英雄副本每日购买次数
    s_setVar(uid,163,2,0) --宝石战场每日上获得次数
    s_setVar(uid,164,1,0) --每日使用小袋金币次数
    s_setVar(uid,164,2,0) --每日使用龙魂珠(中)次数
    s_setVar(uid,164,3,0) -- 每日使用爬塔副本卷轴次数
    s_setVar(uid,164,4,0) --每日使用龙魂珠(大)次数
	s_setVar(uid,164,9,0) --每日使用装备锁次数
    s_setVar(uid,165,1,0) --每日摇钱树次数
    s_setVar(uid,164,5,0) --经验丹(小)每日使用次数
    s_setVar(uid,164,6,0) --经验丹(中)每日使用次数
    s_setVar(uid,164,7,0) --经验丹(大)每日使用次数
	s_setVar(uid,164,8,0) --BOSS封印每日使用次数
    s_setVar(uid,143,3,4) --飞升兑换经验次数

    -- 交易限制
    s_setVar(uid,145,1,0) -- 每日累积交易元宝（交易&摆摊：收入）
    s_setVar(uid,145,2,0) -- 每日累积交易元宝（交易&摆摊：支出）

	--日常副本清理
	if DailyCopyResetUserVar ~= nil then --日常副本清理
		DailyCopyResetUserVar(uid)
	end
    s_setVar(uid,149,4,0) -- 爬塔副本：当前通过的最高层
    s_setVar(uid,149,5,2) -- 爬塔副本：今日剩余重置次数

	-- VIP每日免费原地复活次数刷新
	if FreshVipFreeReliveCount ~= nil then
		FreshVipFreeReliveCount(uid)
    end

	--充值相关
	s_setVar(uid,178,4,0) -- 今日累积充值RMB
	s_setVar(uid,178,5,0) -- 今日累积购买元宝（不包括额外赠送）

	--怪物迷宫次数每日清零
	s_setVar(uid, 153, 3, 0)

	--月卡
	s_setVar(uid,149,18,0) -- 今日是否已领取元宝

	--充值活动按钮top2
	if ActivityIcon then
		ActivityIcon:zeroClear(uid)
	end
	--个人宗门每日捐献金币清零
	s_setVar(uid, 240,1,0)
	--个人宗门签到清零
	s_setVar(uid, 240,2,0)
	s_setVar(uid, 240,3,0) --宗门神树金币灌溉每日次数清零
	s_setVar(uid, 240,4,0) --宗门神树摘取果实每日次数清零
	s_setVar(uid, 240,5,0) --宗门捐献次数次数清零
	s_setVar(uid, 240,10,0) --宗门杀怪上线清零

    --普通聊天限制清零
    s_setVar(uid, 280,1,0)
    --组队聊天限制清零
    s_setVar(uid, 280,2,0)
    --私人聊天限制清零
    s_setVar(uid, 280,3,0)
    --世界聊天限制清零
    s_setVar(uid, 280,4,0)
    --宗门聊天限制清零
    s_setVar(uid, 280,5,0)
	--副本队伍购买次数清零
	for i = 1, 3 do
		s_setVar(uid, 290, i, 0)
	end

	--竞技场零时次数重置
	if s_getField(uid, UserVar_SimulationNum) ~= 10 then
		s_debugUser(uid, "场景中执行零时清理时,竞技场次数没有重置")
		s_setField(uid, UserVar_SimulationNum, 10)
	end

    --传承洞天每日进入次数
	s_setVar(uid, 167,1,0)
	s_setVar(uid, 167,2,0)
    --藏宝图任务每日次数
	s_setVar(uid, 167,10,0)
    --晶源矿脉每日次数
    s_setVar(uid, 167,20,0)
	--手动领取元宝限制
	s_setVar(uid,149,38,0)
	--阴阳妖参
	s_setVar(uid,169,1,0)
	s_setVar(uid,169,3,0)
	s_setVar(uid,169,4,0)
	s_setVar(uid,169,5,0)
	s_deleteItemByBaseID(uid,1101,0,"阴阳妖参任务隔天删除道具",0)

	s_setVar(uid,169,13,0)
	s_setVar(uid,169,14,0)
	s_setVar(uid,169,15,0)
	s_setVar(uid,169,16,0)
	s_setVar(uid,169,23,0)
	s_setVar(uid,169,24,0)
	s_setVar(uid,169,25,0)
	s_setVar(uid,169,26,0)
	s_setVar(uid,169,17,0)
	s_setVar(uid,169,18,0)
	s_setVar(uid,169,19,0)
	s_setVar(uid,169,27,0)
	s_setVar(uid,169,28,0)
	s_setVar(uid,169,29,0)
	s_setVar(uid,169,20,0)
	s_setVar(uid,169,30,0)
	s_setVar(uid,169,31,0)
	s_setVar(uid,169,32,0)
	if s_getCurTime(5) == 1 then
		s_setVar(uid,169,11,0)
		s_setVar(uid,169,12,0)
		s_setVar(uid,169,21,0)
		s_setVar(uid,169,22,0)
		s_setField(uid, UserVar_WorldExam, 0)
		s_setField(uid, UserVar_WorldExamRank, 0)
		s_setField(uid, UserVar_WorldExam_Time, 0)
		s_setField(uid, UserVar_ClanExam, 0)
	end
	if s_getVar(uid,169,42) > 0 then
		FinishRoleTask(uid,s_getVar(uid,169,42))
		s_setTaskValue(uid,s_getVar(uid,169,42),TaskValue_Process,0)
		s_delTask(uid,s_getVar(uid,169,42))
		s_setVar(uid,169,42,0)
	end
	s_setVar(uid,169,41,0)
    s_setVar(uid,297,1,0)
	s_setVar(uid,169,71,0)

	--酒
    s_setVar(uid,300,1,0)
	s_setVar(uid,300,2,0)
	s_setVar(uid,300,2,0)
	s_setField(uid, UserVar_AtkCityDestoryMaster, 0)
	s_setVar(uid,169,91,0)
	s_setVar(uid,169,77,0)
	s_addWorldVar(41,1,0)
	--一折
    s_setVar(uid,149,51,0)
    s_setVar(uid,149,52,0)
    s_setVar(uid,149,53,0)
    s_setVar(uid,149,54,0)
    s_setVar(uid,149,55,0)
    s_setVar(uid,149,56,0)
    s_setVar(uid,169,92,0)
	if s_getVar(uid,451,1) == 1 then
		s_setVar(uid,169,200,0)
	end
	s_setVar(uid,451,1,0)
	clantaskclear(uid)
	s_setField(UserVar_RedPacketSync,0)
	s_setVar(uid,290,14,0)
	dailyofflinecalc(uid)
    s_setVar(uid,149,58,0)
	s_setVar(uid,149,98,0)
	s_setVar(uid,149,97,0)
	s_setVar(uid,320,1,0)
	s_setVar(uid,320,3,0)
	s_setVar(uid,320,4,0)
	s_setVar(uid,140,80,0) -- 采矿次数
	s_setVar(uid,140,86,0) -- 每天使用经验石次数
	s_setVar(uid,140,88,0) -- 每天使用经验石次数
	s_setVar(uid,140,89,0) -- 每天使用经验石次数
	s_setVar(uid,140,90,0) -- 每天使用经验石次数
	--s_setVar(uid,140,107,0) -- 每天装备副本可刷新次数
	if MaterialCopyResetUserVar ~= nil then --材料副本清理
		s_debugUser(uid,">>>>>>>>>>>>>>>>>>材料副本每日自动刷新次数")
		MaterialCopyResetUserVar(uid)
	end
	--[[
	s_setVar(uid,140,107,0) -- 装备副本购买次数1
	s_setVar(uid,140,108,0) -- 装备副本购买次数2
	s_setVar(uid,140,109,0) -- 装备副本购买次数3
	s_setVar(uid,140,110,0) -- 装备副本购买次数4
	s_setVar(uid,140,111,0) -- 装备副本购买次数5
	]]--
	s_setVar(uid,140,112,2) -- 装备副本自动刷新标志
	s_setVar(uid,140,113,2) -- 装备副本自动刷新标志
	s_setVar(uid,140,114,2) -- 装备副本自动刷新标志
	s_setVar(uid,140,115,2) -- 装备副本自动刷新标志
	s_setVar(uid,140,116,2) -- 装备副本自动刷新标志
	s_setVar(uid,140,117,2) -- 装备副本自动刷新标志	
	s_setVar(uid,473,1,0)
	s_setVar(uid,476,1,0)
	s_setVar(uid,480,1,0)
	s_setVar(uid,160,12,0)
	s_setVar(uid,481,2,0)
	s_setVar(uid,420,1,0)
	s_setField(uid,UserVar_IsJinYan,0)
	s_setField(uid,UserVar_JinYanNum,0)
	
	s_setVar(uid,147,1,0)   --押镖 
	s_setVar(uid,147,2,0)  	--瞻仰城主 
	s_setVar(uid,147,3,0)   --元宝嘉年华 
	s_setVar(uid,147,4,0)	--魔军压境 
	s_setVar(uid,147,5,0)   --魔兽殿堂 
	s_setVar(uid,147,6,0)	--群雄夺宝 
	s_setVar(uid,147,7,0)	--夺旗战 
	s_setVar(uid,147,8,0)	--血战到底 
	s_setVar(uid,147,9,0)	--激情闭关 
	s_setVar(uid,147,10,0)	--宝石战场 
	s_setVar(uid,147,11,0)	--攻城战 
	s_setVar(uid,147,12,0)	--篝火盛宴 
	s_setVar(uid,147,13,0)	--全民答题 
	s_setVar(uid,147,14,0)	--元宝嘉年华 
	s_setVar(uid,147,15,0)	--群雄夺宝 
	s_setVar(uid,147,16,0)	--瞻仰城主 
	s_setVar(uid,147,17,0)	--瞻仰城主 
	s_setVar(uid,147,18,0)	--夺旗战 
	s_setVar(uid,147,19,0)	--远古魔王 
	s_setVar(uid,147,20,0)	--全民答题 
	s_setVar(uid,147,21,0)	--双倍经验 
	s_setVar(uid,147,22,0)	--双倍经验 
	s_setVar(uid,147,23,0)	--魔军压境 
	
	
end
