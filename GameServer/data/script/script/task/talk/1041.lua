-- 接受任务时如果已经达到条件了直接完成
-- RoleTaskInfo1041 =
-- {
-- }
-- function RoleTaskInfo1041:OnAcceptTask(uid)
    -- if s_getUserLevel(uid) >= 46 then
        -- AddRoleTaskOperate(uid,1041)
    -- end
-- end

-- RoleTaskInfo1094 =
-- {
-- }
-- function RoleTaskInfo1094:OnAcceptTask(uid)
    -- if s_getUserLevel(uid) >= 63 then
        -- AddRoleTaskOperate(uid,1094)
    -- end
-- end

-- RoleTaskInfo1098 =
-- {
-- }
-- function RoleTaskInfo1098:OnAcceptTask(uid)
    -- if s_getUserLevel(uid) >= 64 then
        -- AddRoleTaskOperate(uid,1098)
    -- end
-- end

-- RoleTaskInfo1101 =
-- {
-- }
-- function RoleTaskInfo1101:OnAcceptTask(uid)
    -- if s_getUserLevel(uid) >= 65 then
        -- AddRoleTaskOperate(uid,1101)
    -- end
-- end

-- RoleTaskInfo1105 =
-- {
-- }
-- function RoleTaskInfo1105:OnAcceptTask(uid)
    -- if s_getUserLevel(uid) >= 66 then
        -- AddRoleTaskOperate(uid,1105)
    -- end
-- end

-- RoleTaskInfo1114 =
-- {
-- }
-- function RoleTaskInfo1114:OnAcceptTask(uid)
    -- if s_getUserLevel(uid) >= 67 then
        -- AddRoleTaskOperate(uid,1114)
    -- end
-- end

-- RoleTaskInfo1120 =
-- {
-- }
-- function RoleTaskInfo1120:OnAcceptTask(uid)
    -- if s_getUserLevel(uid) >= 68 then
        -- AddRoleTaskOperate(uid,1120)
    -- end
-- end

	-- RoleTaskInfo1124 =
	-- {
	-- }


	-- function RoleTaskInfo1124:OnAcceptTask(uid)
		-- if s_getUserLevel(uid) >= 70 then
			-- AddRoleTaskOperate(uid,1124)
		-- end
	-- end
	-- RoleTaskInfo1126 =
	-- {
	-- }
	-- function RoleTaskInfo1126:OnAcceptTask(uid)
		-- if s_getUserLevel(uid) >= 80 then
			-- AddRoleTaskOperate(uid,1126)
		-- end
	-- end
	RoleTaskInfo5102 =
	{
	}
	 function RoleTaskInfo5102:OnAcceptTask(uid)
		 if s_getRebirthLevel(uid) >= 1 then
			 AddRoleTaskOperate(uid,5102)
		end
	end
	RoleTaskInfo5109 =
	{
	}
	function RoleTaskInfo5109:OnAcceptTask(uid)
		if s_getRebirthLevel(uid) >= 2 then
			AddRoleTaskOperate(uid,5109)
		end
	end
	RoleTaskInfo5116 =
	{
	}
	function RoleTaskInfo5116:OnAcceptTask(uid)
		if s_getRebirthLevel(uid) >= 4 then
			AddRoleTaskOperate(uid,5116)
		end
	end
	RoleTaskInfo5123 =
	{
	}
	function RoleTaskInfo5123:OnAcceptTask(uid)
		if s_getRebirthLevel(uid) >= 6 then
			AddRoleTaskOperate(uid,5123)
		end
	end
	RoleTaskInfo5131 =
	{
	}
	function RoleTaskInfo5131:OnAcceptTask(uid)
		if s_getRebirthLevel(uid) >= 8 then
			AddRoleTaskOperate(uid,5131)
		end
	end
	RoleTaskInfo5138 =
	{
	}
	function RoleTaskInfo5138:OnAcceptTask(uid)
		if s_getRebirthLevel(uid) >= 10 then
			AddRoleTaskOperate(uid,5138)
		end
	end
	-- RoleTaskInfo1191 =
	-- {
	-- }
	-- function RoleTaskInfo1191:OnAcceptTask(uid)
		-- if s_getRebirthLevel(uid) >= 8 then
			-- AddRoleTaskOperate(uid,1191)
		-- end
	-- end
	-- RoleTaskInfo1204 =
	-- {
	-- }
	-- function RoleTaskInfo1204:OnAcceptTask(uid)
		-- if s_getRebirthLevel(uid) >= 10 then
			-- AddRoleTaskOperate(uid,1204)
		-- end
	-- end