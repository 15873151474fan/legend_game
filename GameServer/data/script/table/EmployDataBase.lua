-- FILE: 数表-简单任务.xls SHEET: 佣兵任务刷星 KEY: id
EmployDataBase = {
[1]={["id"]=1,["doubleNum"]=100,["randper"]=500,["targetNum"]=10},
[2]={["id"]=2,["doubleNum"]=116,["randper"]=1000,["targetNum"]=10},
[3]={["id"]=3,["doubleNum"]=133,["randper"]=1500,["targetNum"]=10},
[4]={["id"]=4,["doubleNum"]=150,["randper"]=2000,["targetNum"]=10},
[5]={["id"]=5,["doubleNum"]=166,["randper"]=3000,["targetNum"]=10},
[6]={["id"]=6,["doubleNum"]=183,["randper"]=4000,["targetNum"]=10},
[7]={["id"]=7,["doubleNum"]=200,["randper"]=5000,["targetNum"]=10},
[8]={["id"]=8,["doubleNum"]=216,["randper"]=6000,["targetNum"]=10},
[9]={["id"]=9,["doubleNum"]=233,["randper"]=7000,["targetNum"]=10},
[10]={["id"]=10,["doubleNum"]=250,["randper"]=10000,["targetNum"]=10},
}
EmployDataBase.query = function(id) return EmployDataBase[id] end
