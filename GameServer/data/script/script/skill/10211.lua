--战术隐蔽
function OnUseSkill_10211(level,etype1,eid1,etype2,eid2)
	local stype = s_getValue(etype1,eid1,VALUE_TYPE_SCENE_TYPE)
	if stype >= CopySceneType_Challenge and stype <= CopySceneType_Challenge5 then
		s_sysInfo(eid1,"当前场景不能使用此技能")
		return USE_SKILL_ERROR
	end
	if s_getbufflevel(etype1,eid1,10304) ~= 0 then
		if etype1 == SCENE_ENTRY_PLAYER then
			s_sysInfo(eid1,"标记状态不允许隐身")
		end
		return USE_SKILL_ERROR
	end
	if s_getbufflevel(etype1,eid1,20300) ~= 0 then
		s_sysInfo(eid1,"持有旗帜时无法隐身")
		return USE_SKILL_ERROR
	end
	if s_getbufflevel(etype1,eid1,20301) ~= 0 then
		s_sysInfo(eid1,"持有旗帜时无法隐身")
		return USE_SKILL_ERROR
	end
	if s_getbufflevel(etype1,eid1,10211) ~= 0 then
		s_updateBuffTime(etype1,eid1,10211,30)
	else
		s_addbuff(etype1,eid1,10211,level,30,10211)
	end
	ShowAttack(10211,etype1,eid1,etype2,eid2)
end
