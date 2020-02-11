-- FILE: 数表-假日活动表.xlsx SHEET: 额度抽取 KEY: index
LimitDataBase = {
[1]={["index"]=1,["num"]=60,["limit"]=1500,["rate"]=1670},
[2]={["index"]=2,["num"]=300,["limit"]=2000,["rate"]=3336},
[3]={["index"]=3,["num"]=980,["limit"]=2500,["rate"]=5002},
[4]={["index"]=4,["num"]=1980,["limit"]=3000,["rate"]=6668},
[5]={["index"]=5,["num"]=3280,["limit"]=4000,["rate"]=8334},
[6]={["index"]=6,["num"]=6480,["limit"]=5000,["rate"]=10000},
}
LimitDataBase.query = function(index) return LimitDataBase[index] end
