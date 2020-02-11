--1v1模拟战结束
function OnSimulationFinish(npcid,cid,ctype)
	if ctype ~= CopySceneType_Simulation then
		return
	end
	local copy = rawget(_G, "CopySceneInfo_" .. ctype)
	if copy ~= nil and copy.OnCopyFinish~= nil then
		copy.OnCopyFinish(copy,cid)
	end
end
