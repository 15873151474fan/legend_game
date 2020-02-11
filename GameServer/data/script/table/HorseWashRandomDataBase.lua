-- FILE: 数表-坐骑.xlsx SHEET: 洗练随机 KEY: index
HorseWashRandomDataBase = {
[1]={["index"]=1,["randDown"]=3000,["randUp"]=20000,["rate"]=200000},
[2]={["index"]=2,["randDown"]=20001,["randUp"]=40000,["rate"]=400000},
[3]={["index"]=3,["randDown"]=40001,["randUp"]=60000,["rate"]=600000},
[4]={["index"]=4,["randDown"]=60001,["randUp"]=80000,["rate"]=800000},
[5]={["index"]=5,["randDown"]=80001,["randUp"]=100000,["rate"]=1000000},
}
HorseWashRandomDataBase.query = function(index) return HorseWashRandomDataBase[index] end
