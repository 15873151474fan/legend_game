local qualityRatio = {1, 1.5, 2, 3, 6}
--团拓展特勤机甲时间到，任务自动结束
function CorpsEquipAttackFinishEvent(corpsid)
	if corpsid == 0 or corpsid == nil then
		return
	end
	local robotid = s_getCorpsVar(corpsid,1,40)
	if robotid == 0 or robotid == nil then
		return
	end
	local quality = s_getCorpsVar(corpsid,1,36)
	local ratio = (qualityRatio[quality] or 1)
	local ninePlayerList = s_getNineEntry(SCENE_ENTRY_NPC,robotid,30)
	local msg = "很遗憾，未能保护好特勤机甲，本次团拓展失败了"
	for i = 1, table.getn(ninePlayerList), 2 do
		if s_getCorpsId(ninePlayerList[i+1]) == corpsid then
			local exp = 75 * (50 + 0.1 * (s_getValue(SCENE_ENTRY_PLAYER,ninePlayerList[i+1],VALUE_TYPE_LEVEL) ^ 2.2)) * ratio

			s_refreshExp(ninePlayerList[i+1],exp,ExpType_OptionalTask,0)
			s_sysInfo(ninePlayerList[i+1],msg,ChatPos_Important + ChatPos_Sys)
			s_addField(ninePlayerList[i+1],UserVar_CooperationPoint,5)
			s_sysInfo(ninePlayerList[i+1],"个人协作点增加5点")
		end
		--团魔甲中的玩家添加奖励
		if ninePlayerList[i] == SCENE_ENTRY_NPC and s_getValue(SCENE_ENTRY_NPC,ninePlayerList[i+1],VALUE_TYPE_NPCTYPE) == NPC_TYPE_ARMYEQUIP and s_getEquipEntry(ninePlayerList[i+1]) ~= nil then
			local list = s_getEquipEntry(ninePlayerList[i+1])
			for i,memberid in ipairs(list) do
				if s_getCorpsId(memberid) == corpsid then
					local exp = 75 * (50 + 0.1 * (s_getValue(SCENE_ENTRY_PLAYER,memberid,VALUE_TYPE_LEVEL) ^ 2.2)) * ratio
					-- 经验
					s_refreshExp(memberid,exp,ExpType_OptionalTask,0)
					-- 协作点
					s_addField(memberid,UserVar_CooperationPoint,5)
					s_sysInfo(memberid,"个人协作点增加5点")
					s_sysInfo(ninePlayerList[i+1],msg,ChatPos_Important + ChatPos_Sys)
				else
					break
				end
			end
		end
	end
	s_corpsInfo(corpsid,"很遗憾，拓展发布1小时内未完成，本次拓展失败！",ChatPos_Important + ChatPos_Sys)
	s_addCorpsVar(corpsid,1,39,0)
	s_addCorpsVar(corpsid,1,40,0)
end


