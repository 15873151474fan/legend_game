-- FILE: 数表-藏宝图.xls SHEET: 副本怪物 KEY: dwID
TreasureFuBenDataBase = {
[1]={["dwID"]=1,["npcType"]=1,["npcID"]=240,["rateDown"]=0,["rateUp"]=600000},
[2]={["dwID"]=2,["npcType"]=1,["npcID"]=241,["rateDown"]=600001,["rateUp"]=900000},
[3]={["dwID"]=3,["npcType"]=1,["npcID"]=242,["rateDown"]=900001,["rateUp"]=1000000},
[4]={["dwID"]=4,["npcType"]=2,["npcID"]=19001,["rateDown"]=0,["rateUp"]=100000},
[5]={["dwID"]=5,["npcType"]=2,["npcID"]=19002,["rateDown"]=100001,["rateUp"]=200000},
[6]={["dwID"]=6,["npcType"]=2,["npcID"]=19003,["rateDown"]=200001,["rateUp"]=300000},
[7]={["dwID"]=7,["npcType"]=2,["npcID"]=19004,["rateDown"]=300001,["rateUp"]=400000},
[8]={["dwID"]=8,["npcType"]=2,["npcID"]=19005,["rateDown"]=400001,["rateUp"]=500000},
[9]={["dwID"]=9,["npcType"]=2,["npcID"]=19006,["rateDown"]=500001,["rateUp"]=600000},
[10]={["dwID"]=10,["npcType"]=2,["npcID"]=19007,["rateDown"]=600001,["rateUp"]=680000},
[11]={["dwID"]=11,["npcType"]=2,["npcID"]=19008,["rateDown"]=680001,["rateUp"]=730000},
[12]={["dwID"]=12,["npcType"]=2,["npcID"]=19009,["rateDown"]=730001,["rateUp"]=780000},
[13]={["dwID"]=13,["npcType"]=2,["npcID"]=19010,["rateDown"]=780001,["rateUp"]=830000},
[14]={["dwID"]=14,["npcType"]=2,["npcID"]=19011,["rateDown"]=830001,["rateUp"]=880000},
[15]={["dwID"]=15,["npcType"]=2,["npcID"]=19012,["rateDown"]=880001,["rateUp"]=930000},
[16]={["dwID"]=16,["npcType"]=2,["npcID"]=19013,["rateDown"]=930001,["rateUp"]=980000},
[17]={["dwID"]=17,["npcType"]=2,["npcID"]=19014,["rateDown"]=980001,["rateUp"]=1000000},
}
TreasureFuBenDataBase.query = function(dwID) return TreasureFuBenDataBase[dwID] end
