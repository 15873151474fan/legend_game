-- FILE: 数表-藏宝图.xls SHEET: 藏宝图随机区域 KEY: dwID
TreasureRandomDataBase = {
[1]={["dwID"]=1,["mapType"]=1,["levelDown"]=0,["levelUp"]=50,["mapDown"]=2101,["mapUp"]=2107},
[2]={["dwID"]=2,["mapType"]=1,["levelDown"]=51,["levelUp"]=60,["mapDown"]=2108,["mapUp"]=2114},
[3]={["dwID"]=3,["mapType"]=1,["levelDown"]=61,["levelUp"]=70,["mapDown"]=2115,["mapUp"]=2121},
[4]={["dwID"]=4,["mapType"]=1,["levelDown"]=71,["levelUp"]=80,["mapDown"]=2122,["mapUp"]=2127},
[5]={["dwID"]=5,["mapType"]=1,["levelDown"]=81,["levelUp"]=1005,["mapDown"]=2128,["mapUp"]=2135},
[6]={["dwID"]=6,["mapType"]=1,["levelDown"]=1006,["levelUp"]=1008,["mapDown"]=2136,["mapUp"]=2142},
[7]={["dwID"]=7,["mapType"]=1,["levelDown"]=1010,["levelUp"]=1012,["mapDown"]=2143,["mapUp"]=2149},
[8]={["dwID"]=8,["mapType"]=2,["levelDown"]=0,["levelUp"]=50,["mapDown"]=2201,["mapUp"]=2207},
[9]={["dwID"]=9,["mapType"]=2,["levelDown"]=51,["levelUp"]=60,["mapDown"]=2208,["mapUp"]=2214},
[10]={["dwID"]=10,["mapType"]=2,["levelDown"]=61,["levelUp"]=70,["mapDown"]=2215,["mapUp"]=2221},
[11]={["dwID"]=11,["mapType"]=2,["levelDown"]=71,["levelUp"]=80,["mapDown"]=2222,["mapUp"]=2227},
[12]={["dwID"]=12,["mapType"]=2,["levelDown"]=81,["levelUp"]=1005,["mapDown"]=2228,["mapUp"]=2235},
[13]={["dwID"]=13,["mapType"]=2,["levelDown"]=1006,["levelUp"]=1008,["mapDown"]=2236,["mapUp"]=2242},
[14]={["dwID"]=14,["mapType"]=2,["levelDown"]=1010,["levelUp"]=1012,["mapDown"]=2243,["mapUp"]=2249},
}
TreasureRandomDataBase.query = function(dwID) return TreasureRandomDataBase[dwID] end
