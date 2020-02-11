--嗜血狂暴 待开发
function OnUseSkill_10105(level,etype1,eid1,etype2,eid2)
--[[
if etype1 == etype2 and eid1 == eid2 then
return USE_SKILL_ERROR
end
local percent = {100,110,120,130,140,150}
local time1 = {1,1,2,2,3,3}
--local time2 = {1,1,1,2,3,3}

if etype1 == SCENE_ENTRY_PLAYER and s_getTrafficType(eid1) == TrafficType_Horse then
s_resetTrafficType(eid1)
end
if etype2 == SCENE_ENTRY_PLAYER and s_getTrafficType(eid2) == TrafficType_Horse then
s_resetTrafficType(eid2)
end
local posx = s_getValue(etype2,eid2,VALUE_TYPE_POSX)
local posy = s_getValue(etype2,eid2,VALUE_TYPE_POSY)
if s_goto(etype1,eid1,posx,posy,1) ~= VALUE_OK then
return USE_SKILL_ERROR
end

--if s_getbufflevel(etype2,eid2,10715) ~= 0 then
--	return USE_SKILL_ERROR
--end

s_addbuff(etype1,eid1,10105,30,time1[level])

if math.random(1,100) < s_getValue(etype2,eid2,VALUE_TYPE_FAINTDEF) then
s_sysInfo(eid1,"对方眩晕免疫中")
s_sysInfo(eid2,"免疫对方眩晕")
s_addbuff(etype2,eid2,10715,1,2)
else
s_addbuff(etype2,eid2,10703,1,time2[level])
s_addbuff(etype2,eid2,10715,1,3+time2[level])
end

local damage = s_getValue(etype1,eid1,VALUE_TYPE_PDAM)
local value = 0
value = damage * percent[level]/100
--MAGIC_ATTACK_PERCENT_VALUE = hurt[level]*100
MagicAttack(10105,VALUE_TYPE_PDAM,etype1,eid1,etype2,eid2,value)
]]--
end
