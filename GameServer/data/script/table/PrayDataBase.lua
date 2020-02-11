-- FILE: 数表-祈福.xlsx SHEET: 祈福 KEY: dwID
PrayDataBase = {
[1]={["dwID"]=1,["pray_num"]=2,["multiple"]=2},
[2]={["dwID"]=2,["pray_num"]=6,["multiple"]=3},
[3]={["dwID"]=3,["pray_num"]=11,["multiple"]=4},
[4]={["dwID"]=4,["pray_num"]=21,["multiple"]=6},
[5]={["dwID"]=5,["pray_num"]=51,["multiple"]=8},
[6]={["dwID"]=6,["pray_num"]=71,["multiple"]=10},
[7]={["dwID"]=7,["pray_num"]=101,["multiple"]=12},
[8]={["dwID"]=8,["pray_num"]=151,["multiple"]=15},
[9]={["dwID"]=9,["pray_num"]=200,["multiple"]=20},
}
PrayDataBase.query = function(dwID) return PrayDataBase[dwID] end
