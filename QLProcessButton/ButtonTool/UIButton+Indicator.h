//
//  UIButton+Indicator.h
//  QLProcessButton
//
//  Created by 梁啟林 on 2018/8/1.
//  Copyright © 2018年 liangqilin. All rights reserved.
//

#import <UIKit/UIKit.h>

//typedef NS_ENUM(NSUInteger, ButtonEdgeInsetsStyle) {
//    ButtonEdgeInsetsStyleTop,       //!< image在上，label在下
//    ButtonEdgeInsetsStyleLeft,      //!< image在左，label在右
//    ButtonEdgeInsetsStyleBottom,    //!< image在下，label在上
//    ButtonEdgeInsetsStyleRight      //!< image在右，label在左
//};

@interface UIButton (Indicator)

/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
//- (void)layoutButtonWithEdgeInsetsStyle:(ButtonEdgeInsetsStyle)style
//                        imageTitleSpace:(CGFloat)space;


/**
 显示菊花
 */
- (void)showIndicator;
- (void)showIndicatorWithStyle:(UIActivityIndicatorViewStyle)indicatorStyle;

/**
 移除菊花
 */
- (void)hideIndicator;

/**
 *
 *  @brief  按钮点击后，禁用按钮并在按钮上显示ActivityIndicator，以及title
 *
 *  @param title 按钮上显示的文字
 */
- (void)beginSubmitting:(NSString *)title;

/**
 *
 *  @brief  按钮点击后，恢复按钮点击前的状态
 */
- (void)endSubmitting;

/**
 *
 *  @brief  按钮是否正在提交中
 */
@property(nonatomic, readonly, getter=isSubmitting) NSNumber *submitting;

@end
