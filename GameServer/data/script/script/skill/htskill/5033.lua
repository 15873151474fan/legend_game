--地域冥火(目标点周围共5个格子持续受到伤害，火堆持续时间固定为120秒，每2秒受到1次伤害，伤害为攻击力的75%)
function OnUseSkill_5033(level,etype1,eid1,etype2,eid2)
    s_debug("begin use 5033")
	if s_getValue(etype1,eid1,VALUE_TYPE_PROFESSION) ~= Profession_Gunman then
        s_debug("use skill err1 5033")
		return USE_SKILL_ERROR
	end

	--local percent = {-0.25,-0.25,-0.25,-0.25}
	--local life = { 300,500,700,1200,1700,2200,3000,3800,5000,6200,8000,9800,11600,13400,15200,17000}
	local percent = {0.38,0.39,0.40,0.41,0.42}
    local damage = math.floor(GetAttackValue(etype1,eid1)*percent[level]);

    --中心点
    --local posx = x
    --local posy = y
    --if x == nil and y == nil then
    posx = s_getValue(etype2,eid2,VALUE_TYPE_POSX)
    posy = s_getValue(etype2,eid2,VALUE_TYPE_POSY)
    --end

    --火墙5个坐标点
    posList = {posx,posy,posx-1,posy,posx+1,posy,posx,posy-1,posx,posy+1}
    for i = 1,table.getn(posList),2  do
        local npcid = s_summon(etype1,eid1,48001,0,0,posList[i],posList[i+1])
        if npcid ~= 0 then
            s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MASTER,eid1)
            s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,120*1000)
            s_addValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_PDAM_ADD_BASE,damage)
            s_addValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_MDAM_ADD_BASE,damage)
            --地狱冥火需要无敌模式，不然会受到攻击
            s_addState(SCENE_ENTRY_NPC,npcid,SceneEntry_God)
            ShowAttack(5033,etype1,eid1,etype2,eid2)
        end
        --s_addbuff(SCENE_ENTRY_NPC,npcid,30,life[level] - 100,10)
    end
	if etype1 == SCENE_ENTRY_PLAYER then
		s_addValue(etype1,eid1,VALUE_TYPE_SKILL_5033,1)
	end

end
