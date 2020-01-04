//
//  Net.h
//  DanQu
//
//  Created by 吉文峰 on 2020/1/4.
//  Copyright © 2020 吉文峰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/Ice.h>


NS_ASSUME_NONNULL_BEGIN


@interface Net : NSObject

-(Net *) init;

-(void) dealloc;

-(void) call:(NSString *)operation req:(id)req context:(ICEContext *)context response:(void(^)(BOOL, NSMutableData *))response;

-(NSData *)Pack:(id)data;

-(void)Unpack:(NSData *)data value:(id)val;

+(Net *)getInstance;

@end

NS_ASSUME_NONNULL_END
