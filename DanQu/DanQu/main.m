//
//  main.m
//  DanQu
//
//  Created by 吉文峰 on 2019/12/30.
//  Copyright © 2019 吉文峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <objc/Ice.h>
#import "Net.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        
        ICEregisterIceDiscovery(YES);
        ICEregisterIceSSL(YES);
        ICEregisterIceWS(YES);
        ICEregisterIceIAP(YES);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
