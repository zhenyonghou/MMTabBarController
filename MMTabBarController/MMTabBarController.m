//
//  MMTabBarController.m
//  MMTabBarController
//
//  Created by zhenyonghou on 15/6/27.
//  Copyright © 2015年 zhenyonghou. All rights reserved.

#import "MMTabBarController.h"


@interface MMTabBarController ()

@property (nonatomic, strong) NSMutableArray *mm_itemButtons;

@end

@implementation MMTabBarController

- (instancetype)init {
    if (self = [super init]) {
        [self addObserver:self forKeyPath:@"selectedViewController" options:NSKeyValueObservingOptionNew context:NULL];
    }
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"selectedViewController"];
}

- (void)mm_setBarItems:(NSArray *)items controllers:(NSArray *)controllers {
    [self mm_setBarItems:items];
    [self mm_setControllers:controllers];
}

- (void)mm_setBarItems:(NSArray *)items {
    if (self.mm_itemButtons) {
        for (UIButton *item in self.mm_itemButtons) {
            [item removeFromSuperview];
        }
        [self.mm_itemButtons removeAllObjects];
    } else {
        self.mm_itemButtons = [[NSMutableArray alloc] initWithCapacity:items.count];
    }
    
    CGFloat itemWidth = [UIScreen mainScreen].bounds.size.width / items.count;
    
    NSInteger k = 0;
    for (MMTabBarItem *itemView in items) {
        itemView.frame = CGRectMake(0, 0, itemWidth, self.tabBar.bounds.size.height);
        itemView.center = CGPointMake(k * itemWidth + itemWidth / 2, self.tabBar.bounds.size.height / 2);
        [self.tabBar addSubview:itemView];
        [self.mm_itemButtons addObject:itemView];
        ++k;
    }
}

- (void)mm_setControllers:(NSArray *)controllers {
    NSMutableArray *naviArray = [[NSMutableArray alloc] initWithCapacity:controllers.count];
    [controllers enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIViewController *vc = obj;
        [naviArray addObject:[[UINavigationController alloc] initWithRootViewController:vc]];
    }];
    self.viewControllers = naviArray;
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context {
    if ([keyPath isEqualToString:@"selectedViewController"]) {
        NSUInteger index = [self.viewControllers indexOfObject:self.selectedViewController];
        
        [self mm_setSelectIndex:index];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self mm_setSelectIndex:self.selectedIndex];
}

- (void)mm_setSelectIndex:(NSInteger)index
{
    NSUInteger k = 0;
    for (MMTabBarItem *item in self.mm_itemButtons) {
        item.selected = (index == k);
        ++k;
    }
}

@end
