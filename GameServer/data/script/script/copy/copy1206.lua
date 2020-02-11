-- 领地副本

CopySceneInfo_1206 =
{
	initcopy =
	{
		action =
		{
		},
	},
}

-- 副本创建初始化
function CopySceneInfo_1206:InitCopyScene(sceneid)
	s_setSceneVar(sceneid,1,1,0)
end

-- 1秒钟循环
function OnLoopCopyScene_1Sec_1206(ctype,sceneid)
    local step = s_getEvent(Relation_World,0,EventManor)
	local num = s_getSceneVar(sceneid,1,1)
	-- 活动结束 or 神树被占领提前结束
	-- 20 秒倒计时中
    if step == EventStep_Wait or num > 0 then
    	if num == 0 then
    		s_setSceneVar(sceneid,1,1,1)
    		ManorCopy:ManorCopyTimeOver(sceneid)
    	elseif num < 20 then
    		s_setSceneVar(sceneid,1,1, num + 1)
    	elseif num == 20 then
    		ManorCopy:OnCopyClear(sceneid)
	        s_clearCopy(sceneid)
	    end
    end
end

-- 初始化怪物
function CopySceneInfo_1206:InitManorMonster(sceneid, clanid, copydb, treedb)
	local npcid = nil
	if clanid == 0 then
		-- 创建boss
		npcid = s_sysSummon(copydb.boss, sceneid, copydb.treex, copydb.treey, 0, 1)
		if npcid == nil or npcid == 0 then
			s_error("boss创建失败 CopySceneInfo_1206:InitManorMonster:clanid, bossid：" .. clanid .. "," .. copydb.boss)
		else
			s_trace("boss创建成功 CopySceneInfo_1206:InitManorMonster:sceneid, clanid, bossid, npcid：" .. sceneid .. "," .. clanid .. "," .. copydb.boss .. "," .. npcid)
		end
	else
		-- 创建神树
		npcid = s_sysSummon(copydb.tree, sceneid, copydb.treex, copydb.treey, 100, 1)
		if npcid == nil or npcid == 0 then
			s_error("神树创建失败 CopySceneInfo_1206:InitManorMonster:clanid, treeid：" .. clanid .. "," .. copydb.tree)
		else
			-- 设置神树血量与所属宗门
			s_setValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_HP, treedb.hp)
			s_setValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_MAXHP, treedb.hp)
			if clanid ~= 0 then
				s_setValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_CLAN, clanid)
			end
			s_trace("神树创建成功 CopySceneInfo_1206:InitManorMonster:sceneid, clanid, treeid, npcid：" .. sceneid .. "," .. clanid .. "," .. copydb.tree .. "," .. npcid)
		end
	end
	return npcid
end

-- 发送初始数据
function CopySceneInfo_1206:OnPlayerIntoCopyScene(sceneid, userid)
	-- 发送占有宗门名、剩余时间
	ManorCopy:SendCopyInfo(sceneid, userid)
	-- 发送伤害排名
	ManorCopy:SendHurtRank(sceneid, userid)
end

--玩家离开副本
function CopySceneInfo_1206:OnPlayerLeaveCopyScene(sceneid, userid)
    s_setValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_PK_MODE,1)
end

-- 玩家复活
function CopySceneInfo_1206:OnPlayerRelive(userid, rtype)
	if rtype == 3 or rtype == 4 then
		local sceneid = s_getValue(SCENE_ENTRY_PLAYER, userid, VALUE_TYPE_SCENE_ID)
		local pos = ManorCopy:GetRelivePos(sceneid,userid)
		if pos ~= nil then
			s_goto(SCENE_ENTRY_PLAYER, userid, pos.x, pos.y)
		end
	end
end

-- 神树阵亡
function CopySceneInfo_1206:OnMonsterDie(userid, npcid)
	local sceneid = s_getValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_SCENE_ID)
	if sceneid ~= nil and sceneid ~= 0 then
		s_setSceneVar(sceneid,1,1,1)
		ManorCopy:OnTreeDie(userid, sceneid)
	end
end

-- 监听神树或boss死亡
function CopySceneInfo_1206:RegisterNpcDead()
	local trees = {}
	for _, data in pairs(ManorCopyDataBase) do
		if type(data) == "table" and data.tree ~= nil then
			if trees[data.tree] == nil then
				RegisterMyNpcDeadEvent(data.tree, "CopySceneInfo_1206:OnMonsterDie($1,$2)")
				trees[data.tree] = true
			end
			if trees[data.boss] == nil then
				RegisterMyNpcDeadEvent(data.boss, "CopySceneInfo_1206:OnMonsterDie($1,$2)")
				trees[data.boss] = true
			end
		end
	end
end

-- 注册监听
CopySceneInfo_1206:RegisterNpcDead()

