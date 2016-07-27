//
//  PublishViewController.m
//  mogujie
//
//  Created by shijialong on 16/7/27.
//  Copyright © 2016年 shijialong. All rights reserved.
//

#import "PublishViewController.h"

@interface PublishViewController ()

@end

@implementation PublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"哈哈哈猫";
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self setupNav];
    // Do any additional setup after loading the view.
}

- (void)setupNav {
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setTintColor:[UIColor blackColor]];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"退出" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"下一步" style:UIBarButtonItemStyleDone target:self action:@selector(next )];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    
}


- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)next {

}

@end
