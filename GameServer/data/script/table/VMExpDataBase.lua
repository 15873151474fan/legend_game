-- FILE: 数表-活动表.xls SHEET: 瞻仰城主 KEY: level
VMExpDataBase = {
[40]={["level"]=40,["howlong"]=3,["exp"]=36000},
[80]={["level"]=80,["howlong"]=3,["exp"]=64800},
[90]={["level"]=90,["howlong"]=3,["exp"]=108000},
[100]={["level"]=100,["howlong"]=3,["exp"]=162000},
}
VMExpDataBase.query = function(level) return VMExpDataBase[level] end
