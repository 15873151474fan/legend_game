function OnUseSkill_60001_CheckNeedBind(userid)
	local ret = VALUE_FAIL
	if ret == VALUE_FAIL and s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_LOCAL_PORT) == 0 then
		return VALUE_OK
	end
	if ret == VALUE_FAIL and s_getWorldLevel() > 1 and s_getValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_MOBILE) == 0 then
		return VALUE_OK
	end
	if ret == VALUE_FAIL and s_getCurTime(TIME_CURHOURS) >= 2 and s_getCurTime(TIME_CURHOURS) <= 8 then
		return VALUE_OK
	end
	if ret == VALUE_FAIL and s_getVar(userid,1,45) >= 100 then
		return VALUE_OK
	end
	s_addVar(userid,1,45,s_getVar(userid,1,45) + 1)
	return VALUE_FAIL
end
--生物采集
function OnUseSkill_60001(level,etype1,eid1,etype2,eid2)
	if s_getTrafficType(eid1) == TrafficType_InHorse then
		s_sysInfo(eid1,"骑战一体下无法采集")
		return USE_SKILL_ERROR
	end
	if s_getValue(etype2,eid2,VALUE_TYPE_HP) == 0 then
		return USE_SKILL_ERROR
	end
	if s_getValue(etype2,eid2,VALUE_TYPE_BASE_ID) ~= 60004 then
		return USE_SKILL_ERROR
	end
	local weapon = s_getWeapon(eid1)
	local baseid  = s_getItemValue(eid1,weapon,Item_Base_ID)
	local time = 0
	if baseid == 29009 then
		time = 5000
	elseif baseid == 29010  then
		time = 4000
	elseif baseid == 29011 then
		time = 3000
	elseif baseid == 29012 then
		time = 2000
	else
		s_sysInfo(eid1,"要是有把伐木电锯就好了")
		return USE_SKILL_ERROR
	end
	local dur = s_getItemValue(eid1,weapon,Item_Attribute_Dur)
	if dur == 0 then
		s_sysInfo(eid1,"采集工具耐久为0，被系统回收")
		s_deleteItemByThisID(eid1,weapon,1,"采集60001耐久耗尽")
		return USE_SKILL_ERROR
	end
	local dur = s_getItemValue(eid1,weapon,Item_Attribute_Dur)
	if dur == 0 then
		s_sysInfo(eid1,"采集工具耐久为0，被系统回收")
		s_deleteItemByThisID(eid1,weapon,1,"采集60001耐久耗尽")
		return USE_SKILL_ERROR
	end
	s_addVar(eid1,100,1,eid2)
	s_showbar(eid1,time,"DoGather_60001_" .. level .. "($1)",UninterruptActionType_NYCJ,1)
	ShowAttack(60001,etype1,eid1,etype2,eid2)
end
function OnFailedUseSkill60001(userid)
	if math.random(1,100) >= 60 then
		s_addItem(userid,27119,0,1,0,"","药草采集")
		s_sysInfo(userid,"费了好大力气，只获得了药材叶子")
	else
		s_sysInfo(userid,"费了好大力气，还是一无所获")
	end
	local npcid = s_getVar(userid,100,1)
	if npcid ~= 0 then
		s_killnpc(npcid,1)
	end
	return USE_SKILL_ERROR
end

function OnFinishUseSkill60001(userid)
	local npcid = s_getVar(userid,100,1)
	s_killnpc(npcid,1)
	s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_PRACTICE_NYCJ,1)
	s_sysInfo(userid,"噢耶，采集获得了药材")
end

function DoGather_60001_1(userid)
	local npcid = s_getVar(userid,100,1)
	local hp = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP)
	if hp == 0 or hp == nil then
		s_sysInfo(userid,"动作慢了一步，被人抢先了")
		return USE_SKILL_ERROR
	end
	if s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_ENERGY,1) == 0 then
		s_sysInfo(eid1,"精力值不够了哦")
		return USE_SKILL_ERROR
	end
	if math.random(1,100) >= 50 then
		OnFailedUseSkill60001(userid)
		return USE_SKILL_ERROR
	end
	local bindstr = "1-0,"
	if OnUseSkill_60001_CheckNeedBind(userid) == VALUE_OK then
		bindstr = "1-1,"
	end
	if math.random(1,10000) <= 500 then
		s_addItem(userid,27113,0,1,0,bindstr .. "2-2","药草采集")
	else
		s_addItem(userid,27113,0,1,0,bindstr .. "2-1","药草采集")
	end
	OnFinishUseSkill60001(userid)
end

function DoGather_60001_2(userid)
	local npcid = s_getVar(userid,100,1)
	local hp = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP)
	if hp == 0 or hp == nil then
		s_sysInfo(userid,"动作慢了一步，被人抢先了")
		return USE_SKILL_ERROR
	end
	if s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_ENERGY,1) == 0 then
		s_sysInfo(eid1,"精力值不够了哦")
		return USE_SKILL_ERROR
	end
	if math.random(1,100) >= 52 then
		OnFailedUseSkill60001(userid)
		return USE_SKILL_ERROR
	end
	local bindstr = "1-0,"
	if OnUseSkill_60001_CheckNeedBind(userid) == VALUE_OK then
		bindstr = "1-1,"
	end
	if math.random(1,10000) <= 1000 then
		s_addItem(userid,27113,0,1,0,bindstr .. "2-2","药草采集")
	else
		s_addItem(userid,27113,0,1,0,bindstr .. "2-1","药草采集")
	end
	OnFinishUseSkill60001(userid)
end
function DoGather_60001_3(userid)
	local npcid = s_getVar(userid,100,1)
	local hp = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP)
	if hp == 0 or hp == nil then
		s_sysInfo(userid,"动作慢了一步，被人抢先了")
		return USE_SKILL_ERROR
	end
	if s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_ENERGY,1) == 0 then
		s_sysInfo(eid1,"精力值不够了哦")
		return USE_SKILL_ERROR
	end
	if math.random(1,100) >= 55 then
		OnFailedUseSkill60001(userid)
		return USE_SKILL_ERROR
	end
	local bindstr = "1-0,"
	if OnUseSkill_60001_CheckNeedBind(userid) == VALUE_OK then
		bindstr = "1-1,"
	end
	if math.random(1,10000) <= 1500 then
		s_addItem(userid,27113,0,1,0,bindstr .. "2-2","药草采集")
	else
		s_addItem(userid,27113,0,1,0,bindstr .. "2-1","药草采集")
	end
	OnFinishUseSkill60001(userid)
end
function DoGather_60001_4(userid)
	local npcid = s_getVar(userid,100,1)
	local hp = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP)
	if hp == 0 or hp == nil then
		s_sysInfo(userid,"动作慢了一步，被人抢先了")
		return USE_SKILL_ERROR
	end
	if s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_ENERGY,1) == 0 then
		s_sysInfo(eid1,"精力值不够了哦")
		return USE_SKILL_ERROR
	end
	if math.random(1,100) >= 57 then
		OnFailedUseSkill60001(userid)
		return USE_SKILL_ERROR
	end
	local rand = math.random(1,10000)
	local bindstr = "1-0,"
	if OnUseSkill_60001_CheckNeedBind(userid) == VALUE_OK then
		bindstr = "1-1,"
	end
	if rand <= 500 then
		s_addItem(userid,27113,0,1,0,bindstr .. "2-3","药草采集")
	elseif rand <= 2050 then
		s_addItem(userid,27113,0,1,0,bindstr .. "2-2","药草采集")
	else
		s_addItem(userid,27113,0,1,0,bindstr .. "2-1","药草采集")
	end
	OnFinishUseSkill60001(userid)
end
function DoGather_60001_5(userid)
	local npcid = s_getVar(userid,100,1)
	local hp = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP)
	if hp == 0 or hp == nil then
		s_sysInfo(userid,"动作慢了一步，被人抢先了")
		return USE_SKILL_ERROR
	end
	if s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_ENERGY,1) == 0 then
		s_sysInfo(eid1,"精力值不够了哦")
		return USE_SKILL_ERROR
	end
	if math.random(1,100) >= 60 then
		OnFailedUseSkill60001(userid)
		return USE_SKILL_ERROR
	end
	local rand = math.random(1,10000)
	local bindstr = "1-0,"
	if OnUseSkill_60001_CheckNeedBind(userid) == VALUE_OK then
		bindstr = "1-1,"
	end
	if rand <= 150 then
		s_addItem(userid,27113,0,1,0,bindstr .. "2-3","药草采集")
	elseif rand <= 2650 then
		s_addItem(userid,27113,0,1,0,bindstr .. "2-2","药草采集")
	else
		s_addItem(userid,27113,0,1,0,bindstr .. "2-1","药草采集")
	end
	OnFinishUseSkill60001(userid)
end
function DoGather_60001_6(userid)
	local npcid = s_getVar(userid,100,1)
	local hp = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP)
	if hp == 0 or hp == nil then
		s_sysInfo(userid,"动作慢了一步，被人抢先了")
		return USE_SKILL_ERROR
	end
	if s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_ENERGY,1) == 0 then
		s_sysInfo(eid1,"精力值不够了哦")
		return USE_SKILL_ERROR
	end
	if math.random(1,100) >= 62 then
		OnFailedUseSkill60001(userid)
		return USE_SKILL_ERROR
	end
	local rand = math.random(1,10000)
	local bindstr = "1-0,"
	if OnUseSkill_60001_CheckNeedBind(userid) == VALUE_OK then
		bindstr = "1-1,"
	end
	if rand <= 350 then
		s_addItem(userid,27113,0,1,0,bindstr .. "2-3","药草采集")
	elseif rand <= 3350 then
		s_addItem(userid,27113,0,1,0,bindstr .. "2-2","药草采集")
	else
		s_addItem(userid,27113,0,1,0,bindstr .. "2-1","药草采集")
	end
	OnFinishUseSkill60001(userid)
end
function DoGather_60001_7(userid)
	local npcid = s_getVar(userid,100,1)
	local hp = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP)
	if hp == 0 or hp == nil then
		s_sysInfo(userid,"动作慢了一步，被人抢先了")
		return USE_SKILL_ERROR
	end
	if s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_ENERGY,1) == 0 then
		s_sysInfo(eid1,"精力值不够了哦")
		return USE_SKILL_ERROR
	end
	if math.random(1,100) >= 65 then
		OnFailedUseSkill60001(userid)
		return USE_SKILL_ERROR
	end
	local rand = math.random(1,10000)
	local bindstr = "1-0,"
	if OnUseSkill_60001_CheckNeedBind(userid) == VALUE_OK then
		bindstr = "1-1,"
	end
	if rand <= 100 then
		s_addItem(userid,27113,0,1,0,bindstr .. "2-4","药草采集")
	elseif rand <= 600 then
		s_addItem(userid,27113,0,1,0,bindstr .. "2-3","药草采集")
	elseif rand <= 4100 then
		s_addItem(userid,27113,0,1,0,bindstr .. "2-2","药草采集")
	else
		s_addItem(userid,27113,0,1,0,bindstr .. "2-1","药草采集")
	end
	OnFinishUseSkill60001(userid)
end
function DoGather_60001_8(userid)
	local npcid = s_getVar(userid,100,1)
	local hp = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP)
	if hp == 0 or hp == nil then
		s_sysInfo(userid,"动作慢了一步，被人抢先了")
		return USE_SKILL_ERROR
	end
	if s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_ENERGY,1) == 0 then
		s_sysInfo(eid1,"精力值不够了哦")
		return USE_SKILL_ERROR
	end
	if math.random(1,100) >= 70 then
		OnFailedUseSkill60001(userid)
		return USE_SKILL_ERROR
	end
	local rand = math.random(1,10000)
	local bindstr = "1-0,"
	if OnUseSkill_60001_CheckNeedBind(userid) == VALUE_OK then
		bindstr = "1-1,"
	end
	if rand <= 200 then
		s_addItem(userid,27113,0,1,0,bindstr .. "2-4","药草采集")
	elseif rand <= 700 then
		s_addItem(userid,27113,0,1,0,bindstr .. "2-3","药草采集")
	elseif rand <= 4900 then
		s_addItem(userid,27113,0,1,0,bindstr .. "2-2","药草采集")
	else
		s_addItem(userid,27113,0,1,0,bindstr .. "2-1","药草采集")
	end
	OnFinishUseSkill60001(userid)
end
function DoGather_60001_9(userid)
	local npcid = s_getVar(userid,100,1)
	local hp = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP)
	if hp == 0 or hp == nil then
		s_sysInfo(userid,"动作慢了一步，被人抢先了")
		return USE_SKILL_ERROR
	end
	if s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_ENERGY,1) == 0 then
		s_sysInfo(eid1,"精力值不够了哦")
		return USE_SKILL_ERROR
	end
	if math.random(1,100) >= 75 then
		OnFailedUseSkill60001(userid)
		return USE_SKILL_ERROR
	end
	local rand = math.random(1,10000)
	local bindstr = "1-0,"
	if OnUseSkill_60001_CheckNeedBind(userid) == VALUE_OK then
		bindstr = "1-1,"
	end
	if rand <= 300 then
		s_addItem(userid,27113,0,1,0,bindstr .. "2-4","药草采集")
	elseif rand <= 900 then
		s_addItem(userid,27113,0,1,0,bindstr .. "2-3","药草采集")
	elseif rand <= 5700 then
		s_addItem(userid,27113,0,1,0,bindstr .. "2-2","药草采集")
	else
		s_addItem(userid,27113,0,1,0,bindstr .. "2-1","药草采集")
	end
	OnFinishUseSkill60001(userid)
end
function DoGather_60001_10(userid)
	local npcid = s_getVar(userid,100,1)
	local hp = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_HP)
	if hp == 0 or hp == nil then
		s_sysInfo(userid,"动作慢了一步，被人抢先了")
		return USE_SKILL_ERROR
	end
	if s_addValue(SCENE_ENTRY_PLAYER,userid,VALUE_TYPE_ENERGY,1) == 0 then
		s_sysInfo(eid1,"精力值不够了哦")
		return USE_SKILL_ERROR
	end
	if math.random(1,100) >= 80 then
		OnFailedUseSkill60001(userid)
		return USE_SKILL_ERROR
	end
	local rand = math.random(1,10000)
	local bindstr = "1-0,"
	if OnUseSkill_60001_CheckNeedBind(userid) == VALUE_OK then
		bindstr = "1-1,"
	end
	if rand <= 400 then
		s_addItem(userid,27113,0,1,0,bindstr .. "2-4","药草采集")
	elseif rand <= 1100 then
		s_addItem(userid,27113,0,1,0,bindstr .. "2-3","药草采集")
	elseif rand <= 6500 then
		s_addItem(userid,27113,0,1,0,bindstr .. "2-2","药草采集")
	else
		s_addItem(userid,27113,0,1,0,bindstr .. "2-1","药草采集")
	end
	OnFinishUseSkill60001(userid)
end
