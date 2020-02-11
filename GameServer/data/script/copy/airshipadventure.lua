--副本场景变量定义
--1_0	飞艇处在统计船员操作统计状态中，从3开始倒计时，到0统计结束，飞艇执行对应操作
--1_2	飞艇id
--1_3	所在团id
--1_4	当前获得金币数量
--1_5	当前船长已经发布的操作次数
--0_100 开始倒计时
--0_101 开始时间
--0_102 游戏进度(0 准备, 1 开始, 2 接受命令, 3 结束, 4 副本回收)
--0_103 进入飞艇玩家数量
--0_104 是否已经领取过结束奖励,0活动未结束,1活动已结束未领奖,2活动已结束已领奖
--0_105 结束倒计时

--玩家个人变量定义
--101_52 玩家在团飞艇副本中成功操作的次数

--飞跃大峡谷
CopySceneInfo_9 =
{
	--NPC坐标
	npc =
	{
		{60978,		--经验金币
			{130,220}, {120,220}, {110,220}, {100,220}, {90,220}, {82,209},
			{110,194}, {120,194}, {130,194}, {140,194}, {150,194}, {180,180},
			{130,164}, {120,164}, {110,164}, {100,164}, {75,130}, {65,130},
			{60,110}, {60,100}, {60,90}, {75,88}, {85,88}, {95,88}, {105,88},
			{120,125}, {130,125}, {140,125}, {150,125}, {120,135}, {130,135},
			{140,135}, {150,135}, {155,110}, {155,100}, {155,90}, {170,90},
			{180,90}, {183,60}, {170,55}, {160,55}, {150,55}, {140,55}, {130,55},
			{140,36}, {150,36}, {160,36}, {163,33}, {167,33}, {171,33},
		},
		{60979,		--上升气流
			{100,194},{85,130},{60,120},{110,95},{120,130},{150,130},{183,83},
		},
		{60980,		--减速云
			{175,175},{86,136},{66,82},{130,130},{170,65},{135,45},
		},
		{60981,		--空雷
			{175,190},{100,154},{55,130},{66,93},{110,120},{140,130},{180,65},{125,55},
		}
	}
}
--副本初始化
function CopySceneInfo_9:InitCopyScene(cid)
	s_setSceneVar(cid,1,0,0)
	s_setSceneVar(cid,1,1,0)
	s_setSceneVar(cid,1,2,0)
	s_setSceneVar(cid,1,3,0)
	s_setSceneVar(cid,1,4,0)
	s_setSceneVar(cid,1,5,0)
	--s_setSceneVar(cid,0,100,3*60)						--开始倒计时
	s_setSceneVar(cid,0,100,60)							--开始倒计时
	s_setSceneVar(cid,0,102,AirshipState_Wait)			--游戏进度
	s_setSceneVar(cid,0,103,0)							--飞艇当前玩家总数
	s_setSceneVar(cid,0,104,0)							--玩家是否已经领取过活动奖励,0 未领取，1 已领取
	s_setSceneVar(cid,0,105,100)						--飞艇到达成功区域10s倒计时
	s_setSceneVar(cid,0,101,s_getCurTime(TIME_ALLSECONDS))	--开始时间
	local airshipid = s_sysSummon(60977,cid,149,234,1048,false)
	if airshipid == nil or airshipid == 0 then
		s_debug("团飞艇副本召唤飞艇NPC失败！")
		s_clearCopy(cid)
		return
	end
	s_setCopyAirship(cid,airshipid)
	s_setSceneVar(cid,1,2,airshipid)
	for i=1,table.getn(self.npc) do
		for j=2,table.getn(self.npc[i]) do
			s_sysSummon(self.npc[i][1],cid,self.npc[i][j][1],self.npc[i][j][2],1049,0)
		end
	end
	s_setAirshipState(s_getSceneVar(cid,1,2),AirshipState_Wait)
	s_debug("团飞艇副本开启")
end

function OnLoopCopyScene_1Sec_9(ctype,cid)
	local wait = s_getSceneVar(cid,0,100)
	if wait > AirshipState_Wait then
		if wait <= 60 and wait % 10 == 0 then
			s_copyInfo(cid,"飞空艇将在"  .. wait .. "秒启动，请做好准备(艇中至少3人才能起航)")
		end
		s_setSceneVar(cid,0,100,wait - 1)
		if wait == 1 then
			CopySceneInfo_9:init(cid)
		end
		return
	end

	--	s_copyInfo(cid,"副本将在"  .. s_getSceneVar(cid,0,105) .. "秒后关闭！",ChatPos_Important)
	--	s_copyInfo(cid,"0-104"  .. s_getSceneVar(cid,0,104),ChatPos_Important)

	--冒险开始后，副本人数少于3人，副本回收
	if (s_getSceneVar(cid,0,103) < 3) then
		s_copyInfo(cid,"飞空艇成员少于3人，无法起航！(活动结束前召唤其他团员登艇可重新启航！)",ChatPos_Important)
	end

	if s_getSceneVar(cid,0,104) == 2 and s_getSceneVar(cid,0,105) > 0 then
		s_copyInfo(cid,"副本将在"  .. s_getSceneVar(cid,0,105) .. "秒后关闭！",ChatPos_Important)
		s_setSceneVar(cid,0,105,s_getSceneVar(cid,0,105)-1)
		if s_getbuffnum(SCENE_ENTRY_NPC,s_getSceneVar(cid,1,2),20259) == 0 then
			s_addbuff(SCENE_ENTRY_NPC,s_getSceneVar(cid,1,2),20259,1,5,1)
		end
		if s_getSceneVar(cid,0,105) == 0 then
			s_airshipAllLeave(s_getSceneVar(cid,1,2))
			s_clearCopy(cid)
		end
	end

	--在船员操作指令响应状态
	if s_getSceneVar(cid,0,102) == AirshipState_Operate then
		if s_getSceneVar(cid,1,0) ~= 0 then
			s_setSceneVar(cid,1,0,s_getSceneVar(cid,1,0) - 1)
		elseif s_getSceneVar(cid,1,0) == 0 then
			s_doCaptainCommand(s_getSceneVar(cid,1,2))
			s_setSceneVar(cid,1,0,0)
		end
	end

	local start = s_getCurTime(TIME_ALLSECONDS) - s_getSceneVar(cid,0,101)
	if start == 15 * 60 then
		s_copyInfo(cid,"本次冒险将在1分钟后结束,加油啦，勇士们！",ChatPos_Sys)
	end

	--		s_copyInfo(cid,s_getCurTime(TIME_ALLSECONDS) - s_getSceneVar(cid,0,101),ChatPos_Sys)
	--		s_copyInfo(cid,"副本倒计时" .. (s_getSceneVar(cid,0,101) + 16*60 - s_getCurTime(TIME_ALLSECONDS)),ChatPos_Sys)
	--		s_copyInfo(cid,"当前船长发布的指令次数" .. s_getSceneVar(cid,1,5),ChatPos_Sys)

	--时间结束或者到达终点活动结束，发奖励
	if start == 16*60 or s_getSceneVar(cid,0,104) == 1 then

		s_copyInfo(cid,s_getSceneVar(cid,0,104),ChatPos_Sys)

		s_setAirshipState(s_getSceneVar(cid,1,2),airshipid)
		s_setSceneVar(cid,0,102,AirshipState_Finish)

		local corps = s_getSceneVar(cid,1,3)
		local color = s_getCorpsVar(corps,1,36)
		local member_num = 0
		local list = s_getNineEntry(SCENE_ENTRY_PLAYER ,uid,10)
		for i = 1,table.getn(list), 2 do
			if list[i] == SCENE_ENTRY_PLAYER and corps == s_getCorpsId(list[i+1]) then
				member_num = member_num+1
			end
		end

		if start < 60 then
			start = 60
		end
		if start > 960 then
			start = 960
		end

		local color_rate = {1,1.5,2,3,6}
		local rand = math.random(1,100)
		local list = s_getCopyEntry(cid,SCENE_ENTRY_PLAYER)
		for i = 1,table.getn(list), 2 do
			if list[i] == SCENE_ENTRY_PLAYER and corps == s_getCorpsId(list[i+1]) then
				local level = s_getValue(SCENE_ENTRY_PLAYER,list[i+1],VALUE_TYPE_LEVEL)
				local exp = math.floor(100 * (50 + 0.1 * level^2.2)
					* color_rate[color]
					* (2.5-(start - 60) / 600)
					* (1.5 - (s_getSceneVar(cid,1,5) - s_getAirshipOpTimes(s_getSceneVar(cid,1,2),list[i+1])) / s_getSceneVar(cid,1,5))) --获得基本经验
				--基本经验受活动是否完成影响，未完成获得经验减半

				if s_getCorpsVar(corps,1,37) == 2 then
					--经验
					s_refreshExp(list[i+1],exp,ExpType_OptionalTask,0)
					--协作点
					s_addField(list[i+1],UserVar_CooperationPoint,10)
					else
						--经验
						s_refreshExp(list[i+1],exp/2,ExpType_OptionalTask,0)
						--协作点
						s_addField(list[i+1],UserVar_CooperationPoint,5)
					end
					--经验金币奖励(与是否完成无关)
					local goldExp = math.floor(8*(50+0.1*level^2.2)*(1.5*(s_getSceneVar(cid,1,4)^0.8)))
					s_refreshExp(list[i+1],goldExp,ExpType_OptionalTask,0)
					-- 特色奖励
					if rand <= 30 and color == 1 then
						s_addItem(list[i+1],55057,0,1,0,"1-1","探索拓展奖励")
					elseif rand <= 40 and color == 2 then
						s_addItem(list[i+1],55057,0,1,0,"1-1","探索拓展奖励")
					elseif rand <= 50 and color == 3 then
						s_addItem(list[i+1],55057,0,1,0,"1-1","探索拓展奖励")
					elseif rand <= 80 and color == 4 then
						s_addItem(list[i+1],55057,0,1,0,"1-1","探索拓展奖励")
					elseif color == 5 then
						s_addItem(list[i+1],55057,0,1,0,"1-1","探索拓展奖励")
					end
			end
		end
		--		if table.getn(list) >= 5 then
		if s_getSceneVar(cid,0,104) == 1 then
			s_updateAirshipCopyList(corps,60*15 - (start - 60))
		end
		--		end
		--记录当天团飞艇副本完成情况的变量，0未参加，1参加未完成，2参加完成，3参加且已经领取奖励
		s_addCorpsVar(corps,1,37,3)
		s_setSceneVar(cid,0,104,2)
		s_setSceneVar(cid,0,105,10)
	end

	--副本超时回收
	if start >= 16 * 60 + 10 then
		s_setSceneVar(cid,0,102,4)
		local corps = s_getSceneVar(cid,1,3)
		if corps ~= 0 and corps ~= nil then
			s_addCorpsVar(corps,1,37,1)
		end
		s_airshipAllLeave(s_getSceneVar(cid,1,2))
		s_clearCopy(cid)
	end
end

function CopySceneInfo_9:init(cid)
	s_setAirshipState(s_getSceneVar(cid,1,2),AirshipState_Sailing)
end

function CopySceneInfo_9:OnPlayerIntoCopyScene(cid,uid)
	if uid == 0 or uid == nil then
		return
	end

	local corps = s_getSceneVar(cid,1,3)
	if s_getSceneVar(cid,1,2) == nil or s_getSceneVar(cid,1,2) == 0 then
		s_sysInfo(uid,"抱歉，团飞跃彩虹谷副本创建失败，无法进入!", ChatPos_Important)
		return
	end

	--设置玩家参加活动时间，活动为开启时参加时间设置为开启的时间，开启后按当前时间计算
	if s_getCurTime(TIME_ALLSECONDS) <= s_getSceneVar(cid,0,101) + 3*60 then
		s_setVar(uid,101,52,s_getSceneVar(cid,0,101) + 3*60)
	else
		s_setVar(uid,101,52,s_getCurTime(TIME_ALLSECONDS))
	end

	s_airshipAddMember(uid,s_getSceneVar(cid,1,2))
	s_sendCopyInfo(cid,s_getSceneVar(cid,1,4),s_getSceneVar(cid,0,101) + 16*60 - s_getCurTime(TIME_ALLSECONDS),60*15 - s_getCorpsField(s_getSceneVar(cid,1,3),CorpVar_Airship_Time))
end

function CopySceneInfo_9:OnPlayerLeaveCopyScene(cid,uid)
	if (uid == 0 or uid == nil) then
		return
	end
	if s_getSceneVar(cid,1,2) ~= 0 then
		s_resetTrafficType(uid)
		s_airshipUserLeave(s_getSceneVar(cid,1,2),uid)
	end
	if s_getVar(uid,130,5) == 0 then
		s_addVar(uid,130,5,1)
		s_addVar(uid,130,100,s_getVar(uid,130,100)+1)
		s_debugUser(uid,"团活力，团拓展，参与度：1")
	end
end

--金币NPC死亡，增加金币计数
function CopySceneInfo_9:dead_60978(cid,npcid)
	s_setSceneVar(cid,1,4,s_getSceneVar(cid,1,4) + 1)
	s_sendCopyInfo(cid,s_getSceneVar(cid,1,4),s_getSceneVar(cid,0,101) + 16*60 - s_getCurTime(TIME_ALLSECONDS),60*15 - s_getCorpsField(s_getSceneVar(cid,1,3),CorpVar_Airship_Time))
	s_copyInfo(cid,"天上掉金币！",ChatPos_Important)
end

--上升气流，速度追加150，持续10s
function CopySceneInfo_9:dead_60979(cid,npcid)
	s_copyInfo(cid,"乘风破浪,加速飞行！",ChatPos_Important)
end

--减速云，减速减速50%，持续10s
function CopySceneInfo_9:dead_60980(cid,npcid)
	s_copyInfo(cid,"进入风暴,龟速前行~",ChatPos_Important)
end

--空雷，击晕，停止移动3s
function CopySceneInfo_9:dead_60981(cid,npcid)
	s_copyInfo(cid,"嘎嘣一道雷！！！",ChatPos_Important)
end

RegisterCopyNpcDeadEvent(60978,9,0,"CopySceneInfo_9:dead_60978($1,$2)")
RegisterCopyNpcDeadEvent(60979,9,0,"CopySceneInfo_9:dead_60979($1,$2)")
RegisterCopyNpcDeadEvent(60980,9,0,"CopySceneInfo_9:dead_60980($1,$2)")
RegisterCopyNpcDeadEvent(60981,9,0,"CopySceneInfo_9:dead_60981($1,$2)")

