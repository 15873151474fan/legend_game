RoleTaskInfo3431 =
{
	subtasknum = 1,
	subtask1 =
	{
		randomtask =
		{
			{100,100,{3432, 3433, 3434, 3435, 3436, 3437}},
		},
		task = {s_taskRandomTask, {60016}},
	},
}

-- 战士职业
RoleTaskInfo3432 =
{
	parent = 3431,
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleProfession,{1}},
		},
		onaccept =
		{
		--{s_actionChangeRide,{50003, 60*5}},
		},
		task = {s_taskKillNpc, {60016,60019,{10009,10010},10}},
		onfinish =
		{
		--{s_actionChangeRide,{0, 0}},
		},
	},
}

-- 魔刃职业
RoleTaskInfo3433 =
{
	parent = 3431,
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleProfession,{2}},
		},
		onaccept =
		{
		--{s_actionChangeRide,{50003, 60*5}},
		},
		task = {s_taskKillNpc, {60016,60019,{10009,10010},10}},
		onfinish =
		{
		--{s_actionChangeRide,{0, 0}},
		},
	},
}

-- 枪手职业
RoleTaskInfo3434 =
{
	parent = 3431,
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleProfession,{3}},
		},
		onaccept =
		{
		--{s_actionChangeRide,{50003, 60*5}},
		},
		task = {s_taskKillNpc, {60016,60019,{10009,10010},10}},
		onfinish =
		{
		--{s_actionChangeRide,{0, 0}},
		},
	},
}

-- 魔炮职业
RoleTaskInfo3435 =
{
	parent = 3431,
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleProfession,{4}},
		},
		onaccept =
		{
		--{s_actionChangeRide,{50003, 60*5}},
		},
		task = {s_taskKillNpc, {60016,60019,{10009,10010},10}},
		onfinish =
		{
		--{s_actionChangeRide,{0, 0}},
		},
	},
}

-- 医生职业
RoleTaskInfo3436 =
{
	parent = 3431,
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleProfession,{5}},
		},
		onaccept =
		{
		--{s_actionChangeRide,{50003, 60*5}},
		},
		task = {s_taskKillNpc, {60016,60019,{10009,10010},10}},
		onfinish =
		{
		--{s_actionChangeRide,{0, 0}},
		},
	},
}

-- 术士职业
RoleTaskInfo3437 =
{
	parent = 3431,
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleProfession,{6}},
		},
		onaccept =
		{
		--{s_actionChangeRide,{50003, 60*5}},
		},
		task = {s_taskKillNpc, {60016,60019,{10009,10010},10}},
		onfinish =
		{
		--{s_actionChangeRide,{0, 0}},
		},
	},
}
