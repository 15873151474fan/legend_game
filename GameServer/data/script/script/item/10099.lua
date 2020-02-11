--高级BOSS封印
function OnUseItemEvent_10099(uid,thisid,targetid,number)
    local curid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
	local sceneid={6,7,8,9,10,11,12,14}
	local usenum   = s_getVar(uid,164,8)
    local userlevel = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL);

    if userlevel < 80 then
        s_sysInfo(uid,"需要80级以上才能使用该物品",ChatPos_Tips)
        return VALUE_FAIL
    end

	if usenum >= 20 then
        s_sysInfo(uid,"每天只能使用20次BOSS召唤令",ChatPos_Tips)
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
		s_sysInfo(uid,"只能在70级以上地图和王城使用",ChatPos_Tips)
        return VALUE_FAIL
	end
	    
    
	local cannum = 0;
	if number <= (20 - usenum) then
        cannum = number
    end
	
	if s_deleteItemByThisID(uid,thisid,cannum,"OnUseItemEvent_10099") ~= VALUE_OK then
        return VALUE_FAIL
    end
	
    local npctable = {17008,17009,17010,17011,17012,17008,17009,17008,17009,17009}
    local rand = math.random(1,10)
    local curnpcid = npctable[rand]
    local posx = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSX)
    local posy = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSY)
	

    local npcid = s_sysSummon(curnpcid,curid,posx,posy,103,1)
	local mapname = s_getMapName(mapid)	
	if npcid ~= 0 then
		s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,20*60*1000)
        local name1 = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
        local name2 = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NAME)
	    s_sysInfo(uid,"BOSS正在召唤，从虚空中传来异样的声音...",ChatPos_Tips)
        s_worldInfo("[#3]"..name1.."[-]在[#2]"..mapname.."("..posx..","..posy..")[-]召唤了BOSS[#5]"..name2.."[-]，勇士们快去击杀！",ChatPos_Important)
		s_setVar(uid,164,8,s_getVar(uid,164,8) + cannum)
	    return VALUE_OK
	end

    return VALUE_FAIL
end







