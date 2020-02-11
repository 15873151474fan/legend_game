-- FILE: 数表-机缘.xlsx SHEET: 触发机缘 KEY: weekday
ChanceGetLUADataBase = {
[1]={["weekday"]=1,["rate"]=1000},
[2]={["weekday"]=2,["rate"]=2000},
[3]={["weekday"]=3,["rate"]=3000},
[4]={["weekday"]=4,["rate"]=1500},
[5]={["weekday"]=5,["rate"]=3000},
[6]={["weekday"]=6,["rate"]=4000},
[7]={["weekday"]=7,["rate"]=3000},
}
ChanceGetLUADataBase.query = function(weekday) return ChanceGetLUADataBase[weekday] end
