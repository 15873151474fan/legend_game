--boss殿堂传送员1
function OnClickNpc_311(uid,npcid)
    local copytype  = s_getValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_SCENE_TYPE)
    if copytype == CopySceneType_BossHome1 then
        --是在boss殿堂一层给予传送
        s_intoCopy(uid,CopySceneType_BossHome2,208,0,18,79)
    end
end


--boss殿堂二层传送员1
function OnClickNpc_308(uid,npcid)
    --local copytype  = s_getValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_SCENE_TYPE)
    --if copytype == CopySceneType_BossHome2 then
        --是在boss殿堂一层给予传送,去一层
        s_intoCopy(uid,CopySceneType_BossHome1,207,0,71,27)
    --end
end


--boss殿堂二层传送员2
function OnClickNpc_309(uid,npcid)
    local copytype  = s_getValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_SCENE_TYPE)
    if copytype == CopySceneType_BossHome2 then
        --是在boss殿堂一层给予传送, 去三层
        s_intoCopy(uid,CopySceneType_BossHome3,209,0,20,47)
    end
end


--boss殿堂三层层传送员2
function OnClickNpc_310(uid,npcid)
    local copytype  = s_getValue(SCENE_ENTRY_PLAYER, uid, VALUE_TYPE_SCENE_TYPE)
    if copytype == CopySceneType_BossHome3 then
        --是在boss殿堂一层给予传送
        s_intoCopy(uid,CopySceneType_BossHome2,208,0,43,13)
    end
end

--混乱深渊传送员
function OnClickNpc_320(uid,npcid)
        --s_intoCopy(uid,CopySceneType_BossHome2,208,0,87,38)
	s_debug(" clickNpc_320 npcid =>> "..npcid.." uid =>> "..uid)
	--s_intoAbyssCopy2Level(uid)
end
