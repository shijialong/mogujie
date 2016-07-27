//
//  JLTabBarController.m
//  mogujie
//
//  Created by shijialong on 16/7/27.
//  Copyright © 2016年 shijialong. All rights reserved.
//

#import "JLTabBarController.h"
#import "BuyViewController.h"
#import "ChatViewController.h"
#import "MeViewController.h"
#import "WanderingViewController.h"
#import "PublishViewController.h"
#import "JLTabBar.h"


@interface JLTabBarController ()

@end

@implementation JLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpChildViewControllers];
    [self setupTabBar];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(photoClick) name:@"kCameraNotice"object:nil];
}

- (void)setUpChildViewControllers {
    
    //逛
    WanderingViewController *wanderVC = [[WanderingViewController alloc] init];
    [self childViewController:wanderVC imageName:@"icon_tabbar_timeline" selectedImageName:@"icon_tabbar_timeline_selected" withTitle:@"逛逛逛"];
    wanderVC.view.backgroundColor = [UIColor whiteColor];
    
    //买
    BuyViewController *buyVC = [[BuyViewController alloc] init];
    [self childViewController:buyVC imageName:@"Shopping-cart" selectedImageName:@"Shopping-cart_selected" withTitle:@"买买买"];
    buyVC.view.backgroundColor = [UIColor yellowColor];
    //聊
    ChatViewController * chatVC = [[ChatViewController alloc] init];
    [self childViewController:chatVC imageName:@"tabbar_im" selectedImageName:@"tabbar_im_selected" withTitle:@"聊聊聊"];
    chatVC.view.backgroundColor = [UIColor redColor];
    
    //我
    MeViewController * meVC = [[MeViewController alloc] init];
    [self childViewController:meVC imageName:@"mgjme_tabbarItem_me" selectedImageName:@"mgjme_tabbarItem_me_selected" withTitle:@"我我我"];
    meVC.view.backgroundColor = [UIColor greenColor];
}

- (void)childViewController:(UIViewController *)vc imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName withTitle:(NSString *)title {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.tabBarItem.image = [UIImage imageNamed:imageName];
    nav.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    nav.tabBarItem.title = title;
    [self addChildViewController:nav];
}

#pragma mark - 初始化tabBar
- (void)setupTabBar {
    [self setValue:[[JLTabBar alloc] init] forKey:@"tabBar"];
    self.tabBar.tintColor = [UIColor redColor];

}

- (void)photoClick {
    PublishViewController *publishVC = [[PublishViewController alloc] init];
    UINavigationController *publishNav = [[UINavigationController alloc] initWithRootViewController:publishVC];
    [self presentViewController:publishNav animated:YES completion:nil];
}
@end
