-- FILE: 数表-宝藏.xlsx SHEET: 节点配置 KEY: dwID
MineNumConfigDataBase = {
[1]={["dwID"]=1,["maxnum"]=999,["nohitnum"]=0,["initnum"]=0},
[2]={["dwID"]=2,["maxnum"]=19,["nohitnum"]=5,["initnum"]=5},
[3]={["dwID"]=3,["maxnum"]=45,["nohitnum"]=12,["initnum"]=36},
[4]={["dwID"]=4,["maxnum"]=69,["nohitnum"]=40,["initnum"]=50},
[5]={["dwID"]=5,["maxnum"]=90,["nohitnum"]=58,["initnum"]=0},
[6]={["dwID"]=6,["maxnum"]=200,["nohitnum"]=100,["initnum"]=161},
[7]={["dwID"]=7,["maxnum"]=450,["nohitnum"]=400,["initnum"]=101},
[8]={["dwID"]=8,["maxnum"]=2500,["nohitnum"]=1500,["initnum"]=0},
[9]={["dwID"]=9,["maxnum"]=3199,["nohitnum"]=1801,["initnum"]=0},
[10]={["dwID"]=10,["maxnum"]=3499,["nohitnum"]=3001,["initnum"]=0},
}
MineNumConfigDataBase.query = function(dwID) return MineNumConfigDataBase[dwID] end
