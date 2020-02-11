-- 获得狩猎排行奖励
function GetSoulRankReward(uid, rank)
	s_trace("GetSoulRankReward 11111111 uid: " .. uid .. ", rank: " .. rank)
	local data = SoulRankDataBase.query(rank)
	if data == nil then
		return 0
	end

	local itemlist = loadstring("return " .. data.reward)()
	if itemlist == nil or #itemlist == 0 then
		return 0
	end

	local mailitems = {}
	local maxnum = 0
	local num = 0
	for i, item in ipairs(itemlist) do
		maxnum = s_getItemMaxnum(item[1]) or 1
		num = item[3]
		if num <= maxnum then
			item[3] = num
			table.insert(mailitems,item)
		else
			item[3] = maxnum
			num =  num - maxnum
			table.insert(mailitems,item)

			while num > 0 do
				local temp = {}
				for i,v in ipairs(item) do
					temp[i] = v
				end
				if num > maxnum then
					temp[3] = maxnum
					num = num - maxnum
				else
					temp[3] = num
					num = 0
				end
				table.insert(mailitems,temp)
			end
		end
	end

	local subject = "神识榜奖励"
	local text = nil
	if rank > 100 then
		text = "神识榜奖励"
	else
		text = "神识榜第" .. rank .. "名奖励"
	end
	if #mailitems ~= 0 then
		s_sendMail(uid, subject, text, mailitems, subject)
		s_trace("GetSoulRankReward 发送狩猎榜邮件")
	end
	return 1
end

