//
//  LoginViewController.m
//  papapa
//
//  Created by 王志龙 on 15/8/12.
//  Copyright (c) 2015年 wangzhilong. All rights reserved.
//

#import "LoginViewController.h"
#import <UINavigationController+FDFullscreenPopGesture.h>
@interface LoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *bannerView;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *signUpBtn;
@property (weak, nonatomic) IBOutlet UIView *tintView;
@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UIView *signUpView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tintHorizonConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginViewConstraint;
@property (weak, nonatomic) IBOutlet UIButton *signInBtn;
@property (weak, nonatomic) IBOutlet UITextField *loginEmail;
@property (weak, nonatomic) IBOutlet UITextField *loginPassword;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bannerVerticalConstant;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fd_prefersNavigationBarHidden = YES;
    [self configView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)configView {
    self.signInBtn.layer.cornerRadius = 18;
    self.signInBtn.layer.borderWidth = 2;
    self.signInBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.signInBtn.clipsToBounds = YES;
    
    [self.tapGesture addTarget:self action:@selector(handleGesture)];
    [self.signUpView addGestureRecognizer:self.tapGesture];
    [self.loginView addGestureRecognizer:self.tapGesture];
    
    self.loginEmail.delegate = self;
    self.loginPassword.delegate = self;
}

- (void)handleGesture{
    [self pushbackKey];
    
    [self resizeBanner:- self.bannerView.bounds.size.height + 64];

}

- (void)resizeBanner:(CGFloat) distance{
    BOOL isResized = NO;
    if (!self.bannerVerticalConstant.constant == 0) {
        isResized = YES;
    }
    if (!isResized) {
        self.bannerVerticalConstant.constant = distance;
    }
    
    
    [UIView animateWithDuration:0.3 animations:^{
        [self.bannerView layoutIfNeeded];
        [self.loginBtn layoutIfNeeded];
        [self.signUpBtn layoutIfNeeded];
        [self.loginView layoutIfNeeded];
        [self.signUpView layoutIfNeeded];
        [self.tintView layoutIfNeeded];
    }];
}

- (IBAction)handleSwitch:(id)sender {
    [self pushbackKey];
    
    UIButton *btn = sender;
    CGFloat btnWidth = self.loginBtn.bounds.size.width;
    CGFloat viewWidth = self.loginView.bounds.size.width;
    BOOL isLogin = YES;
    
    if (self.tintHorizonConstraint.constant == 0) {
        isLogin = YES;
    }else {
        isLogin = NO;
    }
    
    if (btn.tag == 0) {
        if (!isLogin) {
            self.tintHorizonConstraint.constant = 0;
            self.loginViewConstraint.constant = 0;
            self.signUpBtn.enabled = YES;
            self.loginView.hidden = NO;
        }
    }else if (btn.tag == 1) {
        if (isLogin) {
            self.tintHorizonConstraint.constant = btnWidth;
            self.loginViewConstraint.constant =  - viewWidth;
            self.loginBtn.enabled = YES;
        }
    }
    [UIView animateWithDuration:0.3 animations:^{
        [self.tintView layoutIfNeeded];
        [self.loginView layoutIfNeeded];
        [self.signUpView layoutIfNeeded];
        btn.enabled = NO;
    } completion:^(BOOL finished){
        self.loginView.hidden = isLogin;
    }];
    
}

- (void)pushbackKey {
    [self.loginEmail resignFirstResponder];
    [self.loginPassword resignFirstResponder];
}
- (IBAction)backToParent:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark TextfieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [self resizeBanner:- self.bannerView.bounds.size.height + 64];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField.tag == 4) {
//        [self login];
    }else if (textField.tag == 3) {
        [self.loginPassword becomeFirstResponder];
    }
    return YES;
}

@end
