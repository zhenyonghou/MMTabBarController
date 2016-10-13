//
//  MMTabBarItem.h
//  MMTabBarController
//
//  Created by zhenyonghou on 15/6/27.
//  Copyright © 2015年 zhenyonghou. All rights reserved.


#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MMTabBarItemState) {
    MMTabBarItemStateNormal,
    MMTabBarItemStateSelect
};

@interface MMTabBarItem : UIView {
    UIImageView *_imageView;
    UILabel *_titleLabel;
    
    NSDictionary *_attributedNormal;
    NSDictionary *_attributedSelected;
}

@property (nonatomic, assign) CGFloat innerSpacing;

@property (nonatomic, assign, getter=isSelected) BOOL selected;

- (instancetype)initWithTitle:(NSString *)title normalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage;

- (void)setTitleTextAttributes:(NSDictionary *)attributes forState:(MMTabBarItemState)state;

@end
