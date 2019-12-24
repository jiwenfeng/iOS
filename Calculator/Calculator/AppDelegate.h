//
//  AppDelegate.h
//  Calculator
//
//  Created by 吉文峰 on 2019/12/23.
//  Copyright © 2019 吉文峰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentCloudKitContainer *persistentContainer;

- (void)saveContext;


@end

