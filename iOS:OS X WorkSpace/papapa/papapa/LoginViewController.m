//
//  LoginViewController.m
//  papapa
//
//  Created by 王志龙 on 15/8/12.
//  Copyright (c) 2015年 wangzhilong. All rights reserved.
//

#import "LoginViewController.h"
#import <UINavigationController+FDFullscreenPopGesture.h>
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fd_prefersNavigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}



@end
