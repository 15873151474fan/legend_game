function GetBlessingNum(uid,leveltype)
	s_setVar(uid,140,66,0)
	s_debugUser(uid,"培养羽毛等级 level"..leveltype)
	s_setVar(uid,140,63,0)
	s_setVar(uid,140,64,0)
	local getblnum = s_getVar(uid,140,62)
	local bltype = WingsExpDataBase.query(leveltype)
	local luckynum = bltype.luckynum
	s_setVar(uid,140,64,luckynum)	
	local prize = bltype.prize
	s_debugUser(uid,"培养羽毛等级 prize"..prize)
	local cost  = bltype.cost
	local onceprize = bltype.onceprize
	local luckynum = bltype.luckynum
	local luckyrate = bltype.luckyrate
	local locknum = bltype.locknum
	local critprize = bltype.critprize
	local critnum = bltype.critnum
	local critrate = bltype.critrate
	s_setVar(uid,140,66,locknum)	
	s_debugUser(uid,"培养羽毛等级 锁定值"..s_getVar(uid,140,66))
	local randnum = math.random(1,10000)
	s_debugUser(uid,"培养羽毛等级 随机值 = "..randnum)
	local Feather = s_getItemNumByBaseID(uid,10097,0)
	s_debugUser(uid,"培养羽毛等级 Feather"..Feather)	
	local stype = s_getVar(uid,140,65)
	if Feather < cost then
		if stype == 0 then
			s_sysInfo(uid, "羽毛不足,请购买羽毛", ChatPos_Tips)
			return
		else
			local costnum = 0
			local allcost = bltype.wingsprize
			costnum = (cost - Feather) * allcost
			if s_removeMoney(uid,MoneyType_Gold,costnum,"购买羽毛") == VALUE_OK then
		            	cost = Feather	
				--[[s_setVar(uid,140,62,onceprize + s_getVar(uid,140,62))
				if s_getVar(uid,140,62) > prize then
					s_setVar(uid,140,62,prize)
				end
				s_deleteItemByBaseID(uid,10097,Feather,"升级翅膀扣除")
				return]]--
			else 
				s_sysInfo(uid,"元宝不足，不能购买",ChatPos_Tips)
                		return
         		end		
		end
	end	
	if getblnum >= luckynum then
		s_debugUser(uid,">>>>>>>>>>>>触发祝福值 luckynum = "..luckynum)
		if randnum <= luckyrate then
			s_setVar(uid,140,62,prize)
			s_setVar(uid,140,64,1)
			--s_deleteItemByBaseID(uid,19017,cost,"升级翅膀扣除")
		else
			if getblnum >= critprize then
				if randnum <= critrate then
					s_setVar(uid,140,62,s_getVar(uid,140,62) + onceprize + critnum)
					s_setVar(uid,140,63,critnum + onceprize)		
				else
					s_setVar(uid,140,62,s_getVar(uid,140,62) + onceprize)
				end
			else
				s_setVar(uid,140,62,s_getVar(uid,140,62) + onceprize)
			end	
		end
	else
		if getblnum >= critprize then
			if randnum <= critrate then
				s_setVar(uid,140,62,s_getVar(uid,140,62) + onceprize + critnum)
				s_setVar(uid,140,63,critnum + onceprize)
			else
				s_setVar(uid,140,62,s_getVar(uid,140,62) + onceprize)
			end
		else
			s_setVar(uid,140,62,s_getVar(uid,140,62) + onceprize)
		end	
	end
	if s_getVar(uid,140,62) > prize then
		s_setVar(uid,140,62,prize)
	end
	s_debugUser(uid,"培养羽毛等级 lua 幸运"..s_getVar(uid,140,64))
	s_debugUser(uid,"培养羽毛等级 lua 暴击"..s_getVar(uid,140,63))
	s_debugUser(uid,"培养羽毛等级 lua 祝福值"..s_getVar(uid,140,62))	
	s_deleteItemByBaseID(uid,10097,cost,"升级翅膀扣除")
	s_debugUser(uid,"培养羽毛等级 cost"..cost)
end
