--经验副本找回

function OfflineBackJinyanCopy(uid,num)
	local bakinfo = ExpDungeonDataBase.query(num)
	local text = "经验副本奖励"
	local itemlist = loadstring("return " .. bakinfo.award)()
	if itemlist == nil or #itemlist == 0 then
		return 0
	end
	local mailitems = {}
	for i, item in ipairs(itemlist) do
		if item[3] ~= 0 then
			table.insert(mailitems,item)
		end
	end
	s_sendMail(uid,text,text,mailitems,text)
	s_setVar(uid,470,1,0)
	return 1
end
--离线找回功能
--经验副本找回
function OfflineBackExpCopy(uid,btype)
	--if 1 then return end
	local count = s_getVar(uid,473,2)
	
	local index = 0
	for i=1,5 do 
		local bakinfo0 = FindBackDataBase.query(i)
		if bakinfo0.lev == s_getVar(uid,473,3) then
			index = i
		end
	end

	local bakinfo = FindBackDataBase.query(index)

	--s_debug(" King OfflineBackExpCopy "..btype.." counti "..count .. " index "..index)	
	if bakinfo == nil then
		s_debugUser(uid," expcopy backinfo nil "..btype)	
		return 0
	end
	if btype ==0 or btype > 2 then
		return 0
	end

	if btype == 1 then
		local cost = bakinfo.partFind * count 
		s_trace(" >>>>> expcopy back halfcost"..cost)
		if s_checkMoneyByType(uid,1,cost) == 0 then
			s_sysInfo(uid,"离线找回，金币不够",ChatPos_Tips)
			s_debugUser(uid,"经验 离线找回，金币不够 "..btype)	
			return 0
		end
		if s_removeMoney(uid,1,cost,"经验离线一半找回") == 0 then 
			s_sysInfo(uid,"离线找回，金币扣除失败")
			s_debugUser(uid,"经验 离线找回，金币扣除失败"..btype)	
			return 0
		end
		if count > 0 and bakinfo ~= nil then
			GetRewardWithMail(uid,bakinfo.award,"经验副本离线一半找回",count * 0.5,false,AddItemAction_OfflineBack)
		end
	end

	if btype == 2 then
		local cost = bakinfo.allFind * count
		s_trace(" >>>>> expcopy back allcost"..cost)
		if s_checkMoneyByType(uid,8,cost) == 0 then
			s_sysInfo(uid,"离线找回，元宝不够",ChatPos_Tips)
			s_debugUser(uid,"经验 离线找回，元宝不够 "..btype)	
			return 0
		end
		if s_removeMoney(uid,8,cost,"经验离线全部找回") == 0 then 
			s_sysInfo(uid,"离线找回，元宝扣除失败")
			s_debugUser(uid,"经验 离线找回，元宝扣除失败"..btype)	
			return 0
		end
		if count > 0 and bakinfo ~=nil then
			GetRewardWithMail(uid,bakinfo.award,"经验副本离线全部找回",count,false,AddItemAction_OfflineBack)
		end
	end
	s_setVar(uid,169,113,1)
	for i=127,131,1 do 
		s_setVar(uid,169,i,0)
	end
	s_debugUser(uid," expcopy offlineback rate ")
	return 1
end

--佣兵任务
function OfflineBackEmployTask(uid,btype)
	--if 1 then return end
	s_debugUser(uid," OfflineBackEmployTask "..btype)	
	if s_getVar(uid,169,114) == 1 or s_getVar(uid,169,132) == 0 then
		return 0
	end
	local count = s_getVar(uid,169,132)
	local bakinfo = FindBackDataBase.query(6)
	if bakinfo == nil then
		s_debugUser(uid," employtask backinfo nil "..btype)	
		return 0
	end
	if btype ==0 or btype > 2 then
		return 0
	end
	local rate = 0
	if btype == 1 then
		rate = 0.5 * count
		if s_checkMoneyByType(uid,1,count * bakinfo.partFind) == 0 then
			s_sysInfo(uid,"离线找回，金币不够",ChatPos_Tips)
			s_debugUser(uid,"佣兵 离线找回，金币不够 "..btype)	
			return 0
		end
		if s_removeMoney(uid,1,count * bakinfo.partFind,"佣兵离线一半找回") == 0 then 
			s_sysInfo(uid,"离线找回，金币扣除失败")
			s_debugUser(uid,"佣兵 离线找回，金币扣除失败"..btype)	
			return 0
		end
		GetRewardWithMail(uid,bakinfo.award,"佣兵离线一半找回",rate,false,AddItemAction_OfflineBack)
	end

	if btype == 2 then 
		rate = 1 * count
		if s_checkMoneyByType(uid,8,count * bakinfo.allFind) == 0 then
			s_sysInfo(uid,"离线找回，元宝不够",ChatPos_Tips)
			s_debugUser(uid,"佣兵 离线找回，元宝不够 "..btype)	
			return 0
		end
		if s_removeMoney(uid,8,count * bakinfo.allFind,"佣兵离线全部找回") == 0 then 
			s_sysInfo(uid,"离线找回，元宝扣除失败")
			s_debugUser(uid,"佣兵 离线找回，元宝扣除失败"..btype)	
			return 0
		end
		GetRewardWithMail(uid,bakinfo.award,"佣兵离线全部找回",rate,false,AddItemAction_OfflineBack)
	end

	s_debugUser(uid," employtask offlineback rate "..rate.." count "..count)
	s_setVar(uid,169,114,1)
	s_setVar(uid,169,132,0)
	return 1
	
end
--守卫中都
function OfflineBackGuardMiddle(uid,btype)
	--if 1 then return end
	s_debugUser(uid," OfflineBackGuardMiddle "..btype)	
	if s_getVar(uid,169,115) == 1 or s_getVar(uid,169,133) == 0 then
		return 0
	end
	local count = s_getVar(uid,169,133)
	local bakinfo = FindBackDataBase.query(7)
	if bakinfo == nil then
		s_debugUser(uid," GuardMiddle backinfo nil "..btype)	
		return 0
	end
	if btype == 0 or btype > 2 then
		return 0
	end
	local rate = 0
	if btype == 1 then
		rate = 0.5 * count
		if s_checkMoneyByType(uid,1,count * bakinfo.partFind) == 0 then
			s_sysInfo(uid,"离线找回，金币不够",ChatPos_Tips)
			s_debugUser(uid,"中都 离线找回，金币不够 "..btype)	
			return 0
		end
		if s_removeMoney(uid,1,count * bakinfo.partFind,"守卫中都离线一半找回") == 0 then 
			s_sysInfo(uid,"离线找回，金币扣除失败")
			s_debugUser(uid,"中都 离线找回，金币扣除失败"..btype)	
			return 0
		end
		GetRewardWithMail(uid,bakinfo.award,"中都离线一半找回",rate,false,AddItemAction_OfflineBack)
	end

	if btype == 2 then 
		rate = 1 * count
		if s_checkMoneyByType(uid,8,count * bakinfo.allFind) == 0 then
			s_sysInfo(uid,"离线找回，元宝不够",ChatPos_Tips)
			s_debugUser(uid,"中都 离线找回，元宝不够 "..btype)	
			return 0
		end
		if s_removeMoney(uid,8,count * bakinfo.allFind,"守卫中都离线全部找回") == 0 then 
			s_sysInfo(uid,"离线找回，元宝扣除失败")
			s_debugUser(uid,"中都 离线找回，元宝扣除失败"..btype)	
			return 0
		end
		GetRewardWithMail(uid,bakinfo.award,"中都离线全部找回",rate,false,AddItemAction_OfflineBack)
	end

	s_debugUser(uid," middle offlineback rate "..rate.. " count "..count)

	s_setVar(uid,169,115,1)
	s_setVar(uid,169,133,0)
	return 1
end

--竞技场
function OfflineBackSimulation(uid,btype)
	--if 1 then return end
	s_debugUser(uid," OfflineBackSimulation "..btype)	
	if s_getVar(uid,169,116) == 1 or s_getVar(uid,169,134) == 0 then
		return 0
	end
	local count = s_getVar(uid,169,134)
	local bakinfo = FindBackDataBase.query(8)
	if bakinfo == nil then
		s_debugUser(uid," BackSimulation backinfo nil "..btype)	
		return 0
	end
	if btype ==0 or btype > 2 then
		return 0
	end
	local rate = 0
	if btype == 1 then
		rate = 0.5 * count
		if s_checkMoneyByType(uid,1,count * bakinfo.partFind) == 0 then
			s_sysInfo(uid,"离线找回，金币不够",ChatPos_Tips)
			s_debugUser(uid,"竞技场 离线找回，金币不够 "..btype)	
			return 0
		end
		if s_removeMoney(uid,1,count * bakinfo.partFind,"竞技场离线一半找回") == 0 then 
			s_sysInfo(uid,"离线找回，金币扣除失败")
			s_debugUser(uid,"竞技场 离线找回，金币扣除失败"..btype)	
			return 0
		end
		GetRewardWithMail(uid,bakinfo.award,"竞技场离线一半找回",rate,false,AddItemAction_OfflineBack)
	end

	if btype == 2 then 
		rate = 1 * count
		if s_checkMoneyByType(uid,8,count * bakinfo.allFind) == 0 then
			s_sysInfo(uid,"离线找回，元宝不够",ChatPos_Tips)
			s_debugUser(uid,"竞技场 离线找回，元宝不够 "..btype)	
			return 0
		end
		if s_removeMoney(uid,8,count * bakinfo.allFind,"竞技场离线全部找回") == 0 then 
			s_sysInfo(uid,"离线找回，元宝扣除失败")
			s_debugUser(uid,"竞技场 离线找回，元宝扣除失败"..btype)	
			return 0
		end
		GetRewardWithMail(uid,bakinfo.award,"竞技场离线全部找回",rate,false,AddItemAction_OfflineBack)
	end

	s_debugUser(uid," simulation offlineback rate "..rate.." count "..count)
	s_setVar(uid,169,116,1)
	s_setVar(uid,169,134,0)
	return 1
end

--宗门任务
function OfflineBackClanTask(uid,btype)
	--if 1 then return end
	s_debugUser(uid," OfflineBackClanTask "..btype)	
	if s_getVar(uid,169,117) == 1 or s_getVar(uid,169,135) == 0 then
		return 0
	end
	local count = s_getVar(uid,169,135)
	local bakinfo = FindBackDataBase.query(9)
	local clanid = s_getClanID(uid)
	if bakinfo == nil or clanid == 0 then
		s_debugUser(uid," BackClanTask backinfo nil "..btype)	
		return 0
	end
	if btype ==0 or btype > 2 then
		return 0
	end
	local rate = 0
	if btype == 1 then
		rate = 0.5 * count
		if s_checkMoneyByType(uid,1,count * bakinfo.partFind) == 0 then
			s_sysInfo(uid,"离线找回，金币不够",ChatPos_Tips)
			s_debugUser(uid,"宗门任务 离线找回，金币不够 "..btype)	
			return 0
		end
		if s_removeMoney(uid,1,count * bakinfo.partFind,"宗门任务离线一半找回") == 0 then 
			s_sysInfo(uid,"离线找回，金币扣除失败")
			s_debugUser(uid,"宗门任务 离线找回，金币扣除失败"..btype)	
			return 0
		end
		GetRewardWithMail(uid,bakinfo.award,"宗门任务离线一半找回",rate,false,AddItemAction_OfflineBack)
	end

	if btype == 2 then 
		rate = 1 * count
		if s_checkMoneyByType(uid,8,count * bakinfo.allFind) == 0 then
			s_sysInfo(uid,"离线找回，元宝不够",ChatPos_Tips)
			s_debugUser(uid,"宗门任务 离线找回，元宝不够 "..btype)	
			return 0
		end
		if s_removeMoney(uid,8,count * bakinfo.allFind,"宗门任务离线全部找回") == 0 then 
			s_sysInfo(uid,"离线找回，元宝扣除失败")
			s_debugUser(uid,"宗门任务 离线找回，元宝扣除失败"..btype)	
			return 0
		end
		GetRewardWithMail(uid,bakinfo.award,"宗门任务离线全部找回",rate,false,AddItemAction_OfflineBack)
	end

	s_debugUser(uid," clantask offlineback rate "..rate.. " count "..count)
	s_setVar(uid,169,117,1)
	s_setVar(uid,169,135,0)
	return 1
end

--爬塔副本
function OfflineBackTowerCopy(uid,btype)
	--if 1 then return end
	s_debugUser(uid," OfflineBackTowerCopy "..btype)	
	if s_getVar(uid,169,118) == 1 or s_getVar(uid,481,6) == 0 then
		return 0
	end
	local count = s_getVar(uid,481,6)
	local bakinfo = FindBackDataBase.query(9+count)
	if bakinfo == nil then
		s_debugUser(uid," BackTowerCopy backinfo nil "..btype)	
		return 0
	end
	if btype ==0 or btype > 2 then
		return 0
	end
	local rate = 0
	if btype == 1 then
		rate = 0.5 * count 
		if s_checkMoneyByType(uid,1,count * bakinfo.partFind) == 0 then
			s_sysInfo(uid,"离线找回，金币不够",ChatPos_Tips)
			s_debugUser(uid,"爬塔副本 离线找回，金币不够 "..btype)	
			return 0
		end
		if s_removeMoney(uid,1,count * bakinfo.partFind,"爬塔副本离线一半找回") == 0 then 
			s_sysInfo(uid,"离线找回，金币扣除失败")
			s_debugUser(uid,"爬塔副本 离线找回，金币扣除失败"..btype)	
			return 0
		end
		GetRewardWithMail(uid,bakinfo.award,"爬塔副本离线一半找回",rate,false,AddItemAction_OfflineBack)
	end

	if btype == 2 then 
		rate = 1 * count
		if s_checkMoneyByType(uid,8,count * bakinfo.allFind) == 0 then
			s_sysInfo(uid,"离线找回，元宝不够",ChatPos_Tips)
			s_debugUser(uid,"爬塔副本 离线找回，元宝不够 "..btype)	
			return 0
		end
		if s_removeMoney(uid,8,count * bakinfo.allFind,"爬塔副本离线全部找回") == 0 then 
			s_sysInfo(uid,"离线找回，元宝扣除失败")
			s_debugUser(uid,"爬塔副本 离线找回，元宝扣除失败"..btype)	
			return 0
		end
		GetRewardWithMail(uid,bakinfo.award,"爬塔副本离线全部找回",rate,false,AddItemAction_OfflineBack)
	end

	s_debugUser(uid," TowerCopy offlineback rate "..rate.." count "..count)
	s_setVar(uid,169,118,1)
	return 1
end

