//
//  MCShadowAlertView.h
//  MCCategory
//
//  Created by mcc on 2017/2/16.
//  Copyright © 2017年 mcc. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef NS_ENUM(NSUInteger, ShadowAlertViewAnimationType) {
    
    ShadowAlertViewAnimationNone,//没用动画
    ShadowAlertViewAnimationOutDefine,//模糊自定义动画
    ShadowAlertViewAnimationFromUp,//从上到下的动画
    ShadowAlertViewAnimationFromDown, //从下到上的动画
    ShadowAlertViewAnimationFromRight, //从右到左出来
    
};

@interface MCShadowAlertView : UIView
{
    UIView* m_topView;
    CGRect m_topViewRc;
    BOOL m_bCloseWhenRotate;//转屏是否自动关闭
    BOOL m_bCloseByTap;//点击是否自动关闭
    
    BOOL m_supportOrientation;
    BOOL m_bBottom;
    BOOL m_bPRCustomAlertView;
    
}

@property(nonatomic, retain)UIView* topView;
@property(nonatomic, assign)BOOL bCloseWhenRotate;
@property(nonatomic, assign)BOOL bCloseByTap;
@property(nonatomic, assign)BOOL bPRCustomAlertView;
@property(nonatomic, assign)BOOL bBottom;

- (id)initWithFrame:(CGRect)frame backgroundColor:(UIColor *)color animationType:(ShadowAlertViewAnimationType)animationType;

- (void)onlySetTheTopView:(UIView*)view;
- (void)setTheTopView:(UIView*)view;
- (void)setTheTopView:(UIView*)view supportOrientation:(BOOL)support;
- (void)orientationPosition;
- (void)closeAlertView;
- (void)closeAlertViewWithAnimated;

@end
