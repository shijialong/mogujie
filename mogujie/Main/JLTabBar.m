//
//  JLTabBar.m
//  mogujie
//
//  Created by shijialong on 16/7/27.
//  Copyright © 2016年 shijialong. All rights reserved.
//

#import "JLTabBar.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

@interface JLTabBar ()
@property (nonatomic, strong) UIButton *photoButton;
@end

@implementation JLTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //合成图片放在button上
        UIImage *image = [self mergeImage:[UIImage imageNamed:@"post_bkg"] withImage:[UIImage imageNamed:@"post_camara"] withSize:CGSizeMake(40, 40)];

        //添加button
        UIButton *photoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [photoButton setImage:image forState:UIControlStateNormal];
        photoButton.bounds = CGRectMake(0, 0, 40, 40);
        [photoButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:photoButton];
        self.photoButton = photoButton;
        
    }
    return self;
}


//合成图片
- (UIImage *)mergeImage:(UIImage *)bgImage withImage:(UIImage *)image withSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [bgImage drawInRect:(CGRect){{0,0},size}];
    [image drawInRect:(CGRect){{10,10},{size.width - 20, size.height - 20}}];
    UIImage *mergeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return mergeImage;
}

- (void)buttonAction:(UIButton *)button {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"kCameraNotice" object:nil];

}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    //调整按钮的位置
    CGFloat h = self.frame.size.height;
    self.photoButton.center = CGPointMake(SCREEN_WIDTH * 0.5, h * 0.5);
    
    //按钮的frame数据
    CGFloat buttonH = h;
    CGFloat buttonW = SCREEN_WIDTH / 5;
    CGFloat buttonX = 0;
    CGFloat buttonY = 0;
    
    int index = 0;
    for (UIView *view in self.subviews) {
        if (![NSStringFromClass(view.class) isEqualToString:@"UITabBarButton"]) {
            continue;
        }
        if (index > 1) {
            buttonX = (index + 1) *buttonW;
        } else {
            buttonX = index * buttonW;
        }
        view.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        index ++;
    }

}



@end
