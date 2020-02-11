-- FILE: 数表-翅膀.xlsx SHEET: 翅膀祝福 KEY: dwID
WingsExpDataBase = {
[1]={["dwID"]=1,["prize"]=0,["cost"]=0,["onceprize"]=0,["luckynum"]=0,["luckyrate"]=0,["locknum"]=0,["critprize"]=0,["critnum"]=0,["critrate"]=0,["wingsprize"]=10},
[2]={["dwID"]=2,["prize"]=30,["cost"]=2,["onceprize"]=2,["luckynum"]=15,["luckyrate"]=5000,["locknum"]=15,["critprize"]=6,["critnum"]=2,["critrate"]=2500,["wingsprize"]=10},
[3]={["dwID"]=3,["prize"]=90,["cost"]=3,["onceprize"]=3,["luckynum"]=45,["luckyrate"]=333,["locknum"]=45,["critprize"]=18,["critnum"]=3,["critrate"]=2500,["wingsprize"]=10},
[4]={["dwID"]=4,["prize"]=200,["cost"]=5,["onceprize"]=5,["luckynum"]=100,["luckyrate"]=312,["locknum"]=100,["critprize"]=40,["critnum"]=5,["critrate"]=2500,["wingsprize"]=10},
[5]={["dwID"]=5,["prize"]=600,["cost"]=8,["onceprize"]=8,["luckynum"]=300,["luckyrate"]=166,["locknum"]=300,["critprize"]=120,["critnum"]=8,["critrate"]=2500,["wingsprize"]=10},
[6]={["dwID"]=6,["prize"]=1500,["cost"]=10,["onceprize"]=10,["luckynum"]=750,["luckyrate"]=83,["locknum"]=750,["critprize"]=300,["critnum"]=10,["critrate"]=2500,["wingsprize"]=10},
[7]={["dwID"]=7,["prize"]=4000,["cost"]=20,["onceprize"]=20,["luckynum"]=2400,["luckyrate"]=62,["locknum"]=2000,["critprize"]=800,["critnum"]=20,["critrate"]=2500,["wingsprize"]=10},
[8]={["dwID"]=8,["prize"]=8000,["cost"]=40,["onceprize"]=40,["luckynum"]=5600,["luckyrate"]=62,["locknum"]=4000,["critprize"]=1600,["critnum"]=40,["critrate"]=2500,["wingsprize"]=10},
[9]={["dwID"]=9,["prize"]=15000,["cost"]=60,["onceprize"]=60,["luckynum"]=12000,["luckyrate"]=13,["locknum"]=7500,["critprize"]=3000,["critnum"]=60,["critrate"]=2500,["wingsprize"]=10},
[10]={["dwID"]=10,["prize"]=25000,["cost"]=80,["onceprize"]=80,["luckynum"]=20160,["luckyrate"]=8,["locknum"]=12600,["critprize"]=5040,["critnum"]=80,["critrate"]=2500,["wingsprize"]=10},
}
WingsExpDataBase.query = function(dwID) return WingsExpDataBase[dwID] end
