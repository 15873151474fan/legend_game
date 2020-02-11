--黄金猎命师手扎
function OnRequestBuyGoldHunterScrollEvent(uid)
	local info =
		{
			talk = "<p><n>  拥有</n><n color='GXColorGreen'>240点离线点</n><n>后可购买，购买后清空所有离线点。</n><newline/><n>   您当前有离线点：</n><n color='GXColorGreen'>#1点</n></p>",
			button = {
				{"白色高级猎命师手扎[1.0倍]-花费#1金币(2)","OnDealBuyGoldHunterScrollEvent($1,1)"},
				{"蓝色高级猎命师手扎[1.5倍]-花费#2金币(2)","OnDealBuyGoldHunterScrollEvent($1,2)"},
				{"黄色高级猎命师手扎[2.0倍]-花费#3金币(2)","OnDealBuyGoldHunterScrollEvent($1,3)"},
				{"绿色高级猎命师手扎[3.0倍]-花费#4金币(2)","OnDealBuyGoldHunterScrollEvent($1,4)"},
			},
		}
	local point = s_getVar(uid,112,2)
	if point == 0 then
		s_sysInfo(uid,"您当前没有离线点数，无法购买",ChatPos_MsgBox)
		return
	end
	local M = (point /2000)^0.5
	local _,L = RoleTaskInfo30004:GetTaskExpParam(uid)
	info.talk = string.gsub(info.talk,"#1",point)
	info.button[1][1] = string.gsub(info.button[1][1],"#1",math.floor(10*M*L)*10)
	info.button[2][1] = string.gsub(info.button[2][1],"#2",math.floor(20*M*L)*10)
	info.button[3][1] = string.gsub(info.button[3][1],"#3",math.floor(33*M*L)*10)
	info.button[4][1] = string.gsub(info.button[4][1],"#4",math.floor(50*M*L)*10)
	ShowNpcMenuByTable(uid,info)
end
function OnDealBuyGoldHunterScrollEvent(uid,index)
	local point = s_getVar(uid,112,2)
	if point < 240 then
		s_sysInfo(uid,"需要240以上离线点数才能购买",ChatPos_MsgBox)
		return
	end

	local M = (s_getVar(uid,112,2) /2000)^0.5
	local _,L = RoleTaskInfo30004:GetTaskExpParam(uid)
	local gold = 0
	if index == 1 then
		gold = math.floor(10*M*L)*10
	elseif index == 2 then
		gold = math.floor(20*M*L)*10
	elseif index == 3 then
		gold = math.floor(33*M*L)*10
	elseif index == 4 then
		gold = math.floor(50*M*L)*10
	end
	if gold == 0 then return end

	if s_removeMoney(uid,MoneyType_Gold,gold,"高级猎命师手扎") ~= VALUE_OK then
		s_sysInfo(uid,"您身上没有足够的金子",ChatPos_MsgBox)
		return
	end

	local level = s_getValue(SCENE_ENTRY_PLAYER,uid,VALUE_TYPE_LEVEL)
	local param1,param2 = RoleTaskInfo30004:GetTaskExpParam(uid)
	local exp = point * param1 * (0.16*level^2.2-200)

	local worldlevel = s_getWorldLevel()
	if worldlevel > 1 and worldlevel*10+50 > level+10 then
		exp = exp*(1+0.02*(worldlevel*10+50-level))
	end

	local colors = {1,1.5,2,3}
	if index == 1 then
		exp = exp * colors[index]
		s_addItem(uid,31314,0,1,0,"1-1,7-0,225-" .. exp,"高级猎命师手扎")
	elseif index == 2 then
		exp = exp * colors[index]
		s_addItem(uid,31314,0,1,0,"1-1,7-1,225-" .. exp,"高级猎命师手扎")
	elseif index == 3 then
		exp = exp * colors[index]
		s_addItem(uid,31314,0,1,0,"1-1,7-2,225-" .. exp,"高级猎命师手扎")
	elseif index == 4 then
		exp = exp * colors[index]
		s_addItem(uid,31314,0,1,0,"1-1,7-3,225-" .. exp,"高级猎命师手扎")
	end
	s_addVar(uid,112,2,0)
	s_setup(SCENE_ENTRY_PLAYER,uid,1)
end
