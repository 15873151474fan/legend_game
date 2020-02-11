--酒buff1
function OnLoopBuffEvent_6Sec_35010(level, etype, eid, time, value)
	s_refreshExp(eid, 20000, ExpType_OptionalTask, 0)
end

--function OnRemoveBuffEvent_35010(level, etype, eid, time, value)
--	s_sendWineState(eid,0,2)
--end
