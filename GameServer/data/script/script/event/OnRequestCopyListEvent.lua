--副本榜单请求
function OnRequestCopyListEvent(sid,stype,ltype,uid)
	if ltype == 1 or ltype == 4 or ltype == 5 or ltype == 6 or ltype == 7 then
		local copy = rawget(_G, "CopySceneInfo_" .. stype)
		if copy ~= nil and copy.SendCopyInfoList ~= nil then
			copy.SendCopyInfoList(copy,sid,uid,ltype)
		end
	end
end

