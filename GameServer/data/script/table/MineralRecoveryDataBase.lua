-- FILE: 数表-挖矿.xlsx SHEET: 回收矿 KEY: mineral
MineralRecoveryDataBase = {
[1]={["mineral"]=1,["gold"]=100},
[2]={["mineral"]=2,["gold"]=200},
[3]={["mineral"]=3,["gold"]=500},
[4]={["mineral"]=4,["gold"]=1000},
[5]={["mineral"]=5,["gold"]=2000},
[6]={["mineral"]=6,["gold"]=5000},
}
MineralRecoveryDataBase.query = function(mineral) return MineralRecoveryDataBase[mineral] end
