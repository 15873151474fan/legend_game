function VipRedPacketLimit(uid,viplevel,latestcount)
	-- body
	s_debugUser(uid,"VipRedPacketLimit ".."viplevel="..viplevel.."   latestcount="..latestcount)
	if viplevel == 0 then
		--if latestcount < 3 then
		--	return s_getVar(uid,149,38)+1
		--else
			--s_sysInfo(uid,"抢红包次数已达到最大次数,当前为3次",ChatPos_Tips)
			s_sysInfo(uid,"开通VIP即可开启红包，领取海量元宝",ChatPos_Tips)
			return 0
		--end
	end
	local vipmaxcount = VipDataBase.query(viplevel).red_packet_numLimit
	if vipmaxcount ~= nil then
		s_trace("VipRedPacketLimit ".."viplevel="..viplevel.."	latestcount="..latestcount.."	max="..vipmaxcount)
	end
	if vipmaxcount == nil or latestcount >= vipmaxcount then
		s_sysInfo(uid,"抢红包次数已达到最大次数,当前为"..vipmaxcount.."次",ChatPos_Tips)
 		return 0
    end
    return vipmaxcount
end
