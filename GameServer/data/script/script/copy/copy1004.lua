--人生转轮
CopySceneInfo_1004 =
{
	--每个区域的中心位置坐标
	maxzone = 24,
	maxGiftNum = 103,
	npcpos = {{59,257},{57,181},{57,97},{138,90},{218,87},
		{316,91},{413,93},{408,177},{411,255},{414,330},
		{413,430},{313,431},{223,405},{142,395},{59,400},
		{59,305},{142,303},{223,301},{313,341},{313,258},
		{316,174},{226,174},{137,180},{143,249},},

	rolepos = {{60,257},{58,182},{58,98},{139,91},{219,88},
		{317,92},{414,93},{409,178},{412,256},{415,331},
		{414,431},{314,432},{224,406},{143,396},{60,401},
		{60,304},{143,304},{224,302},{314,342},{314,259},
		{317,175},{227,175},{138,181},{143,250},},

	npcid = {237,238,239,240,241,
		242,243,244,245,246,
		247,248,249,250,251,
		252,253,254,255,256,
		257,258,259,260,},

	--变量(1-1,1-2,1-3,...1-maxzone)为1时触发事件eventid
	--变量(2-1,2-2,2-3,...2-maxzone)表明每层对应的事件eventid
	--变量(3-1,3-2,3-3,...3-maxzone)表明每层进入的次数
	--变量(4-1)表明当前所在的层数，1-maxzone
	--变量(4-2)表明下次所在的层数，1-maxzone
	--变量(4-3)玩家已经经过的层数，1-maxzone*3（最大3圈）
	--变量(4-4)表明当前事件状态，0表示没有开始，1表示开始，2表示完成，3表示领取奖励
	--变量(4-5)玩家是否已经领取剩余所有奖励
	--变量(4-6)随机的事件zone_event序号
	--变量(5-1)事件2的完成进度，0表示没有，10表示完成
	--变量(6-1)事件3的完成进度，0表示没有，1表示完成
	--变量(7-1)事件4的完成进度，0表示没有，1表示完成
	--变量(8-1)事件5的完成进度，0表示没有，1表示完成
	--变量(9-1)事件6的完成进度，0表示没有，1表示完成
	--变量(10-1)事件7的完成进度，0表示没有，1表示完成
	--变量(11-1)事件8的完成进度，0表示没有，1表示完成
	--变量(12-1)事件9的完成进度，0表示没有，1表示完成
	--变量(13-1)事件10的完成进度，0表示没有，1表示完成
	--变量(14-1)事件11的完成进度，0表示没有，1表示完成
	--变量(15-1)事件12的完成进度，0表示没有，1表示完成
	--变量(16-1)事件13的完成进度，0表示没有，1表示完成
	--变量(17-1)事件14的完成进度，0表示没有，1表示完成
	--变量(18-1)事件15的完成进度，0表示没有，1表示完成
	--变量(19-1)事件16的完成进度，0表示没有，1表示完成
	--变量(20-1)事件17的完成进度，0表示没有，1表示完成
	--变量(21-1)事件18的完成进度，0表示没有，1表示完成
	--变量(22-1)事件19的完成进度，0表示没有，1表示完成
	--变量(23-1)事件20的完成进度，0表示没有，1表示完成
	--变量(24-1)事件21的完成进度，0表示没有，1表示完成
	--变量(25-1)事件22的完成进度，0表示没有，1表示完成
	--变量(26-1)事件23的完成进度，0表示没有，1表示完成
	--变量(100-1,100-2,100-3,...100-maxzone)为0表示对应层的奖励未领取，为1表示对应层的奖励已领取过

	--初始化副本的操作
	initcopy =
	{
		action =
		{
			{s_copySetLifeTime,{2700}},
		},
	},

	playerinto =
	{
		action =
		{
			{s_copyZoneOne,{"<p><n color='GXColorYellow' font='3'> 人生转轮</n></p>"}},
			{s_copyZoneTwo,{"<p><n color='GXColorTab'>  1.生命时钟随身商店有售</n><newline/><n color='GXColorTab'> 2.完成提示后可获得奖励</n></p>"}},
			{s_copyTime,{2700}},
		},
	},

	--副本变量改变时的操作
	--事件1变量
	varchange_28_1_1 =
	{
		action =
		{
			{s_copySetSceneVar,{4,4,2}},
			{s_copySetSceneVar,{28,1,0}},
		},
	},
	--事件2变量
	varchange_5_1_10 =
	{
		action =
		{
			{s_copySetSceneVar,{4,4,2}},
			{s_copyClearAllMonster,{}},
		},
	},
	--事件3变量
	varchange_6_1_1 =
	{
		action =
		{
			{s_copySetSceneVar,{4,4,2}},
			{s_copyClearAllMonster,{}},
		},
	},
	varchange_6_2_1 =
	{
		action =
		{
			{s_copySetSceneVar,{4,4,2}},
			{s_copyClearAllMonster,{}},
		},
	},
	--事件4变量
	varchange_7_1_1 =
	{
		action =
		{
			{s_copySetSceneVar,{4,4,2}},
			{s_copySetSceneVar,{7,1,0}},
			{s_copyClearAllMonster,{}},
		},
	},
	--事件5变量
	varchange_8_1_1 =
	{
		action =
		{
			{s_copySetSceneVar,{4,4,2}},
			{s_copyClearAllMonster,{}},
		},
	},
	varchange_8_2_1 =
	{
		action =
		{
			{s_copySetSceneVar,{4,4,2}},
			{s_copyClearAllMonster,{}},
		},
	},
	--事件6变量
	varchange_9_1_3 =
	{
		action =
		{
			{s_copySetSceneVar,{4,4,2}},
		},
	},
	--事件7变量
	varchange_10_1_1 =
	{
		action =
		{
			{s_copySetSceneVar,{4,4,2}},
		},
	},
	--事件8变量
	varchange_11_1_1 =
	{
		action =
		{
			{s_copySetSceneVar,{4,4,2}},
		},
	},
	--事件9变量
	varchange_12_1_4 =
	{
		action =
		{
			{s_copySetSceneVar,{4,4,2}},
		},
	},
	--事件10变量
	varchange_13_1_1 =
	{
		action =
		{
			{s_copySetSceneVar,{4,4,2}},
		},
	},
	--事件11变量
	varchange_14_1_5 =
	{
		action =
		{
			{s_copySetSceneVar,{4,4,2}},
			{s_copyClearAllMonster,{}},
		},
	},
	--事件12变量
	varchange_15_1_8 =
	{
		action =
		{
			{s_copySetSceneVar,{4,4,2}},
		},
	},
	--事件13变量
	varchange_16_1_10 =
	{
		action =
		{
			{s_copySetSceneVar,{4,4,2}},
			{s_copyClearAllMonster,{}},
		},
	},
	--事件14变量
	varchange_17_1_15 =
	{
		action =
		{
			{s_copySetSceneVar,{4,4,2}},
			{s_copyClearAllMonster,{}},
		},
	},
	--事件15变量
	varchange_18_1_3 =
	{
		action =
		{
			{s_copySetSceneVar,{4,4,2}},
			{s_copyClearAllMonster,{}},
		},
	},
	--事件16变量
	varchange_19_1_2 =
	{
		action =
		{
			{s_copySetSceneVar,{4,4,2}},
			{s_copyClearAllMonster,{}},
		},
	},
	--事件17变量
	varchange_20_1_1 =
	{
		action =
		{
			{s_copySetSceneVar,{4,4,2}},
			{s_copyClearAllMonster,{}},
		},
	},
	--事件18变量
	varchange_21_1_1 =
	{
		action =
		{
			{s_copySetSceneVar,{4,4,2}},
			{s_copyClearAllMonster,{}},
		},
	},
	varchange_21_2_1 =
	{
		action =
		{
			{s_copySetSceneVar,{4,4,2}},
			{s_copyClearAllMonster,{}},
		},
	},
	varchange_21_3_1 =
	{
		action =
		{
			{s_copySetSceneVar,{4,4,2}},
			{s_copyClearAllMonster,{}},
		},
	},
	--事件19变量
	varchange_22_1_1 =
	{
		action =
		{
			{s_copySetSceneVar,{4,4,2}},
		},
	},
	--事件20变量
	varchange_23_1_1 =
	{
		action =
		{
			{s_copySetSceneVar,{4,4,2}},
		},
	},
}

zone_event =
{
	{1,12,5,20,4,12,18,11,5,20,4,18,12,5,7,4,11,19,12,5,18,11,3,11},
	{1,18,12,11,20,4,5,18,11,20,4,12,11,19,12,5,7,5,11,3,5,4,18,12},
	{1,4,20,5,18,4,12,11,18,5,20,11,12,4,19,5,18,11,7,11,12,3,12,5},
	{1,4,18,12,11,20,4,5,20,12,11,18,5,7,4,11,19,5,12,11,3,5,12,18},
	{1,12,11,20,12,5,4,20,12,11,12,5,7,4,18,18,5,11,3,4,19,5,18,11},
}

--[eventid] = quality
event_quality =
{
	[1] = 1, [3] = 5, [4] = 2, [5] = 1, [7] = 4,[11] = 1, [12] = 2, [18] = 3, [19] = 4, [20] = 3,
}
--副本创建初始化
function CopySceneInfo_1004:InitCopyScene(sid)
	--随机每层的eventid
	--变量(2-1,2-2,2-3,...2-maxzone)表明每层对应的实际eventid
	local rand = math.random(1,table.getn(zone_event))
	s_setSceneVar(sid, 4, 6, rand)
	for i=1, self.maxzone do
		--场景变量 2-zoneid 记录下对应区域（岛）的事件id
		s_setSceneVar(sid, 2, i, zone_event[rand][i])
		--初始化事件状态变量，开始都是0
		s_setSceneVar(sid, 10, i, 0)
	end
	s_setSceneVar(sid, 4, 3, 0)
	s_setSceneVar(sid, 4, 5, 0)
end

--玩家进入副本提示
function CopySceneInfo_1004:OnPlayerIntoCopyScene(sid,uid)
	CopySceneInfo_1004:InitZone(sid, uid, 1)
	--各岛的奖励领取状态列表，发给客户端用于更新大地图图标
	local gift_state_list = {}
	local isHaveGift
	for zoneid = 1, CopySceneInfo_1004.maxzone, 1 do
		table.insert(gift_state_list, zoneid)
		isHaveGift = event_quality[s_getSceneVar(sid, 2, zoneid)]
		table.insert(gift_state_list, isHaveGift)
	end
	s_sendCopyVar(CopySceneType_Custom_Single, sid, uid, CopySceneInfo_1004.maxzone, gift_state_list)
	ShowLargeMapInterface(uid)
end

--变量改变
function CopySceneInfo_1004:OnCopySceneVarChange(sid, key1, key2, newvalue, oldvalue)
end

--清除场景
function CopySceneInfo_1004:ClearNpc(sid)
	local list = s_getCopyEntry(sid,SCENE_ENTRY_NPC)
	for i = 1,table.getn(list), 2 do --清理NPC
		s_clearNpc(list[i+1])
	end
end

--初始化指定层
function CopySceneInfo_1004:InitZone(sid, uid, zoneid)
	--场景变量 2-zoneid 记录了当前区域（岛）的事件id
	local eventid = s_getSceneVar(sid, 2, zoneid)
	local npcposx = self.npcpos[zoneid][1]
	local npcposy = self.npcpos[zoneid][2]
	local roleposx = self.rolepos[zoneid][1]
	local roleposy = self.rolepos[zoneid][2]
	local npcid = self.npcid[eventid]
	local npcthisid = s_sysSummon(npcid,sid,npcposx,npcposy)
	--跳转到随机出来的下一岛
	s_goto(SCENE_ENTRY_PLAYER, uid, roleposx, roleposy, 0)
	s_setSceneVar(sid, 4, 1, zoneid)
	s_setSceneVar(sid, 4, 4, 0)
	s_setSceneVar(sid, 1, eventid, 1)
	if s_getSceneVar(sid, 100, zoneid) == 1 then
		s_sendCopyZoneThree(sid,"  进入第" .. zoneid .. "层，本层任务已完成，请继续随机下层")
		return
	end
	s_addbuff(SCENE_ENTRY_NPC,npcthisid,20269,1,2700,2)
	s_copyInfo(sid, "进入第" .. zoneid .. "层，触发事件" .. eventid)
	if eventid == 1 then
		s_sendCopyZoneThree(sid,"  第".. zoneid .."层,获得赠送的10个生命的时钟，与小歌利亚对话，即可获得1本故事书")
	elseif eventid == 3 then
		s_sendCopyZoneThree(sid,"  第".. zoneid .."层,恭喜获得25本故事书，击败两种怪物中的一种，击败“亚蝶”可额外获得经验，击败“灭蝶”无法获得经验")
	elseif eventid == 4 then
		s_sendCopyZoneThree(sid,"  第".. zoneid .."层,幸运签到获得2本故事书，请采集3个指定的道具，可额外获得经验")
	elseif eventid == 5 then
		s_sendCopyZoneThree(sid,"  第".. zoneid .."层,签到成功获得1本故事书，请击杀三种怪物中的一种，击败正确的怪物，可额外获得经验")
	elseif eventid == 7 then
		s_sendCopyZoneThree(sid,"  第".. zoneid .."层,恭喜获得15本故事书，进行翻牌，翻牌胜利，可额外获得经验")
	elseif eventid == 11 then
		s_sendCopyZoneThree(sid,"  第".. zoneid .."层,签到成功获得1本故事书，请击败出现的所有怪物，击败完毕后，可额外获得经验")
	elseif eventid == 12 then
		s_sendCopyZoneThree(sid,"  第".. zoneid .."层,幸运签到获得2本故事书，请击败出现的所有怪物，击败完毕后，可额外获得经验")
	elseif eventid == 18 then
		s_sendCopyZoneThree(sid,"  第".. zoneid .."层,恭喜获得5本故事书，击败三种怪物中的一种，击败正确的怪物，可额外获得经验")
	elseif eventid == 19 then
		s_sendCopyZoneThree(sid,"  第".. zoneid .."层,恭喜获得15本故事书，进行翻牌，翻牌胜利，可额外获得经验")
	elseif eventid == 20 then
		s_sendCopyZoneThree(sid,"  第".. zoneid .."层,恭喜获得5本故事书，采集3个指定的道具可额外获得经验")
	end
end
