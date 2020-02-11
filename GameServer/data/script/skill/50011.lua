--战友生命礼赞:废弃
function OnUseSkill_50011(level,etype1,eid1,etype2,eid2)
--[[
--检查是否是战友，并且好友度达到最高等级
local level = s_getCompanionLevel(etype1,eid1,eid2)
if level == 0 then
s_sysInfo(eid1,"不能对非战友使用该技能")
return USE_SKILL_ERROR
elseif level < 9 then
s_sysInfo(eid1,"好友度等级达到生死之交才可以对对方使用")
return USE_SKILL_ERROR
end
if s_getValue(etype2,eid2,VALUE_TYPE_HP) ~= 0 then
s_sysInfo(eid1,"对方没有死亡")
return USE_SKILL_ERROR
end
local func = string.format("OnSkillAction_50011($1,$2,%u)",eid1)
local buttons = "确定|3|Enter|取消|5|Esc"
local msg = "您的战友牺牲自身生命力，希望能够复活您。请问是否接受？"
s_registerMsgBox(eid2,func,buttons,msg,300,1)
ShowAttack(50011,etype1,eid1,etype2,eid2)
]]
end

--此函数起效，不可删除
function OnSkillAction_50011(eid2,result,eid1)
	if result ~= Button_Yes then return end
	if s_getValue(SCENE_ENTRY_PLAYER,eid1,VALUE_TYPE_HP) == 0 then
		s_sysInfo(eid2,"对方当前已经死亡，复活失败")
		return USE_SKILL_ERROR
	end
	if s_getValue(SCENE_ENTRY_PLAYER,eid2,VALUE_TYPE_HP) ~= 0 then
		return USE_SKILL_ERROR
	end
	if s_relive(SCENE_ENTRY_PLAYER,eid2) ~= VALUE_OK then
		return USE_SKILL_ERROR
	end
	local etype = SCENE_ENTRY_PLAYER
	local maxhp = s_getValue(etype,eid2,VALUE_TYPE_MAXHP)
	local maxsp = s_getValue(etype,eid2,VALUE_TYPE_MAXSP)
	s_setValue(etype,eid2,VALUE_TYPE_HP,maxhp)
	s_setValue(etype,eid2,VALUE_TYPE_SP,maxsp)
	local hp = s_getValue(etype,eid1,VALUE_TYPE_HP)
	hp = math.floor(hp * 0.75)
	s_subValue(etype,eid1,VALUE_TYPE_HP,hp)
end
