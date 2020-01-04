//
// Copyright (c) ZeroC, Inc. All rights reserved.
//

// Ice version 3.7.3
// Generated from file `login.ice'
#import <objc/Ice/LocalException.h>
#import <objc/Ice/Stream.h>
#import <login.h>
#import <objc/runtime.h>

#ifdef __clang__
#   pragma clang diagnostic ignored "-Wshadow-ivar"
#endif

@implementation LoginRegReqData

@synthesize strAccount;
@synthesize strPhone;
@synthesize strDevice;
@synthesize strSalt;
@synthesize strVerifier;

-(id) init
{
    self = [super init];
    if(!self)
    {
        return nil;
    }
    self->strAccount = @"";
    self->strPhone = @"";
    self->strDevice = @"";
    self->strSalt = @"";
    self->strVerifier = @"";
    return self;
}

-(id) init:(NSString*)iceP_strAccount strPhone:(NSString*)iceP_strPhone strDevice:(NSString*)iceP_strDevice strSalt:(NSString*)iceP_strSalt strVerifier:(NSString*)iceP_strVerifier
{
    self = [super init];
    if(!self)
    {
        return nil;
    }
    self->strAccount = ICE_RETAIN(iceP_strAccount);
    self->strPhone = ICE_RETAIN(iceP_strPhone);
    self->strDevice = ICE_RETAIN(iceP_strDevice);
    self->strSalt = ICE_RETAIN(iceP_strSalt);
    self->strVerifier = ICE_RETAIN(iceP_strVerifier);
    return self;
}

+(id) regReqData
{
    return ICE_AUTORELEASE([(LoginRegReqData *)[self alloc] init]);
}

+(id) regReqData:(NSString*)iceP_strAccount strPhone:(NSString*)iceP_strPhone strDevice:(NSString*)iceP_strDevice strSalt:(NSString*)iceP_strSalt strVerifier:(NSString*)iceP_strVerifier
{
    return ICE_AUTORELEASE([(LoginRegReqData *)[self alloc] init:iceP_strAccount strPhone:iceP_strPhone strDevice:iceP_strDevice strSalt:iceP_strSalt strVerifier:iceP_strVerifier]);
}

-(id) copyWithZone:(NSZone *)zone
{
    return [(LoginRegReqData *)[[self class] allocWithZone:zone] init:strAccount strPhone:strPhone strDevice:strDevice strSalt:strSalt strVerifier:strVerifier];
}

#if defined(__clang__) && !__has_feature(objc_arc)
-(void) dealloc
{
    [self->strAccount release];
    [self->strPhone release];
    [self->strDevice release];
    [self->strSalt release];
    [self->strVerifier release];
    [super dealloc];
}
#endif

-(NSUInteger) hash
{
    NSUInteger h_ = 5381;
    h_ = ((h_ << 5) + h_) ^ [self->strAccount hash];
    h_ = ((h_ << 5) + h_) ^ [self->strPhone hash];
    h_ = ((h_ << 5) + h_) ^ [self->strDevice hash];
    h_ = ((h_ << 5) + h_) ^ [self->strSalt hash];
    h_ = ((h_ << 5) + h_) ^ [self->strVerifier hash];
    return h_;
}

-(BOOL) isEqual:(id)o_
{
    if(self == o_)
    {
        return YES;
    }
    if(!o_ || ![o_ isKindOfClass:[self class]])
    {
        return NO;
    }
    LoginRegReqData *obj_ = (LoginRegReqData *)o_;
    if(!strAccount)
    {
        if(obj_->strAccount)
        {
            return NO;
        }
    }
    else
    {
        if(![self.strAccount isEqualToString:obj_->strAccount])
        {
            return NO;
        }
    }
    if(!strPhone)
    {
        if(obj_->strPhone)
        {
            return NO;
        }
    }
    else
    {
        if(![self.strPhone isEqualToString:obj_->strPhone])
        {
            return NO;
        }
    }
    if(!strDevice)
    {
        if(obj_->strDevice)
        {
            return NO;
        }
    }
    else
    {
        if(![self.strDevice isEqualToString:obj_->strDevice])
        {
            return NO;
        }
    }
    if(!strSalt)
    {
        if(obj_->strSalt)
        {
            return NO;
        }
    }
    else
    {
        if(![self.strSalt isEqualToString:obj_->strSalt])
        {
            return NO;
        }
    }
    if(!strVerifier)
    {
        if(obj_->strVerifier)
        {
            return NO;
        }
    }
    else
    {
        if(![self.strVerifier isEqualToString:obj_->strVerifier])
        {
            return NO;
        }
    }
    return YES;
}

-(void) iceWrite:(id<ICEOutputStream>)ostr
{
    [ostr writeString:self->strAccount];
    [ostr writeString:self->strPhone];
    [ostr writeString:self->strDevice];
    [ostr writeString:self->strSalt];
    [ostr writeString:self->strVerifier];
}

-(void) iceRead:(id<ICEInputStream>)istr
{
    self->strAccount = [istr newString];
    self->strPhone = [istr newString];
    self->strDevice = [istr newString];
    self->strSalt = [istr newString];
    self->strVerifier = [istr newString];
}
@end

@implementation LoginRegRspData

@synthesize ret;

-(id) init
{
    self = [super init];
    if(!self)
    {
        return nil;
    }
    self->ret = LoginSuccess;
    return self;
}

-(id) init:(LoginErrorCode)iceP_ret
{
    self = [super init];
    if(!self)
    {
        return nil;
    }
    self->ret = iceP_ret;
    return self;
}

+(id) regRspData
{
    return ICE_AUTORELEASE([(LoginRegRspData *)[self alloc] init]);
}

+(id) regRspData:(LoginErrorCode)iceP_ret
{
    return ICE_AUTORELEASE([(LoginRegRspData *)[self alloc] init:iceP_ret]);
}

-(id) copyWithZone:(NSZone *)zone
{
    return [(LoginRegRspData *)[[self class] allocWithZone:zone] init:ret];
}

-(NSUInteger) hash
{
    NSUInteger h_ = 5381;
    h_ = ((h_ << 5) + h_) ^ (uint)ret;
    return h_;
}

-(BOOL) isEqual:(id)o_
{
    if(self == o_)
    {
        return YES;
    }
    if(!o_ || ![o_ isKindOfClass:[self class]])
    {
        return NO;
    }
    LoginRegRspData *obj_ = (LoginRegRspData *)o_;
    if(ret != obj_->ret)
    {
        return NO;
    }
    return YES;
}

-(void) iceWrite:(id<ICEOutputStream>)ostr
{
    [ostr writeEnumerator:self->ret min:0 max:5];
}

-(void) iceRead:(id<ICEInputStream>)istr
{
    self->ret = [istr readEnumerator:0 max:5];
}
@end

@implementation LoginLoginWithTokenReqData

@synthesize strToken;
@synthesize strDevice;

-(id) init
{
    self = [super init];
    if(!self)
    {
        return nil;
    }
    self->strToken = @"";
    self->strDevice = @"";
    return self;
}

-(id) init:(NSString*)iceP_strToken strDevice:(NSString*)iceP_strDevice
{
    self = [super init];
    if(!self)
    {
        return nil;
    }
    self->strToken = ICE_RETAIN(iceP_strToken);
    self->strDevice = ICE_RETAIN(iceP_strDevice);
    return self;
}

+(id) loginWithTokenReqData
{
    return ICE_AUTORELEASE([(LoginLoginWithTokenReqData *)[self alloc] init]);
}

+(id) loginWithTokenReqData:(NSString*)iceP_strToken strDevice:(NSString*)iceP_strDevice
{
    return ICE_AUTORELEASE([(LoginLoginWithTokenReqData *)[self alloc] init:iceP_strToken strDevice:iceP_strDevice]);
}

-(id) copyWithZone:(NSZone *)zone
{
    return [(LoginLoginWithTokenReqData *)[[self class] allocWithZone:zone] init:strToken strDevice:strDevice];
}

#if defined(__clang__) && !__has_feature(objc_arc)
-(void) dealloc
{
    [self->strToken release];
    [self->strDevice release];
    [super dealloc];
}
#endif

-(NSUInteger) hash
{
    NSUInteger h_ = 5381;
    h_ = ((h_ << 5) + h_) ^ [self->strToken hash];
    h_ = ((h_ << 5) + h_) ^ [self->strDevice hash];
    return h_;
}

-(BOOL) isEqual:(id)o_
{
    if(self == o_)
    {
        return YES;
    }
    if(!o_ || ![o_ isKindOfClass:[self class]])
    {
        return NO;
    }
    LoginLoginWithTokenReqData *obj_ = (LoginLoginWithTokenReqData *)o_;
    if(!strToken)
    {
        if(obj_->strToken)
        {
            return NO;
        }
    }
    else
    {
        if(![self.strToken isEqualToString:obj_->strToken])
        {
            return NO;
        }
    }
    if(!strDevice)
    {
        if(obj_->strDevice)
        {
            return NO;
        }
    }
    else
    {
        if(![self.strDevice isEqualToString:obj_->strDevice])
        {
            return NO;
        }
    }
    return YES;
}

-(void) iceWrite:(id<ICEOutputStream>)ostr
{
    [ostr writeString:self->strToken];
    [ostr writeString:self->strDevice];
}

-(void) iceRead:(id<ICEInputStream>)istr
{
    self->strToken = [istr newString];
    self->strDevice = [istr newString];
}
@end

@implementation LoginLoginReqData

@synthesize strToken;
@synthesize strUserName;
@synthesize strPassword;
@synthesize strDevice;

-(id) init
{
    self = [super init];
    if(!self)
    {
        return nil;
    }
    self->strToken = @"";
    self->strUserName = @"";
    self->strPassword = @"";
    self->strDevice = @"";
    return self;
}

-(id) init:(NSString*)iceP_strToken strUserName:(NSString*)iceP_strUserName strPassword:(NSString*)iceP_strPassword strDevice:(NSString*)iceP_strDevice
{
    self = [super init];
    if(!self)
    {
        return nil;
    }
    self->strToken = ICE_RETAIN(iceP_strToken);
    self->strUserName = ICE_RETAIN(iceP_strUserName);
    self->strPassword = ICE_RETAIN(iceP_strPassword);
    self->strDevice = ICE_RETAIN(iceP_strDevice);
    return self;
}

+(id) loginReqData
{
    return ICE_AUTORELEASE([(LoginLoginReqData *)[self alloc] init]);
}

+(id) loginReqData:(NSString*)iceP_strToken strUserName:(NSString*)iceP_strUserName strPassword:(NSString*)iceP_strPassword strDevice:(NSString*)iceP_strDevice
{
    return ICE_AUTORELEASE([(LoginLoginReqData *)[self alloc] init:iceP_strToken strUserName:iceP_strUserName strPassword:iceP_strPassword strDevice:iceP_strDevice]);
}

-(id) copyWithZone:(NSZone *)zone
{
    return [(LoginLoginReqData *)[[self class] allocWithZone:zone] init:strToken strUserName:strUserName strPassword:strPassword strDevice:strDevice];
}

#if defined(__clang__) && !__has_feature(objc_arc)
-(void) dealloc
{
    [self->strToken release];
    [self->strUserName release];
    [self->strPassword release];
    [self->strDevice release];
    [super dealloc];
}
#endif

-(NSUInteger) hash
{
    NSUInteger h_ = 5381;
    h_ = ((h_ << 5) + h_) ^ [self->strToken hash];
    h_ = ((h_ << 5) + h_) ^ [self->strUserName hash];
    h_ = ((h_ << 5) + h_) ^ [self->strPassword hash];
    h_ = ((h_ << 5) + h_) ^ [self->strDevice hash];
    return h_;
}

-(BOOL) isEqual:(id)o_
{
    if(self == o_)
    {
        return YES;
    }
    if(!o_ || ![o_ isKindOfClass:[self class]])
    {
        return NO;
    }
    LoginLoginReqData *obj_ = (LoginLoginReqData *)o_;
    if(!strToken)
    {
        if(obj_->strToken)
        {
            return NO;
        }
    }
    else
    {
        if(![self.strToken isEqualToString:obj_->strToken])
        {
            return NO;
        }
    }
    if(!strUserName)
    {
        if(obj_->strUserName)
        {
            return NO;
        }
    }
    else
    {
        if(![self.strUserName isEqualToString:obj_->strUserName])
        {
            return NO;
        }
    }
    if(!strPassword)
    {
        if(obj_->strPassword)
        {
            return NO;
        }
    }
    else
    {
        if(![self.strPassword isEqualToString:obj_->strPassword])
        {
            return NO;
        }
    }
    if(!strDevice)
    {
        if(obj_->strDevice)
        {
            return NO;
        }
    }
    else
    {
        if(![self.strDevice isEqualToString:obj_->strDevice])
        {
            return NO;
        }
    }
    return YES;
}

-(void) iceWrite:(id<ICEOutputStream>)ostr
{
    [ostr writeString:self->strToken];
    [ostr writeString:self->strUserName];
    [ostr writeString:self->strPassword];
    [ostr writeString:self->strDevice];
}

-(void) iceRead:(id<ICEInputStream>)istr
{
    self->strToken = [istr newString];
    self->strUserName = [istr newString];
    self->strPassword = [istr newString];
    self->strDevice = [istr newString];
}
@end

@implementation LoginLoginRspData

@synthesize ret;
@synthesize strToken;
@synthesize strSession;

-(id) init
{
    self = [super init];
    if(!self)
    {
        return nil;
    }
    self->ret = LoginSuccess;
    self->strToken = @"";
    self->strSession = @"";
    return self;
}

-(id) init:(LoginErrorCode)iceP_ret strToken:(NSString*)iceP_strToken strSession:(NSString*)iceP_strSession
{
    self = [super init];
    if(!self)
    {
        return nil;
    }
    self->ret = iceP_ret;
    self->strToken = ICE_RETAIN(iceP_strToken);
    self->strSession = ICE_RETAIN(iceP_strSession);
    return self;
}

+(id) loginRspData
{
    return ICE_AUTORELEASE([(LoginLoginRspData *)[self alloc] init]);
}

+(id) loginRspData:(LoginErrorCode)iceP_ret strToken:(NSString*)iceP_strToken strSession:(NSString*)iceP_strSession
{
    return ICE_AUTORELEASE([(LoginLoginRspData *)[self alloc] init:iceP_ret strToken:iceP_strToken strSession:iceP_strSession]);
}

-(id) copyWithZone:(NSZone *)zone
{
    return [(LoginLoginRspData *)[[self class] allocWithZone:zone] init:ret strToken:strToken strSession:strSession];
}

#if defined(__clang__) && !__has_feature(objc_arc)
-(void) dealloc
{
    [self->strToken release];
    [self->strSession release];
    [super dealloc];
}
#endif

-(NSUInteger) hash
{
    NSUInteger h_ = 5381;
    h_ = ((h_ << 5) + h_) ^ (uint)ret;
    h_ = ((h_ << 5) + h_) ^ [self->strToken hash];
    h_ = ((h_ << 5) + h_) ^ [self->strSession hash];
    return h_;
}

-(BOOL) isEqual:(id)o_
{
    if(self == o_)
    {
        return YES;
    }
    if(!o_ || ![o_ isKindOfClass:[self class]])
    {
        return NO;
    }
    LoginLoginRspData *obj_ = (LoginLoginRspData *)o_;
    if(ret != obj_->ret)
    {
        return NO;
    }
    if(!strToken)
    {
        if(obj_->strToken)
        {
            return NO;
        }
    }
    else
    {
        if(![self.strToken isEqualToString:obj_->strToken])
        {
            return NO;
        }
    }
    if(!strSession)
    {
        if(obj_->strSession)
        {
            return NO;
        }
    }
    else
    {
        if(![self.strSession isEqualToString:obj_->strSession])
        {
            return NO;
        }
    }
    return YES;
}

-(void) iceWrite:(id<ICEOutputStream>)ostr
{
    [ostr writeEnumerator:self->ret min:0 max:5];
    [ostr writeString:self->strToken];
    [ostr writeString:self->strSession];
}

-(void) iceRead:(id<ICEInputStream>)istr
{
    self->ret = [istr readEnumerator:0 max:5];
    self->strToken = [istr newString];
    self->strSession = [istr newString];
}
@end

@implementation LoginLogoutRspData

@synthesize ret;

-(id) init
{
    self = [super init];
    if(!self)
    {
        return nil;
    }
    self->ret = LoginSuccess;
    return self;
}

-(id) init:(LoginErrorCode)iceP_ret
{
    self = [super init];
    if(!self)
    {
        return nil;
    }
    self->ret = iceP_ret;
    return self;
}

+(id) logoutRspData
{
    return ICE_AUTORELEASE([(LoginLogoutRspData *)[self alloc] init]);
}

+(id) logoutRspData:(LoginErrorCode)iceP_ret
{
    return ICE_AUTORELEASE([(LoginLogoutRspData *)[self alloc] init:iceP_ret]);
}

-(id) copyWithZone:(NSZone *)zone
{
    return [(LoginLogoutRspData *)[[self class] allocWithZone:zone] init:ret];
}

-(NSUInteger) hash
{
    NSUInteger h_ = 5381;
    h_ = ((h_ << 5) + h_) ^ (uint)ret;
    return h_;
}

-(BOOL) isEqual:(id)o_
{
    if(self == o_)
    {
        return YES;
    }
    if(!o_ || ![o_ isKindOfClass:[self class]])
    {
        return NO;
    }
    LoginLogoutRspData *obj_ = (LoginLogoutRspData *)o_;
    if(ret != obj_->ret)
    {
        return NO;
    }
    return YES;
}

-(void) iceWrite:(id<ICEOutputStream>)ostr
{
    [ostr writeEnumerator:self->ret min:0 max:5];
}

-(void) iceRead:(id<ICEInputStream>)istr
{
    self->ret = [istr readEnumerator:0 max:5];
}
@end

@implementation LoginGetVerifyInfoReqData

@synthesize strAccount;
@synthesize strA;
@synthesize strDevice;

-(id) init
{
    self = [super init];
    if(!self)
    {
        return nil;
    }
    self->strAccount = @"";
    self->strA = @"";
    self->strDevice = @"";
    return self;
}

-(id) init:(NSString*)iceP_strAccount strA:(NSString*)iceP_strA strDevice:(NSString*)iceP_strDevice
{
    self = [super init];
    if(!self)
    {
        return nil;
    }
    self->strAccount = ICE_RETAIN(iceP_strAccount);
    self->strA = ICE_RETAIN(iceP_strA);
    self->strDevice = ICE_RETAIN(iceP_strDevice);
    return self;
}

+(id) getVerifyInfoReqData
{
    return ICE_AUTORELEASE([(LoginGetVerifyInfoReqData *)[self alloc] init]);
}

+(id) getVerifyInfoReqData:(NSString*)iceP_strAccount strA:(NSString*)iceP_strA strDevice:(NSString*)iceP_strDevice
{
    return ICE_AUTORELEASE([(LoginGetVerifyInfoReqData *)[self alloc] init:iceP_strAccount strA:iceP_strA strDevice:iceP_strDevice]);
}

-(id) copyWithZone:(NSZone *)zone
{
    return [(LoginGetVerifyInfoReqData *)[[self class] allocWithZone:zone] init:strAccount strA:strA strDevice:strDevice];
}

#if defined(__clang__) && !__has_feature(objc_arc)
-(void) dealloc
{
    [self->strAccount release];
    [self->strA release];
    [self->strDevice release];
    [super dealloc];
}
#endif

-(NSUInteger) hash
{
    NSUInteger h_ = 5381;
    h_ = ((h_ << 5) + h_) ^ [self->strAccount hash];
    h_ = ((h_ << 5) + h_) ^ [self->strA hash];
    h_ = ((h_ << 5) + h_) ^ [self->strDevice hash];
    return h_;
}

-(BOOL) isEqual:(id)o_
{
    if(self == o_)
    {
        return YES;
    }
    if(!o_ || ![o_ isKindOfClass:[self class]])
    {
        return NO;
    }
    LoginGetVerifyInfoReqData *obj_ = (LoginGetVerifyInfoReqData *)o_;
    if(!strAccount)
    {
        if(obj_->strAccount)
        {
            return NO;
        }
    }
    else
    {
        if(![self.strAccount isEqualToString:obj_->strAccount])
        {
            return NO;
        }
    }
    if(!strA)
    {
        if(obj_->strA)
        {
            return NO;
        }
    }
    else
    {
        if(![self.strA isEqualToString:obj_->strA])
        {
            return NO;
        }
    }
    if(!strDevice)
    {
        if(obj_->strDevice)
        {
            return NO;
        }
    }
    else
    {
        if(![self.strDevice isEqualToString:obj_->strDevice])
        {
            return NO;
        }
    }
    return YES;
}

-(void) iceWrite:(id<ICEOutputStream>)ostr
{
    [ostr writeString:self->strAccount];
    [ostr writeString:self->strA];
    [ostr writeString:self->strDevice];
}

-(void) iceRead:(id<ICEInputStream>)istr
{
    self->strAccount = [istr newString];
    self->strA = [istr newString];
    self->strDevice = [istr newString];
}
@end

@implementation LoginGetVerifyInfoRspData

@synthesize ret;
@synthesize strSalt;
@synthesize strB;

-(id) init
{
    self = [super init];
    if(!self)
    {
        return nil;
    }
    self->ret = LoginSuccess;
    self->strSalt = @"";
    self->strB = @"";
    return self;
}

-(id) init:(LoginErrorCode)iceP_ret strSalt:(NSString*)iceP_strSalt strB:(NSString*)iceP_strB
{
    self = [super init];
    if(!self)
    {
        return nil;
    }
    self->ret = iceP_ret;
    self->strSalt = ICE_RETAIN(iceP_strSalt);
    self->strB = ICE_RETAIN(iceP_strB);
    return self;
}

+(id) getVerifyInfoRspData
{
    return ICE_AUTORELEASE([(LoginGetVerifyInfoRspData *)[self alloc] init]);
}

+(id) getVerifyInfoRspData:(LoginErrorCode)iceP_ret strSalt:(NSString*)iceP_strSalt strB:(NSString*)iceP_strB
{
    return ICE_AUTORELEASE([(LoginGetVerifyInfoRspData *)[self alloc] init:iceP_ret strSalt:iceP_strSalt strB:iceP_strB]);
}

-(id) copyWithZone:(NSZone *)zone
{
    return [(LoginGetVerifyInfoRspData *)[[self class] allocWithZone:zone] init:ret strSalt:strSalt strB:strB];
}

#if defined(__clang__) && !__has_feature(objc_arc)
-(void) dealloc
{
    [self->strSalt release];
    [self->strB release];
    [super dealloc];
}
#endif

-(NSUInteger) hash
{
    NSUInteger h_ = 5381;
    h_ = ((h_ << 5) + h_) ^ (uint)ret;
    h_ = ((h_ << 5) + h_) ^ [self->strSalt hash];
    h_ = ((h_ << 5) + h_) ^ [self->strB hash];
    return h_;
}

-(BOOL) isEqual:(id)o_
{
    if(self == o_)
    {
        return YES;
    }
    if(!o_ || ![o_ isKindOfClass:[self class]])
    {
        return NO;
    }
    LoginGetVerifyInfoRspData *obj_ = (LoginGetVerifyInfoRspData *)o_;
    if(ret != obj_->ret)
    {
        return NO;
    }
    if(!strSalt)
    {
        if(obj_->strSalt)
        {
            return NO;
        }
    }
    else
    {
        if(![self.strSalt isEqualToString:obj_->strSalt])
        {
            return NO;
        }
    }
    if(!strB)
    {
        if(obj_->strB)
        {
            return NO;
        }
    }
    else
    {
        if(![self.strB isEqualToString:obj_->strB])
        {
            return NO;
        }
    }
    return YES;
}

-(void) iceWrite:(id<ICEOutputStream>)ostr
{
    [ostr writeEnumerator:self->ret min:0 max:5];
    [ostr writeString:self->strSalt];
    [ostr writeString:self->strB];
}

-(void) iceRead:(id<ICEInputStream>)istr
{
    self->ret = [istr readEnumerator:0 max:5];
    self->strSalt = [istr newString];
    self->strB = [istr newString];
}
@end

@implementation LoginLoginVerifyReqData

@synthesize strAccount;
@synthesize strM1;

-(id) init
{
    self = [super init];
    if(!self)
    {
        return nil;
    }
    self->strAccount = @"";
    self->strM1 = @"";
    return self;
}

-(id) init:(NSString*)iceP_strAccount strM1:(NSString*)iceP_strM1
{
    self = [super init];
    if(!self)
    {
        return nil;
    }
    self->strAccount = ICE_RETAIN(iceP_strAccount);
    self->strM1 = ICE_RETAIN(iceP_strM1);
    return self;
}

+(id) loginVerifyReqData
{
    return ICE_AUTORELEASE([(LoginLoginVerifyReqData *)[self alloc] init]);
}

+(id) loginVerifyReqData:(NSString*)iceP_strAccount strM1:(NSString*)iceP_strM1
{
    return ICE_AUTORELEASE([(LoginLoginVerifyReqData *)[self alloc] init:iceP_strAccount strM1:iceP_strM1]);
}

-(id) copyWithZone:(NSZone *)zone
{
    return [(LoginLoginVerifyReqData *)[[self class] allocWithZone:zone] init:strAccount strM1:strM1];
}

#if defined(__clang__) && !__has_feature(objc_arc)
-(void) dealloc
{
    [self->strAccount release];
    [self->strM1 release];
    [super dealloc];
}
#endif

-(NSUInteger) hash
{
    NSUInteger h_ = 5381;
    h_ = ((h_ << 5) + h_) ^ [self->strAccount hash];
    h_ = ((h_ << 5) + h_) ^ [self->strM1 hash];
    return h_;
}

-(BOOL) isEqual:(id)o_
{
    if(self == o_)
    {
        return YES;
    }
    if(!o_ || ![o_ isKindOfClass:[self class]])
    {
        return NO;
    }
    LoginLoginVerifyReqData *obj_ = (LoginLoginVerifyReqData *)o_;
    if(!strAccount)
    {
        if(obj_->strAccount)
        {
            return NO;
        }
    }
    else
    {
        if(![self.strAccount isEqualToString:obj_->strAccount])
        {
            return NO;
        }
    }
    if(!strM1)
    {
        if(obj_->strM1)
        {
            return NO;
        }
    }
    else
    {
        if(![self.strM1 isEqualToString:obj_->strM1])
        {
            return NO;
        }
    }
    return YES;
}

-(void) iceWrite:(id<ICEOutputStream>)ostr
{
    [ostr writeString:self->strAccount];
    [ostr writeString:self->strM1];
}

-(void) iceRead:(id<ICEInputStream>)istr
{
    self->strAccount = [istr newString];
    self->strM1 = [istr newString];
}
@end

@implementation LoginILogin

+(id) iLogin
{
    return ICE_AUTORELEASE([(LoginILogin *)[self alloc] init]);
}

-(void) iceWriteImpl:(id<ICEOutputStream>)ostr
{
    [ostr startSlice:@"::Login::ILogin" compactId:-1 lastSlice:YES];
    [ostr endSlice];
}

-(void) iceReadImpl:(id<ICEInputStream>)istr
{
    [istr startSlice];
    [istr endSlice];
}

static NSString * iceS_LoginILogin_ids[] =
{
    @"::Ice::Object",
    @"::Login::ILogin"
};

+(void) iceD_Register:(id<LoginILogin>)target current:(ICECurrent *)current is:(id<ICEInputStream>)istr os:(id<ICEOutputStream>)ostr
{
    ICEInternalCheckModeAndSelector(target, ICENormal, @selector(Register_:rsp:current:), current);
    ICEEncodingVersion* encoding = [istr startEncapsulation];
    LoginRegReqData* ICE_AUTORELEASING_QUALIFIER iceP_req = nil;
    [LoginRegReqDataHelper read:istr value:&iceP_req];
    [istr endEncapsulation];
    LoginRegRspData* ICE_AUTORELEASING_QUALIFIER iceP_rsp;
    [ostr startEncapsulation:encoding format:ICEDefaultFormat];
    [target Register_:iceP_req rsp:&iceP_rsp current:current];
    [LoginRegRspDataHelper write:iceP_rsp stream:ostr];
    [ostr endEncapsulation];
}

+(void) iceD_Login:(id<LoginILogin>)target current:(ICECurrent *)current is:(id<ICEInputStream>)istr os:(id<ICEOutputStream>)ostr
{
    ICEInternalCheckModeAndSelector(target, ICENormal, @selector(Login:rsp:current:), current);
    ICEEncodingVersion* encoding = [istr startEncapsulation];
    LoginLoginReqData* ICE_AUTORELEASING_QUALIFIER iceP_req = nil;
    [LoginLoginReqDataHelper read:istr value:&iceP_req];
    [istr endEncapsulation];
    LoginLoginRspData* ICE_AUTORELEASING_QUALIFIER iceP_rsp;
    [ostr startEncapsulation:encoding format:ICEDefaultFormat];
    [target Login:iceP_req rsp:&iceP_rsp current:current];
    [LoginLoginRspDataHelper write:iceP_rsp stream:ostr];
    [ostr endEncapsulation];
}

+(void) iceD_LoginWithToken:(id<LoginILogin>)target current:(ICECurrent *)current is:(id<ICEInputStream>)istr os:(id<ICEOutputStream>)ostr
{
    ICEInternalCheckModeAndSelector(target, ICENormal, @selector(LoginWithToken:rsp:current:), current);
    ICEEncodingVersion* encoding = [istr startEncapsulation];
    LoginLoginWithTokenReqData* ICE_AUTORELEASING_QUALIFIER iceP_req = nil;
    [LoginLoginWithTokenReqDataHelper read:istr value:&iceP_req];
    [istr endEncapsulation];
    LoginLoginRspData* ICE_AUTORELEASING_QUALIFIER iceP_rsp;
    [ostr startEncapsulation:encoding format:ICEDefaultFormat];
    [target LoginWithToken:iceP_req rsp:&iceP_rsp current:current];
    [LoginLoginRspDataHelper write:iceP_rsp stream:ostr];
    [ostr endEncapsulation];
}

+(void) iceD_GetVerifyInfo:(id<LoginILogin>)target current:(ICECurrent *)current is:(id<ICEInputStream>)istr os:(id<ICEOutputStream>)ostr
{
    ICEInternalCheckModeAndSelector(target, ICENormal, @selector(GetVerifyInfo:rsp:current:), current);
    ICEEncodingVersion* encoding = [istr startEncapsulation];
    LoginGetVerifyInfoReqData* ICE_AUTORELEASING_QUALIFIER iceP_req = nil;
    [LoginGetVerifyInfoReqDataHelper read:istr value:&iceP_req];
    [istr endEncapsulation];
    LoginGetVerifyInfoRspData* ICE_AUTORELEASING_QUALIFIER iceP_rsp;
    [ostr startEncapsulation:encoding format:ICEDefaultFormat];
    [target GetVerifyInfo:iceP_req rsp:&iceP_rsp current:current];
    [LoginGetVerifyInfoRspDataHelper write:iceP_rsp stream:ostr];
    [ostr endEncapsulation];
}

+(void) iceD_LoginVerify:(id<LoginILogin>)target current:(ICECurrent *)current is:(id<ICEInputStream>)istr os:(id<ICEOutputStream>)ostr
{
    ICEInternalCheckModeAndSelector(target, ICENormal, @selector(LoginVerify:rsp:current:), current);
    ICEEncodingVersion* encoding = [istr startEncapsulation];
    LoginLoginVerifyReqData* ICE_AUTORELEASING_QUALIFIER iceP_req = nil;
    [LoginLoginVerifyReqDataHelper read:istr value:&iceP_req];
    [istr endEncapsulation];
    LoginLoginRspData* ICE_AUTORELEASING_QUALIFIER iceP_rsp;
    [ostr startEncapsulation:encoding format:ICEDefaultFormat];
    [target LoginVerify:iceP_req rsp:&iceP_rsp current:current];
    [LoginLoginRspDataHelper write:iceP_rsp stream:ostr];
    [ostr endEncapsulation];
}

+(void) iceD_Logout:(id<LoginILogin>)target current:(ICECurrent *)current is:(id<ICEInputStream>)istr os:(id<ICEOutputStream>)ostr
{
    ICEInternalCheckModeAndSelector(target, ICENormal, @selector(Logout:current:), current);
    ICEEncodingVersion* encoding = [istr startEncapsulation];
    [istr endEncapsulation];
    LoginLogoutRspData* ICE_AUTORELEASING_QUALIFIER iceP_rsp;
    [ostr startEncapsulation:encoding format:ICEDefaultFormat];
    [target Logout:&iceP_rsp current:current];
    [LoginLogoutRspDataHelper write:iceP_rsp stream:ostr];
    [ostr endEncapsulation];
}

static NSString * iceS_LoginILogin_all[] =
{
    @"GetVerifyInfo",
    @"Login",
    @"LoginVerify",
    @"LoginWithToken",
    @"Logout",
    @"Register",
    @"ice_id",
    @"ice_ids",
    @"ice_isA",
    @"ice_ping"
};

-(void) iceDispatch:(ICECurrent *)current is:(id<ICEInputStream>)istr os:(id<ICEOutputStream>)ostr
{
    id target = [self iceTarget];
    switch(ICEInternalLookupString(iceS_LoginILogin_all, sizeof(iceS_LoginILogin_all) / sizeof(NSString*), current.operation))
    {
        case 0:
            [LoginILogin iceD_GetVerifyInfo:(id<LoginILogin>)target current:current is:istr os:ostr];
            return;
        case 1:
            [LoginILogin iceD_Login:(id<LoginILogin>)target current:current is:istr os:ostr];
            return;
        case 2:
            [LoginILogin iceD_LoginVerify:(id<LoginILogin>)target current:current is:istr os:ostr];
            return;
        case 3:
            [LoginILogin iceD_LoginWithToken:(id<LoginILogin>)target current:current is:istr os:ostr];
            return;
        case 4:
            [LoginILogin iceD_Logout:(id<LoginILogin>)target current:current is:istr os:ostr];
            return;
        case 5:
            [LoginILogin iceD_Register:(id<LoginILogin>)target current:current is:istr os:ostr];
            return;
        case 6:
            [ICEServant iceD_ice_id:(id<ICEObject>)self current:current is:istr os:ostr];
            return;
        case 7:
            [ICEServant iceD_ice_ids:(id<ICEObject>)self current:current is:istr os:ostr];
            return;
        case 8:
            [ICEServant iceD_ice_isA:(id<ICEObject>)self current:current is:istr os:ostr];
            return;
        case 9:
            [ICEServant iceD_ice_ping:(id<ICEObject>)self current:current is:istr os:ostr];
            return;
        default:
            @throw [ICEOperationNotExistException operationNotExistException:__FILE__
                                                                             line:__LINE__
                                                                             id:current.id_
                                                                             facet:current.facet
                                                                             operation:current.operation];
    }
}

+(NSString * const*) iceStaticIds:(int*)count idIndex:(int*)idx
{
    *count = sizeof(iceS_LoginILogin_ids) / sizeof(NSString *);
    *idx = 1;
    return iceS_LoginILogin_ids;
}
@end

@implementation LoginILoginPrx

-(void) Register_:(LoginRegReqData*)iceP_req rsp:(LoginRegRspData* ICE_AUTORELEASING_QUALIFIER*)iceP_rsp
{
    [self Register_:iceP_req rsp:iceP_rsp context:nil];
}

-(void) Register_:(LoginRegReqData*)iceP_req rsp:(LoginRegRspData* ICE_AUTORELEASING_QUALIFIER*)iceP_rsp context:(ICEContext *)context
{
    ICEMarshalCB marshal = ^(id<ICEOutputStream> ostr) { [LoginILoginPrx iceI_Register_marshal:iceP_req os:ostr]; };
    ICEUnmarshalCB unmarshal = ^(id<ICEInputStream> istr, BOOL ok) { [LoginILoginPrx iceI_Register_unmarshal:iceP_rsp is:istr ok:ok]; };
    [self iceInvoke:@"Register" mode:ICENormal format:ICEDefaultFormat marshal:marshal unmarshal:unmarshal context:context];
}

-(id<ICEAsyncResult>) begin_Register:(LoginRegReqData*)iceP_req
{
    return [self begin_Register:iceP_req context:nil];
}

-(id<ICEAsyncResult>) begin_Register:(LoginRegReqData*)iceP_req context:(ICEContext *)context
{
    ICEMarshalCB marshal = ^(id<ICEOutputStream> ostr) { [LoginILoginPrx iceI_Register_marshal:iceP_req os:ostr]; };
    return [self iceI_begin_invoke:@"Register" mode:ICENormal format:ICEDefaultFormat marshal:marshal returnsData:YES context:context];
}

-(void) end_Register:(LoginRegRspData* ICE_AUTORELEASING_QUALIFIER*)iceP_rsp result:(id<ICEAsyncResult>)result
{
    ICEUnmarshalCB unmarshal = ^(id<ICEInputStream> istr, BOOL ok) { [LoginILoginPrx iceI_Register_unmarshal:iceP_rsp is:istr ok:ok]; };
    [self iceI_end_invoke:@"Register" unmarshal:unmarshal result:result];
}

-(id<ICEAsyncResult>) begin_Register:(LoginRegReqData*)iceP_req response:(void(^)(LoginRegRspData*))response exception:(void(^)(ICEException*))exception
{
    return [self begin_Register:iceP_req context:nil response:response exception:exception sent:nil];
}

-(id<ICEAsyncResult>) begin_Register:(LoginRegReqData*)iceP_req response:(void(^)(LoginRegRspData*))response exception:(void(^)(ICEException*))exception sent:(void(^)(BOOL))sent
{
    return [self begin_Register:iceP_req context:nil response:response exception:exception sent:sent];
}

-(id<ICEAsyncResult>) begin_Register:(LoginRegReqData*)iceP_req context:(ICEContext*)context response:(void(^)(LoginRegRspData*))response exception:(void(^)(ICEException*))exception
{
    return [self begin_Register:iceP_req context:context response:response exception:exception sent:nil];
}

-(id<ICEAsyncResult>) begin_Register:(LoginRegReqData*)iceP_req context:(ICEContext*)context response:(void(^)(LoginRegRspData*))response exception:(void(^)(ICEException*))exception sent:(void(^)(BOOL))sent
{
    ICEMarshalCB marshal = ^(id<ICEOutputStream> ostr) { [LoginILoginPrx iceI_Register_marshal:iceP_req os:ostr]; };
    void(^completed)(id<ICEInputStream>, BOOL) = ^(id<ICEInputStream> istr, BOOL ok)
    {
        LoginRegRspData* ICE_AUTORELEASING_QUALIFIER iceP_rsp = nil;
        @try
        {
            [LoginILoginPrx iceI_Register_unmarshal:&iceP_rsp is:istr ok:ok];
        }
        @catch(ICEException* ex)
        {
            if(exception)
            {
                exception(ex);
            }
            return;
        }
        if(response)
        {
            response(iceP_rsp);
        }
    };
    return [self iceI_begin_invoke:@"Register" mode:ICENormal format:ICEDefaultFormat marshal:marshal completed:completed response:(response != nil) exception:exception sent:sent context:context];
}

-(void) Login:(LoginLoginReqData*)iceP_req rsp:(LoginLoginRspData* ICE_AUTORELEASING_QUALIFIER*)iceP_rsp
{
    [self Login:iceP_req rsp:iceP_rsp context:nil];
}

-(void) Login:(LoginLoginReqData*)iceP_req rsp:(LoginLoginRspData* ICE_AUTORELEASING_QUALIFIER*)iceP_rsp context:(ICEContext *)context
{
    ICEMarshalCB marshal = ^(id<ICEOutputStream> ostr) { [LoginILoginPrx iceI_Login_marshal:iceP_req os:ostr]; };
    ICEUnmarshalCB unmarshal = ^(id<ICEInputStream> istr, BOOL ok) { [LoginILoginPrx iceI_Login_unmarshal:iceP_rsp is:istr ok:ok]; };
    [self iceInvoke:@"Login" mode:ICENormal format:ICEDefaultFormat marshal:marshal unmarshal:unmarshal context:context];
}

-(id<ICEAsyncResult>) begin_Login:(LoginLoginReqData*)iceP_req
{
    return [self begin_Login:iceP_req context:nil];
}

-(id<ICEAsyncResult>) begin_Login:(LoginLoginReqData*)iceP_req context:(ICEContext *)context
{
    ICEMarshalCB marshal = ^(id<ICEOutputStream> ostr) { [LoginILoginPrx iceI_Login_marshal:iceP_req os:ostr]; };
    return [self iceI_begin_invoke:@"Login" mode:ICENormal format:ICEDefaultFormat marshal:marshal returnsData:YES context:context];
}

-(void) end_Login:(LoginLoginRspData* ICE_AUTORELEASING_QUALIFIER*)iceP_rsp result:(id<ICEAsyncResult>)result
{
    ICEUnmarshalCB unmarshal = ^(id<ICEInputStream> istr, BOOL ok) { [LoginILoginPrx iceI_Login_unmarshal:iceP_rsp is:istr ok:ok]; };
    [self iceI_end_invoke:@"Login" unmarshal:unmarshal result:result];
}

-(id<ICEAsyncResult>) begin_Login:(LoginLoginReqData*)iceP_req response:(void(^)(LoginLoginRspData*))response exception:(void(^)(ICEException*))exception
{
    return [self begin_Login:iceP_req context:nil response:response exception:exception sent:nil];
}

-(id<ICEAsyncResult>) begin_Login:(LoginLoginReqData*)iceP_req response:(void(^)(LoginLoginRspData*))response exception:(void(^)(ICEException*))exception sent:(void(^)(BOOL))sent
{
    return [self begin_Login:iceP_req context:nil response:response exception:exception sent:sent];
}

-(id<ICEAsyncResult>) begin_Login:(LoginLoginReqData*)iceP_req context:(ICEContext*)context response:(void(^)(LoginLoginRspData*))response exception:(void(^)(ICEException*))exception
{
    return [self begin_Login:iceP_req context:context response:response exception:exception sent:nil];
}

-(id<ICEAsyncResult>) begin_Login:(LoginLoginReqData*)iceP_req context:(ICEContext*)context response:(void(^)(LoginLoginRspData*))response exception:(void(^)(ICEException*))exception sent:(void(^)(BOOL))sent
{
    ICEMarshalCB marshal = ^(id<ICEOutputStream> ostr) { [LoginILoginPrx iceI_Login_marshal:iceP_req os:ostr]; };
    void(^completed)(id<ICEInputStream>, BOOL) = ^(id<ICEInputStream> istr, BOOL ok)
    {
        LoginLoginRspData* ICE_AUTORELEASING_QUALIFIER iceP_rsp = nil;
        @try
        {
            [LoginILoginPrx iceI_Login_unmarshal:&iceP_rsp is:istr ok:ok];
        }
        @catch(ICEException* ex)
        {
            if(exception)
            {
                exception(ex);
            }
            return;
        }
        if(response)
        {
            response(iceP_rsp);
        }
    };
    return [self iceI_begin_invoke:@"Login" mode:ICENormal format:ICEDefaultFormat marshal:marshal completed:completed response:(response != nil) exception:exception sent:sent context:context];
}

-(void) LoginWithToken:(LoginLoginWithTokenReqData*)iceP_req rsp:(LoginLoginRspData* ICE_AUTORELEASING_QUALIFIER*)iceP_rsp
{
    [self LoginWithToken:iceP_req rsp:iceP_rsp context:nil];
}

-(void) LoginWithToken:(LoginLoginWithTokenReqData*)iceP_req rsp:(LoginLoginRspData* ICE_AUTORELEASING_QUALIFIER*)iceP_rsp context:(ICEContext *)context
{
    ICEMarshalCB marshal = ^(id<ICEOutputStream> ostr) { [LoginILoginPrx iceI_LoginWithToken_marshal:iceP_req os:ostr]; };
    ICEUnmarshalCB unmarshal = ^(id<ICEInputStream> istr, BOOL ok) { [LoginILoginPrx iceI_LoginWithToken_unmarshal:iceP_rsp is:istr ok:ok]; };
    [self iceInvoke:@"LoginWithToken" mode:ICENormal format:ICEDefaultFormat marshal:marshal unmarshal:unmarshal context:context];
}

-(id<ICEAsyncResult>) begin_LoginWithToken:(LoginLoginWithTokenReqData*)iceP_req
{
    return [self begin_LoginWithToken:iceP_req context:nil];
}

-(id<ICEAsyncResult>) begin_LoginWithToken:(LoginLoginWithTokenReqData*)iceP_req context:(ICEContext *)context
{
    ICEMarshalCB marshal = ^(id<ICEOutputStream> ostr) { [LoginILoginPrx iceI_LoginWithToken_marshal:iceP_req os:ostr]; };
    return [self iceI_begin_invoke:@"LoginWithToken" mode:ICENormal format:ICEDefaultFormat marshal:marshal returnsData:YES context:context];
}

-(void) end_LoginWithToken:(LoginLoginRspData* ICE_AUTORELEASING_QUALIFIER*)iceP_rsp result:(id<ICEAsyncResult>)result
{
    ICEUnmarshalCB unmarshal = ^(id<ICEInputStream> istr, BOOL ok) { [LoginILoginPrx iceI_LoginWithToken_unmarshal:iceP_rsp is:istr ok:ok]; };
    [self iceI_end_invoke:@"LoginWithToken" unmarshal:unmarshal result:result];
}

-(id<ICEAsyncResult>) begin_LoginWithToken:(LoginLoginWithTokenReqData*)iceP_req response:(void(^)(LoginLoginRspData*))response exception:(void(^)(ICEException*))exception
{
    return [self begin_LoginWithToken:iceP_req context:nil response:response exception:exception sent:nil];
}

-(id<ICEAsyncResult>) begin_LoginWithToken:(LoginLoginWithTokenReqData*)iceP_req response:(void(^)(LoginLoginRspData*))response exception:(void(^)(ICEException*))exception sent:(void(^)(BOOL))sent
{
    return [self begin_LoginWithToken:iceP_req context:nil response:response exception:exception sent:sent];
}

-(id<ICEAsyncResult>) begin_LoginWithToken:(LoginLoginWithTokenReqData*)iceP_req context:(ICEContext*)context response:(void(^)(LoginLoginRspData*))response exception:(void(^)(ICEException*))exception
{
    return [self begin_LoginWithToken:iceP_req context:context response:response exception:exception sent:nil];
}

-(id<ICEAsyncResult>) begin_LoginWithToken:(LoginLoginWithTokenReqData*)iceP_req context:(ICEContext*)context response:(void(^)(LoginLoginRspData*))response exception:(void(^)(ICEException*))exception sent:(void(^)(BOOL))sent
{
    ICEMarshalCB marshal = ^(id<ICEOutputStream> ostr) { [LoginILoginPrx iceI_LoginWithToken_marshal:iceP_req os:ostr]; };
    void(^completed)(id<ICEInputStream>, BOOL) = ^(id<ICEInputStream> istr, BOOL ok)
    {
        LoginLoginRspData* ICE_AUTORELEASING_QUALIFIER iceP_rsp = nil;
        @try
        {
            [LoginILoginPrx iceI_LoginWithToken_unmarshal:&iceP_rsp is:istr ok:ok];
        }
        @catch(ICEException* ex)
        {
            if(exception)
            {
                exception(ex);
            }
            return;
        }
        if(response)
        {
            response(iceP_rsp);
        }
    };
    return [self iceI_begin_invoke:@"LoginWithToken" mode:ICENormal format:ICEDefaultFormat marshal:marshal completed:completed response:(response != nil) exception:exception sent:sent context:context];
}

-(void) GetVerifyInfo:(LoginGetVerifyInfoReqData*)iceP_req rsp:(LoginGetVerifyInfoRspData* ICE_AUTORELEASING_QUALIFIER*)iceP_rsp
{
    [self GetVerifyInfo:iceP_req rsp:iceP_rsp context:nil];
}

-(void) GetVerifyInfo:(LoginGetVerifyInfoReqData*)iceP_req rsp:(LoginGetVerifyInfoRspData* ICE_AUTORELEASING_QUALIFIER*)iceP_rsp context:(ICEContext *)context
{
    ICEMarshalCB marshal = ^(id<ICEOutputStream> ostr) { [LoginILoginPrx iceI_GetVerifyInfo_marshal:iceP_req os:ostr]; };
    ICEUnmarshalCB unmarshal = ^(id<ICEInputStream> istr, BOOL ok) { [LoginILoginPrx iceI_GetVerifyInfo_unmarshal:iceP_rsp is:istr ok:ok]; };
    [self iceInvoke:@"GetVerifyInfo" mode:ICENormal format:ICEDefaultFormat marshal:marshal unmarshal:unmarshal context:context];
}

-(id<ICEAsyncResult>) begin_GetVerifyInfo:(LoginGetVerifyInfoReqData*)iceP_req
{
    return [self begin_GetVerifyInfo:iceP_req context:nil];
}

-(id<ICEAsyncResult>) begin_GetVerifyInfo:(LoginGetVerifyInfoReqData*)iceP_req context:(ICEContext *)context
{
    ICEMarshalCB marshal = ^(id<ICEOutputStream> ostr) { [LoginILoginPrx iceI_GetVerifyInfo_marshal:iceP_req os:ostr]; };
    return [self iceI_begin_invoke:@"GetVerifyInfo" mode:ICENormal format:ICEDefaultFormat marshal:marshal returnsData:YES context:context];
}

-(void) end_GetVerifyInfo:(LoginGetVerifyInfoRspData* ICE_AUTORELEASING_QUALIFIER*)iceP_rsp result:(id<ICEAsyncResult>)result
{
    ICEUnmarshalCB unmarshal = ^(id<ICEInputStream> istr, BOOL ok) { [LoginILoginPrx iceI_GetVerifyInfo_unmarshal:iceP_rsp is:istr ok:ok]; };
    [self iceI_end_invoke:@"GetVerifyInfo" unmarshal:unmarshal result:result];
}

-(id<ICEAsyncResult>) begin_GetVerifyInfo:(LoginGetVerifyInfoReqData*)iceP_req response:(void(^)(LoginGetVerifyInfoRspData*))response exception:(void(^)(ICEException*))exception
{
    return [self begin_GetVerifyInfo:iceP_req context:nil response:response exception:exception sent:nil];
}

-(id<ICEAsyncResult>) begin_GetVerifyInfo:(LoginGetVerifyInfoReqData*)iceP_req response:(void(^)(LoginGetVerifyInfoRspData*))response exception:(void(^)(ICEException*))exception sent:(void(^)(BOOL))sent
{
    return [self begin_GetVerifyInfo:iceP_req context:nil response:response exception:exception sent:sent];
}

-(id<ICEAsyncResult>) begin_GetVerifyInfo:(LoginGetVerifyInfoReqData*)iceP_req context:(ICEContext*)context response:(void(^)(LoginGetVerifyInfoRspData*))response exception:(void(^)(ICEException*))exception
{
    return [self begin_GetVerifyInfo:iceP_req context:context response:response exception:exception sent:nil];
}

-(id<ICEAsyncResult>) begin_GetVerifyInfo:(LoginGetVerifyInfoReqData*)iceP_req context:(ICEContext*)context response:(void(^)(LoginGetVerifyInfoRspData*))response exception:(void(^)(ICEException*))exception sent:(void(^)(BOOL))sent
{
    ICEMarshalCB marshal = ^(id<ICEOutputStream> ostr) { [LoginILoginPrx iceI_GetVerifyInfo_marshal:iceP_req os:ostr]; };
    void(^completed)(id<ICEInputStream>, BOOL) = ^(id<ICEInputStream> istr, BOOL ok)
    {
        LoginGetVerifyInfoRspData* ICE_AUTORELEASING_QUALIFIER iceP_rsp = nil;
        @try
        {
            [LoginILoginPrx iceI_GetVerifyInfo_unmarshal:&iceP_rsp is:istr ok:ok];
        }
        @catch(ICEException* ex)
        {
            if(exception)
            {
                exception(ex);
            }
            return;
        }
        if(response)
        {
            response(iceP_rsp);
        }
    };
    return [self iceI_begin_invoke:@"GetVerifyInfo" mode:ICENormal format:ICEDefaultFormat marshal:marshal completed:completed response:(response != nil) exception:exception sent:sent context:context];
}

-(void) LoginVerify:(LoginLoginVerifyReqData*)iceP_req rsp:(LoginLoginRspData* ICE_AUTORELEASING_QUALIFIER*)iceP_rsp
{
    [self LoginVerify:iceP_req rsp:iceP_rsp context:nil];
}

-(void) LoginVerify:(LoginLoginVerifyReqData*)iceP_req rsp:(LoginLoginRspData* ICE_AUTORELEASING_QUALIFIER*)iceP_rsp context:(ICEContext *)context
{
    ICEMarshalCB marshal = ^(id<ICEOutputStream> ostr) { [LoginILoginPrx iceI_LoginVerify_marshal:iceP_req os:ostr]; };
    ICEUnmarshalCB unmarshal = ^(id<ICEInputStream> istr, BOOL ok) { [LoginILoginPrx iceI_LoginVerify_unmarshal:iceP_rsp is:istr ok:ok]; };
    [self iceInvoke:@"LoginVerify" mode:ICENormal format:ICEDefaultFormat marshal:marshal unmarshal:unmarshal context:context];
}

-(id<ICEAsyncResult>) begin_LoginVerify:(LoginLoginVerifyReqData*)iceP_req
{
    return [self begin_LoginVerify:iceP_req context:nil];
}

-(id<ICEAsyncResult>) begin_LoginVerify:(LoginLoginVerifyReqData*)iceP_req context:(ICEContext *)context
{
    ICEMarshalCB marshal = ^(id<ICEOutputStream> ostr) { [LoginILoginPrx iceI_LoginVerify_marshal:iceP_req os:ostr]; };
    return [self iceI_begin_invoke:@"LoginVerify" mode:ICENormal format:ICEDefaultFormat marshal:marshal returnsData:YES context:context];
}

-(void) end_LoginVerify:(LoginLoginRspData* ICE_AUTORELEASING_QUALIFIER*)iceP_rsp result:(id<ICEAsyncResult>)result
{
    ICEUnmarshalCB unmarshal = ^(id<ICEInputStream> istr, BOOL ok) { [LoginILoginPrx iceI_LoginVerify_unmarshal:iceP_rsp is:istr ok:ok]; };
    [self iceI_end_invoke:@"LoginVerify" unmarshal:unmarshal result:result];
}

-(id<ICEAsyncResult>) begin_LoginVerify:(LoginLoginVerifyReqData*)iceP_req response:(void(^)(LoginLoginRspData*))response exception:(void(^)(ICEException*))exception
{
    return [self begin_LoginVerify:iceP_req context:nil response:response exception:exception sent:nil];
}

-(id<ICEAsyncResult>) begin_LoginVerify:(LoginLoginVerifyReqData*)iceP_req response:(void(^)(LoginLoginRspData*))response exception:(void(^)(ICEException*))exception sent:(void(^)(BOOL))sent
{
    return [self begin_LoginVerify:iceP_req context:nil response:response exception:exception sent:sent];
}

-(id<ICEAsyncResult>) begin_LoginVerify:(LoginLoginVerifyReqData*)iceP_req context:(ICEContext*)context response:(void(^)(LoginLoginRspData*))response exception:(void(^)(ICEException*))exception
{
    return [self begin_LoginVerify:iceP_req context:context response:response exception:exception sent:nil];
}

-(id<ICEAsyncResult>) begin_LoginVerify:(LoginLoginVerifyReqData*)iceP_req context:(ICEContext*)context response:(void(^)(LoginLoginRspData*))response exception:(void(^)(ICEException*))exception sent:(void(^)(BOOL))sent
{
    ICEMarshalCB marshal = ^(id<ICEOutputStream> ostr) { [LoginILoginPrx iceI_LoginVerify_marshal:iceP_req os:ostr]; };
    void(^completed)(id<ICEInputStream>, BOOL) = ^(id<ICEInputStream> istr, BOOL ok)
    {
        LoginLoginRspData* ICE_AUTORELEASING_QUALIFIER iceP_rsp = nil;
        @try
        {
            [LoginILoginPrx iceI_LoginVerify_unmarshal:&iceP_rsp is:istr ok:ok];
        }
        @catch(ICEException* ex)
        {
            if(exception)
            {
                exception(ex);
            }
            return;
        }
        if(response)
        {
            response(iceP_rsp);
        }
    };
    return [self iceI_begin_invoke:@"LoginVerify" mode:ICENormal format:ICEDefaultFormat marshal:marshal completed:completed response:(response != nil) exception:exception sent:sent context:context];
}

-(void) Logout:(LoginLogoutRspData* ICE_AUTORELEASING_QUALIFIER*)iceP_rsp
{
    [self Logout:iceP_rsp context:nil];
}

-(void) Logout:(LoginLogoutRspData* ICE_AUTORELEASING_QUALIFIER*)iceP_rsp context:(ICEContext *)context
{
    ICEUnmarshalCB unmarshal = ^(id<ICEInputStream> istr, BOOL ok) { [LoginILoginPrx iceI_Logout_unmarshal:iceP_rsp is:istr ok:ok]; };
    [self iceInvoke:@"Logout" mode:ICENormal format:ICEDefaultFormat marshal:nil unmarshal:unmarshal context:context];
}

-(id<ICEAsyncResult>) begin_Logout
{
    return [self begin_Logout:nil];
}

-(id<ICEAsyncResult>) begin_Logout:(ICEContext *)context
{
    return [self iceI_begin_invoke:@"Logout" mode:ICENormal format:ICEDefaultFormat marshal:nil returnsData:YES context:context];
}

-(void) end_Logout:(LoginLogoutRspData* ICE_AUTORELEASING_QUALIFIER*)iceP_rsp result:(id<ICEAsyncResult>)result
{
    ICEUnmarshalCB unmarshal = ^(id<ICEInputStream> istr, BOOL ok) { [LoginILoginPrx iceI_Logout_unmarshal:iceP_rsp is:istr ok:ok]; };
    [self iceI_end_invoke:@"Logout" unmarshal:unmarshal result:result];
}

-(id<ICEAsyncResult>) begin_Logout:(void(^)(LoginLogoutRspData*))response exception:(void(^)(ICEException*))exception
{
    return [self begin_Logout:nil response:response exception:exception sent:nil];
}

-(id<ICEAsyncResult>) begin_Logout:(void(^)(LoginLogoutRspData*))response exception:(void(^)(ICEException*))exception sent:(void(^)(BOOL))sent
{
    return [self begin_Logout:nil response:response exception:exception sent:sent];
}

-(id<ICEAsyncResult>) begin_Logout:(ICEContext*)context response:(void(^)(LoginLogoutRspData*))response exception:(void(^)(ICEException*))exception
{
    return [self begin_Logout:context response:response exception:exception sent:nil];
}

-(id<ICEAsyncResult>) begin_Logout:(ICEContext*)context response:(void(^)(LoginLogoutRspData*))response exception:(void(^)(ICEException*))exception sent:(void(^)(BOOL))sent
{
    void(^completed)(id<ICEInputStream>, BOOL) = ^(id<ICEInputStream> istr, BOOL ok)
    {
        LoginLogoutRspData* ICE_AUTORELEASING_QUALIFIER iceP_rsp = nil;
        @try
        {
            [LoginILoginPrx iceI_Logout_unmarshal:&iceP_rsp is:istr ok:ok];
        }
        @catch(ICEException* ex)
        {
            if(exception)
            {
                exception(ex);
            }
            return;
        }
        if(response)
        {
            response(iceP_rsp);
        }
    };
    return [self iceI_begin_invoke:@"Logout" mode:ICENormal format:ICEDefaultFormat marshal:nil completed:completed response:(response != nil) exception:exception sent:sent context:context];
}

+(NSString *) ice_staticId
{
    return @"::Login::ILogin";
}

+(void) iceI_Register_marshal:(LoginRegReqData*)iceP_req os:(id<ICEOutputStream>)ostr
{
    [LoginRegReqDataHelper write:iceP_req stream:ostr];
}
+(void) iceI_Register_unmarshal:(LoginRegRspData* ICE_AUTORELEASING_QUALIFIER*)iceP_rsp is:(id<ICEInputStream>)istr ok:(BOOL)ok
{
    *iceP_rsp = nil;
    if(!ok)
    {
        @try
        {
            [istr startEncapsulation];
            [istr throwException];
        }
        @catch(ICEUserException *ex)
        {
            [istr endEncapsulation];
            @throw [ICEUnknownUserException unknownUserException:__FILE__ line:__LINE__ unknown:[ex ice_id]];
        }
    }
    else
    {
        [istr startEncapsulation];
        [LoginRegRspDataHelper read:istr value:&*iceP_rsp];
        [istr endEncapsulation];
    }
}

+(void) iceI_Login_marshal:(LoginLoginReqData*)iceP_req os:(id<ICEOutputStream>)ostr
{
    [LoginLoginReqDataHelper write:iceP_req stream:ostr];
}
+(void) iceI_Login_unmarshal:(LoginLoginRspData* ICE_AUTORELEASING_QUALIFIER*)iceP_rsp is:(id<ICEInputStream>)istr ok:(BOOL)ok
{
    *iceP_rsp = nil;
    if(!ok)
    {
        @try
        {
            [istr startEncapsulation];
            [istr throwException];
        }
        @catch(ICEUserException *ex)
        {
            [istr endEncapsulation];
            @throw [ICEUnknownUserException unknownUserException:__FILE__ line:__LINE__ unknown:[ex ice_id]];
        }
    }
    else
    {
        [istr startEncapsulation];
        [LoginLoginRspDataHelper read:istr value:&*iceP_rsp];
        [istr endEncapsulation];
    }
}

+(void) iceI_LoginWithToken_marshal:(LoginLoginWithTokenReqData*)iceP_req os:(id<ICEOutputStream>)ostr
{
    [LoginLoginWithTokenReqDataHelper write:iceP_req stream:ostr];
}
+(void) iceI_LoginWithToken_unmarshal:(LoginLoginRspData* ICE_AUTORELEASING_QUALIFIER*)iceP_rsp is:(id<ICEInputStream>)istr ok:(BOOL)ok
{
    *iceP_rsp = nil;
    if(!ok)
    {
        @try
        {
            [istr startEncapsulation];
            [istr throwException];
        }
        @catch(ICEUserException *ex)
        {
            [istr endEncapsulation];
            @throw [ICEUnknownUserException unknownUserException:__FILE__ line:__LINE__ unknown:[ex ice_id]];
        }
    }
    else
    {
        [istr startEncapsulation];
        [LoginLoginRspDataHelper read:istr value:&*iceP_rsp];
        [istr endEncapsulation];
    }
}

+(void) iceI_GetVerifyInfo_marshal:(LoginGetVerifyInfoReqData*)iceP_req os:(id<ICEOutputStream>)ostr
{
    [LoginGetVerifyInfoReqDataHelper write:iceP_req stream:ostr];
}
+(void) iceI_GetVerifyInfo_unmarshal:(LoginGetVerifyInfoRspData* ICE_AUTORELEASING_QUALIFIER*)iceP_rsp is:(id<ICEInputStream>)istr ok:(BOOL)ok
{
    *iceP_rsp = nil;
    if(!ok)
    {
        @try
        {
            [istr startEncapsulation];
            [istr throwException];
        }
        @catch(ICEUserException *ex)
        {
            [istr endEncapsulation];
            @throw [ICEUnknownUserException unknownUserException:__FILE__ line:__LINE__ unknown:[ex ice_id]];
        }
    }
    else
    {
        [istr startEncapsulation];
        [LoginGetVerifyInfoRspDataHelper read:istr value:&*iceP_rsp];
        [istr endEncapsulation];
    }
}

+(void) iceI_LoginVerify_marshal:(LoginLoginVerifyReqData*)iceP_req os:(id<ICEOutputStream>)ostr
{
    [LoginLoginVerifyReqDataHelper write:iceP_req stream:ostr];
}
+(void) iceI_LoginVerify_unmarshal:(LoginLoginRspData* ICE_AUTORELEASING_QUALIFIER*)iceP_rsp is:(id<ICEInputStream>)istr ok:(BOOL)ok
{
    *iceP_rsp = nil;
    if(!ok)
    {
        @try
        {
            [istr startEncapsulation];
            [istr throwException];
        }
        @catch(ICEUserException *ex)
        {
            [istr endEncapsulation];
            @throw [ICEUnknownUserException unknownUserException:__FILE__ line:__LINE__ unknown:[ex ice_id]];
        }
    }
    else
    {
        [istr startEncapsulation];
        [LoginLoginRspDataHelper read:istr value:&*iceP_rsp];
        [istr endEncapsulation];
    }
}
+(void) iceI_Logout_unmarshal:(LoginLogoutRspData* ICE_AUTORELEASING_QUALIFIER*)iceP_rsp is:(id<ICEInputStream>)istr ok:(BOOL)ok
{
    *iceP_rsp = nil;
    if(!ok)
    {
        @try
        {
            [istr startEncapsulation];
            [istr throwException];
        }
        @catch(ICEUserException *ex)
        {
            [istr endEncapsulation];
            @throw [ICEUnknownUserException unknownUserException:__FILE__ line:__LINE__ unknown:[ex ice_id]];
        }
    }
    else
    {
        [istr startEncapsulation];
        [LoginLogoutRspDataHelper read:istr value:&*iceP_rsp];
        [istr endEncapsulation];
    }
}
@end

@implementation LoginErrorCodeHelper
+(ICEInt) getMinValue
{
    return 0;
}
+(ICEInt) getMaxValue
{
    return 5;
}
@end

@implementation LoginRegReqDataHelper
+(Class) getType
{
    return [LoginRegReqData class];
}
+(Class) getOptionalHelper
{
    return [ICEVarLengthOptionalHelper class];
}
+(ICEInt) minWireSize
{
    return 5;
}
@end

@implementation LoginRegRspDataHelper
+(Class) getType
{
    return [LoginRegRspData class];
}
+(Class) getOptionalHelper
{
    return [ICEVarLengthOptionalHelper class];
}
+(ICEInt) minWireSize
{
    return 1;
}
@end

@implementation LoginLoginWithTokenReqDataHelper
+(Class) getType
{
    return [LoginLoginWithTokenReqData class];
}
+(Class) getOptionalHelper
{
    return [ICEVarLengthOptionalHelper class];
}
+(ICEInt) minWireSize
{
    return 2;
}
@end

@implementation LoginLoginReqDataHelper
+(Class) getType
{
    return [LoginLoginReqData class];
}
+(Class) getOptionalHelper
{
    return [ICEVarLengthOptionalHelper class];
}
+(ICEInt) minWireSize
{
    return 4;
}
@end

@implementation LoginLoginRspDataHelper
+(Class) getType
{
    return [LoginLoginRspData class];
}
+(Class) getOptionalHelper
{
    return [ICEVarLengthOptionalHelper class];
}
+(ICEInt) minWireSize
{
    return 3;
}
@end

@implementation LoginLogoutRspDataHelper
+(Class) getType
{
    return [LoginLogoutRspData class];
}
+(Class) getOptionalHelper
{
    return [ICEVarLengthOptionalHelper class];
}
+(ICEInt) minWireSize
{
    return 1;
}
@end

@implementation LoginGetVerifyInfoReqDataHelper
+(Class) getType
{
    return [LoginGetVerifyInfoReqData class];
}
+(Class) getOptionalHelper
{
    return [ICEVarLengthOptionalHelper class];
}
+(ICEInt) minWireSize
{
    return 3;
}
@end

@implementation LoginGetVerifyInfoRspDataHelper
+(Class) getType
{
    return [LoginGetVerifyInfoRspData class];
}
+(Class) getOptionalHelper
{
    return [ICEVarLengthOptionalHelper class];
}
+(ICEInt) minWireSize
{
    return 3;
}
@end

@implementation LoginLoginVerifyReqDataHelper
+(Class) getType
{
    return [LoginLoginVerifyReqData class];
}
+(Class) getOptionalHelper
{
    return [ICEVarLengthOptionalHelper class];
}
+(ICEInt) minWireSize
{
    return 2;
}
@end

@implementation LoginILoginPrxHelper
+(id) readRetained:(id<ICEInputStream>)stream
{
    return [stream newProxy:[LoginILoginPrx class]];
}
@end
