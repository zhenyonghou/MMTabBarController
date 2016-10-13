//
//  MMTabBarItem.m
//  MMTabBarController
//
//  Created by zhenyonghou on 15/6/27.
//  Copyright © 2015年 zhenyonghou. All rights reserved.

#import "MMTabBarItem.h"

@interface MMTabBarItem()

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) UIImage *normalImage;

@property (nonatomic, strong) UIImage *selectedImage;

@end

@implementation MMTabBarItem

- (instancetype)initWithTitle:(NSString *)title normalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage {
    if (self = [super init]) {
        _title = title;
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self addSubview:_titleLabel];
        [self updateTitle];
        
        _normalImage = normalImage;
        _selectedImage = selectedImage;
        
        _innerSpacing = 4;
        _attributedNormal = @{NSFontAttributeName : [UIFont systemFontOfSize:10], NSForegroundColorAttributeName: [UIColor grayColor]};
        _attributedSelected = @{NSFontAttributeName : [UIFont systemFontOfSize:10], NSForegroundColorAttributeName: [UIColor blackColor]};
    }
    return self;
}

- (void)setTitleTextAttributes:(NSDictionary *)attributes forState:(MMTabBarItemState)state
{
    if (MMTabBarItemStateNormal == state) {
        _attributedNormal = attributes;
    } else if (MMTabBarItemStateSelect == state) {
        _attributedSelected = attributes;
    }
}

- (void)setSelected:(BOOL)selected
{
    _selected = selected;
    
    _imageView.highlighted = _selected;
    [self updateTitle];
}

#pragma mark- inner methods

- (void)setImage:(UIImage *)image forState:(MMTabBarItemState)state
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        [self addSubview:_imageView];
    }
    
    if (MMTabBarItemStateNormal == state) {
        _imageView.image = image;
    } else if (MMTabBarItemStateSelect == state) {
        _imageView.highlightedImage = image;
    }
}

- (void)updateTitle
{
    if (_title && _title.length > 0) {
        if (_selected) {
            _titleLabel.attributedText = [[NSAttributedString alloc] initWithString:_title attributes:_attributedSelected];
        } else {
            _titleLabel.attributedText = [[NSAttributedString alloc] initWithString:_title attributes:_attributedNormal];
        }
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (_titleLabel.text && _titleLabel.text.length > 0) {
        CGSize titleSize = [_titleLabel sizeThatFits:CGSizeZero];
        CGSize imageSize = _imageView.bounds.size;
        
        CGFloat imageStartingY = roundf((self.bounds.size.height - imageSize.height - titleSize.height) / 2);
        
        _imageView.frame = CGRectMake((self.bounds.size.width - _normalImage.size.width) / 2,
                                      imageStartingY,
                                      imageSize.width,
                                      imageSize.height);
        
        _titleLabel.frame = CGRectMake((self.bounds.size.width - titleSize.width) / 2,
                                       imageStartingY + imageSize.height + _innerSpacing,
                                       titleSize.width,
                                       titleSize.height);
        
    } else {
        _imageView.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    }
}


@end
