--瞻仰城主buff,副城主获得经验,后期可能会修改
function OnLoopBuffEvent_3Sec_2009(level, etype, eid, time, value)
	if time == 0 then
		return
	end

	local exp = GetVMExp(value)
	s_refreshExp(eid, exp, ExpType_OptionalTask, 0)
end
