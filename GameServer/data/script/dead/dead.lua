--npc死亡回调,后期优化可以向服务器注册需要回调的NPC，避免重复调用无效的死亡脚本
function OnNpcDeadEvent(npcbaseid,level,npcthisid,userid,murderid)
	--NPC死亡对打死怪的玩家以及其组队成员触发
	if userid == nil then
		userid = 0
	end
	if murderid == nil then
		murderid = 0
	end
	if npcbaseid == 60182 or npcbaseid == 22946 or npcbaseid == 22945
		or npcbaseid == 22947 or npcbaseid ==22948 then
		s_debug("国战NPC死亡:"..npcbaseid..","..level..","..npcthisid..","..userid..","..murderid)
	end
	if NpcDeadEventTable ~= nil then
		if NpcDeadEventTable[npcbaseid] ~= nil then
			local funs = NpcDeadEventTable[npcbaseid]
			if table.getn(funs) >=1 then
				for i=1,table.getn(funs) do
					if type(funs[i]) == "function" then
						funs[i](userid,npcthisid)
					elseif type(funs[i]) == "string" then
						local fun = StringToFunction(funs[i])
						if fun == nil then
							s_debug("死亡回调函数有问题:"..funs[i])
						else
							fun(userid,npcthisid)
						end
					end
				end
			end
		end
	end

	--NPC死亡只对最终打死怪的玩家触发
	if MyNpcDeadEventTable ~= nil and userid == murderid then
		if MyNpcDeadEventTable[npcbaseid] ~= nil then
			local funs = MyNpcDeadEventTable[npcbaseid]
			if table.getn(funs) >= 1 then
				for i=1,table.getn(funs) do
					if type(funs[i]) == "function" then
						funs[i](userid,npcthisid)
					elseif type(funs[i]) == "string" then
						local fun = StringToFunction(funs[i])
						if fun == nil then
							s_debug("死亡回调函数有问题:"..funs[i])
						else
							fun(userid,npcthisid)
						end
					end
				end
			end
		end
	end

	--NPC等级死亡触发
	if NpcDeadLevelEventTable ~= nil then
		if #NpcDeadLevelEventTable >= 1 and userid ~= nil then
			for i=1, #NpcDeadLevelEventTable do
				local func = NpcDeadLevelEventTable[i]
				if type(func) == "function" then
					func(userid,level)
				elseif type(func) == "string" then
					local fun = StringToFunction(func)
					if fun == nil then
						s_debug("死亡回调函数有问题:".. func)
					else
						fun(userid,level)
					end
				end
			end
		end
	end

	local fun = rawget(_G,"OnNpcDeadEvent"..npcbaseid)
	if fun ~= nil then
		fun(npcthisid,userid)
	end
end

