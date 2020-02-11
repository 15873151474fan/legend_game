--召唤鬼仆
function OnUseSkill_5059(level,etype1,eid1,etype2,eid2)
	local levels = s_getValue(etype1,eid1,VALUE_TYPE_LEVEL)
    local npctable = {[41001]=9,[41002]=15,[41003]=20,[41004]=25,[41005]=30,[41006]=35,[41007]=37,[41008]=40,[41009]=45,[41010]=50,[41011]=55,[41012]=60,[41013]=65,[41014]=70,[41015]=75,[41016]=80,[41017]=85,[41018]=90}
    local result = {}
    local curnpcId = 0;
    local minList = {};
	local percent = {0.1,0.11,0.12,0.13,0.14}
    for idx ,value in pairs(npctable) do
        if levels - value >= 0 then
           result[levels-value] = idx
           table.insert(minList,levels - value)
        end
    end
    table.sort(minList)
    curnpcId = result[minList[1]];
	local damage=math.floor(s_getValue(etype1,eid1,VALUE_TYPE_TMAXDAM)*percent[level]+100);
	local npcid = s_summon(etype1,eid1,curnpcId)
	if npcid ~= 0 then
		s_addValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_PDAM_ADD_BASE,damage)
		s_addValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MDAM_ADD_BASE,damage)
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER,eid1)
		s_setValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_MASTERTYPE, etype1)
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,20*60*1000)
        s_addbuff(etype1,eid1,2013,levels,60 * 20)
	end
	ShowAttack(5059,etype1,eid1,etype2,npcid)

	if etype1 == SCENE_ENTRY_PLAYER then
		s_addValue(etype1,eid1,VALUE_TYPE_SKILL_5059,1)
	end
end
