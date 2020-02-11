RoleTaskInfo50015 =
{
	subtasknum = 1,
	subtask1 =
	{
		task={s_taskKillNpc, {337,337,60944,10}},
	},
}

function RoleTaskInfo50015:OnNpcDeadEvent_60943(uid,level)
	local rand = math.random(1,100)
	local npc = 0
	local ai = 103
	if 	rand < 75 then
		npc = 60944
		ai = 103
		s_sysInfo(uid,"狼被你激怒了，变成了狼人士兵！")
	else
		npc = 60945
		ai = 103
		s_sysInfo(uid,"狼被你杀死了，狼人指挥官前来讨伐你了！")
	end
	--[[else
	npc = 60946
	ai = 123
	s_sysInfo(uid,"你被狼群列为大敌，派出了狼人魔甲！")
	end]]--
	local worldlevel = s_getWorldLevel()
	local npcid = s_summon(SCENE_ENTRY_PLAYER,uid,npc,ai,1)
	if npc == 60945 then
		if npcid ~= 0 then
			if worldlevel == 1 then
			--						s_addbuff(SCENE_ENTRY_NPC,npcid,105,,10)
			elseif worldlevel == 2 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,6000,10)
			elseif worldlevel == 3 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,13000,10)
			elseif worldlevel == 4 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,24000,10)
			elseif worldlevel == 5 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,35000,10)
			elseif worldlevel == 6 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,58000,10)
			elseif worldlevel == 7 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,78000,10)
			elseif worldlevel == 8 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,101000,10)
			elseif worldlevel == 9 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,128000,10)
			elseif worldlevel == 10 then
				s_addbuff(SCENE_ENTRY_NPC,npcid,105,162000,10)
			end
		end
	end
	s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,60*30*1000)
end

-- RegisterMyNpcDeadEvent(60943,"RoleTaskInfo50015:OnNpcDeadEvent_60943($1,$2)")
