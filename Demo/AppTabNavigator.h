//
//  AppTabNavigator.h
//  MMTabBarController
//
//  Created by amy on 2016/10/13.
//  Copyright © 2016年 amy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface AppTabNavigator : NSObject

+ (AppTabNavigator*)tabNavigator;

- (void)buildTabBarController;

@end
