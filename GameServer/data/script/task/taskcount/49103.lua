--领取团官员奖励
RoleTaskInfo49103 = {}
function RoleTaskInfo49103:GetTaskDailyInfo(uid, outvec)
	if outvec == nil then return end
	--taskid
	table.insert(outvec, 49103)

	--dayNum, dayDoneNum
	local corps = s_getCorpsId(uid)
	if corps == 0 then
		table.insert(outvec, 0)
		table.insert(outvec, 0)
	else
		local fun,str = s_getFunction(uid,Relation_Corps)
		if fun == nil or fun == 0 then
			table.insert(outvec, 0)
			table.insert(outvec, 0)
		else
			local offer = 0
			local otype = 0
			if fun == FunctionType_CLeader then
				otype = CorpVar_OfferLeader
			elseif fun == FunctionType_CInterLeader then
				otype = CorpVar_OfferInter
			elseif fun == FunctionType_CExterLeader then
				otype = CorpVar_OfferExter
			elseif fun == FunctionType_CBeauty then
				otype = CorpVar_OfferBeauty
			end
			if otype == 0 then
				table.insert(outvec, 0)
				table.insert(outvec, 0)
			else
				offer = s_getCorpsField(corps,otype)
				if offer == 0 then
					table.insert(outvec, 1)
					table.insert(outvec, 1)
				else
					table.insert(outvec, 1)
					table.insert(outvec, 0)
				end
			end
		end
	end

	--weekNum
	table.insert(outvec, 0)
	--weekDoneNum
	table.insert(outvec, 0)
end
