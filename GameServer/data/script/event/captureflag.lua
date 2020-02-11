--夺旗战活动

function EventCaptureFlag(eventid, value1, value2, value3)
	if s_isExistScene(HashSceneID(3,16)) == 0 then
		return
	end

	if value3 == 1 then
		s_trace("夺旗战活动开始")
		delFlag()
		local sceneid = HashSceneID(3,16)
		local flagid = s_sysSummon(307, sceneid, 29, 33, 1066)
		if flagid == nil or flagid == 0 then
			s_error("夺旗战活动NPC分配错误")
			return
		end
		s_trace("分配夺旗战npcid="..flagid)
		s_addWorldVar(13, 152, flagid)
		s_notifyClient(eventid,1)
	end

	if value3 == 2 then
		s_trace("夺旗战活动结束")
		delFlag()
		s_notifyClient(eventid,0)
	end
end

function delFlag()
		local flagid = s_getWorldVar(13, 152)
		if flagid ~= nil and flagid ~= 0 then
			s_trace("销毁夺旗战旗子npcid="..flagid)
			s_clearNpc(flagid)
		end
		s_addWorldVar(13,152, 0)
end

