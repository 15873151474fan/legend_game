-- 红包排行改变
function OnRedPacketRankChanged(uid, rank)
	s_trace("OnRedPacketRankChanged start uid: " .. uid .. ", rank: " .. rank)

	local newrank = rank
	if newrank > 11 then
		newrank = 11
	end

	local oldrank = s_getVar(uid,149,11)

	if oldrank ~= rank then
		-- 保存排名
		s_setVar(uid,149,11,rank)
	end

	if oldrank > 11 then
		oldrank = 11
	end

	if newrank == oldrank then
		return
	end

	s_trace("OnRedPacketRankChanged 排名变更 旧: " .. oldrank .. ", 新: " .. newrank)

	-- 移除旧称号、buff
	local data = RedPacketDataBase.query(oldrank)
	if data ~= nil then
		if data.title ~= 0 then
			s_delTitle(SCENE_ENTRY_PLAYER, uid, data.title)
			s_trace("OnRedPacketRankChanged 删除称号 uid: " .. uid .. ", title: " .. data.title)
		end
		if data.buff ~= 0 then
			s_removebuff(SCENE_ENTRY_PLAYER, uid, data.buff)
			s_trace("OnRedPacketRankChanged 删除buff uid: " .. uid .. ", buff: " .. data.buff)
		end
	end

	-- 添加新称号、buff
	data = RedPacketDataBase.query(newrank)
	if data ~= nil then
		if data.title ~= 0 then
			s_addTitle(SCENE_ENTRY_PLAYER, uid, data.title)
			s_trace("OnRedPacketRankChanged 添加称号 uid: " .. uid .. ", title: " .. data.title)
		end
		if data.buff ~= 0 then
			s_addbuff(SCENE_ENTRY_PLAYER, uid, data.buff, 0)
			s_trace("OnRedPacketRankChanged 添加buff uid: " .. uid .. ", buff: " .. data.buff)
		end
	end
end

