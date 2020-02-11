--高级BOSS封印
function OnUseItemEvent_500001(uid,thisid,targetid,number)
    local curid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
	local sceneid={6,7,8,9,10,11,12,14}
	local usenum   = s_getVar(uid,164,8)
    local userlevel = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL);

    if userlevel < 80 then
        s_sysInfo(uid,"需要80级以上才能使用该物品",ChatPos_Tips)
        return VALUE_FAIL
    end

	if usenum >= 20 then
        s_sysInfo(uid,"每天只能解封20道BOSS封印",ChatPos_Tips)
        return VALUE_FAIL
	end
	local x=0
	local mapid=0
	for i,v in ipairs(sceneid) do
		if curid == HashSceneID(3,sceneid[i]) then
			x=1
			mapid=sceneid[i]
		end
	end
    
	if x == 0 then
		s_sysInfo(uid,"只能在70级以上地图和战城使用",ChatPos_Tips)
        return VALUE_FAIL
	end
	    
    
	local cannum = 0;
	if number <= (2000 - usenum) then
        cannum = number
    end
	
	if s_deleteItemByThisID(uid,thisid,cannum,"OnUseItemEvent_500001") ~= VALUE_OK then
        return VALUE_FAIL
    end
	
    local npctable1 = {23001,23002,23003,23004}
	local npctable2 = {23005,23006,23007,23008}
	local npctable3 = {23009,23010,23011,23012}
	local npctable4 = {23013,23014,23015,23016}
	local npctable5 = {23017,23018,23019,23020}
	local npctable6 = {23021,23022,23023}
	local bossname
	local curnpcid
	local rand
	if  (usenum+1)%6==1 then
		rand = math.random(1,4)
		curnpcid = npctable1[rand]	
		bossname="第1个BOSS_稀有度【"		
	end
	if  (usenum+1)%6==2 then
		rand = math.random(1,4)
		curnpcid = npctable2[rand]	
		bossname="第2个BOSS_稀有度【"			
	end
	if  (usenum+1)%6==3 then
		rand = math.random(1,4)
		curnpcid = npctable3[rand]	
		bossname="第3个BOSS_稀有度【"		
	end
	if  (usenum+1)%6==4 then
		rand = math.random(1,4)
		curnpcid = npctable4[rand]	
		bossname="第4个BOSS_稀有度【"	
	end
	if  (usenum+1)%6==5 then
		rand = math.random(1,4)
		curnpcid = npctable5[rand]	
		bossname="第5个BOSS_稀有度【"	
	end
	if  (usenum+1)%6==0 then
		rand = math.random(1,3)
		curnpcid = npctable6[rand]	
		rand=rand+2
		bossname="第6个BOSS_稀有度【"			
	end
	
    local posx = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSX)
    local posy = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSY)
	

    local npcid = s_sysSummon(curnpcid,curid,posx,posy,103,1)
	local mapname = s_getMapName(mapid)	
	if npcid ~= 0 then
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,20*60*1000)
        local name1 = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
        local name2 = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NAME)
	    s_sysInfo(uid,bossname..rand.."】",ChatPos_Tips)
        s_worldInfo("[#3]"..name1.."[-]在[#2]"..mapname.."("..posx..","..posy..")[-]解开了混乱深渊"..bossname..rand.."】的封印",ChatPos_Important)
		s_setVar(uid,164,8,s_getVar(uid,164,8) + cannum)
	    return VALUE_OK
	end

    return VALUE_FAIL
end







