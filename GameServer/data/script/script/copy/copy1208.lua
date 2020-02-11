--传承洞天
CopySceneInfo_1208 = {}

function CopySceneInfo_1208:InitCopyScene(cid)
    CreateQcdtmNpc(cid)
end

function CopySceneInfo_1208:OnPlayerIntoCopyScene(cid)
    --设置倒计时
    s_sendCopyTime(cid,s_getSceneVar(cid,1,1))
end

function CreateQcdtmNpc(cid)
    local gmconfig = TreasureFuBenGWConfig.query(221)
    local npcidlist1 ={}
    local npcidlist2 ={}
    local zoneIndex = {}
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
                if v.rateUp >= randnum and v.rateDown <= randnum then
                    for _,s in pairs (TreasureFuBenBOSSConfig) do
                        if type(s) ~= "function" and zoneIndex[_] ~= 1 and s.mapType == 2 then
                            s_trace("..........npcid1"..v.npcID.._..num)
                            s_sysSummon(v.npcID,cid,math.random(s.Xdown,s.Xup),math.random(s.Ydown,s.Yup),103,1)
                            zoneIndex[_] = 1
                            break
                        end 
                    end 
                    table.insert(npcidlist1,npcid)
                end
            end
        end
    end

    --创建传承宝箱
    local num1 = gmconfig.baoxiangNum
    for i = 1, num1 do
        local randnum1 = math.random(0, 1000000)
        for k,v in pairs (TreasureFuBenDataBase) do
            if type(v) ~= "function" and v.npcType == 1 then
                if v.rateUp >= randnum1 and v.rateDown <= randnum1 then
                    for _,s in pairs (TreasureFuBenBOSSConfig) do
                        if type(s) ~= "function" and zoneIndex[_] ~= 2 and s.mapType == 2 then
                            s_trace("..........npcid2"..v.npcID.._..num1)
                            s_sysSummon(v.npcID,cid,math.random(s.Xdown,s.Xup),math.random(s.Ydown,s.Yup),103,1)
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

function OnLoopCopyScene_3Sec_1208(ctype,cid)
    --计算副本时间 
    s_setSceneVar(cid,1,1,s_getSceneVar(cid,1,1) - 3)
    if s_getSceneVar(cid,1,1) <= 0 then
        s_clearCopy(cid)
    end
end

--销毁副本
function CopySceneInfo_1208:FinalCopyScene(sid)
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
