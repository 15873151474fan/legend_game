--蚀骨术(最多对24个目标造成群体中毒，并有%5的几率使目标减速,持续2秒)
function OnUseSkill_5061(level,etype1,eid1,etype2,eid2,posx,posy)
   local damage  = 0 
    --local percent = {4.5,5.0,5.5,6.0,6.5,7.0,7.5,8.0,8.5,9.0}
    local percentDamge = {[1]={4.5,15000},[2]={5.0,16000},[3]={5.5,17000},[4]={6.0,22000},[5]={6.5,23000},
                        [6]={7.0,24000},[7]={7.5,30000},[8]={8.0,35000},[9]={8.5,40000},[10]={9.0,50000}}
    local victim  = {}
    local num    = 0;
    if etype1 == SCENE_ENTRY_NPC then
            s_debug("OnUseSkill_5061 error NPC不能使用该技能")
            return USE_SKILL_ERROR
    end 

    if etype2 == SCENE_ENTRY_PLAYER then
        s_debug("OnUseSkill_5061 error 只能对怪物使用该技能")
        return USE_SKILL_ERROR
    end 
    s_debug("OnUseSkill_5061 lua call: percent=".." adddamage="..percentDamge[level][2])
    local time=60
    local num = 0 

        ----是否可PK
    if s_checkPK(5061,etype1,eid1,etype2,eid2) ~= VALUE_OK then
        --local entry_x = s_getValue(etype2,eid2,VALUE_TYPE_POSX)
        --local entry_y = s_getValue(etype2,eid2,VALUE_TYPE_POSY)
        --local att_x   = s_getValue(etype1,eid1,VALUE_TYPE_POSX);
        --local att_y   = s_getValue(etype1,eid1,VALUE_TYPE_POSY);
        --local dst = math.sqrt((entry_x- att_x)^2 + (entry_y-att_y)^2)
        --攻击距离是5
        --if dst > 5 then
                return USE_SKILL_ERROR
        --end 
    end 
    
 damage  = GetAttackValue(etype1,eid1) * percentDamge[level][1] + percentDamge[level][2];
 s_debug("OnUseSkill_5061 lua call, dam="..damage)
    MagicAttack(5061,VALUE_TYPE_MDAM,etype1,eid1,etype2,eid2,damage)
end
