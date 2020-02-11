--请国王颁发官员奖金
RoleTaskInfo49105 = {}
function RoleTaskInfo49105:GetTaskDailyInfo(uid, outvec)
	if outvec == nil then return end
	--taskid
	table.insert(outvec, 49105)

	--dayNum, dayDoneNum
	local homeland = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_HOMELAND)
	local appraisalkey = 0
	local fun = s_getFunction(uid,Relation_Country)
	if fun == FunctionType_Marshal then
		appraisalkey = 101
	elseif fun == FunctionType_ViceMarshal then
		appraisalkey = 102
	elseif fun == FunctionType_Interior then
		appraisalkey = 103
	elseif fun == FunctionType_Treasury then
		appraisalkey = 104
	elseif fun == FunctionType_Defense then
		appraisalkey = 105
	elseif fun == FunctionType_Police then
		appraisalkey = 106
	elseif fun == FunctionType_VicePolice then
		appraisalkey = 107
	elseif fun == FunctionType_RoseKnight then
		appraisalkey = 108
	end

	if appraisalkey == 0 then
		table.insert(outvec, 0)
		table.insert(outvec, 0)
	else
		table.insert(outvec, 1)

		if s_getCountryVar(homeland, 1, appraisalkey) ~= 0 then
			table.insert(outvec, 1)
		else
			table.insert(outvec, 0)
		end
	end

	--weekNum
	table.insert(outvec, 0)
	--weekDoneNum
	table.insert(outvec, 0)
end
