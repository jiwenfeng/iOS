//
//  SRPClient.h
//  DanQu
//
//  Created by 吉文峰 on 2020/1/4.
//  Copyright © 2020 吉文峰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <openssl/srp.h>
#import <openssl/bn.h>
#import <openssl/sha.h>
#import <openssl/evp.h>
#import <openssl/rand.h>

NS_ASSUME_NONNULL_BEGIN

@interface SRPClient : NSObject

-(SRPClient *) init;

-(void)dealloc;

-(NSString *) genSalt;

-(NSString *) genA;

-(NSString *) genVerifier:(NSString *)account password:(NSString *)password salt:(NSString *)salt;

-(NSString *) calcM1:(NSString *)account password:(NSString *)password NSStrA:(NSString *)NSStrA NSStrB:(NSString *)NSStrB NSStrSalt:(NSString *)NSStrSalt;
@end

NS_ASSUME_NONNULL_END
