--一些特殊任务道具的掉落

--31137掉落戒指
function NpcDeadDropTaskItem31137(uid)
	local TASK = {1631,1651,1681,1731,1761}
	for i=1,table.getn(TASK) do
		local taskid = TASK[i]
		if math.random(1,10000) <= 20 then	--1/500概率
			local taskProcess = s_getTaskValue(uid,taskid,TaskValue_Process)
			if taskProcess == TaskProcess_Doing or taskProcess == TaskProcess_CanDone then
				local num = s_getVar(uid,105,1)
				if num < 2 then
					local cid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
					local x1 = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSX)
					local y1 = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSY)
					s_addSceneItem(31137,1,cid,x1,y1)
					s_addVar(uid,105,1,num+1)
				end
			end
		end
	end
end
--RegisterNpcDeadEvent(10077,"NpcDeadDropTaskItem31137($1)")
--RegisterNpcDeadEvent(10078,"NpcDeadDropTaskItem31137($1)")
--RegisterNpcDeadEvent(10079,"NpcDeadDropTaskItem31137($1)")
--RegisterNpcDeadEvent(10080,"NpcDeadDropTaskItem31137($1)")
--RegisterNpcDeadEvent(10088,"NpcDeadDropTaskItem31137($1)")
------------------------------------------------------------------------------------------------
--31143掉落
function NpcDeadDropTaskItem31143(uid)
	local TASK = {1791,1801,1841,1861,1911,1931,1951,1981,2011,2041,2071,2081,2111,2141,2161,2181,2211}
	for i=1,table.getn(TASK) do
		local taskid = TASK[i]
		if math.random(1,10000) <= 20 then	--1/500概率
			local taskProcess = s_getTaskValue(uid,taskid,TaskValue_Process)
			if taskProcess == TaskProcess_Doing or taskProcess == TaskProcess_CanDone then
				local num = s_getVar(uid,105,2)
				if num < 2 then
					local cid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
					local x1 = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSX)
					local y1 = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSY)
					s_addSceneItem(31143,1,cid,x1,y1)
					s_addVar(uid,105,2,num+1)
				end
			end
		end
	end
end
--[[
RegisterNpcDeadEvent(10089,"NpcDeadDropTaskItem31143($1)")
RegisterNpcDeadEvent(10090,"NpcDeadDropTaskItem31143($1)")
RegisterNpcDeadEvent(10091,"NpcDeadDropTaskItem31143($1)")
RegisterNpcDeadEvent(10092,"NpcDeadDropTaskItem31143($1)")
RegisterNpcDeadEvent(10094,"NpcDeadDropTaskItem31143($1)")
RegisterNpcDeadEvent(10095,"NpcDeadDropTaskItem31143($1)")
RegisterNpcDeadEvent(10096,"NpcDeadDropTaskItem31143($1)")
RegisterNpcDeadEvent(10097,"NpcDeadDropTaskItem31143($1)")
RegisterNpcDeadEvent(10099,"NpcDeadDropTaskItem31143($1)")
RegisterNpcDeadEvent(10098,"NpcDeadDropTaskItem31143($1)")
RegisterNpcDeadEvent(10100,"NpcDeadDropTaskItem31143($1)")
RegisterNpcDeadEvent(10101,"NpcDeadDropTaskItem31143($1)")
RegisterNpcDeadEvent(10102,"NpcDeadDropTaskItem31143($1)")
RegisterNpcDeadEvent(10103,"NpcDeadDropTaskItem31143($1)")
RegisterNpcDeadEvent(10104,"NpcDeadDropTaskItem31143($1)")
RegisterNpcDeadEvent(10105,"NpcDeadDropTaskItem31143($1)")
RegisterNpcDeadEvent(10106,"NpcDeadDropTaskItem31143($1)")
]]--

----------------------------------------------------------------------------------------------------
--31144掉落
function NpcDeadDropTaskItem31144(uid)
	local TASK = {1631,1651,1681,1731,1761,1761,1008}
	for i=1,table.getn(TASK) do
		local taskid = TASK[i]
		if math.random(1,10000) <= 20 then  --1/500概率
			local taskProcess = s_getTaskValue(uid,taskid,TaskValue_Process)
			if taskProcess == TaskProcess_Doing or taskProcess == TaskProcess_CanDone then
				local num = s_getVar(uid,105,3)
				if num < 2 then
					local cid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
					local x1 = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSX)
					local y1 = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSY)
					s_addSceneItem(31144,1,cid,x1,y1)
					s_addVar(uid,105,3,num+1)
				end
			end
		end
	end
end
--RegisterNpcDeadEvent(10077,"NpcDeadDropTaskItem31144($1)")
--RegisterNpcDeadEvent(10078,"NpcDeadDropTaskItem31144($1)")
--RegisterNpcDeadEvent(10079,"NpcDeadDropTaskItem31144($1)")
--RegisterNpcDeadEvent(10080,"NpcDeadDropTaskItem31144($1)")
--RegisterNpcDeadEvent(10080,"NpcDeadDropTaskItem31144($1)")
--RegisterNpcDeadEvent(10088,"NpcDeadDropTaskItem31144($1)")
--RegisterNpcDeadEvent(10077,"NpcDeadDropTaskItem31144($1)")
---------------------------------------------------------------------------------------------------------------------
--31102掉落
function NpcDeadDropTaskItem31102(uid)
	local TASK = {1481,1491,1501,1511,1521,1561,1571,1581,1591}
	for i=1,table.getn(TASK) do
		local taskid = TASK[i]
		if math.random(1,10000) <= 20 then	--1/500概率
			local taskProcess = s_getTaskValue(uid,taskid,TaskValue_Process)
			if taskProcess == TaskProcess_Doing or taskProcess == TaskProcess_CanDone then
				local num = s_getVar(uid,105,4)
				if num < 2 then
					local cid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
					local x1 = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSX)
					local y1 = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSY)
					s_addSceneItem(31102,1,cid,x1,y1)
					s_addVar(uid,105,4,num+1)
				end
			end
		end
	end
end
--未填写入任务中的地宫怪物，不需要回调函数处理，但要注册保证怪物死亡后有任务计数，这里添加空回调函数
function NpcDeadDropTaskItemNullToCount(uid)
	return
end

--[[
RegisterNpcDeadEvent(10057,"NpcDeadDropTaskItem31102($1)")
RegisterNpcDeadEvent(10058,"NpcDeadDropTaskItem31102($1)")
RegisterNpcDeadEvent(10059,"NpcDeadDropTaskItem31102($1)")
RegisterNpcDeadEvent(10060,"NpcDeadDropTaskItem31102($1)")
RegisterNpcDeadEvent(10061,"NpcDeadDropTaskItem31102($1)")
RegisterNpcDeadEvent(10062,"NpcDeadDropTaskItem31102($1)")
RegisterNpcDeadEvent(10063,"NpcDeadDropTaskItem31102($1)")
RegisterNpcDeadEvent(10064,"NpcDeadDropTaskItem31102($1)")
RegisterNpcDeadEvent(10065,"NpcDeadDropTaskItem31102($1)")
-]]
-----------------------------------------------------------------------------------------------------------------------------
--[[--31066掉落
function NpcDeadDropTaskItem31066(uid)
	local TASK = {1255,1263,1243,1240,1233}
	for i=1,table.getn(TASK) do
		local taskid = TASK[i]
		if math.random(1,10000) <= 600 then	--1/500概率
			local taskProcess = s_getTaskValue(uid,taskid,TaskValue_Process)
			if taskProcess == TaskProcess_Doing or taskProcess == TaskProcess_CanDone then
				local num = s_getVar(uid,105,5)
				if num < 2 then
					local cid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
					local x1 = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSX)
					local y1 = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSY)
					s_addSceneItem(31066,1,cid,x1,y1)
					s_addVar(uid,105,5,num+1)
				end
			end
		end
	end
end
RegisterNpcDeadEvent(10014,"NpcDeadDropTaskItem31066($1)")
RegisterNpcDeadEvent(10013,"NpcDeadDropTaskItem31066($1)")
RegisterNpcDeadEvent(10012,"NpcDeadDropTaskItem31066($1)")
--]]--------
--[[--------------------------------------------------------------------------------------------------------------
--图腾掉落 31064
function NpcDeadDropTaskItem31064(uid)
	local TASK = {1205,1211,1221,1223,1213}
	for i=1,table.getn(TASK) do
		local taskid = TASK[i]
		if math.random(1,10000) <= 600 then --1/500概率
			local taskProcess = s_getTaskValue(uid,taskid,TaskValue_Process)
			if taskProcess == TaskProcess_Doing or taskProcess == TaskProcess_CanDone then
				local num = s_getVar(uid,105,6)
				if num < 2 then
					local cid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
					local x1 = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSX)
					local y1 = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSY)
					s_addSceneItem(31064,1,cid,x1,y1)
					s_addVar(uid,105,6,num+1)
				end
			end
		end
	end
end
--RegisterNpcDeadEvent(10008,"NpcDeadDropTaskItem31064($1)")
RegisterNpcDeadEvent(10009,"NpcDeadDropTaskItem31064($1)")
RegisterNpcDeadEvent(10010,"NpcDeadDropTaskItem31064($1)")
RegisterNpcDeadEvent(10011,"NpcDeadDropTaskItem31064($1)")
RegisterNpcDeadEvent(10012,"NpcDeadDropTaskItem31064($1)")
----]]-----------------------------------------------------------------------------------------------------------------
--[[--47004掉落   妖皇的委托书
function NpcDeadDropTaskItem47004(uid)
    if math.random(1,10000) <= 600 then --1/500概率
        local TASK = {1221,1230,1233,1240,1243,1251,1255,1263}
        for i=1,table.getn(TASK) do
        local taskid = TASK[i]
        local taskProcess = s_getTaskValue(uid,taskid,TaskValue_Process)
        if taskProcess == TaskProcess_Doing or taskProcess == TaskProcess_CanDone then
            local num = s_getVar(uid,105,7)
            if num < 2 then
                local cid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
                local x1 = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSX)
                local y1 = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSY)
                s_addSceneItem(47004,1,cid,x1,y1)
                s_addVar(uid,105,7,num+1)
            end
        end
    end
end
end
RegisterNpcDeadEvent(10011,"NpcDeadDropTaskItem47004($1)")
RegisterNpcDeadEvent(10012,"NpcDeadDropTaskItem47004($1)")
RegisterNpcDeadEvent(10013,"NpcDeadDropTaskItem47004($1)")
RegisterNpcDeadEvent(10014,"NpcDeadDropTaskItem47004($1)")

-----------------------------------------------------------------------------------------------------------
--47005掉落   妖后的委托书
function NpcDeadDropTaskItem47005(uid)
    if math.random(1,10000) <= 600 then --1/500概率
        local TASK = {1221,1230,1233,1240,1243,1251,1255,1263}
        for i=1,table.getn(TASK) do
        local taskid = TASK[i]
        local taskProcess = s_getTaskValue(uid,taskid,TaskValue_Process)
        if taskProcess == TaskProcess_Doing or taskProcess == TaskProcess_CanDone then
            local num = s_getVar(uid,105,8)
            if num < 2 then
                local cid = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_SCENE_ID)
                local x1 = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSX)
                local y1 = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_POSY)
                s_addSceneItem(47005,1,cid,x1,y1)
                s_addVar(uid,105,8,num+1)
            end
        end
    end
end
end
RegisterNpcDeadEvent(10011,"NpcDeadDropTaskItem47005($1)")
RegisterNpcDeadEvent(10012,"NpcDeadDropTaskItem47005($1)")
RegisterNpcDeadEvent(10013,"NpcDeadDropTaskItem47005($1)")
RegisterNpcDeadEvent(10014,"NpcDeadDropTaskItem47005($1)")
--]]------------------------------------------------------------------------------------------------------------

--骷髅之王任务要杀3只怪才能完成任务
function TaskNpcDeathCallBack7009(userid)
    if s_hasTask(userid,8091)  == VALUE_OK then
        AddRoleTaskOperate(userid,8091)
    elseif s_hasTask(userid,8092)  == VALUE_OK then
        AddRoleTaskOperate(userid,8092)
    elseif s_hasTask(userid,8093)  == VALUE_OK then
        AddRoleTaskOperate(userid,8093)
    elseif s_hasTask(userid,8094)  == VALUE_OK then
        AddRoleTaskOperate(userid,8094)
    elseif s_hasTask(userid,8095)  == VALUE_OK then
        AddRoleTaskOperate(userid,8095)
    elseif s_hasTask(userid,8096)  == VALUE_OK then
        AddRoleTaskOperate(userid,8096)
    end
end

--公会争霸任务
function TaskNpcDeathCallBack1034(userid)
    if s_hasTask(userid,1034)  == VALUE_OK then
        AddRoleTaskOperate(userid,1034)
    end
end

RegisterNpcDeadEvent(9340,"TaskNpcDeathCallBack7009($1)")
RegisterNpcDeadEvent(9341,"TaskNpcDeathCallBack7009($1)")
RegisterNpcDeadEvent(9342,"TaskNpcDeathCallBack7009($1)")

RegisterNpcDeadEvent(9353,"TaskNpcDeathCallBack1034($1)")
RegisterNpcDeadEvent(9354,"TaskNpcDeathCallBack1034($1)")
RegisterNpcDeadEvent(9355,"TaskNpcDeathCallBack1034($1)")
RegisterNpcDeadEvent(9356,"TaskNpcDeathCallBack1034($1)")
RegisterNpcDeadEvent(9357,"TaskNpcDeathCallBack1034($1)")
RegisterNpcDeadEvent(9358,"TaskNpcDeathCallBack1034($1)")

