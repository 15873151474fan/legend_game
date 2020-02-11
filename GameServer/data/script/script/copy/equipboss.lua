--魔甲BOSS
--副本开启时间 0_101
--副本是否刷新BOSS 0_102

function CopySceneInfo_EquipBoss_InitCopyScene(ctype,cid)
	local cur_time = s_getCurTime(TIME_ALLSECONDS)
	s_setSceneVar(cid,0,101,cur_time)
	s_setSceneVar(cid,0,102,0)
end

function CopySceneInfo_EquipBoss_OnPlayerIntoCopyScene(cid,uid)
	s_goto(SCENE_ENTRY_PLAYER,uid,128,142)
end

function CopySceneInfo_EquipBoss_OnPlayerLeaveCopyScene(cid,uid)
end

function OnLoopCopyScene_1Sec_EquipBoss(ctype,cid)
	local time = s_getCurTime(TIME_ALLSECONDS)
	local summon = s_getSceneVar(cid,0,102)
	if summon == 0 then
		s_setSceneVar(cid,0,102,1)
		local npcid = s_sysSummon(20021,cid,113,67,0,1)
		if npcid ~= 0 and npcid ~= nil then
			s_addbuff(SCENE_ENTRY_NPC,npcid,20356,1,10)
		end
		npcid = s_sysSummon(20022,cid,68,190,0,1)
		if npcid ~= 0 and npcid ~= nil then
			s_addbuff(SCENE_ENTRY_NPC,npcid,20357,1,10)
		end
		npcid = s_sysSummon(20023,cid,187,190,0,1)
		if npcid ~= 0 and npcid ~= nil then
			s_addbuff(SCENE_ENTRY_NPC,npcid,20358,1,10)
		end
	end
	if time%86400 >= 85800 then
		s_clearCopy(cid)
	end
end

function CopySceneInfo_EquipBoss_OnPlayerRelive(uid,rtype)
	s_goto(SCENE_ENTRY_PLAYER,uid,128,142)
end

------------------------------------------------------------------------------------
local EquipBossCopyScene = [[
    CopySceneInfo_$1 = { }
    function CopySceneInfo_$1:InitCopyScene(cid)
        CopySceneInfo_EquipBoss_InitCopyScene($1,cid)
    end
    function CopySceneInfo_$1:OnPlayerIntoCopyScene(cid,uid)
        CopySceneInfo_EquipBoss_OnPlayerIntoCopyScene(cid,uid)
    end
    function CopySceneInfo_$1:OnPlayerLeaveCopyScene(cid,uid)
        CopySceneInfo_EquipBoss_OnPlayerLeaveCopyScene(cid,uid)
    end
	function CopySceneInfo_$1:OnPlayerRelive(uid,rtype)
		CopySceneInfo_EquipBoss_OnPlayerRelive(uid,rtype)
	end
    function OnLoopCopyScene_1Sec_$1(ctype,cid)
        OnLoopCopyScene_1Sec_EquipBoss(ctype,cid)
    end
]]
RegistetFunction(FormatString(EquipBossCopyScene,71))
------------------------------------------------------------------------------------
