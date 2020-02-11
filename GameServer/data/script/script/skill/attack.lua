USE_SKILL_ERROR = 0
USE_SKILL_SUCESS = 1
MAGIC_ATTACK_PERCENT_VALUE = 10000

--群体攻击特效
function ShowAttackMulti(skillid,etype1,eid1,...)
	s_debug("ShowAttackMuti")
	s_attack(skillid,etype1,eid1,0,0,...)
end

--显示客户端攻击特效--------------------------------------------------------------------
function ShowAttack(skillid,etype1,eid1,etype2,eid2)
	s_attack(skillid,etype1,eid1,0,0,etype2,eid2,0,0)
end
--显示客户端攻击特效--------------------------------------------------------------------
function ShowAttackWithHurType(skillid,etype1,eid1,etype2,eid2,hurttype,hurtnum)
	s_attack(skillid,etype1,eid1,0,0,etype2,eid2,hurttype,hurtnum)
end
--攻减防攻击计算---------------------------------------------------------------------
function MagicAttack(skillid,atype,etype1,eid1,...)
	local percent = MAGIC_ATTACK_PERCENT_VALUE
	s_MagicAttack(skillid,atype,percent,etype1,eid1,...)
end
--直接伤害，不走PK流程---------------------------------------------------------------
function DirectAttack(skillid,etype1,eid1,...)	--变长参数为攻击类型和攻击数值
	local victim = {}
	local arg = {...}
	for i = 1, #arg, 3 do
		local etype2,eid2,damage= arg[i],arg[i+1],arg[i+2]
		table.insert(victim,etype2)
		table.insert(victim,eid2)
		table.insert(victim,0)
		table.insert(victim,damage)
	end
	s_attack(skillid,etype1,eid1,0,0,unpack(victim))
end
--特伤攻击----------------------------------------------------------------------------
function MagicHurtAttack(skillid,etype1,eid1,htype,damage, ...)
	local victim = {}
	local arg = {...}
	for i = 1, #arg, 2 do
		local etype2,eid2 = arg[i],arg[i+1]	--变长参数处理
		local hdef = 0
		if htype == ATTACK_TYPE_LH then
			hdef = s_getValue(etype2,eid2,VALUE_TYPE_LDEF)
		end
		if htype == ATTACK_TYPE_HH then
			hdef = s_getValue(etype2,eid2,VALUE_TYPE_HDEF)
		end
		if htype == ATTACK_TYPE_BH then
			hdef = s_getValue(etype2,eid2,VALUE_TYPE_BDEF)
		end
		if htype == ATTACK_TYPE_WH then
			hdef = s_getValue(etype2,eid2,VALUE_TYPE_WDEF)
		end
		if damage >= hdef then
			damage = damage - hdef
		else
			damage = 0
		end
		table.insert(victim,etype2)
		table.insert(victim,eid2)
		table.insert(victim,0)
		table.insert(victim,0)
	end
	s_attack(skillid,etype1,eid1,htype,damage,unpack(victim))
end

--团魔甲攻击玩家---------------------------------------------------------------------
function ArmyEquipAttack(skillid,etype1,eid1,etype2,eid2,hurtadd)
	local hurt = 0
	local htype = s_getValue(etype1,eid1,VALUE_TYPE_HURT_TYPE)
	if htype ~= 0 then
		local hdef = 0
		if htype == ATTACK_TYPE_LH then
			hurt = s_getValue(etype1,eid1,VALUE_TYPE_LDAM)
			hdef = s_getValue(etype2,eid2,VALUE_TYPE_LDEF)
		end
		if htype == ATTACK_TYPE_HH then
			hurt = s_getValue(etype1,eid1,VALUE_TYPE_HDAM)
			hdef = s_getValue(etype2,eid2,VALUE_TYPE_HDEF)
		end
		if htype == ATTACK_TYPE_BH then
			hurt = s_getValue(etype1,eid1,VALUE_TYPE_BDAM)
			hdef = s_getValue(etype2,eid2,VALUE_TYPE_BDEF)
		end
		if htype == ATTACK_TYPE_WH then
			hurt = s_getValue(etype1,eid1,VALUE_TYPE_WDAM)
			hdef = s_getValue(etype2,eid2,VALUE_TYPE_WDEF)
		end
		if hurt >= hdef then
			hurt = hurt - hdef
		else
			hurt = 0
		end
	end
	s_attack(skillid,etype1,eid1,htype,hurt+hurtadd ,etype2,eid2)
end

--1把2击退step格-------------------------------------------------------------------------
--1把2击退step格-------------------------------------------------------------------------
function BeatBack(etype1,eid1,etype2,eid2,step,gtype)
	local x1 = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
	local y1 = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	local x2 = s_getValue(etype2,eid2,VALUE_TYPE_POSX)
	local y2 = s_getValue(etype2,eid2,VALUE_TYPE_POSY)

	local dst = math.floor(math.sqrt((x1-x2)^2 + (y1-y2)^2))
	if dst == 0 then dst = 1 end
	local x = step / dst * (x2 - x1) + x2
	local y = step / dst * (y2 - y1) + y2

	s_goto(etype2,eid2,x,y,gtype)
end
--1向2跳跃step格
function JumpTo(etype1,eid1,etype2,eid2,step,gtype)
	if eid2 == nil or eid2 == 0 then return end

	local x1 = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
	local y1 = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	local x2 = s_getValue(etype2,eid2,VALUE_TYPE_POSX)
	local y2 = s_getValue(etype2,eid2,VALUE_TYPE_POSY)

	local dst = math.floor(math.sqrt((x1-x2)^2 + (y1-y2)^2))
	if dst == 0 then dst = 1 end
	local x = step / dst * (x2 - x1) + x1
	local y = step / dst * (y2 - y1) + y1

	s_goto(etype1,eid1,x,y,gtype)
end
--随机获得一个仇恨玩家
function GetRandomPlayer(etype1,eid1,etype2,eid2)
	local posx = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
	local posy = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	local etype,eid,lock = s_getEnemy(eid1)
	if lock == VALUE_FAIL then
		etype = etype2
		eid = eid2
		s_setEnemy(eid1,etype,eid,VALUE_OK)
	else
		eid = 0
		local list = s_getEnemyEntry(eid1)
		local dstlist = {}
		local curnumber = 0
		for i = 1,table.getn(list), 2 do
			local x1 = s_getValue(list[i],list[i+1],VALUE_TYPE_POSX)
			local y1 = s_getValue(list[i],list[i+1],VALUE_TYPE_POSY)
			if math.sqrt((x1-posx)^2 + (y1-posy)^2) > 3 then
				table.insert(dstlist,list[i])
				table.insert(dstlist,list[i+1])
				curnumber = curnumber + 1
			end
		end
		if curnumber > 0 then
			local j = math.random(1,curnumber)
			if dstlist[2*j-1] == etype2 and dstlist[2*j] ~= eid2 then
				etype = etype2
				eid = dstlist[2*j]
				s_setEnemy(eid1,etype,eid,VALUE_FAIL)
			end
		end
	end
	return etype,eid
end
--获得直线间的所可攻击的玩家-------------------------------------------------------
function GetPlayerInLine(etype1,eid1,etype2,eid2)
	local range = {}
	local step = {0.8,0.6,0.4,0.2}
	local x1 = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
	local y1 = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	local posx = s_getValue(etype2,eid2,VALUE_TYPE_POSX)
	local posy = s_getValue(etype2,eid2,VALUE_TYPE_POSY)
	posx,posy = GetFarEntryPosition(x1,y1,posx,posy,10)
	for i = 1,table.getn(step) do
		local x = x1 * step[i] + (1 - step[i]) * posx
		local y = y1 * step[i] + (1 - step[i]) * posy
		table.insert(range,x)
		table.insert(range,y)
	end
	local victim = {}
	local list = s_getNineEntry(etype1,eid1,15)
	for i = 1,table.getn(list), 2 do
        local entry_x = s_getValue(list[i],list[i+1],VALUE_TYPE_POSX)
        local entry_y = s_getValue(list[i],list[i+1],VALUE_TYPE_POSY)
        for j = 1,table.getn(range),2 do
            local dst = math.sqrt((entry_x-range[j])^2 + (entry_y-range[j+1])^2)
            if dst < 3 then
                table.insert(victim,list[i])
                table.insert(victim,list[i+1])
                s_debug("inline = %d-%d-%d-%d",list[i],list[i+1],s_getValue(list[i],list[i+1],VALUE_TYPE_POSX),s_getValue(list[i],list[i+1],VALUE_TYPE_POSY));
                break
            end
        end
	end
	return victim
end
--获得两个物件之间的距离-------------------------------------------------------
function GetEntryPosition(etype1,eid1,etype2,eid2)
	local x1 = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
	local y1 = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	local x2 = s_getValue(etype2,eid2,VALUE_TYPE_POSX)
	local y2 = s_getValue(etype2,eid2,VALUE_TYPE_POSY)
	if x1 == nil or y1 == nil or x2 == nil or y2 == nil then
		return 0
	end
	return math.floor(math.sqrt((x1-x2)^2 + (y1-y2)^2))
end

--计算A点到B点距离为r的C点坐标--------------------------------------------------------------------------
function GetFarEntryPosition(pa_x,pa_y,pb_x,pb_y,r)
	if pa_x == pb_x and pa_y == pb_y then return 0,0 end
	local dist_ab = math.sqrt((pa_x-pb_x)^2 + (pa_y-pb_y)^2)
	if dist_ab == 0 then dist_ab = 1 end
	local posx = pa_x + (pb_x - pa_x) * r / dist_ab
	local posy = pa_y + (pb_y - pa_y) * r / dist_ab
	return posx,posy
end

--检查免疫buff--------------------------------------------------------------------------
function CheckPowerBuff(etype1,eid1)
	if s_getbufflevel(etype1,eid1,10612) ~= 0 then
		return VALUE_OK   --天然抗体
	end
	if s_getbufflevel(etype1,eid1,10110) ~= 0 then
		return VALUE_OK  --战神附体
	end
	return VALUE_FAIL
end
--通用放毒函数--------------------------------------------------------------------------
function SpeadPoison(etype1,eid1,etype2,eid2,plevel,buffid)
	local MAX_HURT = {
		{20,  50,  90,   190},
		{40,  90,  180,  360},
		{60,  140, 280,  570},
		{80,  200, 410,  820},
		{120, 300, 600,  1210},
		{180, 460, 920,  1840},
		{260, 650, 1300, 2600},
		{340, 860, 1720, 3450},
		{440, 1090,2190, 4380},
		{540, 1350,2690, 5390},
		{700, 1750,3500, 7000},
		{880, 2190,4380, 8760},
		{1070,2670,5330,10660},
		{1270,3180,6350,12700},
		{1490,3720,7440,14880}
	}
	if buffid == nil then buffid = 20003 end
	local PERCENT = {2,5,10,20}
	if s_getbufflevel(etype2,eid2,buffid ) == 0 then
		local level = s_getValue(etype1,eid1,VALUE_TYPE_LEVEL)
		level  = math.floor(1+(level-1) / 10 )
		s_addbuff(etype2,eid2,buffid,PERCENT[plevel],10,MAX_HURT[level][plevel])
	end
end
--Boss的群攻技能走特殊流程-----------------------------------------------------------------
function BossDamage(etype1,eid1,alevel,bosslevel)
	local MAX_HURT = {
		{190,  380,  560,  750  },
		{340,  680,  1020, 1360 },
		{520,  1040, 1550, 2070 },
		{710,  1420, 2130, 2840 },
		{1010, 2010, 3020, 4020 },
		{1480, 2950, 4430, 5900 },
		{2300, 4610, 6910, 9220 },
		{3320, 6640, 9970, 13290},
		{4530, 9070, 13600,18130},
		{5940, 11880,17830,23770},
		{8170, 16340,24500,32670},
		{9890, 19790,29680,39580},
		{11660,23320,34980,46640},
		{13470,26940,40410,53880},
		{15320,30640,45960,61280}
	}
	local htype = s_getValue(etype1,eid1,VALUE_TYPE_HURT_TYPE)
	if htype == nil or htype == 0 then
		return 0,0
	end

	if bosslevel == nil or bosslevel == 0 then
		bosslevel = s_getValue(etype1,eid1,VALUE_TYPE_LEVEL)
	end
	bosslevel = math.floor(1+(bosslevel-1) / 10 )
	return htype,MAX_HURT[bosslevel][alevel]
end

--巴比伦塔的Boss技能走特殊流程-----------------------------------------------------------------
function BossBabylonDamage(etype1,eid1,alevel,bosslevel)
	local MAX_HURT = {
		{1720,2750,4120,5840},--1-91级,1-3层
		{1790,2860,4300,6090},--2-92级,4-6层
		{1860,2980,4470,6340},--3-93级,7-9层
		{1940,3100,4650,6590},--4-94级,10-12层
		{2010,3220,4830,6840},--5-95级,13-15层
		{2080,3330,5000,7090},--6-96级,16-18层
		{2160,3450,5180,7340},--7-97级,19-21层
		{2230,3570,5350,7590},--8-98级,22-24层
		{2300,3690,5530,7840},--9-99级,25-27层
		{2380,3800,5710,8090},--10-100级,28-30层
		{2450,3920,5880,8340},--11-103级,31-33层
		{2570,4120,6180,8750},--12-106级,34-36层
		{2700,4310,6470,9170},--13-109级,37-40层
		{2820,4510,6770,9580},--14-113级,41-43层
		{2940,4710,7060,10000},--15-116级,44-46层
		{3060,4900,7350,10420},--16-119级,47-50层
		{3190,5100,7650,10830},--17-123级,51-53层
		{3310,5290,7940,11250},--18-126级,54-56层
		{3430,5490,8240,11670},--19-129级,57-60层
	}
	local htype = s_getValue(etype1,eid1,VALUE_TYPE_HURT_TYPE)
	if htype == nil or htype == 0 then
		return 0,0
	end
	if bosslevel == nil or bosslevel == 0 then
		bosslevel = s_getValue(etype1,eid1,VALUE_TYPE_LEVEL)
	end
	if	bosslevel <= 100 then
		if	bosslevel <= 90 then bosslevel = 91 end
		bosslevel = math.floor(bosslevel - 90 )
	else
		bosslevel = 10 + 3*math.floor((bosslevel-100) / 10 )+math.mod(bosslevel,10)/3
	end
	return htype,MAX_HURT[bosslevel][alevel]
end
--使用技能-----------------------------------------------------------------
function OnUseSkill(skill,level,atype,attackid,defendtype,defendid,attdirect)
	
	--血液汲取技能会被嘲讽打断
	if skill == 10108 then s_removebuff(defendtype,defendid,20025) end
	local fun = rawget(_G,"OnUseSkill_" .. skill)
	if fun ~= nil then
		MAGIC_ATTACK_PERCENT_VALUE = 10000
		local ret = fun(level,atype,attackid,defendtype,defendid,attdirect)
		if ret==3 then
			return 3
		end
		if ret ~= USE_SKILL_ERROR then
			return VALUE_OK --技能返回nil和USE_SKILL_SUCESS都为成功
		end
		return VALUE_FAIL
	end
end

function OnUseSkillWithPos(skill,level,atype,attackid,defendtype,defendid,posx,posy,attdirect)
	local fun = rawget(_G,"OnUseSkill_" .. skill)
	if fun ~= nil then
		MAGIC_ATTACK_PERCENT_VALUE = 10000
		local ret = fun(level,atype,attackid,defendtype,defendid,posx,posy,attdirect)
		if ret ~= USE_SKILL_ERROR then
			return VALUE_OK --技能返回nil和USE_SKILL_SUCESS都为成功
		end
		return VALUE_FAIL
	end
end

--玩家攻击团魔甲
function OnPlayerAttackArmyequip(skillid,level,etype1,eid1,etype2,eid2)
	--	if s_checkPK(skillid,etype1,eid1,etype2,eid2) == VALUE_OK then
	--		return VALUE_FAIL
	--	end
	local damage = s_getValue(etype1,eid1,VALUE_TYPE_PDAM)
	local tmp = s_getValue(etype1,eid1,VALUE_TYPE_MDAM)
	if damage < tmp then
		local hit = s_getValue(etype1,eid1,VALUE_TYPE_MHIT)
		damage = tmp + math.random(0,hit)
	else
		local hit = s_getValue(etype1,eid1,VALUE_TYPE_PHIT)
		damage = damage + math.random(0,hit)
	end
	local worldlevel = s_getWorldLevel()
	local rate = 93+worldlevel
	if rate >= 100 then
		rate = 1
	else
		rate = 100 - rate
	end
	damage = damage * rate * 0.01
	if damage < 1 then
		s_sysInfo(eid1,"攻击力太低打不动啊")
	end
	s_attack(skillid,etype1,eid1,0,0,etype2,eid2,0,damage)
	return VALUE_OK
end
--玩家攻击镖车
function OnPlayerAttackGuard(skill,level,etype1,eid1,etype2,eid2)
	local damage = s_getValue(etype1,eid1,VALUE_TYPE_PDAM)
	local tmp = s_getValue(etype1,eid1,VALUE_TYPE_MDAM)
	if damage < tmp then
		local hit = s_getValue(etype1,eid1,VALUE_TYPE_MHIT)
		damage = tmp + math.random(0,hit)
	else
		local hit = s_getValue(etype1,eid1,VALUE_TYPE_PHIT)
		damage = damage + math.random(0,hit)
	end
	if damage < 1 then
		damage = 1
	end
	--不同等级的攻击者减伤效果不一样
	local level1 = s_getValue(etype1,eid1,VALUE_TYPE_LEVEL)
	local level2 = s_getValue(etype2,eid2,VALUE_TYPE_LEVEL)
	local sub = 0
	if level1 > (level2 + 20) then
		sub = 3000
	end
	if level1 > (level2 + 40) then
		sub = 4000
	end
	if level1 > (level2 + 60) then
		sub = 7000
	end
	damage =  math.floor(damage * (10000 - sub)/10000)
	s_attack(skill,etype1,eid1,0,0,etype2,eid2,0,damage)
	return VALUE_OK
end
--玩家攻击魔甲BOSS
function OnPlayerAttackEquipBoss(skillid,level,etype1,eid1,etype2,eid2)
	--  if s_checkPK(skillid,etype1,eid1,etype2,eid2) == VALUE_OK then
	--      return VALUE_FAIL
	--  end
	local damage = s_getValue(etype1,eid1,VALUE_TYPE_PDAM)
	local tmp = s_getValue(etype1,eid1,VALUE_TYPE_MDAM)
	if damage < tmp then
		local hit = s_getValue(etype1,eid1,VALUE_TYPE_MHIT)
		damage = tmp + math.random(0,hit)
	else
		local hit = s_getValue(etype1,eid1,VALUE_TYPE_PHIT)
		damage = damage + math.random(0,hit)
	end
	damage = damage * 0.05
	if damage < 1 then
		s_sysInfo(eid1,"攻击力太低打不动啊")
	end
	s_attack(skillid,etype1,eid1,0,0,etype2,eid2,0,damage)
	return VALUE_OK
end

--获得攻击者的攻击力
function GetAttackValue(etype1,eid1)
    local damage = 0;
    local dwmaxatt = 0;
    local dwminatt = 0;

    if etype1 == SCENE_ENTRY_PLAYER then
        local profession =  s_getValue(etype1,eid1,VALUE_TYPE_PROFESSION)
        if profession == Profession_Soldier then
            dwminatt = s_getValue(etype1,eid1,VALUE_TYPE_PDAM);
            dwmaxatt = s_getValue(etype1,eid1,VALUE_TYPE_PMAXDAM);
        elseif profession == Profession_Gunman then
            dwminatt = s_getValue(etype1,eid1,VALUE_TYPE_MDAM);
            dwmaxatt = s_getValue(etype1,eid1,VALUE_TYPE_MMAXDAM);
        elseif  profession == Profession_Freeman then
            dwminatt = s_getValue(etype1,eid1,VALUE_TYPE_TDAM);
            dwmaxatt = s_getValue(etype1,eid1,VALUE_TYPE_TMAXDAM);
        end
        local dwluck = s_getValue(etype1,eid1,VALUE_TYPE_LUCK);
        local dwcurse = s_getValue(etype1,eid1,VALUE_TYPE_CURSE);
        local dwresult = 0;

        if dwluck > dwcurse then
            dwresult = (dwluck - dwcurse) / 10 * 100;
            if dwresult > 90 then
                dwresult = 90;
            end
            if math.random(1,100)  < dwresult then
                damage = dwmaxatt;
            else
            	damage = math.random(math.min(dwminatt,dwmaxatt),math.max(dwminatt,dwmaxatt));
				--打不到最大就取随机，而不是取最小
                --damage = dwminatt;
            end

        elseif (dwcurse > dwluck) then
            dwresult = ( dwcurse - dwluck) / 10 * 100;
            if dwresult  > 90 then
                dwresult = 90;
            end
            if math.random(1,100)  < dwresult then
                damage = dwminatt;
            else
            	damage = math.random(math.min(dwminatt,dwmaxatt),math.max(dwminatt,dwmaxatt));
				--打不到最小就取随机，而不是取最大
                --damage = dwmaxatt;
            end
        else
            damage = math.random(math.min(dwminatt,dwmaxatt),math.max(dwminatt,dwmaxatt));
        end
    else
        -- 怪物ai里已经自动获取了攻击类型并获得相应攻击力，理论上是不会到这里

    end

    --伤害加成
    damage = math.floor(damage * (1 + s_getValue(etype1,eid1,VALUE_TYPE_DAMAGE_ADD_PER) * 0.0001));
    return damage;
end

--获得攻击目标方向后的N个目标(目前像刺杀剑术，灭世斩在用)
--etype1(目标类型),eid1(目标id),curdir(目标方向),num(后面几个目标)
function getAttackDir(etype1,eid1,curdir,num)
    local poslist = {};
    local temptype,tempid,tmpposx,tmpposy;
    local posx = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
    local posy = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
    for i = 1,num do
        if DIR_RIGHT == curdir then  --向右
            tmpposx = posx + i;
            tmpposy = posy;
        --elseif DIR_RIGHTUP == curdir then  -- 右上
            --tmpposx = posx + i;
            --tmpposy = posy - i;
        elseif DIR_UP == curdir then -- 向上
            tmpposx = posx;
            tmpposy = posy - i;
        --elseif DIR_LEFTUP == curdir then -- 左上
            --tmpposx = posx - i;
            --tmpposy = posy - i;
        elseif DIR_LEFT == curdir then --向左
            tmpposx = posx - i;
            tmpposy = posy;
        --elseif DIR_LEFTDOWN == curdir then -- 左下
            --tmpposx = posx - i;
            --tmpposy = posy + i;
        elseif DIR_DOWN == curdir then --向下
            tmpposx = posx;
            tmpposy = posy + i;
        --elseif DIR_RIGHTDOWN == curdir then -- 右下
            --tmpposx = posx + i;
            --tmpposy = posy + i;
        end
        table.insert(poslist,tmpposx);
        table.insert(poslist,tmpposy);
    end
    return poslist;
end

function getHalfcircleDir(etype1,eid1,curdir)
    local poslist = {};
    local temptype,tempid,tmpposx,tmpposy;
    local posx = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
    local posy = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	local x1,x2,x3,x4,x5
	local y1,y2,y3,y4,y5
	if DIR_RIGHT == curdir then  --向右
		x1,y1 = getFrantPos(etype1,eid1,curdir)
		x2,y2 = getLeftPos(etype1,eid1,curdir)
		x3,y3 = getRightPos(etype1,eid1,curdir)
		x4,y4 = getpreRightPos(etype1,eid1,curdir)
		x5,y5 = getpreLeftPos(etype1,eid1,curdir)
	elseif DIR_RIGHTUP == curdir then  -- 右上
		x1,y1 = getFrantPos(etype1,eid1,curdir)
		x2,y2 = getLeftPos(etype1,eid1,curdir)
		x3,y3 = getRightPos(etype1,eid1,curdir)
		x4,y4 = getpreRightPos(etype1,eid1,curdir)
		x5,y5 = getpreLeftPos(etype1,eid1,curdir)
	elseif DIR_UP == curdir then -- 向上
		x1,y1 = getFrantPos(etype1,eid1,curdir)
		x2,y2 = getLeftPos(etype1,eid1,curdir)
		x3,y3 = getRightPos(etype1,eid1,curdir)
		x4,y4 = getpreRightPos(etype1,eid1,curdir)
		x5,y5 = getpreLeftPos(etype1,eid1,curdir)
	elseif DIR_LEFTUP == curdir then -- 左上
		x1,y1 = getFrantPos(etype1,eid1,curdir)
		x2,y2 = getLeftPos(etype1,eid1,curdir)
		x3,y3 = getRightPos(etype1,eid1,curdir)
		x4,y4 = getpreRightPos(etype1,eid1,curdir)
		x5,y5 = getpreLeftPos(etype1,eid1,curdir)
	elseif DIR_LEFT == curdir then --向左
		x1,y1 = getFrantPos(etype1,eid1,curdir)
		x2,y2 = getLeftPos(etype1,eid1,curdir)
		x3,y3 = getRightPos(etype1,eid1,curdir)
		x4,y4 = getpreRightPos(etype1,eid1,curdir)
		x5,y5 = getpreLeftPos(etype1,eid1,curdir)
	elseif DIR_LEFTDOWN == curdir then -- 左下
		x1,y1 = getFrantPos(etype1,eid1,curdir)
		x2,y2 = getLeftPos(etype1,eid1,curdir)
		x3,y3 = getRightPos(etype1,eid1,curdir)
		x4,y4 = getpreRightPos(etype1,eid1,curdir)
		x5,y5 = getpreLeftPos(etype1,eid1,curdir)
	elseif DIR_DOWN == curdir then --向下
		x1,y1 = getFrantPos(etype1,eid1,curdir)
		x2,y2 = getLeftPos(etype1,eid1,curdir)
		x3,y3 = getRightPos(etype1,eid1,curdir)
		x4,y4 = getpreRightPos(etype1,eid1,curdir)
		x5,y5 = getpreLeftPos(etype1,eid1,curdir)
	elseif DIR_RIGHTDOWN == curdir then --向下
		x1,y1 = getFrantPos(etype1,eid1,curdir)
		x2,y2 = getLeftPos(etype1,eid1,curdir)
		x3,y3 = getRightPos(etype1,eid1,curdir)
		x4,y4 = getpreRightPos(etype1,eid1,curdir)
		x5,y5 = getpreLeftPos(etype1,eid1,curdir)
	end
        table.insert(poslist,x1);
        table.insert(poslist,y1);
        table.insert(poslist,x2);
        table.insert(poslist,y2);
        table.insert(poslist,x3);
        table.insert(poslist,y3);
        table.insert(poslist,x4);
        table.insert(poslist,y4);
        table.insert(poslist,x5);
        table.insert(poslist,y5);
		return poslist
end

function getFrantPos(etype1,eid1,curdir)
    local temptype,tempid,tmpposx,tmpposy;
    local posx = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
    local posy = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	if DIR_RIGHT == curdir then  --向右
		tmpposx = posx + 1;
		tmpposy = posy;
	elseif DIR_RIGHTUP == curdir then  -- 右上
		tmpposx = posx + 1;
		tmpposy = posy - 1;
	elseif DIR_UP == curdir then -- 向上
		tmpposx = posx;
		tmpposy = posy - 1;
	elseif DIR_LEFTUP == curdir then -- 左上
		tmpposx = posx - 1;
		tmpposy = posy - 1;
	elseif DIR_LEFT == curdir then --向左
		tmpposx = posx - 1;
		tmpposy = posy;
	elseif DIR_LEFTDOWN == curdir then -- 左下
		tmpposx = posx - 1;
		tmpposy = posy + 1;
	elseif DIR_DOWN == curdir then --向下
		tmpposx = posx;
		tmpposy = posy + 1;
	elseif DIR_RIGHTDOWN == curdir then --向下
		tmpposx = posx + 1;
		tmpposy = posy + 1;
	end
	return tmpposx,tmpposy
end

function getBackPos(etype1,eid1,curdir)
	 local temptype,tempid,tmpposx,tmpposy;
    local posx = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
    local posy = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	if DIR_RIGHT == curdir then  --向右
		tmpposx = posx - 1;
		tmpposy = posy;
	elseif DIR_RIGHTUP == curdir then  -- 右上
		tmpposx = posx - 1;
		tmpposy = posy + 1;
	elseif DIR_UP == curdir then -- 向上
		tmpposx = posx;
		tmpposy = posy + 1;
	elseif DIR_LEFTUP == curdir then -- 左上
		tmpposx = posx + 1;
		tmpposy = posy + 1;
	elseif DIR_LEFT == curdir then --向左
		tmpposx = posx + 1;
		tmpposy = posy;
	elseif DIR_LEFTDOWN == curdir then -- 左下
		tmpposx = posx + 1;
		tmpposy = posy - 1;
	elseif DIR_DOWN == curdir then --向下
		tmpposx = posx;
		tmpposy = posy - 1;
	elseif DIR_RIGHTDOWN == curdir then --向下
		tmpposx = posx - 1;
		tmpposy = posy - 1;
	end
	return tmpposx,tmpposy
end

function getLeftPos(etype1,eid1,curdir)
	local temptype,tempid,tmpposx,tmpposy;
    local posx = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
    local posy = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	if DIR_RIGHT == curdir then  --向右
		tmpposx = posx ;
		tmpposy = posy - 1;
	elseif DIR_RIGHTUP == curdir then  -- 右上
		tmpposx = posx - 1;
		tmpposy = posy - 1;
	elseif DIR_UP == curdir then -- 向上
		tmpposx = posx - 1;
		tmpposy = posy;
	elseif DIR_LEFTUP == curdir then -- 左上
		tmpposx = posx - 1;
		tmpposy = posy + 1;
	elseif DIR_LEFT == curdir then --向左
		tmpposx = posx;
		tmpposy = posy + 1;
	elseif DIR_LEFTDOWN == curdir then -- 左下
		tmpposx = posx + 1;
		tmpposy = posy + 1;
	elseif DIR_DOWN == curdir then --向下
		tmpposx = posx + 1;
		tmpposy = posy;
	elseif DIR_RIGHTDOWN == curdir then --向下
		tmpposx = posx + 1;
		tmpposy = posy - 1;
	end
	return tmpposx,tmpposy
end

function getRightPos(etype1,eid1,curdir)
	local temptype,tempid,tmpposx,tmpposy;
    local posx = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
    local posy = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	if DIR_RIGHT == curdir then  --向右
		tmpposx = posx;
		tmpposy = posy + 1;
	elseif DIR_RIGHTUP == curdir then  -- 右上
		tmpposx = posx + 1;
		tmpposy = posy + 1;
	elseif DIR_UP == curdir then -- 向上
		tmpposx = posx + 1;
		tmpposy = posy;
	elseif DIR_LEFTUP == curdir then -- 左上
		tmpposx = posx + 1;
		tmpposy = posy - 1;
	elseif DIR_LEFT == curdir then --向左
		tmpposx = posx;
		tmpposy = posy - 1;
	elseif DIR_LEFTDOWN == curdir then -- 左下
		tmpposx = posx - 1;
		tmpposy = posy - 1;
	elseif DIR_DOWN == curdir then --向下
		tmpposx = posx - 1;
		tmpposy = posy;
	elseif DIR_RIGHTDOWN == curdir then --向下
		tmpposx = posx - 1;
		tmpposy = posy + 1;
	end
	return tmpposx,tmpposy
end

function getpreRightPos(etype1,eid1,curdir)
	 local temptype,tempid,tmpposx,tmpposy;
    local posx = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
    local posy = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	if DIR_RIGHT == curdir then  --向右
		tmpposx = posx + 1;
		tmpposy = posy + 1;
	elseif DIR_RIGHTUP == curdir then  -- 右上
		tmpposx = posx ;
		tmpposy = posy + 1;
	elseif DIR_UP == curdir then -- 向上
		tmpposx = posx + 1;
		tmpposy = posy - 1;
	elseif DIR_LEFTUP == curdir then -- 左上
		tmpposx = posx;
		tmpposy = posy - 1;
	elseif DIR_LEFT == curdir then --向左
		tmpposx = posx - 1;
		tmpposy = posy - 1;
	elseif DIR_LEFTDOWN == curdir then -- 左下
		tmpposx = posx - 1;
		tmpposy = posy ;
	elseif DIR_DOWN == curdir then --向下
		tmpposx = posx - 1;
		tmpposy = posy + 1;
	elseif DIR_RIGHTDOWN == curdir then --向下
		tmpposx = posx ;
		tmpposy = posy + 1;
	end
	return tmpposx,tmpposy
end

function getpreLeftPos(etype1,eid1,curdir)
	 local temptype,tempid,tmpposx,tmpposy;
    local posx = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
    local posy = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	if DIR_RIGHT == curdir then  --向右
		tmpposx = posx + 1;
		tmpposy = posy - 1;
	elseif DIR_RIGHTUP == curdir then  -- 右上
		tmpposx = posx ;
		tmpposy = posy - 1;
	elseif DIR_UP == curdir then -- 向上
		tmpposx = posx - 1;
		tmpposy = posy - 1;
	elseif DIR_LEFTUP == curdir then -- 左上
		tmpposx = posx - 1;
		tmpposy = posy;
	elseif DIR_LEFT == curdir then --向左
		tmpposx = posx - 1;
		tmpposy = posy + 1;
	elseif DIR_LEFTDOWN == curdir then -- 左下
		tmpposx = posx ;
		tmpposy = posy + 1;
	elseif DIR_DOWN == curdir then --向下
		tmpposx = posx + 1;
		tmpposy = posy + 1;
	elseif DIR_RIGHTDOWN == curdir then --向下
		tmpposx = posx + 1;
		tmpposy = posy ;
	end
	return tmpposx,tmpposy
end

function getbackRightPos(etype1,eid1,curdir)
	 local temptype,tempid,tmpposx,tmpposy;
    local posx = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
    local posy = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	if DIR_RIGHT == curdir then  --向右
		tmpposx = posx - 1;
		tmpposy = posy + 1;
	elseif DIR_RIGHTUP == curdir then  -- 右上
		tmpposx = posx ;
		tmpposy = posy + 1;
	elseif DIR_UP == curdir then -- 向上
		tmpposx = posx + 1;
		tmpposy = posy + 1;
	elseif DIR_LEFTUP == curdir then -- 左上
		tmpposx = posx + 1;
		tmpposy = posy ;
	elseif DIR_LEFT == curdir then --向左
		tmpposx = posx + 1;
		tmpposy = posy - 1;
	elseif DIR_LEFTDOWN == curdir then -- 左下
		tmpposx = posx ;
		tmpposy = posy - 1;
	elseif DIR_DOWN == curdir then --向下
		tmpposx = posx - 1;
		tmpposy = posy - 1;
	elseif DIR_RIGHTDOWN == curdir then --向下
		tmpposx = posx - 1;
		tmpposy = posy ;
	end
	return tmpposx,tmpposy
end


function getbackLeftPos(etype1,eid1,curdir)
	 local temptype,tempid,tmpposx,tmpposy;
    local posx = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
    local posy = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	if DIR_RIGHT == curdir then  --向右
		tmpposx = posx - 1;
		tmpposy = posy - 1;
	elseif DIR_RIGHTUP == curdir then  -- 右上
		tmpposx = posx - 1;
		tmpposy = posy ;
	elseif DIR_UP == curdir then -- 向上
		tmpposx = posx - 1;
		tmpposy = posy + 1;
	elseif DIR_LEFTUP == curdir then -- 左上
		tmpposx = posx ;
		tmpposy = posy + 1;
	elseif DIR_LEFT == curdir then --向左
		tmpposx = posx + 1;
		tmpposy = posy + 1;
	elseif DIR_LEFTDOWN == curdir then -- 左下
		tmpposx = posx + 1;
		tmpposy = posy ;
	elseif DIR_DOWN == curdir then --向下
		tmpposx = posx + 1;
		tmpposy = posy - 1;
	elseif DIR_RIGHTDOWN == curdir then --向下
		tmpposx = posx ;
		tmpposy = posy - 1;
	end
	return tmpposx,tmpposy
end

function getnowcyclepos(etype1,eid1,curdir)
    local posx = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
    local posy = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	local tmplist = {}
	for i=0,7,1 do
		local tmpx,tmpy = GetPosByDirect(posx,posy,i,1)
        table.insert(tmplist,tmpx);
        table.insert(tmplist,tmpy);
	end
	return tmplist
end
function getnow2stepcyclepos(etype1,eid1,curdir)
    local posx = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
    local posy = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	local tmplist = {}
	for i=0,7,1 do
		local tmpx,tmpy = GetPosByDirect(posx,posy,i,2)
        table.insert(tmplist,tmpx);
        table.insert(tmplist,tmpy);
	end
	local tmpx1 = posx + 2
	local tmpy1 = posy - 1
    table.insert(tmplist,tmpx1);
    table.insert(tmplist,tmpy1);
	local tmpx2 = posx + 1
	local tmpy2 = posy - 2
    table.insert(tmplist,tmpx2);
    table.insert(tmplist,tmpy2);
	local tmpx3 = posx + 2
	local tmpy3 = posy + 1
    table.insert(tmplist,tmpx3);
    table.insert(tmplist,tmpy3);
	local tmpx4 = posx + 1
	local tmpy4 = posy + 2
    table.insert(tmplist,tmpx4);
    table.insert(tmplist,tmpy4);
	local tmpx5 = posx - 1
	local tmpy5 = posy - 2
    table.insert(tmplist,tmpx5);
    table.insert(tmplist,tmpy5);
	local tmpx6 = posx - 2
	local tmpy6 = posy - 1
    table.insert(tmplist,tmpx6);
    table.insert(tmplist,tmpy6);
	local tmpx7 = posx - 2
	local tmpy7 = posy + 1
    table.insert(tmplist,tmpx7);
    table.insert(tmplist,tmpy7);
	local tmpx8 = posx - 1
	local tmpy8 = posy + 2
    table.insert(tmplist,tmpx8);
    table.insert(tmplist,tmpy8);
	return tmplist
end


function getnowNstepos(etype1,eid1,curdir,num)
    local posx = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
    local posy = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	local tmplist = {}
	local iNum = tonumber(num)
	for i=1,iNum do
		local tmpx,tmpy = GetPosByDirect(posx,posy,curdir,i)
        table.insert(tmplist,tmpx);
        table.insert(tmplist,tmpy);
	--s_debug("x="..posx.."xxxxxxxx="..tmpx.."yyyyyyy="..tmpy)
	end
	return tmplist
end

--获取指定num距离的坐标
function getnowNpos(etype1,eid1,curdir,num)
    local posx = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
    local posy = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
	local tmplist = {}
	local iNum = tonumber(num)
	s_debug("num=================="..iNum)
	local tmpx,tmpy = GetPosByDirect(posx,posy,curdir,num)
	table.insert(tmplist,tmpx);
 	table.insert(tmplist,tmpy);
	return tmplist
end

function getNextpos(posx,posy,curdir,num)
        local tmplist = {}
        local iNum = tonumber(num)
        s_debug("getNextpos num=================="..iNum)
        local tmpx,tmpy = GetPosByDirect(posx,posy,curdir,num)
        table.insert(tmplist,tmpx);
        table.insert(tmplist,tmpy);
        return tmplist
end

function getnowNpos2(etype1,eid1,curdir,num)
    local posx = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
    local posy = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
        local tmplist = {}
        local iNum = tonumber(num)
        s_debug("num=================="..iNum)
	for i=iNum-1,iNum do
        local tmpx,tmpy = GetPosByDirect(posx,posy,curdir,i)
        table.insert(tmplist,tmpx);
        table.insert(tmplist,tmpy);
	end

        return tmplist
end

--以目标为起始点,包含目标位置
function getAttackDir2(etype1,eid1,curdir,num)
    local poslist = {};
    local temptype,tempid,tmpposx,tmpposy;
    local posx = s_getValue(etype1,eid1,VALUE_TYPE_POSX)
    local posy = s_getValue(etype1,eid1,VALUE_TYPE_POSY)
    for i = 0,num-1 do
        if DIR_RIGHT == curdir then  --向右
            tmpposx = posx + i;
            tmpposy = posy;
        --elseif DIR_RIGHTUP == curdir then  -- 右上
            --tmpposx = posx + i;
            --tmpposy = posy - i;
        elseif DIR_UP == curdir then -- 向上
            tmpposx = posx;
            tmpposy = posy - i;
        --elseif DIR_LEFTUP == curdir then -- 左上
            --tmpposx = posx - i;
            --tmpposy = posy - i;
        elseif DIR_LEFT == curdir then --向左
            tmpposx = posx - i;
            tmpposy = posy;
        --elseif DIR_LEFTDOWN == curdir then -- 左下
            --tmpposx = posx - i;
            --tmpposy = posy + i;
        elseif DIR_DOWN == curdir then --向下
            tmpposx = posx;
            tmpposy = posy + i;
        --elseif DIR_RIGHTDOWN == curdir then -- 右下
            --tmpposx = posx + i;
            --tmpposy = posy + i;
        end
        table.insert(poslist,tmpposx);
        table.insert(poslist,tmpposy);
    end
    return poslist;
end
