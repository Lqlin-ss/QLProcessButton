//
//  ViewController.m
//  QLProcessButton
//
//  Created by 梁啟林 on 2018/8/1.
//  Copyright © 2018年 liangqilin. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+Indicator.h"
#import <objc/runtime.h>

@interface ViewController ()

@property (strong, nonatomic) UIButton *loginButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.loginButton setFrame:CGRectMake(100, 100, 120, 40)];
    [self.view addSubview:self.loginButton];
}

#pragma mark - 直接在按钮的点击事件中调用几个对外开放的方法就行了。
- (void)loginButtonEvent:(UIButton *)sender{
    //1.单纯显示默认菊花
//    [sender showIndicator];
    
    //2.显示菊花并选择菊花颜色
//    [sender showIndicatorWithStyle:UIActivityIndicatorViewStyleGray];
    
    //3.显示菊花并定义旋转过程中的title
    [sender beginSubmitting:@"登录中"];
    
    
    //5秒后关闭菊花
    [self performSelector:@selector(hide:) withObject:sender afterDelay:5.0];
}

- (void)hide:(UIButton *)sender{
//    [sender hideIndicator];//针对 1、2 方法的关闭
    [sender endSubmitting];//针对 3 方法的关闭
}

#pragma mark - lazy
- (UIButton *)loginButton {
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _loginButton.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        _loginButton.layer.backgroundColor = [UIColor colorWithRed:253/255.0 green:79/255.0 blue:62/255.0 alpha:1].CGColor;
        _loginButton.layer.cornerRadius = 20.0;
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton addTarget:self action:@selector(loginButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}

@end
