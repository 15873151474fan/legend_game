-- FILE: 数表-挖矿.xlsx SHEET: 挖矿 KEY: index
MineralDataBase = {
[1]={["index"]=1,["time"]=300,["mineral1"]=3656,["mineral2"]=2436,["mineral3"]=1624,["mineral4"]=1082,["mineral5"]=721,["mineral6"]=481},
[2]={["index"]=2,["time"]=600,["mineral1"]=4054,["mineral2"]=2500,["mineral3"]=1543,["mineral4"]=952,["mineral5"]=588,["mineral6"]=363},
[3]={["index"]=3,["time"]=1200,["mineral1"]=4472,["mineral2"]=2538,["mineral3"]=1442,["mineral4"]=819,["mineral5"]=465,["mineral6"]=264},
[4]={["index"]=4,["time"]=2400,["mineral1"]=4867,["mineral2"]=2546,["mineral3"]=1333,["mineral4"]=698,["mineral5"]=365,["mineral6"]=191},
[5]={["index"]=5,["time"]=3600,["mineral1"]=5281,["mineral2"]=2525,["mineral3"]=1208,["mineral4"]=578,["mineral5"]=276,["mineral6"]=132},
[6]={["index"]=6,["time"]=4800,["mineral1"]=5693,["mineral2"]=2474,["mineral3"]=1075,["mineral4"]=467,["mineral5"]=203,["mineral6"]=88},
[7]={["index"]=7,["time"]=7200,["mineral1"]=6118,["mineral2"]=2388,["mineral3"]=933,["mineral4"]=364,["mineral5"]=142,["mineral6"]=55},
[8]={["index"]=8,["time"]=9600,["mineral1"]=6565,["mineral2"]=2263,["mineral3"]=780,["mineral4"]=269,["mineral5"]=92,["mineral6"]=31},
[9]={["index"]=9,["time"]=14400,["mineral1"]=9335,["mineral2"]=622,["mineral3"]=41,["mineral4"]=2,["mineral5"]=0,["mineral6"]=0},
}
MineralDataBase.query = function(index) return MineralDataBase[index] end
