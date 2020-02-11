--排行榜500名内的玩家不进入奖励
--离线15天，离最高等级大于10级的玩家
--离最高等级10级的玩家
--离最高等级5级的玩家
--战斗力排行榜500名之外的玩家
--第一档 30506
--第二档 30501
--第三档 30502
--第四档 30503
--第五档 30505
--第六档 30504

RoleTaskInfo30500 =
{
	ring = 1,
	subtasknum = 1,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkWorldLevel,{3,9}},
			{s_checkPowerOrder,{500,0}},
		},
		randomtask =
		{
			{100,100,{30506}},
			{100,100,{30501}},
			{100,100,{30502}},
			{100,100,{30503}},
			{100,100,{30505}},
			{100,100,{30504}},
		},
		task = {s_taskRandomTask, {0}},
	},
}

--命运女神的厚爱（封印等级差10级，且15天不上线）
RoleTaskInfo30501 =
{
	parent = 30500,
	subtasknum = 4,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleLevel,{70,200}},
			{s_checkOfflineDay,{15,0}},
			{s_checkPowerOrder,{800,0}},
			{s_checkLevelDiff,{10,0}},
		},
		randomtask =
		{
			{60,100,{30550, 30551,	30552,	30553,	}},
			{40,100,{30555, 30556,	30557,	30558}},
		},
		task = {s_taskRandomTask, {0}},
		onfinish =
		{
			{s_actionSmile,{25}},
		},
	},
	subtask2 =
	{
		randomtask =
		{
			{60,100,{30550, 30551,	30552,	30553,	}},
			{40,100,{30555, 30556,	30557,	30558}},
		},
		task = {s_taskRandomTask, {0}},
		onfinish =
		{
			{s_actionAddItem,{35200,0,1,0,"1-1","命运女神的垂青1-1"}},
			{s_actionAddItem,{29066,0,5,0,"1-1,7-3","命运女神的垂青1-1"}},
			{s_actionAddItem,{31145,0,4,0,"1-1,7-3","命运女神的垂青1-1"}},
			{s_actionSmile,{25}},
		},
	},
	subtask3 =
	{
		randomtask =
		{
			{60,100,{30550, 30551,	30552,	30553,	}},
			{40,100,{30555, 30556,	30557,	30558}},
		},
		task = {s_taskRandomTask, {0}},
		onfinish =
		{
			{s_actionAddItem,{35200,0,1,0,"1-1","命运女神的垂青1-2"}},
			{s_actionAddItem,{26020,0,30,0,"1-1,3-604800","命运女神的垂青1-2"}},
			{s_actionAddItem,{35202,0,4,0,"1-1,3-604800","命运女神的垂青1-2"}},
			{s_actionSmile,{25}},
		},
	},
	subtask4 =
	{
		randomtask =
		{
			{60,100,{30550, 30551,	30552,	30553,	}},
			{40,100,{30555, 30556,	30557,	30558}},
		},
		task = {s_taskRandomTask, {0}},
		onfinish =
		{
			{s_actionAddItem,{35200,0,1,0,"1-1","命运女神的垂青1-3"}},
			{s_actionAddItem,{15,0,1,0,"1-1","命运女神的垂青1-3"}},
			{s_actionAddItem,{14,0,1,0,"1-1","命运女神的垂青1-3"}},
			{s_actionSmile,{9}},
			{s_taskplay,{5}},
		},
	},
}

--命运女神的垂青（封印等级差10级以上）
RoleTaskInfo30502 =
{
	parent = 30500,
	subtasknum = 4,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkPowerOrder,{800,0}},
			{s_checkRoleLevel,{70,200}},
			{s_checkLevelDiff,{10,0}},
		},
		randomtask =
		{
			{60,100,{30560, 30561,	30562,	30563,	}},
			{40,100,{30565, 30566,	30567,	30568}},
		},
		task = {s_taskRandomTask, {0}},
		onfinish =
		{
			{s_actionSmile,{25}},
		},
	},
	subtask2 =
	{
		randomtask =
		{
			{60,100,{30560, 30561,	30562,	30563,	}},
			{40,100,{30565, 30566,	30567,	30568}},
		},
		task = {s_taskRandomTask, {0}},
		onfinish =
		{
			{s_actionAddItem,{27108,0,50,0,"1-1","命运女神的垂青2-1"}},
			{s_actionAddItem,{31145,0,2,0,"1-1,7-3","命运女神的垂青2-1"}},
			{s_actionAddItem,{29066,0,5,0,"1-1,7-3","命运女神的垂青2-1"}},
			{s_actionSmile,{25}},
		},
	},
	subtask3 =
	{
		randomtask =
		{
			{60,100,{30560, 30561,	30562,	30563,	}},
			{40,100,{30565, 30566,	30567,	30568}},
		},
		task = {s_taskRandomTask, {0}},
		onfinish =
		{
			{s_actionAddItem,{26102,0,20,0,"1-1","命运女神的垂青2-2"}},
			{s_actionAddItem,{23055,0,5,0,"1-1","命运女神的垂青2-2"}},
			{s_actionAddItem,{29061,0,3,0,"1-1,7-3","命运女神的垂青2-2"}},
			{s_actionSmile,{25}},
		},
	},
	subtask4 =
	{
		randomtask =
		{
			{60,100,{30560, 30561,	30562,	30563,	}},
			{40,100,{30565, 30566,	30567,	30568}},
		},
		task = {s_taskRandomTask, {0}},
		onfinish =
		{
			{s_actionAddItem,{26142,0,1,0,"1-1","命运女神的垂青2-3"}},
			{s_actionAddItem,{35206,0,1,0,"1-1","命运女神的垂青2-3"}},
			{s_actionAddItem,{35207,0,5,0,"1-1","命运女神的垂青2-3"}},
			{s_actionSmile,{9}},
			{s_taskplay,{5}},
		},
	},
}

--命运女神的关注（封印等级差7级）
RoleTaskInfo30503 =
{
	parent = 30500,
	subtasknum = 4,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleLevel,{70,200}},
			{s_checkLevelDiff,{7,0}},
			{s_checkPowerOrder,{800,0}},
		},
		randomtask =
		{
			{45,100,{30570, 30571,	30572,	30573,	}},
			{40,100,{30575, 30576,	30577,	30578}},
			{15,100,{30590, 30591,	30592,	30593}},
		},
		task = {s_taskRandomTask, {0}},
		onfinish =
		{
			{s_actionSmile,{25}},
		},
	},
	subtask2 =
	{
		randomtask =
		{
			{45,100,{30570, 30571,	30572,	30573,	}},
			{40,100,{30575, 30576,	30577,	30578}},
			{15,100,{30590, 30591,	30592,	30593}},
		},
		task = {s_taskRandomTask, {0}},
		onfinish =
		{
			{s_actionAddItem,{29066,0,2,0,"1-1,7-3","命运女神的垂青3-1"}},
			{s_actionAddItem,{29061,0,2,0,"1-1,7-3","命运女神的垂青3-1"}},
			{s_actionAddItem,{35207,0,2,0,"1-1","命运女神的垂青3-1"}},
			{s_actionSmile,{25}},
		},
	},
	subtask3 =
	{
		randomtask =
		{
			{45,100,{30570, 30571,	30572,	30573,	}},
			{40,100,{30575, 30576,	30577,	30578}},
			{15,100,{30590, 30591,	30592,	30593}},
		},
		task = {s_taskRandomTask, {0}},
		onfinish =
		{
			{s_actionAddItem,{35208,0,1,0,"1-1","命运女神的垂青3-2"}},
			{s_actionAddItem,{35203,0,1,0,"1-1","命运女神的垂青3-2"}},
			{s_actionAddItem,{35204,0,1,0,"1-1","命运女神的垂青3-2"}},
			{s_actionSmile,{25}},
		},
	},
	subtask4 =
	{
		randomtask =
		{
			{45,100,{30570, 30571,	30572,	30573,	}},
			{40,100,{30575, 30576,	30577,	30578}},
			{15,100,{30590, 30591,	30592,	30593}},
		},
		task = {s_taskRandomTask, {0}},
		onfinish =
		{
			{s_actionAddItem,{31123,0,1,0,"1-1","命运女神的垂青3-3"}},
			{s_actionAddItem,{26149,0,3,0,"1-1,2-3","命运女神的垂青3-3"}},
			{s_actionAddItem,{27108,0,40,0,"1-1","命运女神的垂青3-3"}},
			{s_actionSmile,{9}},
			{s_taskplay,{5}},
		},
	},
}

--命运女神的注视（战斗力排行500名之外）
RoleTaskInfo30504 =
{
	parent = 30500,
	subtasknum = 4,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleLevel,{70,200}},
			{s_checkPowerOrder,{500,0}},
		},
		randomtask =
		{
			{30,100,{30580, 30581,	30582,	30583,	}},
			{30,100,{30585, 30586,	30587,	30588}},
			{30,100,{30600, 30601,	30602,	30603}},
			{10,100,{30605, 30606,	30607}},
		},
		task = {s_taskRandomTask, {0}},
		onfinish =
		{
			{s_actionSmile,{25}},
		},
	},
	subtask2 =
	{
		randomtask =
		{
			{30,100,{30580, 30581,	30582,	30583,	}},
			{30,100,{30585, 30586,	30587,	30588}},
			{30,100,{30600, 30601,	30602,	30603}},
			{10,100,{30605, 30606,	30607}},
		},
		task = {s_taskRandomTask, {0}},
		onfinish =
		{
			{s_actionAddItem,{23055,0,1,0,"1-1","命运女神的垂青4-1"}},
			{s_actionAddItem,{35201,0,1,0,"1-1","命运女神的垂青4-1"}},
			{s_actionAddItem,{29066,0,1,0,"1-1,7-2","命运女神的垂青4-1"}},
			{s_actionSmile,{25}},
		},
	},
	subtask3 =
	{
		randomtask =
		{
			{30,100,{30580, 30581,	30582,	30583,	}},
			{30,100,{30585, 30586,	30587,	30588}},
			{30,100,{30600, 30601,	30602,	30603}},
			{10,100,{30605, 30606,	30607}},
		},
		task = {s_taskRandomTask, {0}},
		onfinish =
		{
			{s_actionAddItem,{35204,0,1,0,"1-1","命运女神的垂青4-2"}},
			{s_actionAddItem,{26149,0,1,0,"2-3,1-1","命运女神的垂青4-2"}},
			{s_actionSmile,{25}},
		},
	},
	subtask4 =
	{
		randomtask =
		{
			{30,100,{30580, 30581,	30582,	30583,	}},
			{30,100,{30585, 30586,	30587,	30588}},
			{30,100,{30600, 30601,	30602,	30603}},
			{10,100,{30605, 30606,	30607}},
		},
		task = {s_taskRandomTask, {0}},
		onfinish =
		{
			{s_actionAddItem,{26104,0,1,0,"1-1","命运女神的垂青4-3"}},
			{s_actionAddItem,{26102,0,5,0,"1-1","命运女神的垂青4-3"}},
			{s_actionAddItem,{14,0,1,0,"1-1","命运女神的垂青4-3"}},
			{s_actionSmile,{9}},
			{s_taskplay,{5}},
		},
	},
}


--命运女神的注视（战斗力排行500名之外，装备积分小于15分）
RoleTaskInfo30505 =
{
	parent = 30500,
	subtasknum = 4,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkRoleLevel,{70,200}},
			{s_checkEquipAmmend,{0,15}},
			{s_checkPowerOrder,{800,0}},
		},
		randomtask =
		{
			{30,100,{30610, 30611,	30612,	30613,	}},
			{30,100,{30615, 30616,	30617,	30618}},
			{30,100,{30620, 30621,	30622,	30623}},
			{10,100,{30625, 30626,	30627}},
		},
		task = {s_taskRandomTask, {0}},
		onfinish =
		{
			{s_actionSmile,{25}},
		},
	},
	subtask2 =
	{
		randomtask =
		{
			{30,100,{30610, 30611,	30612,	30613,	}},
			{30,100,{30615, 30616,	30617,	30618}},
			{30,100,{30620, 30621,	30622,	30623}},
			{10,100,{30625, 30626,	30627}},
		},
		task = {s_taskRandomTask, {0}},
		onfinish =
		{
			{s_actionAddItem,{23055,0,3,0,"1-1","命运女神的垂青5-1"}},
			{s_actionAddItem,{35201,0,3,0,"1-1","命运女神的垂青5-1"}},
			{s_actionAddItem,{29066,0,3,0,"1-1,7-2","命运女神的垂青5-1"}},
			{s_actionSmile,{25}},
		},
	},
	subtask3 =
	{
		randomtask =
		{
			{30,100,{30610, 30611,	30612,	30613,	}},
			{30,100,{30615, 30616,	30617,	30618}},
			{30,100,{30620, 30621,	30622,	30623}},
			{10,100,{30625, 30626,	30627}},
		},
		task = {s_taskRandomTask, {0}},
		onfinish =
		{
			{s_actionAddItem,{35204,0,1,0,"1-1","命运女神的垂青5-2"}},
			{s_actionAddItem,{26102,0,10,0,"1-1","命运女神的垂青5-2"}},
			{s_actionSmile,{25}},
		},
	},
	subtask4 =
	{
		randomtask =
		{
			{30,100,{30610, 30611,	30612,	30613,	}},
			{30,100,{30615, 30616,	30617,	30618}},
			{30,100,{30620, 30621,	30622,	30623}},
			{10,100,{30625, 30626,	30627}},
		},
		task = {s_taskRandomTask, {0}},
		onfinish =
		{
			{s_actionAddItem,{27110,0,3,0,"1-1,2-3","命运女神的垂青5-3"}},
			{s_actionAddItem,{35209,0,1,0,"1-1","命运女神的垂青5-3"}},
			{s_actionAddItem,{10,0,10,0,"1-1","命运女神的垂青5-3"}},
			{s_actionSmile,{9}},
			{s_taskplay,{5}},
		},
	},
}

--命运女神的厚爱（比最高等级差30级以上且等级在41级以上）
RoleTaskInfo30506 =
{
	parent = 30500,
	subtasknum = 4,
	subtask1 =
	{
		onacceptcheck =
		{
			{s_checkPowerOrder,{800,0}},
			{s_checkRoleLevel,{41,200}},
			{s_checkLevelDiff,{30,0}},
		},
		randomtask =
		{
			{60,100,{30630, 30631,	30632,	30633,	}},
			{40,100,{30635, 30636,	30637,	30638}},
		},
		task = {s_taskRandomTask, {0}},
		onfinish =
		{
			{s_actionSmile,{25}},
		},
	},
	subtask2 =
	{
		randomtask =
		{
			{60,100,{30630, 30631,	30632,	30633,	}},
			{40,100,{30635, 30636,	30637,	30638}},
		},
		task = {s_taskRandomTask, {0}},
		onfinish =
		{
			{s_actionAddItem,{35212,0,2,0,"1-1","命运女神的垂青6-1"}},
			{s_actionAddItem,{26020,0,20,0,"1-1,3-604800","命运女神的垂青6-1"}},
			{s_actionAddItem,{35214,0,1,0,"1-1","命运女神的垂青6-1"}},
			{s_actionSmile,{25}},
		},
	},
	subtask3 =
	{
		randomtask =
		{
			{60,100,{30630, 30631,	30632,	30633,	}},
			{40,100,{30635, 30636,	30637,	30638}},
		},
		task = {s_taskRandomTask, {0}},
		onfinish =
		{
			{s_actionAddItem,{35212,0,2,0,"1-1","命运女神的垂青6-2"}},
			{s_actionAddItem,{35213,0,1,0,"1-1","命运女神的垂青6-2"}},
			{s_actionAddItem,{35202,0,2,0,"1-1","命运女神的垂青6-2"}},
			{s_actionSmile,{25}},
		},
	},
	subtask4 =
	{
		randomtask =
		{
			{60,100,{30630, 30631,	30632,	30633,	}},
			{40,100,{30635, 30636,	30637,	30638}},
		},
		task = {s_taskRandomTask, {0}},
		onfinish =
		{
			{s_actionAddItem,{35200,0,1,0,"1-1","命运女神的垂青6-3"}},
			{s_actionAddItem,{35207,0,5,0,"1-1","命运女神的垂青6-3"}},
			{s_actionAddItem,{52011,0,1,0,"1-1,3-86400","命运女神的垂青6-3"}},
			{s_actionSmile,{9}},
			{s_taskplay,{5}},
		},
	},
}
