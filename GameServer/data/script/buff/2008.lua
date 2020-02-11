--瞻仰城主buff
function OnLoopBuffEvent_3Sec_2008(level, etype, eid, time, value)
	if time == 0 then
		return
	end

	local exp = GetVMExp(value)
	s_refreshExp(eid, exp, ExpType_OptionalTask, 0)
end
