-- FILE: 数表-佳酿.xlsx SHEET: 酒buff KEY: index
WineBuffDataBase = {
[1]={["index"]=1,["needWinBuffExp"]=100,["buffid"]=35001,["lasttime"]=1800},
[2]={["index"]=2,["needWinBuffExp"]=200,["buffid"]=35002,["lasttime"]=1800},
[3]={["index"]=3,["needWinBuffExp"]=500,["buffid"]=35003,["lasttime"]=1800},
[4]={["index"]=4,["needWinBuffExp"]=1000,["buffid"]=35004,["lasttime"]=1800},
[5]={["index"]=5,["needWinBuffExp"]=2500,["buffid"]=35005,["lasttime"]=1800},
}
WineBuffDataBase.query = function(index) return WineBuffDataBase[index] end
