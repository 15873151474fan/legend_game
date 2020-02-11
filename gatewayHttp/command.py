#encoding: utf-8

import struct
import functools
import zlib
from ctypes import sizeof, resize, string_at, byref, create_string_buffer, cast, memmove, addressof
from ctypes import Structure, c_ubyte, c_int32, c_uint32,c_char, pointer, POINTER,c_float
# 名词定义：
# 游戏平台服： 我们游戏自己的平台服务器，简写:PS
# 代理服务器： 处理与91，360平台相关的服务协议，简写:AS

# 主协议
eCommand_Heartbeat    = 0       # 代理平台连接的一些消息处理，比如验证连接合法性
eCommand_Main_Connect = 1       # 代理平台连接的一些消息处理，比如验证连接合法性
eCommand_Main_Login   = 2       # 玩家登陆平台类（用于玩家登陆具体的平台，比如91，360）
eCommand_Main_Recharge= 3       # 玩家充值类消息
eCommand_Main_Query_Info = 4    # 查询信息

# eCommand_Main_Connect 子协议
eCommand_Heartbeat_Req = 200       # 代理平台连接的一些消息处理，比如验证连接合法性

eCommand_Sub_Connect_Req = 1   # 游戏平台连接代理验证（AS->PS）
eCommand_Sub_Connect_Rsp = 2   # 游戏平台连接代理验证返回（PS->AS）

# eCommand_Main_Login 子协议
eCommand_Sub_Login_Req = 1      # 玩家登陆平台请求（PS->AS）
eCommand_Sub_Login_Rsp = 2      # 玩家登陆平台请求返回（AS->PS）
eCommand_Sub_Get_Token = 3      # 获取Token
eCommand_Sub_Get_Token_Rsp  = 4  # 返回Token
eCommand_Sub_Bind_Phone     = 5  # 绑定手机号码，有验证码则验证，没有则发送验证码
eCommand_Sub_Bind_Phone_Rsp = 6  # 返回结果

# eCommand_Main_Recharge 子协议
eCommand_Sub_Recharge_Req   = 1  # 玩家充值通知，从AS发到PS
eCommand_Sub_Recharge_Rsp   = 2  # 玩家充值通知返回，从PS返回到AS
eCommand_Sub_Recharge_Query = 3  # 订单查询
eCommand_Sub_Create_Platform_Order   = 4  # 创建平台订单,适应于vivo, amigo
eCommand_Sub_Return_Platform_Order   = 5  # 返回平台订单
eCommand_Sub_Recharge_Req_Reward     = 6  # 请求游戏服发放奖励
eCommand_Sub_Recharge_Rsp_Reward     = 7  # 返回发放奖励得结果
eCommand_Sub_Recharge_Get_Balance    = 8  # 获取玩家余额（针对运用宝）
eCommand_Sub_Recharge_Return_Balance = 9  # 返回玩家余额 (针对运用宝)
eCommand_Sub_Recharge_Confirm_Balance= 10 # 玩家余额确认 (针对运用宝)
eCommand_Sub_Unlimit_Recharge        = 11 # 部分无己方订单号的或者无限额的充值
eCommand_Sub_Create_Game_Order       = 12 # 海外平台想通过该协议来验证角色是否存在，并返回订单号
eCommand_Sub_Return_Game_Order       = 13 # 如果存在该角色，则返回一个订单号，否则返回失败

# eCommand_Main_Query_Info 子协议
eCommand_Sub_Query_Info_PrivateKey_CS   = 1  # PS发送请求查询某个平台的私钥信息
eCommand_Sub_Query_Info_PublicKey_CS    = 2  # PS发送请求查询某个平台的公钥信息
eCommand_Sub_Query_ROLE_Req             = 3  # AS发送到游戏请求角色信息列表
eCommand_Sub_Query_ROLE_Rsp             = 4  # PS返回角色信息列表
eCommand_Sub_Query_Server_Req           = 5  # AS发送到游戏请求服务器信息列表
eCommand_Sub_Query_Server_Rsp           = 6  # PS返回服务器信息列表

# 命令操作结果定义
eCommand_Result_Success = 0    # 命令执行成功

MAX_ORDER_ID_LEN     =  64  # 订单长度
MAX_ROLE_NAME_LEN    =  64  # 角色名称
MAX_EXTERN_DATA_LEN  =  64  # 扩展字段长度
MAX_EXTERN_DATA_LEN2 =  256  # 扩展字段长度2
MAX_USER_ACCOUNT_LEN =  128  # 玩家帐写最大长度
MAX_USER_SESSION_LEN =  256  # 玩家会话最大长度, 金立的长度为126
MAX_APP_ID_LEN       =  32  # APPID 长度
MAX_APP_KEY_LEN      =  64  # APPKEY长度
MAX_APP_PREFIX_LEN   =  8   # APP PREFIX 长度
MAX_ZONE_ID_LEN      =  32  # zoneid长度
MAX_QUERY_PARAM_LEN  =  5120 # 查询凭证相关参数
MAX_NOTICE_URL_LEN   =  128 #充值回调得URL长度
MAX_PUBLIC_KEY_LEN   =  1025
MAX_PRIVATE_KEY_LEN   =  4097
MAX_PLAYER_NUM       = 100 # 角色信息最大个数
MAX_SERIALNO_LEN     = 100 # 流水号 
MAX_GAME_CODE_LEN    = 20  # 游戏码（efun）
MAX_PHONE_NUM_LEN    = 11  # 11位手机号码长度
MAX_PHONE_CODE_LEN   = 4   # 4位手机验证码

FIRST_NULL  = 0
SECOND_NULL = 0
HEAD_SIZE = 4
PACKET_ZIP = 0x40000000

class BaseCmd(Structure):
    _pack_ = 1
    _fields_ = [
        ("first", c_ubyte),
        ("second", c_ubyte),
    ]
    def __init__(self,first=0,second=0):
        super(BaseCmd,self).__init__()
        self.first  = first
        self.second = second

    def pack(self):
        raw = string_at(byref(self), sizeof(self))
        return struct.pack("I", sizeof(self)) + raw

    @classmethod
    def unpack(cls, buf, ext=True):
        cstring = create_string_buffer(buf)
        obj = cast(pointer(cstring), POINTER(cls)).contents
        if cls == BaseCmd and ext:
            submapping = CLASS_MAPPING.get(obj.first, None)
            if submapping and obj.second in submapping:
                vtype = submapping[obj.second]
                p = POINTER(submapping[obj.second])
                ext_obj = cast(pointer(cstring), p).contents
                if hasattr(vtype, '_variable_type_'):
                    ext_obj.unpackv()
                return ext_obj
            else:
                msg = "(%s, %s) Not in CLASS_MAPPING"
                raise RuntimeError(msg % (obj.first, obj.second))
        return obj

    @staticmethod
    def parse_packet(stream, on_action):
        def on_packet(zipped,data):
            if zipped:
                data = zlib.decompress( data )
            packet = BaseCmd.unpack(data)
            on_action(packet)

        def on_data(data):
            packet_size = struct.unpack("I", data)[0]
            zipped = PACKET_ZIP & packet_size == PACKET_ZIP
            packet_size = packet_size & 0xffff
            stream.read_bytes(packet_size, functools.partial(on_packet,zipped))

        stream.read_bytes(HEAD_SIZE, on_data)

    @staticmethod
    def mapping(m=None):
        if not m:
            return CLASS_MAPPING
        for key in m:
            if key in CLASS_MAPPING:
                CLASS_MAPPING[key].update(m[key])
            else:
                CLASS_MAPPING[key] = m[key]

class BaseAppCmd(BaseCmd):
    _pack_ = 1
    _fields_ = [
        ("uiTalkingSDKAppId", c_uint32), # Talkingsdk app id
    ]
    def __init__(self ,*args ):
        super(BaseAppCmd,self).__init__(*args)
        self.uiTalkingSDKAppId = 11111111

# 消息名定义规则：源服 + 2 + 目标服 + 消息 + Command
# 一个平台的信息

class TPlatformContext(Structure):
    _pack_ = 1
    _fields_ = [
        ("nPlatformID", c_int32), # 平台ID
        ("szAppID", c_char * (MAX_APP_ID_LEN)),      # 游戏在该平台上的应用ID
        ("szAppKey", c_char * (MAX_APP_KEY_LEN)),# 应用在该平台上的KEY，有的平台需要。
        ("szSecretKey", c_char * (MAX_APP_KEY_LEN)),#  OAuth2使用的加密串
        ("szPrefix", c_char * (MAX_APP_PREFIX_LEN)),# 该平台的用户名前缀
    ]

    def __init__(self):
        super(TPlatformContext,self).__init__()
        self.nPlatformID = 0
        self.nAppID      = 0

# *******************PS与AS的连接验证****************
# AS连上PS的验证
class AS2PSConnectCommand(BaseCmd):
    _pack_ = 1
    _fields_ = [
        ("nConnectKey", c_int32),    # 平台ID
        ("nPlatformCount", c_int32), # 游戏在该平台上的应用ID
        ("data", TPlatformContext * 0), # 平台信息列表
    ]
    def __init__(self, connectKey , platforms):
        super(AS2PSConnectCommand,self).__init__(eCommand_Main_Connect,eCommand_Sub_Connect_Req)
        self.nConnectKey    = connectKey
        self.nPlatformCount = sizeof(platforms) / sizeof(TPlatformContext)
        if self.nPlatformCount > 0:
            resize(self,sizeof(self) + sizeof(TPlatformContext) * self.nPlatformCount)
            memmove(addressof(self) + sizeof(self.__class__),platforms,sizeof(platforms))

# 验证返回
class PS2ASConnectCommand(BaseAppCmd):
    _pack_ = 1
    _fields_ = [
        ("nResult", c_int32),    # 验证结果
    ]

    def __init__(self):
        super(PS2ASConnectCommand,self).__init__()
        self.nResult = 0

# 验证玩家身份是否合法
class PS2ASLoginCommand(BaseAppCmd):
    _pack_ = 1
    _fields_ = [
        ("nPlatformID", c_int32),    # 需要登陆的平台
        ("szAccount", c_char * (MAX_USER_ACCOUNT_LEN)), # 玩家帐号
        ("szSession", c_char * (MAX_USER_SESSION_LEN)),# 玩家SESSION，部分平台有这个
        ("szDataEx", c_char * (MAX_EXTERN_DATA_LEN2)),  # 扩展数据长度
        ("uiClientID", c_uint32),    # 这个需要在后面的返回中原样返回，用于游戏平台查找对应的客户端连接
    ]
    def __init__(self):
        super(PS2ASLoginCommand,self).__init__()

# AS返回
class AS2PSLoginCommand(BaseCmd):
    _pack_ = 1
    _fields_ = [
        ("nResult", c_int32),     # 登陆结果, 0 表示成功
        ("nPlatformID", c_int32), # 需要登陆的平台ID
        ("szAccount", c_char * (MAX_USER_ACCOUNT_LEN)), # 玩家帐号
        ("szSession", c_char * (MAX_USER_SESSION_LEN)),# 玩家SESSION，部分平台有这个
        ("szDataEx", c_char * (MAX_EXTERN_DATA_LEN2)),  # 扩展数据长度
        ("uiClientID", c_uint32),    # 这个需要在后面的返回中原样返回，用于游戏平台查找对应的客户端连接
        ("uiPlatUserID", c_uint32),    # 平台玩家的ID，适应于360
    ]

    def __init__(self):
        super(AS2PSLoginCommand,self).__init__(eCommand_Main_Login,eCommand_Sub_Login_Rsp)
        self.nPlatformID= 0

    @classmethod
    def from_request(cls,request):
        resp = cls()
        resp.nPlatformID = request.nPlatformID
        resp.szAccount   = request.szAccount
        resp.szSession   = request.szSession
        resp.szDataEx    = request.szDataEx
        resp.uiClientID  = request.uiClientID
        if hasattr(request,'uiPlatUserID'):
            resp.uiPlatUserID = request.uiPlatUserID
        return resp

# 获取Token，适应于类OAuth的协议
class PS2ASGetTokenCommand(BaseAppCmd):
    _pack_ = 1
    _fields_ = [
        ("uiServerID", c_uint32),     # 登陆结果, 0 表示成功
        ("uiUserID",   c_uint32),     # 登陆结果, 0 表示成功
        ("nPlatformID",c_int32 ),     # 登陆结果, 0 表示成功
        ("szDataEx", c_char * (MAX_EXTERN_DATA_LEN)),  # 扩展数据长度
    ]
    def __init__(self):
        super(PS2ASGetTokenCommand,self).__init__()

    def create_response(self,access_token):
        resp = AS2PSGetTokenCommand()
        resp.uiServerID = self.uiServerID
        resp.uiUserID   = self.uiUserID
        resp.szDataEx   = access_token
        return resp

# 获取Token，适应于类OAuth的协议
class AS2PSGetTokenCommand(BaseCmd):
    _pack_ = 1
    _fields_ = [
        ("uiServerID", c_uint32),     # 登陆结果, 0 表示成功
        ("uiUserID",   c_uint32),     # 登陆结果, 0 表示成功
        ("szDataEx", c_char * (MAX_EXTERN_DATA_LEN)),  # 扩展数据长度
    ]
    def __init__(self):
        super(AS2PSGetTokenCommand,self).__init__(eCommand_Main_Login,eCommand_Sub_Get_Token_Rsp)


# 代理通知游戏平台服有玩家充值
# 对于协议里面的部分字段，比如玩家ID，商品ID等字段需要看平台充值协议，可能平台只能提供一个订单ID参数。
# 这时候就在平台上实现内部订单号生成，通过订单号来查找这些信息。
class AS2PSRechargeCommand(BaseAppCmd):
    _pack_ = 1
    _fields_ = [
        ("nPlatformID", c_int32), # 平台ID, 在上面枚举里面定义
        ("szPlatformOrder", c_char * (MAX_ORDER_ID_LEN)), # 订单号
        ("szGameOrder", c_char * (MAX_ORDER_ID_LEN)), # 订单号
        ("nServerID", c_int32), # 充值的目标服务器，一个玩家可能在多个服务器上都有角色，所以需要知道他在哪个服务器充值
        ("uiUserID", c_uint32), # 用户在游戏内部平台服上的玩家ID
        ("uiPlayerID", c_uint32), # 用户在游戏内部游戏服上的ID
        ("fOriginalMoney", c_float), # 原价(格式:0.00),购买时应用传入的单价*总数,总原价
        ("fOrderMoney", c_float), # 实际价格(格式:0.00),购买时应用传入的单价*总数,总实际 价格
        ("uiGoodsID", c_uint32), # 用户买了什么商品
        ("uiGoodsCount", c_uint32), # 用户买了多少个
        ("szDataEx", c_char * (MAX_EXTERN_DATA_LEN)),  # 扩展数据长度
        ("nStatus", c_int32), # 购买状态, 1, 处理中;2 支付成功;3支付失败
    ]

    def __init__(self):
        super(AS2PSRechargeCommand,self).__init__(eCommand_Main_Recharge,eCommand_Sub_Recharge_Req)
        self.nPlatformID= 0

    def __str__(self):
        return "%s, %s, %s, %s" % (self.nPlatformID, self.szGameOrder, self.szPlatformOrder, self.fOrderMoney)

class AS2PSUnlimitRecharge(BaseAppCmd):
    _pack_ = 1
    _fields_ = [
        ("nPlatformID", c_int32), # 平台ID, 在上面枚举里面定义
        ("szPlatformOrder", c_char * (MAX_ORDER_ID_LEN)), # 订单号
        ("szGameOrder", c_char * (MAX_ORDER_ID_LEN)), # 订单号
        ("nServerID", c_int32), # 充值的目标服务器，一个玩家可能在多个服务器上都有角色，所以需要知道他在哪个服务器充值
        ("uiUserID", c_uint32), # 用户在游戏内部平台服上的玩家ID
        ("uiPlayerID", c_uint32), # 用户在游戏内部游戏服上的ID
        ("fOriginalMoney", c_float), # 原价(格式:0.00),购买时应用传入的单价*总数,总原价
        ("fOrderMoney", c_float), # 实际价格(格式:0.00),购买时应用传入的单价*总数,总实际 价格
        ("uiGoodsID", c_uint32), # 用户买了什么商品
        ("uiGoodsCount", c_uint32), # 用户买了多少个
        ("szDataEx", c_char * (MAX_EXTERN_DATA_LEN)),  # 扩展数据长度
        ("nStatus", c_int32), # 购买状态, 1, 处理中;2 支付成功;3支付失败
    ]

    def __init__(self):                                #3                       11
        super(AS2PSUnlimitRecharge,self).__init__(eCommand_Main_Recharge,eCommand_Sub_Unlimit_Recharge)
        self.nPlatformID = 0

    def __str__(self):
        return "%s, %s, %s, %s" % (self.nPlatformID, self.szGameOrder, self.szPlatformOrder, self.fOrderMoney)


# PS到AS的返回确认
class PS2ASRechargeCommand(BaseAppCmd):
    _pack_ = 1
    _fields_ = [
        ("nPlatformID", c_int32), # 平台ID, 在上面枚举里面定义
        ("nStatus",     c_int32), # 平台ID, 在上面枚举里面定义
        ("szPlatformOrder", c_char * (MAX_ORDER_ID_LEN)), # 第三方订单号
        ("szGameOrder", c_char * (MAX_ORDER_ID_LEN)), # 游戏的订单号
        ("szDataEx", c_char * (MAX_EXTERN_DATA_LEN)),  # 扩展数据长度
    ]

    def __init__(self):
        super(PS2ASRechargeCommand,self).__init__()

# PS到AS查询订单是否已经充值
class PS2ASRechargeQueryCommand(BaseAppCmd):
    _pack_ = 1
    _fields_ = [
        ("nPlatformID", c_int32), # 平台ID, 在上面枚举里面定义
        ("szGameOrder", c_char * (MAX_ORDER_ID_LEN)), # 游戏的订单号
        ("nServerID", c_uint32), #游戏服务器大区id
        ("uiPlayerID", c_uint32), # 用户在游戏内部游戏服上的ID
        ("fOriginalMoney", c_float), # 原价(格式:0.00),购买时应用传入的单价*总数,总原价
        ("fOrderMoney", c_float), # 实际价格(格式:0.00),购买时应用传入的单价*总数,总实际 价格
        ("szQueryParam", c_char * (MAX_QUERY_PARAM_LEN)), # 查询凭证
        ("szDataEx", c_char * (MAX_EXTERN_DATA_LEN)),  # 扩展数据长度
    ]

    def __init__(self):
        super(PS2ASRechargeQueryCommand,self).__init__(eCommand_Main_Recharge,eCommand_Sub_Recharge_Query)

# PS到AS创建平台订单
class PS2ASCreatePlatformOrderCommand(BaseAppCmd):
    _pack_ = 1
    _fields_ = [
        ("nPlatformID", c_int32), # 平台ID, 在上面枚举里面定义
        ("szGameOrder", c_char * (MAX_ORDER_ID_LEN)), # 订单号
        ("nServerID", c_int32), # 充值的目标服务器，一个玩家可能在多个服务器上都有角色，所以需要知道他在哪个服务器充值
        ("uiUserID", c_uint32), # 用户在游戏内部平台服上的玩家ID
        ("uiPlayerID", c_uint32), # 用户在游戏内部游戏服上的ID
        ("fOriginalMoney", c_float), # 原价(格式:0.00),购买时应用传入的单价*总数,总原价
        ("fOrderMoney", c_float), # 实际价格(格式:0.00),购买时应用传入的单价*总数,总实际 价格
        ("uiGoodsID", c_uint32), # 用户买了什么商品
        ("uiGoodsCount", c_uint32), # 用户买了多少个
        ("szRoleName", c_char * (MAX_ROLE_NAME_LEN)),  # 充值用户在游戏内的角色名称
        ("szDataEx", c_char * (MAX_EXTERN_DATA_LEN)),  # 扩展数据长度
        ("szDataEx2", c_char * (MAX_EXTERN_DATA_LEN2)),  # 扩展数据长度2, 为了那些变态长的数据
    ]

    def __init__(self):
        super(PS2ASCreatePlatformOrderCommand,self).__init__()

# PS到AS创建平台订单
class AS2PSReturnPlatformOrderCommand(BaseAppCmd):
    _pack_ = 1
    _fields_ = [
        ("nPlatformID", c_int32), # 平台ID, 在上面枚举里面定义
        ("szPlatformOrder", c_char * (MAX_ORDER_ID_LEN)), # 订单号
        ("szGameOrder", c_char * (MAX_ORDER_ID_LEN)), # 订单号
        ("nServerID", c_int32), # 充值的目标服务器，一个玩家可能在多个服务器上都有角色，所以需要知道他在哪个服务器充值
        ("uiUserID", c_uint32), # 用户在游戏内部平台服上的玩家ID
        ("uiPlayerID", c_uint32), # 用户在游戏内部游戏服上的ID
        ("fOriginalMoney", c_float), # 原价(格式:0.00),购买时应用传入的单价*总数,总原价
        ("fOrderMoney", c_float), # 实际价格(格式:0.00),购买时应用传入的单价*总数,总实际 价格
        ("uiGoodsID", c_uint32), # 用户买了什么商品
        ("uiGoodsCount", c_uint32), # 用户买了多少个
        ("szDataEx", c_char * (MAX_EXTERN_DATA_LEN2)),  # 扩展数据长度, hw作为sign #MAX_EXTERN_DATA_LEN
        ("nStatus", c_int32), # 0 成功, 1 失败
        ("szNoticeUrl", c_char * (MAX_NOTICE_URL_LEN)), #充值回调链接，没有就默认为空
    ]

    def __init__(self):
        super(AS2PSReturnPlatformOrderCommand,self).__init__(eCommand_Main_Recharge,eCommand_Sub_Return_Platform_Order)

    @classmethod
    def from_request(cls,request):
        resp = cls()
        resp.nPlatformID = request.nPlatformID
        resp.szGameOrder   = request.szGameOrder
        resp.nServerID   = request.nServerID
        resp.uiUserID    = request.uiUserID
        resp.uiPlayerID    = request.uiPlayerID
        resp.fOriginalMoney    = request.fOriginalMoney
        resp.fOrderMoney    = request.fOrderMoney
        resp.uiGoodsID    = request.uiGoodsID
        resp.uiGoodsCount    = request.uiGoodsCount
        resp.szDataEx  = request.szDataEx
        return resp

# 查询Public Key
class QueryPublicKeyCommand(BaseAppCmd):
    _pack_ = 1
    _fields_ = [
        ("nPlatformID", c_int32),    # 需要登陆的平台
        ("uiClientID", c_uint32),    # 这个需要在后面的返回中原样返回，用于游戏平台查找对应的客户端连接
        ("szKey", c_char * (MAX_PUBLIC_KEY_LEN)),  # KEY, MAX_PUBLIC_KEY_LEN = 1025
    ]

    def __init__(self):
        super(QueryPublicKeyCommand,self).__init__()

# 查询Private Key
class QueryPrivateKeyCommand(BaseAppCmd):
    _pack_ = 1
    _fields_ = [
        ("nPlatformID", c_int32),    # 需要登陆的平台
        ("uiClientID", c_uint32),    # 这个需要在后面的返回中原样返回，用于游戏平台查找对应的客户端连接
        ("szKey", c_char * (MAX_PRIVATE_KEY_LEN)),  # KEY, MAX_PRIVATE_KEY_LEN = 4097
    ]

    def __init__(self):
        super(QueryPrivateKeyCommand,self).__init__()
        
# 请求玩家角色列表
class AS2PSQueryRoleCommand(BaseAppCmd):
    _pack_ = 1
    _fields_ = [
        ("nPlatformID", c_uint32),    # 平台id
        ("nServerID", c_uint32),      # 服务器id
        ("szGameCode", c_char * MAX_GAME_CODE_LEN),      # 游戏编号，可选
        ("szAccount", c_char * (MAX_USER_ACCOUNT_LEN)),  # 平台账户
    ]
    def __init__(self):
        super(AS2PSQueryRoleCommand,self).__init__(eCommand_Main_Query_Info,eCommand_Sub_Query_ROLE_Req)

class RoleInfo(Structure):
    _pack_ = 1
    _fields_ = [
        ("szName", c_char * MAX_ROLE_NAME_LEN),  #角色名称
        ("nLevel", c_uint32),                    #等级
        ("nRoleid", c_uint32),                   #角色id
        ("nSubgame", c_uint32),                  #游戏服id
    ]
    
class PS2ASQueryRoleResultCommand(BaseAppCmd):
    _pack_ = 1
    _fields_ = [
        ("nPlatformID", c_uint32),  # 平台id
        ("nResult", c_uint32),      # 操作结果
        ("szAccount", c_char * MAX_USER_ACCOUNT_LEN),
        ("nNum", c_uint32),         #角色个数
        ("szRoleList", RoleInfo * MAX_PLAYER_NUM) #角色信息列表
    ]
    def __init__(self):
        super(PS2ASQueryRoleResultCommand,self).__init__(eCommand_Main_Query_Info,eCommand_Sub_Query_ROLE_Rsp)

class AS2PSQueryServerCommand(BaseAppCmd):
    _pack_ = 1
    _fields_ = [
        ("nPlatformID", c_uint32),    # 平台id
        ("szChannel", c_char * (MAX_USER_ACCOUNT_LEN)),  # 平台账户
        ("szDataExt", c_char * (MAX_EXTERN_DATA_LEN)),   # 扩展字段
    ]
    def __init__(self):                                  # 4                           5
        super(AS2PSQueryRoleCommand,self).__init__(eCommand_Main_Query_Info,eCommand_Sub_Query_Server_Req)

class ServerInfo(Structure):
    _pack_ = 1
    _fields_ = [
        ("nServerID", c_uint32),                 #服务器ID
        ("szName", c_char * MAX_ROLE_NAME_LEN),  #服务器名称
    ]
    
class PS2ASQueryServerResultCommand(BaseAppCmd):
    _pack_ = 1
    _fields_ = [
        ("nPlatformID", c_uint32),  # 平台id
        ("nResult", c_uint32),      # 操作结果
        ("szChannel", c_char * MAX_USER_ACCOUNT_LEN),
        ("nNum", c_uint32),         #服务器个数
        ("szServerList", ServerInfo * MAX_PLAYER_NUM) #服务器信息列表
    ]
    def __init__(self):                                  # 4                              6
        super(PS2ASQueryRoleResultCommand,self).__init__(eCommand_Main_Query_Info,eCommand_Sub_Query_Server_Rsp)

#发放奖励
class AS2PSSendRewardCommand(BaseAppCmd):
    _pack_ = 1
    _fields_ = [
        ("nPlatformID", c_uint32), # 平台id
        ("nServerID", c_uint32),   # 服务器id
        ("szGameCode", c_char * MAX_GAME_CODE_LEN),   # 服务器编号
        ("szAccount", c_char * MAX_USER_ACCOUNT_LEN), # 平台账户
        ("nCharid", c_uint32),     # 角色id 
        ("szSerialNo", c_char * MAX_SERIALNO_LEN),     # 奖励流水号
        ("nPackageId", c_uint32),  # 奖励ID
        ("nPacketNum", c_uint32),  # 奖励数量
        ("szDataEx", c_char * MAX_SERIALNO_LEN)        #附加数据
    ]
    def __init__(self):
        super(AS2PSSendRewardCommand,self).__init__(eCommand_Main_Recharge,eCommand_Sub_Recharge_Req_Reward)
        
#发放奖励结果
class PS2ASSendRewardResultCommand(BaseAppCmd):
    _pack_ = 1
    _fields_ = [
        ("nPlatformID", c_uint32), # 平台id
        ("szAccount", c_char * MAX_USER_ACCOUNT_LEN), # 平台账户
        ("nCharid", c_uint32), # 角色id
        ("nResult", c_uint32), # 操作结果
    ]
    
    def __init__(self):
        super(AS2PSSendRewardCommand,self).__init__(eCommand_Main_Recharge,eCommand_Sub_Recharge_Rsp_Reward)
        
# PS到AS查询玩家余额
class PS2ASGetBalanceCommand(BaseAppCmd):
    _pack_ = 1
    _fields_ = [
        ("nPlatformID", c_int32), # 平台ID, 在上面枚举里面定义
        ("uiPlayerID", c_uint32), # 用户在游戏内部游戏服上的ID
        ("nZoneID", c_uint32),    # 游戏服务器大区id
        ("szQueryParam", c_char * (MAX_QUERY_PARAM_LEN)), # 查询凭证，json格式
        ("szDataExt", c_char * (MAX_EXTERN_DATA_LEN)),    # 扩展数据 64
    ]

    def __init__(self):                               # 3                            8
        super(PS2ASGetBalanceCommand,self).__init__(eCommand_Main_Recharge,eCommand_Sub_Recharge_Get_Balance)
        
# AS到PS返回玩家余额，
class AS2PSReturnBalanceCommand(BaseAppCmd):
    _pack_ = 1
    _fields_ = [
        ("nPlatformID", c_int32), # 平台ID, 在上面枚举里面定义
        ("uiPlayerID", c_uint32), # 用户在游戏内部游戏服上的ID
        ("nZoneID", c_uint32),    # 游戏服务器大区id
        ("uiBalance", c_uint32),  # 玩家余额
        ("szSerialNo", c_char * (MAX_SERIALNO_LEN)),    # 运用宝扣除余额的流水号
        ("szAccount", c_char * (MAX_USER_ACCOUNT_LEN)), # 玩家账号
        ("szDataExt", c_char * (MAX_EXTERN_DATA_LEN)),  # 扩展数据 64
    ]

    def __init__(self):                                # 3                          9
        super(AS2PSReturnBalanceCommand,self).__init__(eCommand_Main_Recharge,eCommand_Sub_Recharge_Return_Balance)
        
# PS到AS返回余额确认包，
class PS2ASConfirmBalanceCommand(BaseAppCmd):
    _pack_ = 1
    _fields_ = [
        ("nPlatformID", c_int32), # 平台ID, 在上面枚举里面定义
        ("uiPlayerID", c_uint32), # 用户在游戏内部游戏服上的ID
        ("szSerialNo", c_char * (MAX_SERIALNO_LEN)),    # 运用宝扣除余额的流水号
        ("szAccount", c_char * (MAX_USER_ACCOUNT_LEN)), # 玩家账号
    ]

    def __init__(self):                                # 3                          10
        super(PS2ASConfirmBalanceCommand,self).__init__(eCommand_Main_Recharge,eCommand_Sub_Recharge_Confirm_Balance)

class AS2PSCreateGameOrderCommand(BaseAppCmd):
    _pack_ = 1
    _fields_ = [
        ("nPlatformID", c_int32), # 平台ID, 在上面枚举里面定义
        ("nServerID", c_int32), # 充值的目标服务器，一个玩家可能在多个服务器上都有角色，所以需要知道他在哪个服务器充值
        ("uiUserID", c_uint32), # 用户在游戏内部平台服上的玩家ID
        ("uiPlayerID", c_uint32), # 用户在游戏内部游戏服上的ID
        ("fOriginalMoney", c_float), # 原价(格式:0.00),购买时应用传入的单价*总数,总原价
        ("fOrderMoney", c_float), # 实际价格(格式:0.00),购买时应用传入的单价*总数,总实际 价格
        ("uiGoodsID", c_uint32), # 用户买了什么商品
        ("uiGoodsCount", c_uint32), # 用户买了多少个
        ("szRoleName", c_char * (MAX_ROLE_NAME_LEN)),  # 充值用户在游戏内的角色名称
        ("szDataEx", c_char * (MAX_EXTERN_DATA_LEN)),  # 扩展数据长度
    ]

    def __init__(self):                                 #  3                      12
        super(AS2PSCreateGameOrderCommand,self).__init__(eCommand_Main_Recharge,eCommand_Sub_Create_Game_Order)

class PS2ASReturnGameOrderCommand(BaseAppCmd):
    _pack_ = 1
    _fields_ = [
        ('nPlatformID', c_int32), #平台ID, 在上面枚举里面定义
        ("nServerID", c_int32), # 充值的目标服务器，一个玩家可能在多个服务器上都有角色，所以需要知道他在哪个服务器充值
        ("uiUserID", c_uint32), # 用户在游戏内部平台服上的玩家ID
        ("uiPlayerID", c_uint32), # 用户在游戏内部游戏服上的ID
        ("szGameOrder", c_char * (MAX_ORDER_ID_LEN)), # 订单号,如果不存在该玩家，则返回空订单号
        ("fOriginalMoney", c_float), # 原价(格式:0.00),购买时应用传入的单价*总数,总原价
        ("fOrderMoney", c_float), # 实际价格(格式:0.00),购买时应用传入的单价*总数,总实际 价格
        ("uiGoodsID", c_uint32), # 用户买了什么商品
        ("uiGoodsCount", c_uint32), # 用户买了多少个
        ("szRoleName", c_char * (MAX_ROLE_NAME_LEN)),  # 充值用户在游戏内的角色名称
        ("szDataEx", c_char * (MAX_EXTERN_DATA_LEN)),  # 扩展数据长度
    ]
    def __init__(self):                                     # 3                   13      
        super(PS2ASReturnGameOrderCommand, self).__init__(eCommand_Main_Recharge,eCommand_Sub_Return_Game_Order)

#绑定手机号码
class PS2ASBindPhoneCommand(BaseAppCmd):
    _pack_ = 1
    _fields_ = [
        ('nPlatformID', c_int32),
        ("nServerID", c_uint32),                        # 服务器id
        ("uiPlayerID", c_uint32),                       # 用户在游戏内部游戏服上的ID
        ("szAccount", c_char * (MAX_USER_ACCOUNT_LEN)), # 玩家账号
        ("uiUserID", c_uint32),                         # 用户在平台上的账号ID
        ("szPhone", c_char * (MAX_PHONE_NUM_LEN)),      # 玩家手机号码
        ("szCode", c_char * (MAX_PHONE_CODE_LEN)),      # 手机验证码
        ("szDataExt", c_char * (MAX_EXTERN_DATA_LEN))   # 扩展数据,用于存储remark数据
    ]
    
    def __init__(self):                                    #2                 #5
        super(PS2ASBindPhoneCommand, self).__init__(eCommand_Main_Login,eCommand_Sub_Bind_Phone)

#返回绑定结果     
class AS2PSBindPhoneResultCommand(BaseCmd):
    _pack_ = 1
    _fields_ = [
        ("nServerID", c_uint32),                        # 服务器id
        ("uiPlayerID", c_uint32),                       # 用户在游戏内部游戏服上的ID
        ("szPhone", c_char * (MAX_PHONE_NUM_LEN)),      # 玩家手机号码
        ("szCode", c_char * (MAX_PHONE_CODE_LEN)),      # 手机验证码
        ("nResult", c_uint32),                          # 操作结果,0成功，1验证码错误, 2手机已绑定，3系统错误（账号未绑定，http错误）4请求次数太多
    ]
    
    def __init__(self):                                      #2                   #6
        super(AS2PSBindPhoneResultCommand, self).__init__(eCommand_Main_Login,eCommand_Sub_Bind_Phone_Rsp)
    
    @classmethod
    def from_request(cls,request):
        resp = cls()
        resp.nServerID   = request.nServerID
        resp.uiPlayerID  = request.uiPlayerID
        resp.szPhone     = request.szPhone
        resp.szCode      = request.szCode
        return resp


CLASS_MAPPING = {

    0: {
        0: BaseCmd,
        eCommand_Heartbeat_Req: BaseCmd
    },
    eCommand_Main_Connect: {
        eCommand_Sub_Connect_Req: AS2PSConnectCommand,
        eCommand_Sub_Connect_Rsp: PS2ASConnectCommand
    },
    eCommand_Main_Login: {
        eCommand_Sub_Login_Req: PS2ASLoginCommand,
        eCommand_Sub_Login_Rsp: AS2PSLoginCommand,
        eCommand_Sub_Get_Token: PS2ASGetTokenCommand,
        eCommand_Sub_Get_Token_Rsp: AS2PSGetTokenCommand,
        eCommand_Sub_Bind_Phone: PS2ASBindPhoneCommand,
        eCommand_Sub_Bind_Phone_Rsp: AS2PSBindPhoneResultCommand,
    },
    eCommand_Main_Recharge: {
        eCommand_Sub_Recharge_Req: AS2PSRechargeCommand,
        eCommand_Sub_Recharge_Rsp: PS2ASRechargeCommand,
        eCommand_Sub_Recharge_Query: PS2ASRechargeQueryCommand,
        eCommand_Sub_Create_Platform_Order: PS2ASCreatePlatformOrderCommand,
        eCommand_Sub_Return_Platform_Order: AS2PSReturnPlatformOrderCommand,
        eCommand_Sub_Recharge_Req_Reward: AS2PSSendRewardCommand,
        eCommand_Sub_Recharge_Rsp_Reward: PS2ASSendRewardResultCommand,
        eCommand_Sub_Recharge_Get_Balance: PS2ASGetBalanceCommand,
        eCommand_Sub_Recharge_Return_Balance: AS2PSReturnBalanceCommand,
        eCommand_Sub_Recharge_Confirm_Balance: PS2ASConfirmBalanceCommand,
        eCommand_Sub_Unlimit_Recharge: AS2PSUnlimitRecharge,
        eCommand_Sub_Create_Game_Order: AS2PSCreateGameOrderCommand,
        eCommand_Sub_Return_Game_Order: PS2ASReturnGameOrderCommand,
    },
    eCommand_Main_Query_Info: {
        eCommand_Sub_Query_Info_PrivateKey_CS: QueryPrivateKeyCommand,
        eCommand_Sub_Query_Info_PublicKey_CS: QueryPublicKeyCommand,
        eCommand_Sub_Query_ROLE_Req: AS2PSQueryRoleCommand,
        eCommand_Sub_Query_ROLE_Rsp: PS2ASQueryRoleResultCommand,
        eCommand_Sub_Query_Server_Req: AS2PSQueryServerCommand,
        eCommand_Sub_Query_Server_Rsp: PS2ASQueryServerResultCommand,
    },
}
