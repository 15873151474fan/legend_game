#encoding: utf-8
# order_status: SUCCEED, FAILED, INIT,
# notifying_status: SUCCEED, FAILED, INIT, NOTIFYING
SUCCEED = 1  # 订单成功(支付成功)
FAILED  = 2  # 通知失败, 订单没有失败的状态,原因: 1, 只有成功订单才会通知我们; 2, 除了1之外, 我们对订单的行为只有创建, 所以订单只有INIT和SUCCEED两个状态
INIT    = 3  # 新订单,未支付
NOTIFYING = 4 # 通知状态
FAKE    = 5 # 我们创建的订单, 返回给游戏

HTTP_401 = 401 #Unauthorized, 签名错误
HTTP_405 = 405 #Method Not Allowed, 找不到对应的handler
HTTP_422 = 422 # unprocessable_entity , handler对数据未做处理
