//
//  AppStartup.m
//  MMTabBarController
//
//  Created by amy on 2016/10/13.
//  Copyright © 2016年 amy. All rights reserved.
//

#import "AppStartup.h"
#import "AppTabNavigator.h"

@implementation AppStartup

+ (void)setupForAppDelegate:(AppDelegate *)appDelegate {
    [[self class] installWindowWithAppDelegate:appDelegate];

    [[AppTabNavigator tabNavigator] buildTabBarController];
}

+ (void)installWindowWithAppDelegate:(AppDelegate *)appDelegate {
    appDelegate.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    appDelegate.window.backgroundColor = [UIColor whiteColor];
    [appDelegate.window makeKeyAndVisible];
}

@end
