--中级BOSS封印
function OnUseItemEvent_10140(uid,thisid,targetid,number)
    local curid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
	local sceneid={6,7,8,9,10,11,12,14,104}
	local usenum   = s_getVar(uid,164,8)
    local userlevel = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL);

    -- if userlevel < 80 then
       -- s_sysInfo(uid,"需要80级以上才能使用该物品",ChatPos_Tips)
       -- return VALUE_FAIL
    -- end

	-- if usenum >= 20 then
       -- s_sysInfo(uid,"每天只能解封20道BOSS封印",ChatPos_Tips)
       -- return VALUE_FAIL
	-- end
	--local x=0
	--local mapid=0
	-- for i,v in ipairs(sceneid) do
		-- if curid == HashSceneID(3,sceneid[i]) then
			-- x=1
			-- mapid=sceneid[i]
		-- end
	-- end
    
	-- if x == 0 then
		-- s_sysInfo(uid,"只能在70级以上地图和战城使用",ChatPos_Tips)
        -- return VALUE_FAIL
	-- end
	    
    
	local cannum = 0;
	if number <= (20 - usenum) then
        cannum = number
    end
	
	if s_deleteItemByThisID(uid,thisid,cannum,"OnUseItemEvent_10140") ~= VALUE_OK then
        return VALUE_FAIL
    end
	
    local npctable = {233,234,235,235,233,234}
    --local rand = math.random(1,6)
	for i,v in ipairs(npctable) do
		local curnpcid = npctable[i]
		local posx = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSX)+i
		local posy = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSY)+i
		local npcid = s_sysSummon(curnpcid,curid,posx,posy,103,1)
		--local mapname = s_getMapName(mapid)	
		if npcid ~= 0 then
			s_setValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_LIFE,20*60*1000)
			local name1 = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_NAME)
			local name2 = s_getValue(SCENE_ENTRY_NPC,npcid,VALUE_TYPE_NAME)
			--s_sysInfo(uid,"BOSS封印已解除，从虚空中传来异样的声音...",ChatPos_Tips)
			--s_worldInfo("[#3]"..name1.."[-]在[#2]"..mapname.."("..posx..","..posy..")[-]解开了BOSS[#5]"..name2.."[-]的封印，少侠们快去击杀！",ChatPos_Important)
			s_setVar(uid,164,8,s_getVar(uid,164,8) + 0)
		end
		
	end
    return VALUE_OK
    
	

    
	
	

    --return VALUE_FAIL
end
