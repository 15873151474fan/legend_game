-- FILE: 数表-装备洗练.xlsx SHEET: 洗练随机 KEY: index
EquipWashRandomDataBase = {
[1]={["index"]=1,["randDown"]=1000,["randUp"]=10000,["rate"]=100000},
[2]={["index"]=2,["randDown"]=10001,["randUp"]=20000,["rate"]=200000},
[3]={["index"]=3,["randDown"]=20001,["randUp"]=30000,["rate"]=300000},
[4]={["index"]=4,["randDown"]=30001,["randUp"]=40000,["rate"]=400000},
[5]={["index"]=5,["randDown"]=40001,["randUp"]=50000,["rate"]=500000},
[6]={["index"]=6,["randDown"]=50001,["randUp"]=60000,["rate"]=600000},
[7]={["index"]=7,["randDown"]=60001,["randUp"]=70000,["rate"]=700000},
[8]={["index"]=8,["randDown"]=70001,["randUp"]=80000,["rate"]=800000},
[9]={["index"]=9,["randDown"]=80001,["randUp"]=90000,["rate"]=900000},
[10]={["index"]=10,["randDown"]=90001,["randUp"]=100000,["rate"]=1000000},
}
EquipWashRandomDataBase.query = function(index) return EquipWashRandomDataBase[index] end
