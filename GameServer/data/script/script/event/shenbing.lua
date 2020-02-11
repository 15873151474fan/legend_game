--生成神兵属性
function OnBuildAttribute(uid,itemid)
	local shenbing = rawget(_G,"ItemShenbing")
	if shenbing ~= nil and shenbing.buildAttribute ~= nil then
		shenbing.buildAttribute(shenbing,uid,itemid)
	end
end
