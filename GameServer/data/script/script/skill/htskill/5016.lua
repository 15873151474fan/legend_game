--蛮牛冲撞
--技能等级和冲撞距离的关系
local levelDistance = {3,4,5,5,5}
local skill5016 = {{1,30,0.5},{2,35,0.6},{3,40,0.7},{4,45,0.8},{5,50,1}}
local test_44011 = {{1,20,30},{2,25,32},{3,30,33},{4,35,34},{5,40,36},{6,45,37},{7,50,39},{8,55,40},{9,60,42},{10,65,43},{11,70,45},{12,80,50}}
function OnUseSkill_5016(level,etype1,eid1,etype2,eid2,curdir)
	if s_getValue(etype1,eid1,VALUE_TYPE_PROFESSION) ~= Profession_Soldier then
		return USE_SKILL_ERROR
	end
	--s_debug("TestSkill_5016;;;;;;;;;;;;;"..test_44011[1][1].." "..test_44011[1][2].." "..test_44011[1][3].." "..test_44011[2][1].." "..test_44011[2][2].." "..test_44011[2][3])
	if s_checkPK(5016,etype1,eid1,etype1,eid2) == VALUE_FAIL then
		return USE_SKILL_ERROR
	end

        local name = s_getNpcByTmpID(etype2,eid2)
	if name == "城主雕像" then
		return USE_SKILL_ERROR
	end
      --安全区
       if  s_checkZoneType(etype1,eid1,ZONE_ABSOLUTE) == VALUE_OK then
	       s_sysInfo(eid1,"安全区不允许PK")
	       return USE_SKILL_ERROR
       end

	--等级判断
       local play1Level = s_getValue(etype1,eid1,VALUE_TYPE_LEVEL)
       local play2Level = s_getValue(etype2,eid2,VALUE_TYPE_LEVEL)
       local RebirthLevel1 = s_getRebirthLevel(eid1)
       local RebirthLevel2 = 0
       if etype2 == SCENE_ENTRY_NPC then
	       RebirthLevel2 = 0
       else
	       RebirthLevel2 = s_getRebirthLevel(eid2)
       end

       s_debug("OnUseSkill_5016==level1"..play1Level.."play2="..play2Level.."zhuansheng1=="..RebirthLevel1.."zhuansheng2"..RebirthLevel2.." dir="..curdir.."boss="..s_getValue(etype2,eid2,VALUE_TYPE_MONSTER_TYPE))
       if RebirthLevel1 < RebirthLevel2 then
	       s_sysInfo(eid1,"力量不足，冲撞失败",ChatPos_Tips)
	       return USE_SKILL_ERROR
       elseif RebirthLevel1 == RebirthLevel2 then
		if play1Level < play2Level then
			s_sysInfo(eid1,"力量不足，冲撞失败", ChatPos_Tips)
			return USE_SKILL_ERROR
		end
       else
       end

       --不允许撞击BOSS
       if s_getValue(etype2,eid2,VALUE_TYPE_MONSTER_TYPE) == 3 then
	       s_sysInfo(eid1,"力量不足，冲撞失败", ChatPos_Tips)
	       return USE_SKILL_ERROR
       end

	--local mapid = s_getValue(etype2,eid2,VALUE_TYPE_CURRENT_MAP)
	--s_trace("king......mapid="..mapid)

	local posx = s_getValue(etype2,eid2,VALUE_TYPE_POSX)
	local posy = s_getValue(etype2,eid2,VALUE_TYPE_POSY)
     
    local myposx = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
    local myposy = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
    local dstList = s_getBlockPrePoint(etype1,eid1,posx,posy)
	local poslist = getnowNstepos(etype1,eid1,curdir,levelDistance[level])
	local findp = false
	local index= 0
	local distance= {}
	local mindistance = 99
	local iIndex = 0;
	for i=1,#poslist,2 do
		s_trace(" poslist x=".. poslist[i].." y="..poslist[i+1].." x="..posx.." y="..posy)
		if poslist[i] == posx and poslist[i+1] == posy then
			findp = true
			index = i
			break;
		end
		--distance[i] = twoPointToDistance(poslist[i], poslist[i+1], posx, posy)
		--计算最大距离的点
		--if distance[i] < mindistance then
		--	mindistance = distance[i]
		--end
	end
	if findp == false then
		s_trace(" target not in line,最远坐标:x="..poslist[#poslist - 1].." y="..poslist[#poslist])
		--计算出和目标距离最近的点
		s_goto(etype1,eid1,poslist[#poslist - 1],poslist[#poslist],8,curdir)
		return USE_SKILL_ERROR
	end
	--local p2pos = getnowNstepos(etype2,eid2,curdir,3)--被撞击者下一坐标
	local bRet = VALUE_OK
	local p2pos = getnowNpos2(etype2,eid2,curdir,levelDistance[level])
    if table.getn(dstList) > 1 then
        if dstList[1] == myposx and dstList[2] == myposy then
            return USE_SKILL_ERROR
        end
		if dstList[1] == posx and dstList[2] == posy then
			bRet = s_checkBlock(etype2, eid2, p2pos[3],p2pos[4],curdir)
			s_goto(etype2,eid2,p2pos[3],p2pos[4],8,curdir)
			s_goto(etype1,eid1,p2pos[1],p2pos[2],8,curdir)
			--s_trace("122222222222222222222222222222222222222222222222222233333..ret="..bRet)
			if bRet == 1 then
			 bRet = 3
			end

		else
			if s_goto(etype1,eid1,dstList[1],dstList[2],8,curdir) ~= VALUE_OK then
				s_trace("122222222222222222223333333333333333")
				return USE_SKILL_ERROR
			end
		end
		s_trace(" 5016 dislist x="..dstList[1].." y="..dstList[2])
    end

	s_trace(" 5016 p2pos x="..p2pos[3].." y="..p2pos[4].." ret="..bRet)
    --s_trace('OnUseSkill_5016 etype1='..etype1..",eid1="..eid1..",etype2="..etype2..",eid2="..eid2..",x="..dstList[1]..",y="..dstList[2]);
    --ShowAttack(5016,etype1,eid1,etype2,eid2)

    --伤害
    --local damage = s_getValue(etype1,eid1,VALUE_TYPE_PDAM)
	--local percent = {0,0,0,0,0}
    --local damage  = GetAttackValue(etype1,eid1)* percent[level];
	--local value = damage * 0.2
	--s_trace("222222222222222222222222 5016 damage="..damage)
	--MagicAttack(5016,VALUE_TYPE_PDAM,etype1,eid1,etype2,eid2,damage)

	if etype1 == SCENE_ENTRY_PLAYER then
		s_addValue(etype1,eid1,VALUE_TYPE_SKILL_5016,1)
	end
	--冲撞成功
	--s_addbuff(etype2,eid2,2003,1,5)
	--s_sysInfo(eid1,"冲成功，目标被眩晕",ChatPos_Sys)
	return bRet
end

--平面两点间的距离
function twoPointToDistance(x1,y1,x2,y2)
	return math.sqrt(math.pow((y2-y1),2)+math.pow((x2-x1),2))
end
