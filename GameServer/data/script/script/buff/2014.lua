--修炼buff
function OnLoopBuffEvent_6Sec_2014(level, etype, eid, time, value)
	if time == 0 then
		return
	end

	GetClanExp(eid,level)
end

function GetClanExp(uid,value)
--	if value <= 80 then
--		value = 80
--	elseif value > 80 and value <= 90 then
--		value = 90
--	elseif value > 90 and value <= 100 then
--		value = 100
--	elseif value > 100 and value <= 110 then
--		value =110
--	elseif value > 110 and value <= 120 then
--		value =120
--	elseif value > 120 and value <= 130 then
--		value =130
--	elseif value > 130 and value <= 140 then
--		value =140
--	elseif value > 140 then
--		value =150
--	end

--	local minfoTable = {}	
--	if value ~= 0 then
--		for k,v in pairs(ManorTrainDataBase) do
--			if type(v) == "table" and v.level == value then
--				table.insert(minfoTable,v)
--			end
--		end
--	end
--	table.sort(minfoTable,function(a,b)return a.index<b.index end)
	
--	local rate = 0
--	local getrate = math.random(1,10000)
--	if getrate <= minfoTable[1].rate then
--		rate = 1
--	elseif getrate <=minfoTable[2].rate then
--		rate = 2
--	elseif getrate <=minfoTable[3].rate then
--		rate = 3
--	end

--	local bexp = s_doubleTrain(uid,minfoTable[rate].exp)
--	s_refreshExp(uid, minfoTable[rate].exp, ExpType_OptionalTask, 0)
	s_refreshExp(uid, 28000, ExpType_Fish, 0)
--	GetRewardWithMail(uid, minfoTable[rate].awarditem, "修炼奖励", 1, false, 1012)
--	s_addDailyTargetTime(uid,45,1)
--	s_sendTrainState(uid,rate)
end

--function OnRemoveBuffEvent_2014(level, etype, eid, time, value)
--	s_deleteClanPos(eid)
--end
