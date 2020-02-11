--传承洞天
CopySceneInfo_1207 = {}

function CopySceneInfo_1207:InitCopyScene(cid)
    CreateQcdtNpc(cid)
end

function CopySceneInfo_1207:OnPlayerIntoCopyScene(cid)
    --设置倒计时
    s_sendCopyTime(cid,s_getSceneVar(cid,1,1))
end

function CreateQcdtNpc(cid)
    local gmconfig = TreasureFuBenGWConfig.query(220)
    local npcidlist1 ={}
    local npcidlist2 ={}
    local zoneIndex = {}
    --存放boss刷新的坐标
    local npcbosspos = {}
    --设置倒计时间
    s_setSceneVar(cid,1,1,10*60)
    --发送副本时间
    s_sendCopyTime(cid,s_getSceneVar(cid,1,1))
    
    
    --创建副本BOSS
    local num = gmconfig.BOSSNum
    for i = 1, num do
        local randnum = math.random(0, 1000000)
        for k,v in pairs (TreasureFuBenDataBase) do 

            if type(v) ~= "function" and v.npcType == 2 then
                if num == 0  then
                    break
                end
                if v.rateUp >= randnum and v.rateDown <= randnum then
                    for _,s in pairs (TreasureFuBenBOSSConfig) do
                        if type(s) ~= "function" and zoneIndex[_] ~= 1 and s.mapType == 1 then
                            --s_trace("..........npcid1"..v.npcID.._)
			    --刷藏宝山洞BOSS
                           local tmpnpcid = s_sysSummon(v.npcID,cid,math.random(s.Xdown,s.Xup),math.random(s.Ydown,s.Yup),103,1)
                            local bossposx = s_getValue(SCENE_ENTRY_NPC,tmpnpcid,VALUE_TYPE_POSX)
                            local bossposy = s_getValue(SCENE_ENTRY_NPC,tmpnpcid,VALUE_TYPE_POSY)
                            --s_trace("..........npctmpid "..tmpnpcid.."坐标 x="..bossposx.." y="..bossposy)
                            table.insert(npcbosspos,{bossposx,bossposy})

                            zoneIndex[_] = 1
                            break
                        end 
                    end 
                    table.insert(npcidlist1,npcid)
                end
            end
        end
    end

    --创建副本Npc
    local num1 = gmconfig.baoxiangNum
    for i = 1, num1 do
        local randnum1 = math.random(0, 1000000)
        for k,v in pairs (TreasureFuBenDataBase) do
            if type(v) ~= "function" and v.npcType == 1 then
                if num == 0 then
                    break
                end
                if v.rateUp >= randnum1 and v.rateDown <= randnum1 then
                    for _,s in pairs (TreasureFuBenBOSSConfig) do
                        if type(s) ~= "function" and zoneIndex[_] ~= 2 and s.mapType == 1 then
                            --s_trace("..........npcid2"..v.npcID.._)
			    --刷藏宝山洞宝箱a
			    s_sysSummon(v.npcID,cid,npcbosspos[i][1],npcbosspos[i][2],103,1)
			    s_trace("宝箱坐标 x="..npcbosspos[i][1].." y="..npcbosspos[i][2])
                            --s_sysSummon(v.npcID,cid,math.random(s.Xdown,s.Xup),math.random(s.Ydown,s.Yup),103,1)
                            zoneIndex[_] = 2
                            break
                        end 
                    end 
                    table.insert(npcidlist2,npcid)
                end
            end
        end
    end

    return true
end

function OnLoopCopyScene_3Sec_1207(ctype,cid)
    --计算副本时间 
    s_setSceneVar(cid,1,1,s_getSceneVar(cid,1,1) - 3)
    if s_getSceneVar(cid,1,1) <= 0 then
        s_clearCopy(cid)
    end
end

--销毁副本
function CopySceneInfo_1207:FinalCopyScene(sid)
    TreasureCopyHistory = TreasureCopyHistory or {}
    for k,v in pairs(TreasureCopyHistory) do
        if v == sid then
            TreasureCopyHistory[k] = nil
        end
    end

    --清空副本npc
    for k,v in pairs (npcidlist1) do
        s_clearNpc(v[k])
    end

    for k,v in pairs (npcidlist2) do
        s_clearNpc(v[k])
    end


    --清空副本倒计时
    s_setSceneVar(sid,1,1,0)
end

function CopySceneInfo_1207:OnPlayerDie(sid,uid,murder,dtype)
end
