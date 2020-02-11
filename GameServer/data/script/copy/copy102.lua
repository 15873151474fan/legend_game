--情缘活动副本
CopySceneInfo_102 =
{
	--副本最大人数
	maxplayernum = 2,

	name = "情缘活动副本",

	--需创建的npc列表{npc表格中id,x坐标,y坐标}
	npclist =
	{
		{63105,21,63},
		{63106,44,76},
		{63107,38,88},
		{63108,27,90},
		--{63109,16,73},
	},

	--随机任务列表{任务表格中id,任务表格中id},下标从1开始
	tasklist =
	{
		{30150,30150},
		{30151,30154},
		{30152,30158},
		{30153,30162},
		{30155,30155},
		{30156,30159},
		{30157,30163},
		{30160,30160},
		{30161,30164},
		{30165,30165},		
	},
}

--[[
变量说明
0_0 随机到的任务所在任务列表中的下标
0_1 第一个进入副本玩家的id
0_2 每二个进入副本玩家的id
0_3 完成任务计数
]]--

--副本创建初始化
function CopySceneInfo_102:InitCopyScene(sid)
	for _,v in pairs(self.npclist) do
		local npcid = s_sysSummon(v[1],sid,v[2],v[3])
		if npcid == nil then
			s_debug(self.name .. "创建npc: " .. v[1] .. "失败")
		end
	end
end

--玩家进入副本提示
function CopySceneInfo_102:OnPlayerIntoCopyScene(sid,uid)
	local taskindex = s_getSceneVar(sid,0,0)
	local taskid = nil
	if taskindex ~= nil and taskindex ~= 0 then
		taskid = self.tasklist[taskindex][2]
		if taskid == nil or taskid == 0 then
			s_debug(self.name .. "：随机任务出错")
			return
		end
		AddRoleTaskForGM(uid,taskid)
		s_setSceneVar(sid,0,1,uid)
		return
	end
	local taskindex = math.random(#self.tasklist)
	if taskindex == nil or taskindex == 0 then
		s_debug(self.name .. "：随机任务出错")
		return
	end
	taskid = self.tasklist[taskindex][1]
	if taskid == nil or taskid == 0 then
		s_debug(self.name .. "：随机任务出错")
		return
	end
	AddRoleTaskForGM(uid,taskid)
	s_setSceneVar(sid,0,0,taskindex)
	s_setSceneVar(sid,0,2,uid)
end

--玩家离开副本
function CopySceneInfo_102:OnPlayerLeaveCopyScene(sid,uid)
end

--销毁副本
function CopySceneInfo_102:FinalCopyScene(sid)
end

function CopySceneInfo_102:checkIsGiveReward(uid,taskid)
	local sid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
	local count = s_getSceneVar(sid,0,3)
	if count == 1 then
		local uid1 = s_getSceneVar(sid,0,1)
		local uid2 = s_getSceneVar(sid,0,2)
		if uid1 == nil or uid1 == 0 or uid2 == nil or uid == 0 then
			s_debug(self.name .. "：给予任务奖励时找不到副本中玩家")
			return
		end
		CommonTaskReward(uid1,taskid)
		CommonTaskReward(uid2,taskid)
		local time = s_getCurTime(TIME_ALLSECONDS)
		s_setVar(uid1,1,102,time)
		s_setVar(uid2,1,102,time)
		return
	end
	if count == nil then
		count = 0
	end
	s_setSceneVar(sid,0,3,count + 1)
	return
end
