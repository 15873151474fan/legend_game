--技能0 测试脚本函数用，随便改=============================================
function OnUseSkill_0(level,etype1,eid1,etype2,eid2)
	local stype,sid = s_getselect(etype1,eid1)
	if stype == SCENE_ENTRY_NPC then
		s_killnpc(sid,1)
	end
end
--技能1 老板视察，效果九屏玩家全灭=============================================
function OnUseSkill_1(level,etype1,eid1,etype2,eid2)
	for i = 1,level do
		local victim = {}
		local list = s_getNineEntry(etype1,eid1,20)
		for i = 1,table.getn(list), 2 do
			if list[i] ~= etype1 or list[i+1] ~= eid1 then
				if s_checkPK(1,etype1,eid1,list[i],list[i+1]) == VALUE_OK then
					local hp = s_getValue(list[i],list[i+1],VALUE_TYPE_HP)
					local maxhp = s_getValue(list[i],list[i+1],VALUE_TYPE_MAXHP)
					if hp <= maxhp then
						table.insert(victim,list[i])
						table.insert(victim,list[i+1])
						table.insert(victim,hp)
					end
				end
			end
		end
		DirectAttack(5502,etype1,eid1,unpack(victim))
	end
end
--技能2 九屏满血回复===========================================================
function OnUseSkill_2(level,etype1,eid1,etype2,eid2)
	local list = s_getNineEntry(etype1,eid1,20)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			local curhp = s_getValue(list[i],list[i+1],VALUE_TYPE_HP)
			local maxhp = s_getValue(list[i],list[i+1],VALUE_TYPE_MAXHP)
			local cursp = s_getValue(list[i],list[i+1],VALUE_TYPE_SP)
			local maxsp = s_getValue(list[i],list[i+1],VALUE_TYPE_MAXSP)
			if curhp ~= maxhp or cursp ~= maxsp then
				s_addValue(list[i],list[i+1],VALUE_TYPE_HP,10000)
				s_addValue(list[i],list[i+1],VALUE_TYPE_SP,10000)
				s_setValue(list[i],list[i+1],VALUE_TYPE_DEMON_JOIN,300)
				ShowAttack(10604,etype1,eid1,etype2,eid2)
			end
		end
	end
end
--技能3 选中单体直接伤害===============================================================
function OnUseSkill_3(level,etype1,eid1,etype2,eid2)
	local etype,eid = s_getSelect(eid1)
	if eid == 0 then
		s_sysInfo(eid1,"请先选中目标",ChatPos_Sys + ChatPos_Important)
		return USE_SKILL_ERROR
	end
	DirectAttack(5000,etype1,eid1,etype,eid,level)
end
--技能4 选中单体百分比直接伤害===========================================================
function OnUseSkill_4(level,etype1,eid1,etype2,eid2)
	local etype,eid = s_getSelect(eid1)
	if eid == 0 then
		s_sysInfo(eid1,"请先选中目标",ChatPos_Sys + ChatPos_Important)
		return USE_SKILL_ERROR
	end
	local maxhp = s_getValue(etype,eid,VALUE_TYPE_MAXHP)
	DirectAttack(5000,etype1,eid1,etype,eid,maxhp*level/100)
end
--技能5 学会本职业所有技能=============================================================
function OnUseSkill_5(level,etype1,eid1,etype2,eid2)
	local profession =  s_getValue(etype1,eid1,VALUE_TYPE_PROFESSION)
	if profession == Profession_Soldier then
		s_addskill(etype1,eid1,5006,1)
		for i = 10100,10120 do
			s_addskill(etype1,eid1,i,1)
		end
	elseif profession == Profession_Spy then
		s_addskill(etype1,eid1,5007,1)
		for i = 10200,10220 do
			s_addskill(etype1,eid1,i,1)
		end
	elseif profession == Profession_Gunman then
		s_addskill(etype1,eid1,5008,1)
		for i = 10300,10320 do
			s_addskill(etype1,eid1,i,1)
		end
	elseif profession == Profession_Blast then
		s_addskill(etype1,eid1,5009,1)
		for i = 10400,10420 do
			s_addskill(etype1,eid1,i,1)
		end
	elseif profession == Profession_Freeman then
		s_addskill(etype1,eid1,5010,1)
		for i = 10500,10520 do
			s_addskill(etype1,eid1,i,1)
		end
	elseif profession == Profession_Doctor then
		s_addskill(etype1,eid1,5011,1)
		for i = 10600,10620 do
			s_addskill(etype1,eid1,i,1)
		end
	end
end
--九屏复活===========================================================
function OnUseSkill_6(level,etype1,eid1,etype2,eid2)
	local list = s_getNineEntry(etype1,eid1,20)
	for i = 1,table.getn(list), 2 do
		if list[i] == SCENE_ENTRY_PLAYER then
			s_relive(list[i],list[i+1])
		end
	end
end
--九屏持续攻击===========================================================
function OnUseSkill_7(level,etype1,eid1,etype2,eid2)
	local npcid = s_summon(etype1,eid1,10001,999,1)
end
--九屏持续回复===========================================================
function OnUseSkill_8(level,etype1,eid1,etype2,eid2)
	local npcid = s_summon(etype1,eid1,10001,998,1)
end
--九屏持续清除CD===========================================================
function OnUseSkill_9(level,etype1,eid1,etype2,eid2)
	local npcid = s_summon(etype1,eid1,10001,997,1)
end
--召唤小弟===========================================================
function OnUseSkill_10(level,etype1,eid1,etype2,eid2)
	for i=1,level do
		local npcid = s_summon(etype1,eid1,10001,996,1)
	end
end
