//
//  WanderingViewController.m
//  mogujie
//
//  Created by shijialong on 16/7/27.
//  Copyright © 2016年 shijialong. All rights reserved.
//

#import "WanderingViewController.h"
#import "BannerView.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
@interface WanderingViewController ()
@property (nonatomic, strong) BannerView *bannerView;
@end

@implementation WanderingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.bannerView = [[BannerView alloc] initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 200)];
    self.bannerView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.bannerView];
}


@end
