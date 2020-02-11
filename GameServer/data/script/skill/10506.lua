--召唤火元素 待开发
function OnUseSkill_10506(level,etype1,eid1,etype2,eid2)
--[[
local HP_percent = {30}
local CHANCE_percent = { 20,25,30,35,40}
local Time1 = { 20,22,24,26,28,30,32,34,36}
local maxhp = s_getValue(etype1,eid1,VALUE_TYPE_MAXHP)

local npcid = s_summon(etype1,eid1,48002)
if npcid == 0 then
return USE_SKILL_ERROR
else
if math.random(1,100) <= CHANCE_percent[level] then
s_addbuff(SCENE_ENTRY_NPC,npcid,30,maxhp*HP_percent[level],10)
s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER,eid1)
s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,Time1[level]*1000)
end
end
--符文相关
if s_getRuneDur(eid1,48002) > 0 then
s_reduceRuneDur(eid1,48002)
end
ShowAttack(48002,etype1,eid1,etype2,eid2)
]]
end
--火元素的攻击走攻击流程 48002.lua
