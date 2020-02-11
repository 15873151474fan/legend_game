--闪电炮塔
function OnUseSkill_10407(level,etype1,eid1,etype2,eid2)
	local life = { 300,500,700,1200,1700,2200,3000,3800,5000,6200,8000,9800,11600,13400,15200,17000}

	local npcid = s_summon(etype1,eid1,48001)
	if npcid == 0 then
		return USE_SKILL_ERROR
	end
	s_addbuff(SCENE_ENTRY_NPC,npcid,30,life[level] - 100,10)
	s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER,eid1)
	s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,60*1000)
	ShowAttack(10407,etype1,eid1,etype2,eid2)
end
--炮塔的攻击走NPC统一的攻击流程 48001.lua
