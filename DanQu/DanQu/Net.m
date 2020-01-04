//
//  Net.m
//  DanQu
//
//  Created by 吉文峰 on 2020/1/4.
//  Copyright © 2020 吉文峰. All rights reserved.
//

#import "Net.h"

static Net *gNet = NULL;

@implementation Net

id<ICECommunicator> ic;
id<ICEObjectPrx> prx;

-(Net *) init
{
    ic = [ICEUtil createCommunicator];
    prx = [ic stringToProxy:@"DispatchServer:ws -h 192.168.21.169 -p 10000"];
    return self;
}

-(void) dealloc
{
    
}

+(Net *)getInstance
{
    if (gNet == NULL)
    {
        gNet = [[Net alloc] init];
    }
    return gNet;
}

-(NSData *)Pack:(id)data
{
    id<ICEOutputStream> output = [ICEUtil createOutputStream:ic];
    [output startEncapsulation];
    [data iceWrite:output];
    [output endEncapsulation];
    return [output finished];
}

-(void) Unpack:(NSData *)data value:(id)val
{
    @try {
        id<ICEInputStream> input = [ICEUtil createInputStream:ic data:data];
        [input startEncapsulation];
        [val iceRead:input];
        [input endEncapsulation];
    } @catch (NSException *exception) {
        NSLog(@"************************%@", exception);
    } @finally {
        
    }
    
}

-(void) call:(NSString *)operation req:(id)req context:(ICEContext *)context response:(void(^)(BOOL, NSMutableData *))response
{
    @try {
        NSData *inEncaps = [self Pack:req];
        [prx begin_ice_invoke:operation mode:ICENormal inEncaps:inEncaps context:context response:response exception:nil];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception);
    } @finally {
    }
    
}

@end
