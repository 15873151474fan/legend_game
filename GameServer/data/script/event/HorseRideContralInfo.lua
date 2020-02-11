function GetHorseCanBeRideInMap(uid,mapid)
	--s_debug("GetHorseCanBeRideInMap userid : %u, mapid %u",uid,mapid)
	local mapinfo = MapDataBase
	local intomapinfo = mapinfo[mapid]
	if intomapinfo == nil then
		--s_sysInfo(uid,"地图编号非法",ChatPos_Sys)
		s_debug(uid,"地图编号非法 userid : %u, mapid %u",uid,mapid)
		return 0
	else
		return intomapinfo.canRide
	end

end


