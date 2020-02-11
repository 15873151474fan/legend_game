--购买发型或者脸型道具事件
--itemtype 脸型(2)或者发型(1)
--index  脸型或者发型对应的表id
function OnBuyFaceAndHairItemEvent(uid,itemtype,index)
	if s_removeMoney(uid,MoneyType_Money,100,"美容") ~= VALUE_OK then
		s_sysInfo(uid,"银币不够，无法购买");
		return
	end
	local itemid = 0
	local itemindex = 0
	if itemtype == 1 then
		itemid = 31012
		itemindex = 202
	elseif itemtype == 2 then
		itemid = 31013
		itemindex = 201
	end
	if itemid == 0 then
		return
	end
	local attr = itemindex .."-"..index
	s_addItem(uid,itemid,0,1,0,attr,"购买")
end
