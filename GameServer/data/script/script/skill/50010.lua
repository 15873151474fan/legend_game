--战友同袍
function OnUseSkill_50010(level,etype1,eid1,etype2,eid2)
--[[
local level = s_getbufflevel(etype1,eid1,30014)
if level > 0 then
s_removebuff(etype1,eid1,30014)
else
s_addbuff(etype1,eid1,30014,1,600)
end
ShowAttack(50010,etype1,eid1,etype2,eid2)
]]
end
