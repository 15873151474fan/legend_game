--瞻仰城主buff,城主获得检验,后期可能修改,暂时留接口
function OnLoopBuffEvent_3Sec_2010(level, etype, eid, time, value)
	if time == 0 then
		return
	end

	local exp = GetVMExp(value)
	s_refreshExp(eid, exp, ExpType_OptionalTask, 0)
end
