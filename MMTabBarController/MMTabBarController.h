//
//  MMTabBarController.h
//  MMTabBarController
//
//  Created by zhenyonghou on 15/6/27.
//  Copyright © 2015年 zhenyonghou. All rights reserved.

/**
 *  TODO: 增加badge view
 */

#import <UIKit/UIKit.h>
#import "MMTabBarItem.h"

@interface MMTabBarController : UITabBarController

- (void)mm_setBarItems:(NSArray *)items controllers:(NSArray *)controllers;

@end
