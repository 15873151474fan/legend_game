--副本样例
CopySceneInfo_1002 =
{
	--初始化副本的操作
	initcopy =
	{
		action =
		{
			{s_copySetLifeTime,{900}},
			{s_copySetSceneVar,{99,1,1}},
		--{s_copySummonNpcToKill,{22000,2,134,135,0,0,2,2,2}},
		},
	},

	playerinto =
	{
		action =
		{
			--{s_copyZoneOne,{"公主的梦境"}},
			----{s_copyZoneTwo,{""}},
			--{s_copyZoneThree,{"今天是公主大婚的日子，去找丘比特参加婚礼吧！（与丘比特对话，开启婚礼）"}},
			{s_copyTime,{900}},
		--{s_copySetSceneVar,{1,1,5}},
		},
	},

	--副本变量改变时的操作
	varchange_2_1_4 =
	{
		action =
		{
			--{s_copyClearCopy,{}},
			--{s_copySummonNpcToKill,{60841,6,101,121,0,0,2,2,6}},
			--{s_copyZoneThree,{"敌人越来越多，可是王子不知去向，还是先击退这些敌军吧！"}},
		},
	},

	varchange_2_2_6 =
	{
		action =
		{
			--{s_copyClearCopy,{}},
			--{s_copySummonNpcToKill,{60842,1,101,121,0,0,2,3,1}},
			--{s_copyZoneThree,{"敌人的一个指挥官出现了，击倒它！"}},
		},
	},

	varchange_2_3_1 =
	{
		action =
		{
			--{s_copyClearCopy,{}},
			--{s_copyZoneThree,{"糟糕，找不到王子，也许……哎，还是先回去禀告公主吧！（与丘比特对话，禀告公主）"}},
			--{s_copySetSceneVar,{99,1,3}},
			--GM弹窗：回去找婚礼使者，禀告公主
			--{s_copyCopyInfo,{"回去找婚礼使者，禀告公主",8}},
		},
	},

	playerintozone_1 =
	{
		check =
		{
			{s_copycheckSceneVar,{99,1,2,2}},
		},
		action =
		{
			{s_copyAddTimer,{2,3}},
			{s_copySetSceneVar,{99,1,6}},
			--{s_copyPlayClientLua,{2}},
			----GM弹窗：冲进敌阵，消灭包围王子的魔军
			--{s_copyCopyInfo,{"冲进敌阵，消灭包围王子的魔军",8}},
		},
	},

	playerintozone_2 =
	{
		check =
		{
			{s_copycheckSceneVar,{99,1,6,6}},
		},
		action =
		{
			--{s_copySummonNpcToKill,{60840,4,101,121,0,0,2,1,4}},
			{s_copySetSceneVar,{99,1,0}},
		},
	},

	timer_1 =
	{
		action =
		{
			--{s_copyZoneThree,{"王子带领光明骑士团去救援光明城了，公主请您也跟上去增援！(如果未发现怪物，请尝试在桥上来回搜索)"}},
			--{s_copySetSceneVar,{99,1,2}},
			--{s_copyCopyInfo,{"去往桥的另一边，增援王子",8}},
		--GM弹窗：去往桥的另一边，增援王子
		},
	},

	timer_2 =
	{
		action =
		{
			--{s_copyZoneThree,{"王子似乎被敌军包围了，杀进去寻找王子！(击败周围的魔军士兵，突破包围)"}},
		},
	},

	timer_3 =
	{
		action =
		{
			{s_copyClearCopy,{}},
		},
	},

}

guardNpcId = 400
listNpc = {}

    --npc位置
    npc_pos1 = {
	[1]={60,41},[2]={63,43},[3]={66,45},[4]={69,47},[5]={72,49},[6]={75,51},
	[7]={63,39},[8]={66,41},[9]={69,43},[10]={72,45},[11]={75,47},[12]={78,49}};
    npc_pos2 = {
	[1]={66,38},[2]={69,40},[3]={72,42},[4]={75,44},[5]={78,46},[6]={81,48}};

--玩家离开副本
function CopySceneInfo_1002:OnPlayerLeaveCopyScene(cid,uid)
	s_setValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_PK_MODE,1)

	s_debug("玩家离开副本 OnPlayerLeaveCopy")
    --回收NPC
    CopySceneInfo_1002:ClearNpc(cid)
    s_clearCopy(cid)
end

function CopySceneInfo_1002:ClearNpc(cid)
   local list = s_getCopyEntry(cid,SCENE_ENTRY_NPC)
   for i = 1,table.getn(list), 2 do --清理NPC
	  s_clearNpc(list[i+1])
   end
end

-- 请求刷新副本怪物
function RequestRefreshNPC(userid, sceneid, mapid)

   	if mapid ~= 104 then
               s_debug("有外挂!!!")
		return
	end
	CopySceneInfo_1002:ClearNpc(sceneid)
	--s_debug("RequestRefreshCopyNPC................................uid="..userid.." sid="..sceneid.." mapid="..mapid)
	-- 刷新NPC
    for k,v in pairs(npc_pos1) do
        --s_debug("k="..k.." v="..npc_pos1[k][1].."v2="..npc_pos1[k][2].."guardNpcId="..guardNpcId)
		local ff1=guardNpcId+k
        local npcid = s_sysSummon(ff1, sceneid,npc_pos1[k][1], npc_pos1[k][2], 103, 1)
        listNpc[k] = npcid
    end

    local num = table.getn(listNpc);
    for k,v in pairs(npc_pos2) do
	num = num + 1
		local ff2=guardNpcId+k+12
        local npcid = s_sysSummon(ff2, sceneid,npc_pos2[k][1], npc_pos2[k][2], 103, 1)
        listNpc[num] = npcid
    end

end

