------------ 团副本 -------------------------
-- BOSS食物鉴定
function CopySceneJudgeFood(uid,operate)
	CopySceneInfo_1:BossFoodJudge(uid,operate)
end

--BOSS 喂养
function CopyScenFeedBossFood(sid,uid,operate)
	CopySceneInfo_1:FeedBossFood(sid,uid,operate)
end

--BOSS 每日重生
function CopySceneBossRelive(corps,sid)
	CopySceneInfo_1:InitCorpsBreed(sid,corps)
end

--开启击败BOSS
function  CopySceneKillCorpsBoss(uid,corps,sid)
	CopySceneInfo_1:BossBloodShare(sid,corps,uid)
end

-- 植物成长
function CopyScenePlantGrowth(corps,sid)
	CopySceneInfo_1:PlantGrowth(corps,sid)
end

-- 宠物游乐
function CopyBaseParkDemonPlay(corps,sid)
	CopySceneInfo_1:DemonPlay(corps,sid)
end

-- 宠物游乐场宠物注册
function OnDemonParkRegister(uid,demonid,hour,playtype,baseid)
	CopySceneInfo_1:DemonParkRegister(uid,demonid,hour,playtype,baseid)
end

-- 玩家退团
function RemoveCorpsUserEvent(corpsid,sid,uid)
	CopySceneInfo_1:RemoveCorpsUser(corpsid,sid,uid)
end

--收获植物
function OnHarvestCorpsPlantEvent(uid, index)
	CopySceneInfo_1:ToHarvestPlant(uid, index)
end

--设置不可浇水
function OnSetCorpsPlantAllowWaterEvent(uid,index,allow)
	CopySceneInfo_1:SetPlantAllowWater(uid,index,allow)
end

-- 请求植物提示
function OnReqCorpsPlantTipEvent(corps, uid)
	CopySceneInfo_1:ReqCorpsPlantTip(corps, uid, 0)
end

-- 客户端请求刷新提示
function OnFreshPlantTipEvent(corps, uid, index)
	if index == nil or index == 0 then return end

	CopySceneInfo_1:OnePlantGrowth(corps,index,0)
	CopySceneInfo_1:OnClientReqTip(corps, uid, index)
end

--BOSS喂养 GM指令
function CopySceneGmBreedBoss(gmtype,corpsid,uid,value,mood,appet)
	CopySceneInfo_1:GmBreedBoss(gmtype,corpsid,uid,value,mood,appet)
end
--GM 种植
function CopySceneGmPlant(gmtype,corps,uid,sid,value)
	CopySceneInfo_1:GmSeedPlant(gmtype,corps,uid,sid,value)
end

--GM 团战
function CorpsBattleGmCmd(gmtype,uid,red,blue)
	CopySceneInfo_3:CorpsBattleGmCmd(gmtype,uid,red,blue)
end

--GM 军战
function ArmyBattleGmCmd(gmtype,uid,red,blue)
	CopySceneInfo_7:ArmyBattleGmCmd(gmtype,uid,red,blue)
end
