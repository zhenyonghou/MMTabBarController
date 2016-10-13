//
//  AppTabNavigator.m
//  MMTabBarController
//
//  Created by amy on 2016/10/13.
//  Copyright © 2016年 amy. All rights reserved.
//

#import "AppTabNavigator.h"
#import "MMTabBarController.h"

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "ForthViewController.h"

@interface AppTabNavigator ()

@property (nonatomic, strong) MMTabBarController *tabBarController;

@end

@implementation AppTabNavigator

static AppTabNavigator * navigator = nil;

+ (AppTabNavigator*)tabNavigator
{
    @synchronized(self) {
        if (navigator == nil) {
            navigator = [[AppTabNavigator alloc] init];
        }
    }
    return navigator;
}

- (void)buildTabBarController {
    if (!self.tabBarController) {
        [self installTabBarController];
    }
    
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appDelegate.window.rootViewController = self.tabBarController;
}

- (void)installTabBarController
{
    MMTabBarItem *barItem0 = [[MMTabBarItem alloc] initWithTitle:@"First"
                                                     normalImage:[UIImage imageNamed:@"tabbar_first"]
                                                   selectedImage:[UIImage imageNamed:@"tabbar_first_hl"]];
    MMTabBarItem *barItem1 = [[MMTabBarItem alloc] initWithTitle:@"Second"
                                                     normalImage:[UIImage imageNamed:@"tabbar_second"]
                                                   selectedImage:[UIImage imageNamed:@"tabbar_second_hl"]];
    MMTabBarItem *barItem2 = [[MMTabBarItem alloc] initWithTitle:@"Third"
                                                           normalImage:[UIImage imageNamed:@"tabbar_third"]
                                                   selectedImage:[UIImage imageNamed:@"tabbar_third_hl"]];
    MMTabBarItem *barItem3 = [[MMTabBarItem alloc] initWithTitle:@"第4页"
                                                           normalImage:[UIImage imageNamed:@"tabbar_forth"]
                                                   selectedImage:[UIImage imageNamed:@"tabbar_forth_hl"]];
    
    self.tabBarController = [[MMTabBarController alloc] init];
    [self.tabBarController mm_setBarItems:@[barItem0, barItem1, barItem2, barItem3]
                              controllers:@[[[FirstViewController alloc] init],
                                            [[SecondViewController alloc] init],
                                            [[ThirdViewController alloc] init],
                                            [[ForthViewController alloc] init]]];
}


@end
