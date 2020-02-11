--副本
--101,1 副本完成条件
--101,2 倒计时显示
--101,3 客户端动画
CopySceneInfo_1021 =
{
	--初始化副本的操作
	initcopy =
	{
		action =
		{


			{s_copySetLifeTime,{600}},
			{s_copySetSceneVar,{99,1,1}},
		},
	},

	playerinto =
	{
		action =
		{
			{s_copyTime,{600}},
			{s_copyZoneOne,{"普利斯神殿"}},
			{s_copyZoneTwo,{""}},
			{s_copyZoneThree,{"与海神侍从对话，了解情况"}},
			{s_copySummonNpc,{10520,1,150,168,}},
			{s_copyAddTimer,{1,2}},
		},
	},


	timer_1 =
	{
		action =
		{
			{s_copyPlayClientLua,{401}},	--进入副本播放动画
			{s_copyCopyInfo,{"与海神侍从对话，了解情况。",8}},
			{s_copyCopyInfo,{"与海神侍从对话，了解情况。",32}},
		},
	},

	varchange_99_1_3 =
	{
		action =
		{
			{s_copyZoneOne,{"普利斯神殿"}},
			{s_copyZoneTwo,{""}},
			{s_copyZoneThree,{"继续与海神侍从对话"}},
			{s_copyCopyInfo,{"继续与海神侍从对话",8}},
			{s_copyCopyInfo,{"继续与海神侍从对话",32}},
		},
	},

	varchange_99_1_4 =
	{
		action =
		{
			{s_copyZoneOne,{"普利斯神殿"}},
			{s_copyZoneTwo,{""}},
			{s_copyZoneThree,{"击败鹿魔王，拯救公主！"}},
			{s_copyCopyInfo,{"击败鹿魔王，拯救公主！",8}},
			{s_copyCopyInfo,{"击败鹿魔王，拯救公主！",32}},
		},
	},


	--进入区域2，召唤BOSS，公主
	playerintozone_2 =
	{
		check =
		{
			{s_copycheckSceneVar,{99,1,4,4}}, --接受任务后，才能触发
		},
		action =
		{
			{s_copySummonNpc,{10510,1,156,107,}},  --光柱
			{s_copySummonNpc,{10505,1,156,107,}},  --公主
			{s_copySummonNpcToKill,{10509,1,150,107,0,0,2,1,1}}, --BOSS
			{s_copySetSceneVar,{99,1,5}},
		},
	},


	varchange_2_1_1 =
	{
		action =
		{
			{s_copyCopyInfo,{"亲吻公主，破除魔咒",8}},
			{s_copyCopyInfo,{"亲吻公主，破除魔咒",32}},
			{s_copyZoneThree,{"亲吻公主，破除魔咒"}},
			{s_copyClearNpcByBaseID,{10510}	},	--删除光柱NPC
			{s_copyAddTimer,{4,2}},


		},
	},

	timer_4 =
	{
		action =
		{
			{s_copyPlayClientLua,{404}},  --播放变身的事情

		},
	},

	varchange_2_1_3 =
	{
		action =
		{
			{s_copyClearNpcByBaseID,{10505}	},	--删除公主NPC
			{s_copySummonNpc,{10506,1,156,107,}},  --公主
			{s_copySetSceneVar,{2,1,4}},
			{s_copyCopyInfo,{"给公主穿上衣服",8}},
			{s_copyCopyInfo,{"给公主穿上衣服",32}},
			{s_copyZoneThree,{"给公主穿上衣服"}},
		--	{s_copyAddTimer,{2,10}},
		},
	},


	varchange_2_1_5 =
	{
		action =
		{
			{s_copyClearNpcByBaseID,{10506}	},	--删除洛神公主NPC
			{s_copySummonNpc,{10507,1,156,107,}},  --公主
			{s_copyAddTimer,{3,6}},
			{s_copyPlayClientLua,{406}},  --播放变身的事情
		--
		},
	},

	timer_3 =
	{
		action =
		{
			{s_copyPlayClientLua,{407}},
			{s_copyAddTimer,{5,30}},

		},
	},

	timer_5 =
	{
		action =
		{
			{s_copyClearCopy,{}},
		},
	},
}

--公主
NpcMenuInfo10505 =
{
	talk = "<p><n>呜呜呜，只有勇士的吻，我才能恢复美貌。   </n><newline/><n color='GXColorGreen'></n></p>",
	button = {
		{"亲吻公主(2)","NpcMenuInfo10505:zhengjiu($1)","NpcMenuInfo10505:zhengjiu2($1)"},
	}
}


--亲吻公主
function NpcMenuInfo10505:zhengjiu2(uid)
	local sid = s_getValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_SCENE_ID)
	if s_getSceneVar(sid,2,1) == 1 then
		return VALUE_OK
	end
	return VALUE_FAIL
end


function NpcMenuInfo10505:zhengjiu(uid)
	local sid = s_getValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_SCENE_ID)
	--s_addCopyTimer(sid, 1, 3)
	s_setSceneVar(sid,2,1,3)
	s_playClientLua(uid,405)  --播放变身的事情
end


--没穿衣服的公主
NpcMenuInfo10506 =
{
	talk = "<p><n>啊啊啊！人家的衣服呢！   </n><newline/><n color='GXColorGreen'></n></p>",
	button = {
		{"给公主穿上衣服(2)","NpcMenuInfo10506:chuanyi($1)","NpcMenuInfo10506:chuanyi2($1)"},
	}
}

--穿衣
function NpcMenuInfo10506:chuanyi2(uid)
	local sid = s_getValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_SCENE_ID)
	if s_getSceneVar(sid,2,1) == 4 then
		return VALUE_OK
	end
	return VALUE_FAIL
end


function NpcMenuInfo10506:chuanyi(uid)
	local sid = s_getValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_SCENE_ID)
	--s_addCopyTimer(sid, 1, 3)
	--	s_playClientLua(uid,404)  --播放变身的事情
	s_setSceneVar(sid,2,1,5)
end




--海神使者
NpcMenuInfo10520 =
{
	talk = "<p><n>   鹿魔王趁海神大人不在，把宫殿搞的一团乱！</n><newline/><n color='GXColorGreen'></n></p>",
	button = {
		{"发生了什么事情(2)","NpcMenuInfo10520:StarWedding($1)","NpcMenuInfo10520:ShowWedding($1)"},
		{"拯救公主(2)","NpcMenuInfo10520:Talktoprincess($1)","NpcMenuInfo10520:ShowTalktoprincess($1)"},
	--	{"离开副本(2)","NpcMenuInfo10520:DealMenu1($1)","NpcMenuInfo10520:ShowMenu1($1)"},
	}
}


--发生了什么事
function NpcMenuInfo10520:ShowWedding(uid)
	local sid = s_getValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_SCENE_ID)
	if s_getSceneVar(sid,99,1) == 1 then
		return VALUE_OK
	end
	return VALUE_FAIL
end


function NpcMenuInfo10520:StarWedding(uid)
	local sid = s_getValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_SCENE_ID)
	--s_addCopyTimer(sid, 1, 3)
	s_playClientLua(uid,402)  --播放发生的事情
	s_setSceneVar(sid,99,1,3)
end

--拯救公主
function NpcMenuInfo10520:ShowTalktoprincess(uid)
	local sid = s_getValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_SCENE_ID)
	if s_getSceneVar(sid,99,1) ==3 then
		return VALUE_OK
	end
	return VALUE_FAIL
end


function NpcMenuInfo10520:Talktoprincess(uid)
	local sid = s_getValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_SCENE_ID)
	--	s_addCopyTimer(sid, 3, 18)
	s_playClientLua(uid,403)
	s_setSceneVar(sid,99,1,4)
end



	