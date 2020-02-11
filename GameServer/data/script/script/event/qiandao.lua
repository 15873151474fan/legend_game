--兑换彩票
function OnRequestQianDaoBaoxiang(uid,index)
	qiandao_baoxiang = {}
	qiandao_baoxiang_1 = {
		{ baseid = 31145, rate = 3, num=5, iv="1-1"},
		{ baseid = 29066, rate = 3, num=25, iv="1-1"},
		{ baseid = 29026, rate = 3, num=3, iv="1-1"},
		{ baseid = 23061, rate = 3, num=1, iv="1-1"},
		{ baseid = 23051, rate = 3, num=2, iv="1-1"},
		{ baseid = 23051, rate = 4, num=3, iv="1-1"},
		{ baseid = 7, rate = 5, num=2, iv="1-1"},
		{ baseid = 7, rate = 6, num=1, iv="1-1"},
		{ baseid = 31145, rate = 6, num=1, iv="1-1"},
		{ baseid = 27108, rate = 6, num=2, iv="1-1"},
		{ baseid = 27108, rate = 6, num=3, iv="1-1"},
		{ baseid = 29066, rate = 6, num=5, iv="1-1"},
		{ baseid = 26130, rate = 6, num=5, iv="1-1"},
		{ baseid = 29026, rate = 6, num=2, iv="1-1"},
		{ baseid = 29066, rate = 10, num=25, iv="1-1"},
		{ baseid = 26130, rate = 10, num=8, iv="1-1"},
	}
	qiandao_baoxiang_61 = {
		{ baseid = 31145, rate = 3, num=5, iv="1-1"},
		{ baseid = 29066, rate = 3, num=25, iv="1-1"},
		{ baseid = 29026, rate = 3, num=3, iv="1-1"},
		{ baseid = 23061, rate = 3, num=1, iv="1-1"},
		{ baseid = 23051, rate = 3, num=2, iv="1-1"},
		{ baseid = 23051, rate = 4, num=3, iv="1-1"},
		{ baseid = 7, rate = 5, num=2, iv="1-1"},
		{ baseid = 7, rate = 6, num=3, iv="1-1"},
		{ baseid = 31145, rate = 6, num=1, iv="1-1"},
		{ baseid = 27108, rate = 6, num=2, iv="1-1"},
		{ baseid = 27108, rate = 6, num=3, iv="1-1"},
		{ baseid = 29066, rate = 6, num=5, iv="1-1"},
		{ baseid = 29061, rate = 6, num=1, iv="1-1"},
		{ baseid = 29026, rate = 6, num=2, iv="1-1"},
		{ baseid = 29026, rate = 6, num=2, iv="1-1"},
		{ baseid = 29066, rate = 10, num=25, iv="1-1"},
	}
	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	if level <= 60 then
		qiandao_baoxiang = qiandao_baoxiang_1
	else
		qiandao_baoxiang = qiandao_baoxiang_61
	end
	if s_getVar(uid,109,5) ~= 0 then
		s_messageBox(uid,"已经领取过宝箱")
		return VALUE_FAIL
	end
	local randnum = math.random(1,100)
	local currate = 0
	local mynum = 0
	local begin = 0
	for i = 1, table.getn(qiandao_baoxiang) do
		currate = currate + qiandao_baoxiang[i].rate
		if randnum <= currate then
			mynum = i
			s_addItem(uid,qiandao_baoxiang[i].baseid,3,qiandao_baoxiang[i].num,0,qiandao_baoxiang[i].iv,"签到宝箱")
			break
		end
	end
	if mynum > 0 then
		if (mynum % 2) == 1 then
			local j = 0
			for i = 1, table.getn(qiandao_baoxiang) do
				if (i % 2) == 1 then
					j = j + 1
					s_sendBaoXiangPresent(uid,j,qiandao_baoxiang[i].baseid,qiandao_baoxiang[i].num,qiandao_baoxiang[i].iv)
				end
			end
			s_addVar(uid,109,5,(mynum + 1)/2)
			s_sendQianDaoState(uid)
		else
			local j = 0
			for i = 1, table.getn(qiandao_baoxiang) do
				if (i % 2) == 0 then
					j = j + 1
					s_sendBaoXiangPresent(uid,j,qiandao_baoxiang[i].baseid,qiandao_baoxiang[i].num,qiandao_baoxiang[i].iv)
				end
			end
			s_addVar(uid,109,5,(mynum)/2)
			s_sendQianDaoState(uid)
		end
		for i = 1, table.getn(qiandao_baoxiang) do
			if mynum == i then
				s_sendBaoXiangPresent(uid,index,qiandao_baoxiang[i].baseid,qiandao_baoxiang[i].num,qiandao_baoxiang[i].iv)
				break
			end
		end
	else
		s_messageBox(uid,"打开了一个空宝箱" .. randnum .. ":" .. currate)
	end
end

function OnRequestQianDaoPresent(uid)
	if s_getVar(uid,109,6) ~= 0 then
		s_messageBox(uid,"已经领取过签到奖励")
		return VALUE_FAIL
	end
	local present_days = s_getVar(uid,109,4)
	s_addItem(uid,29304,3,1,0,"1-1","签到奖品")
	if present_days > 1 then
		s_addItem(uid,34207,3,1,0,"1-1","签到奖品")
	end
	s_addVar(uid,109,6,1)
	s_sendQianDaoState(uid)
	return VALUE_OK
end

