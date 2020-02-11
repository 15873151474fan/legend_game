--召唤神灵
function OnUseSkill_5060(level,etype1,eid1,etype2,eid2)
	local levels = s_getValue(etype1,eid1,VALUE_TYPE_LEVEL)
    local npctable = {[41101]=75,[41102]=77,[41103]=79,[41104]=81,[41105]=83,[41106]=85,[41107]=87,[41108]=89,[41109]=90,[41110]=95}
    local result = {}
    local curnpcId = 0;
	local damage=s_getValue(etype1,eid1,VALUE_TYPE_TMAXDAM)
	local percent = {0.2,0.21,0.22,0.23,0.24}
    local minList = {};
    for idx ,value in pairs(npctable) do
        if levels - value >= 0 then
           result[levels-value] = idx
           table.insert(minList,levels - value)
        end
    end
    table.sort(minList)
    curnpcId = result[minList[1]];
	damage=math.floor(damage*percent[level]+600);
	local npcid = s_summon(etype1,eid1,curnpcId)
	if npcid ~= 0 then
		s_addValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_PDAM_ADD_BASE,damage)
		s_addValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MDAM_ADD_BASE,damage)
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER,eid1)
		s_setValue(SCENE_ENTRY_NPC, npcid, VALUE_TYPE_MASTERTYPE, etype1)
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,20*60*1000)
        s_addbuff(etype1,eid1,2013,levels,60 * 20)
	end
	ShowAttack(5060,etype1,eid1,etype2,npcid)
	if etype1 == SCENE_ENTRY_PLAYER then
		s_addValue(etype1,eid1,VALUE_TYPE_SKILL_5060,1)
	end
end
