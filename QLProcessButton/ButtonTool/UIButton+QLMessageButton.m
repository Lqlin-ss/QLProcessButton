//
//  UIButton+QLMessageButton.m
//  SecurityCommunity
//
//  Created by 梁啟林 on 2018/8/16.
//  Copyright © 2018年 利浪. All rights reserved.
//

#import "UIButton+QLMessageButton.h"
#import <objc/runtime.h>

//static char *readViewKey = "readViewKey";
static NSString *const readViewKey = @"readViewKey";

@interface UIButton ()

@property (nonatomic, strong) UIView *readView;

@end

@implementation UIButton (QLMessageButton)


- (void)showMessage{
    UIView *lView = [[UIView alloc] init];
    lView.frame = CGRectMake(self.bounds.size.width - 8, 0, 8, 8);
    lView.backgroundColor = [UIColor redColor];
    lView.layer.cornerRadius = 4;
    lView.layer.masksToBounds = YES;
    
    objc_setAssociatedObject(self, &readViewKey, lView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self addSubview:self.readView];
    
}

- (void)hideMessage{
//    UIView *readView = (UIView *)objc_getAssociatedObject(self, &readViewKey);
    [self.readView removeFromSuperview];
}


#pragma mark - Getter Setter
- (UIView *)readView{
    return objc_getAssociatedObject(self, &readViewKey);
}

//- (void)setReadView:(UIView *)readView{
//    /*
//     object : 给相应对象添加属性
//     key : 属性名称
//     value : 属性值
//     policy :保存策略
//     */
//    objc_setAssociatedObject(self, &readViewKey, readView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}

@end
