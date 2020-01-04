//
// Copyright (c) ZeroC, Inc. All rights reserved.
//

// Ice version 3.7.3
// Generated from file `login.ice'

#import <objc/Ice/Config.h>
#import <objc/Ice/Proxy.h>
#import <objc/Ice/Current.h>
#import <objc/Ice/Object.h>
#import <objc/Ice/Stream.h>
#import <objc/Ice/LocalObject.h>
#import <objc/Ice/Exception.h>

@class LoginILogin;
@protocol LoginILogin;

@class LoginILoginPrx;
@protocol LoginILoginPrx;

typedef enum : ICEInt
{
    LoginSuccess = 0,
    LoginFailure = 1,
    LoginAccountExist = 2,
    LoginPasswordError = 3,
    LoginStateError = 4,
    LoginAccountNotExist = 5
} LoginErrorCode;

@interface LoginRegReqData : NSObject <NSCopying>
{
    @private
        NSString *strAccount;
        NSString *strPhone;
        NSString *strDevice;
        NSString *strSalt;
        NSString *strVerifier;
}

@property(nonatomic, ICE_STRONG_ATTR) NSString *strAccount;
@property(nonatomic, ICE_STRONG_ATTR) NSString *strPhone;
@property(nonatomic, ICE_STRONG_ATTR) NSString *strDevice;
@property(nonatomic, ICE_STRONG_ATTR) NSString *strSalt;
@property(nonatomic, ICE_STRONG_ATTR) NSString *strVerifier;

-(id) init;
-(id) init:(NSString*)strAccount strPhone:(NSString*)strPhone strDevice:(NSString*)strDevice strSalt:(NSString*)strSalt strVerifier:(NSString*)strVerifier;
+(id) regReqData;
+(id) regReqData:(NSString*)strAccount strPhone:(NSString*)strPhone strDevice:(NSString*)strDevice strSalt:(NSString*)strSalt strVerifier:(NSString*)strVerifier;
// This class also overrides copyWithZone:
// This class also overrides dealloc
// This class also overrides hash, and isEqual:
-(void) iceWrite:(id<ICEOutputStream>)ostr;
-(void) iceRead:(id<ICEInputStream>)istr;
@end

@interface LoginRegRspData : NSObject <NSCopying>
{
    @private
        LoginErrorCode ret;
}

@property(nonatomic, assign) LoginErrorCode ret;

-(id) init;
-(id) init:(LoginErrorCode)ret;
+(id) regRspData;
+(id) regRspData:(LoginErrorCode)ret;
// This class also overrides copyWithZone:
// This class also overrides hash, and isEqual:
-(void) iceWrite:(id<ICEOutputStream>)ostr;
-(void) iceRead:(id<ICEInputStream>)istr;
@end

@interface LoginLoginWithTokenReqData : NSObject <NSCopying>
{
    @private
        NSString *strToken;
        NSString *strDevice;
}

@property(nonatomic, ICE_STRONG_ATTR) NSString *strToken;
@property(nonatomic, ICE_STRONG_ATTR) NSString *strDevice;

-(id) init;
-(id) init:(NSString*)strToken strDevice:(NSString*)strDevice;
+(id) loginWithTokenReqData;
+(id) loginWithTokenReqData:(NSString*)strToken strDevice:(NSString*)strDevice;
// This class also overrides copyWithZone:
// This class also overrides dealloc
// This class also overrides hash, and isEqual:
-(void) iceWrite:(id<ICEOutputStream>)ostr;
-(void) iceRead:(id<ICEInputStream>)istr;
@end

@interface LoginLoginReqData : NSObject <NSCopying>
{
    @private
        NSString *strToken;
        NSString *strUserName;
        NSString *strPassword;
        NSString *strDevice;
}

@property(nonatomic, ICE_STRONG_ATTR) NSString *strToken;
@property(nonatomic, ICE_STRONG_ATTR) NSString *strUserName;
@property(nonatomic, ICE_STRONG_ATTR) NSString *strPassword;
@property(nonatomic, ICE_STRONG_ATTR) NSString *strDevice;

-(id) init;
-(id) init:(NSString*)strToken strUserName:(NSString*)strUserName strPassword:(NSString*)strPassword strDevice:(NSString*)strDevice;
+(id) loginReqData;
+(id) loginReqData:(NSString*)strToken strUserName:(NSString*)strUserName strPassword:(NSString*)strPassword strDevice:(NSString*)strDevice;
// This class also overrides copyWithZone:
// This class also overrides dealloc
// This class also overrides hash, and isEqual:
-(void) iceWrite:(id<ICEOutputStream>)ostr;
-(void) iceRead:(id<ICEInputStream>)istr;
@end

@interface LoginLoginRspData : NSObject <NSCopying>
{
    @private
        LoginErrorCode ret;
        NSString *strToken;
        NSString *strSession;
}

@property(nonatomic, assign) LoginErrorCode ret;
@property(nonatomic, ICE_STRONG_ATTR) NSString *strToken;
@property(nonatomic, ICE_STRONG_ATTR) NSString *strSession;

-(id) init;
-(id) init:(LoginErrorCode)ret strToken:(NSString*)strToken strSession:(NSString*)strSession;
+(id) loginRspData;
+(id) loginRspData:(LoginErrorCode)ret strToken:(NSString*)strToken strSession:(NSString*)strSession;
// This class also overrides copyWithZone:
// This class also overrides dealloc
// This class also overrides hash, and isEqual:
-(void) iceWrite:(id<ICEOutputStream>)ostr;
-(void) iceRead:(id<ICEInputStream>)istr;
@end

@interface LoginLogoutRspData : NSObject <NSCopying>
{
    @private
        LoginErrorCode ret;
}

@property(nonatomic, assign) LoginErrorCode ret;

-(id) init;
-(id) init:(LoginErrorCode)ret;
+(id) logoutRspData;
+(id) logoutRspData:(LoginErrorCode)ret;
// This class also overrides copyWithZone:
// This class also overrides hash, and isEqual:
-(void) iceWrite:(id<ICEOutputStream>)ostr;
-(void) iceRead:(id<ICEInputStream>)istr;
@end

@interface LoginGetVerifyInfoReqData : NSObject <NSCopying>
{
    @private
        NSString *strAccount;
        NSString *strA;
        NSString *strDevice;
}

@property(nonatomic, ICE_STRONG_ATTR) NSString *strAccount;
@property(nonatomic, ICE_STRONG_ATTR) NSString *strA;
@property(nonatomic, ICE_STRONG_ATTR) NSString *strDevice;

-(id) init;
-(id) init:(NSString*)strAccount strA:(NSString*)strA strDevice:(NSString*)strDevice;
+(id) getVerifyInfoReqData;
+(id) getVerifyInfoReqData:(NSString*)strAccount strA:(NSString*)strA strDevice:(NSString*)strDevice;
// This class also overrides copyWithZone:
// This class also overrides dealloc
// This class also overrides hash, and isEqual:
-(void) iceWrite:(id<ICEOutputStream>)ostr;
-(void) iceRead:(id<ICEInputStream>)istr;
@end

@interface LoginGetVerifyInfoRspData : NSObject <NSCopying>
{
    @private
        LoginErrorCode ret;
        NSString *strSalt;
        NSString *strB;
}

@property(nonatomic, assign) LoginErrorCode ret;
@property(nonatomic, ICE_STRONG_ATTR) NSString *strSalt;
@property(nonatomic, ICE_STRONG_ATTR) NSString *strB;

-(id) init;
-(id) init:(LoginErrorCode)ret strSalt:(NSString*)strSalt strB:(NSString*)strB;
+(id) getVerifyInfoRspData;
+(id) getVerifyInfoRspData:(LoginErrorCode)ret strSalt:(NSString*)strSalt strB:(NSString*)strB;
// This class also overrides copyWithZone:
// This class also overrides dealloc
// This class also overrides hash, and isEqual:
-(void) iceWrite:(id<ICEOutputStream>)ostr;
-(void) iceRead:(id<ICEInputStream>)istr;
@end

@interface LoginLoginVerifyReqData : NSObject <NSCopying>
{
    @private
        NSString *strAccount;
        NSString *strM1;
}

@property(nonatomic, ICE_STRONG_ATTR) NSString *strAccount;
@property(nonatomic, ICE_STRONG_ATTR) NSString *strM1;

-(id) init;
-(id) init:(NSString*)strAccount strM1:(NSString*)strM1;
+(id) loginVerifyReqData;
+(id) loginVerifyReqData:(NSString*)strAccount strM1:(NSString*)strM1;
// This class also overrides copyWithZone:
// This class also overrides dealloc
// This class also overrides hash, and isEqual:
-(void) iceWrite:(id<ICEOutputStream>)ostr;
-(void) iceRead:(id<ICEInputStream>)istr;
@end

@protocol LoginILogin <NSObject>
-(void) Register_:(LoginRegReqData*)req rsp:(LoginRegRspData**)rsp current:(ICECurrent *)current;
-(void) Login:(LoginLoginReqData*)req rsp:(LoginLoginRspData**)rsp current:(ICECurrent *)current;
-(void) LoginWithToken:(LoginLoginWithTokenReqData*)req rsp:(LoginLoginRspData**)rsp current:(ICECurrent *)current;
-(void) GetVerifyInfo:(LoginGetVerifyInfoReqData*)req rsp:(LoginGetVerifyInfoRspData**)rsp current:(ICECurrent *)current;
-(void) LoginVerify:(LoginLoginVerifyReqData*)req rsp:(LoginLoginRspData**)rsp current:(ICECurrent *)current;
-(void) Logout:(LoginLogoutRspData**)rsp current:(ICECurrent *)current;
@end

@interface LoginILogin : ICEServant
+(id) iLogin;
+(void) iceD_Register:(id<LoginILogin>)target current:(ICECurrent *)current is:(id<ICEInputStream>)istr os:(id<ICEOutputStream>)ostr;
+(void) iceD_Login:(id<LoginILogin>)target current:(ICECurrent *)current is:(id<ICEInputStream>)istr os:(id<ICEOutputStream>)ostr;
+(void) iceD_LoginWithToken:(id<LoginILogin>)target current:(ICECurrent *)current is:(id<ICEInputStream>)istr os:(id<ICEOutputStream>)ostr;
+(void) iceD_GetVerifyInfo:(id<LoginILogin>)target current:(ICECurrent *)current is:(id<ICEInputStream>)istr os:(id<ICEOutputStream>)ostr;
+(void) iceD_LoginVerify:(id<LoginILogin>)target current:(ICECurrent *)current is:(id<ICEInputStream>)istr os:(id<ICEOutputStream>)ostr;
+(void) iceD_Logout:(id<LoginILogin>)target current:(ICECurrent *)current is:(id<ICEInputStream>)istr os:(id<ICEOutputStream>)ostr;
@end

@protocol LoginILoginPrx <ICEObjectPrx>
-(void) Register_:(LoginRegReqData*)req rsp:(LoginRegRspData* ICE_AUTORELEASING_QUALIFIER*)rsp;
-(void) Register_:(LoginRegReqData*)req rsp:(LoginRegRspData* ICE_AUTORELEASING_QUALIFIER*)rsp context:(ICEContext *)context;
-(id<ICEAsyncResult>) begin_Register:(LoginRegReqData*)req;
-(id<ICEAsyncResult>) begin_Register:(LoginRegReqData*)req context:(ICEContext *)context;
-(void) end_Register:(LoginRegRspData* ICE_AUTORELEASING_QUALIFIER*)rsp result:(id<ICEAsyncResult>)result;
-(id<ICEAsyncResult>) begin_Register:(LoginRegReqData*)req response:(void(^)(LoginRegRspData*))response exception:(void(^)(ICEException*))exception;
-(id<ICEAsyncResult>) begin_Register:(LoginRegReqData*)req context:(ICEContext *)context response:(void(^)(LoginRegRspData*))response exception:(void(^)(ICEException*))exception;
-(id<ICEAsyncResult>) begin_Register:(LoginRegReqData*)req response:(void(^)(LoginRegRspData*))response exception:(void(^)(ICEException*))exception sent:(void(^)(BOOL))sent;
-(id<ICEAsyncResult>) begin_Register:(LoginRegReqData*)req context:(ICEContext *)context response:(void(^)(LoginRegRspData*))response exception:(void(^)(ICEException*))exception sent:(void(^)(BOOL))sent;
-(void) Login:(LoginLoginReqData*)req rsp:(LoginLoginRspData* ICE_AUTORELEASING_QUALIFIER*)rsp;
-(void) Login:(LoginLoginReqData*)req rsp:(LoginLoginRspData* ICE_AUTORELEASING_QUALIFIER*)rsp context:(ICEContext *)context;
-(id<ICEAsyncResult>) begin_Login:(LoginLoginReqData*)req;
-(id<ICEAsyncResult>) begin_Login:(LoginLoginReqData*)req context:(ICEContext *)context;
-(void) end_Login:(LoginLoginRspData* ICE_AUTORELEASING_QUALIFIER*)rsp result:(id<ICEAsyncResult>)result;
-(id<ICEAsyncResult>) begin_Login:(LoginLoginReqData*)req response:(void(^)(LoginLoginRspData*))response exception:(void(^)(ICEException*))exception;
-(id<ICEAsyncResult>) begin_Login:(LoginLoginReqData*)req context:(ICEContext *)context response:(void(^)(LoginLoginRspData*))response exception:(void(^)(ICEException*))exception;
-(id<ICEAsyncResult>) begin_Login:(LoginLoginReqData*)req response:(void(^)(LoginLoginRspData*))response exception:(void(^)(ICEException*))exception sent:(void(^)(BOOL))sent;
-(id<ICEAsyncResult>) begin_Login:(LoginLoginReqData*)req context:(ICEContext *)context response:(void(^)(LoginLoginRspData*))response exception:(void(^)(ICEException*))exception sent:(void(^)(BOOL))sent;
-(void) LoginWithToken:(LoginLoginWithTokenReqData*)req rsp:(LoginLoginRspData* ICE_AUTORELEASING_QUALIFIER*)rsp;
-(void) LoginWithToken:(LoginLoginWithTokenReqData*)req rsp:(LoginLoginRspData* ICE_AUTORELEASING_QUALIFIER*)rsp context:(ICEContext *)context;
-(id<ICEAsyncResult>) begin_LoginWithToken:(LoginLoginWithTokenReqData*)req;
-(id<ICEAsyncResult>) begin_LoginWithToken:(LoginLoginWithTokenReqData*)req context:(ICEContext *)context;
-(void) end_LoginWithToken:(LoginLoginRspData* ICE_AUTORELEASING_QUALIFIER*)rsp result:(id<ICEAsyncResult>)result;
-(id<ICEAsyncResult>) begin_LoginWithToken:(LoginLoginWithTokenReqData*)req response:(void(^)(LoginLoginRspData*))response exception:(void(^)(ICEException*))exception;
-(id<ICEAsyncResult>) begin_LoginWithToken:(LoginLoginWithTokenReqData*)req context:(ICEContext *)context response:(void(^)(LoginLoginRspData*))response exception:(void(^)(ICEException*))exception;
-(id<ICEAsyncResult>) begin_LoginWithToken:(LoginLoginWithTokenReqData*)req response:(void(^)(LoginLoginRspData*))response exception:(void(^)(ICEException*))exception sent:(void(^)(BOOL))sent;
-(id<ICEAsyncResult>) begin_LoginWithToken:(LoginLoginWithTokenReqData*)req context:(ICEContext *)context response:(void(^)(LoginLoginRspData*))response exception:(void(^)(ICEException*))exception sent:(void(^)(BOOL))sent;
-(void) GetVerifyInfo:(LoginGetVerifyInfoReqData*)req rsp:(LoginGetVerifyInfoRspData* ICE_AUTORELEASING_QUALIFIER*)rsp;
-(void) GetVerifyInfo:(LoginGetVerifyInfoReqData*)req rsp:(LoginGetVerifyInfoRspData* ICE_AUTORELEASING_QUALIFIER*)rsp context:(ICEContext *)context;
-(id<ICEAsyncResult>) begin_GetVerifyInfo:(LoginGetVerifyInfoReqData*)req;
-(id<ICEAsyncResult>) begin_GetVerifyInfo:(LoginGetVerifyInfoReqData*)req context:(ICEContext *)context;
-(void) end_GetVerifyInfo:(LoginGetVerifyInfoRspData* ICE_AUTORELEASING_QUALIFIER*)rsp result:(id<ICEAsyncResult>)result;
-(id<ICEAsyncResult>) begin_GetVerifyInfo:(LoginGetVerifyInfoReqData*)req response:(void(^)(LoginGetVerifyInfoRspData*))response exception:(void(^)(ICEException*))exception;
-(id<ICEAsyncResult>) begin_GetVerifyInfo:(LoginGetVerifyInfoReqData*)req context:(ICEContext *)context response:(void(^)(LoginGetVerifyInfoRspData*))response exception:(void(^)(ICEException*))exception;
-(id<ICEAsyncResult>) begin_GetVerifyInfo:(LoginGetVerifyInfoReqData*)req response:(void(^)(LoginGetVerifyInfoRspData*))response exception:(void(^)(ICEException*))exception sent:(void(^)(BOOL))sent;
-(id<ICEAsyncResult>) begin_GetVerifyInfo:(LoginGetVerifyInfoReqData*)req context:(ICEContext *)context response:(void(^)(LoginGetVerifyInfoRspData*))response exception:(void(^)(ICEException*))exception sent:(void(^)(BOOL))sent;
-(void) LoginVerify:(LoginLoginVerifyReqData*)req rsp:(LoginLoginRspData* ICE_AUTORELEASING_QUALIFIER*)rsp;
-(void) LoginVerify:(LoginLoginVerifyReqData*)req rsp:(LoginLoginRspData* ICE_AUTORELEASING_QUALIFIER*)rsp context:(ICEContext *)context;
-(id<ICEAsyncResult>) begin_LoginVerify:(LoginLoginVerifyReqData*)req;
-(id<ICEAsyncResult>) begin_LoginVerify:(LoginLoginVerifyReqData*)req context:(ICEContext *)context;
-(void) end_LoginVerify:(LoginLoginRspData* ICE_AUTORELEASING_QUALIFIER*)rsp result:(id<ICEAsyncResult>)result;
-(id<ICEAsyncResult>) begin_LoginVerify:(LoginLoginVerifyReqData*)req response:(void(^)(LoginLoginRspData*))response exception:(void(^)(ICEException*))exception;
-(id<ICEAsyncResult>) begin_LoginVerify:(LoginLoginVerifyReqData*)req context:(ICEContext *)context response:(void(^)(LoginLoginRspData*))response exception:(void(^)(ICEException*))exception;
-(id<ICEAsyncResult>) begin_LoginVerify:(LoginLoginVerifyReqData*)req response:(void(^)(LoginLoginRspData*))response exception:(void(^)(ICEException*))exception sent:(void(^)(BOOL))sent;
-(id<ICEAsyncResult>) begin_LoginVerify:(LoginLoginVerifyReqData*)req context:(ICEContext *)context response:(void(^)(LoginLoginRspData*))response exception:(void(^)(ICEException*))exception sent:(void(^)(BOOL))sent;
-(void) Logout:(LoginLogoutRspData* ICE_AUTORELEASING_QUALIFIER*)rsp;
-(void) Logout:(LoginLogoutRspData* ICE_AUTORELEASING_QUALIFIER*)rsp context:(ICEContext *)context;
-(id<ICEAsyncResult>) begin_Logout;
-(id<ICEAsyncResult>) begin_Logout:(ICEContext *)context;
-(void) end_Logout:(LoginLogoutRspData* ICE_AUTORELEASING_QUALIFIER*)rsp result:(id<ICEAsyncResult>)result;
-(id<ICEAsyncResult>) begin_Logout:(void(^)(LoginLogoutRspData*))response exception:(void(^)(ICEException*))exception;
-(id<ICEAsyncResult>) begin_Logout:(ICEContext *)context response:(void(^)(LoginLogoutRspData*))response exception:(void(^)(ICEException*))exception;
-(id<ICEAsyncResult>) begin_Logout:(void(^)(LoginLogoutRspData*))response exception:(void(^)(ICEException*))exception sent:(void(^)(BOOL))sent;
-(id<ICEAsyncResult>) begin_Logout:(ICEContext *)context response:(void(^)(LoginLogoutRspData*))response exception:(void(^)(ICEException*))exception sent:(void(^)(BOOL))sent;
@end

@interface LoginILoginPrx : ICEObjectPrx <LoginILoginPrx>
+(NSString *) ice_staticId;
+(void) iceI_Register_marshal:(LoginRegReqData*)iceP_req os:(id<ICEOutputStream>)ostr;
+(void) iceI_Register_unmarshal:(LoginRegRspData* ICE_AUTORELEASING_QUALIFIER*)iceP_rsp is:(id<ICEInputStream>)istr ok:(BOOL)ok;
+(void) iceI_Login_marshal:(LoginLoginReqData*)iceP_req os:(id<ICEOutputStream>)ostr;
+(void) iceI_Login_unmarshal:(LoginLoginRspData* ICE_AUTORELEASING_QUALIFIER*)iceP_rsp is:(id<ICEInputStream>)istr ok:(BOOL)ok;
+(void) iceI_LoginWithToken_marshal:(LoginLoginWithTokenReqData*)iceP_req os:(id<ICEOutputStream>)ostr;
+(void) iceI_LoginWithToken_unmarshal:(LoginLoginRspData* ICE_AUTORELEASING_QUALIFIER*)iceP_rsp is:(id<ICEInputStream>)istr ok:(BOOL)ok;
+(void) iceI_GetVerifyInfo_marshal:(LoginGetVerifyInfoReqData*)iceP_req os:(id<ICEOutputStream>)ostr;
+(void) iceI_GetVerifyInfo_unmarshal:(LoginGetVerifyInfoRspData* ICE_AUTORELEASING_QUALIFIER*)iceP_rsp is:(id<ICEInputStream>)istr ok:(BOOL)ok;
+(void) iceI_LoginVerify_marshal:(LoginLoginVerifyReqData*)iceP_req os:(id<ICEOutputStream>)ostr;
+(void) iceI_LoginVerify_unmarshal:(LoginLoginRspData* ICE_AUTORELEASING_QUALIFIER*)iceP_rsp is:(id<ICEInputStream>)istr ok:(BOOL)ok;
+(void) iceI_Logout_unmarshal:(LoginLogoutRspData* ICE_AUTORELEASING_QUALIFIER*)iceP_rsp is:(id<ICEInputStream>)istr ok:(BOOL)ok;
@end

@interface LoginErrorCodeHelper : ICEEnumHelper
@end

@interface LoginRegReqDataHelper : ICEStructHelper
@end

@interface LoginRegRspDataHelper : ICEStructHelper
@end

@interface LoginLoginWithTokenReqDataHelper : ICEStructHelper
@end

@interface LoginLoginReqDataHelper : ICEStructHelper
@end

@interface LoginLoginRspDataHelper : ICEStructHelper
@end

@interface LoginLogoutRspDataHelper : ICEStructHelper
@end

@interface LoginGetVerifyInfoReqDataHelper : ICEStructHelper
@end

@interface LoginGetVerifyInfoRspDataHelper : ICEStructHelper
@end

@interface LoginLoginVerifyReqDataHelper : ICEStructHelper
@end

@interface LoginILoginPrxHelper : ICEProxyHelper
@end

typedef ICEObjectHelper LoginILoginHelper;
