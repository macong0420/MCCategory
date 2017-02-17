//
//  MCShadowAlertView.m
//  MCCategory
//
//  Created by mcc on 2017/2/16.
//  Copyright © 2017年 mcc. All rights reserved.
//

#import "MCShadowAlertView.h"
#import "MCCommonMacroDefine.h"
const CGFloat PRShadowAnimationDuration = 0.4f;

@interface MCShadowAlertView ()
{
    ShadowAlertViewAnimationType _animationType;
}
@end

@implementation MCShadowAlertView

@synthesize topView = m_topView;
@synthesize bCloseWhenRotate = m_bCloseWhenRotate;
@synthesize bCloseByTap = m_bCloseByTap;
@synthesize bPRCustomAlertView = m_bPRCustomAlertView;
@synthesize bBottom = m_bBottom;


- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        [self initDataWithColor:nil animationType:ShadowAlertViewAnimationNone];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame backgroundColor:(UIColor *)color animationType:(ShadowAlertViewAnimationType)animationType
{
    if ((self = [super initWithFrame:frame])) {
        [self initDataWithColor:color animationType:animationType];
    }
    
    return self;
}

- (void)initDataWithColor:(UIColor *)color animationType:(ShadowAlertViewAnimationType)animationType
{
    m_topViewRc = CGRectZero;
    m_bCloseWhenRotate = NO;
    m_bCloseByTap = YES;
    m_bBottom = YES;
    
    _animationType = animationType;
    
    if (!color) {
        color = MCColor(@"#000000", 0.6);
    }
    
    if (animationType == ShadowAlertViewAnimationOutDefine) {
        [self coverView];
    }
    
    self.backgroundColor = color;
}

- (void)coverView
{
    UIView  *coverView = [[UIView alloc] initWithFrame:self.bounds];
    coverView.backgroundColor = RGBACOLOR(5, 0, 10, 0.55);
    [self addSubview:coverView];
}


- (void)dealloc
{
    self.topView = nil;
}

- (void)onlySetTheTopView:(UIView*)view
{
    if (self.topView != view)
    {
        if (self.topView && [self.topView superview])
        {
            [self.topView removeFromSuperview];
        }
        self.topView = view;
        [self addSubview:self.topView];
        m_topViewRc = view.frame;
    }
    
    [self showAlert];
}

- (void)setTheTopView:(UIView*)view
{
    [self setTheTopView:view supportOrientation:NO];
}

- (void)setTheTopView:(UIView*)view supportOrientation:(BOOL)support
{
    m_supportOrientation = support;
    
    [self onlySetTheTopView:view];
    
    if (m_supportOrientation)
    {
        [self doSupportOrientation];
    }
    
}

- (void)orientationPosition
{
    
    if (self.bCloseWhenRotate)
    {
        if (self.bPRCustomAlertView)
        {
            [self closeAlertView];
        }

        return;
    }
    
    if (m_supportOrientation)
    {
        [self doSupportOrientation];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"UIDeviceOrientationDidChangeNotification" object:nil];
    
}

- (void)doSupportOrientation
{
    {
        BOOL bLandSpace = NO;
        UIInterfaceOrientation statusBarOrientation = [[UIApplication sharedApplication] statusBarOrientation];
        switch (statusBarOrientation)
        {
            case UIInterfaceOrientationPortrait:
            case UIInterfaceOrientationPortraitUpsideDown:
            {
                bLandSpace = NO;
            }
                break;
            case UIInterfaceOrientationLandscapeLeft:
            case UIInterfaceOrientationLandscapeRight:
            {
                bLandSpace = YES;
            }
                break;
                
            default:
                break;
        }
        
        
        BOOL isNonePurches  = YES;

        CGRect rcTopView = self.topView.frame;
        
        if (isNonePurches) {
            if (m_bBottom)
            {
                if (bLandSpace)
                {
                    rcTopView = CGRectMake(0,ClientFullSizeContainStatusBar.size.width-rcTopView.size.height,ClientFullSizeContainStatusBar.size.height,rcTopView.size.height);
                }
                else
                {
                    rcTopView = CGRectMake(0,ClientFullSizeContainStatusBar.size.height-rcTopView.size.height,ClientFullSizeContainStatusBar.size.width,rcTopView.size.height);
                    
                }
            }
            else
            {
                if (bLandSpace)
                {
                    rcTopView = CGRectMake((ClientFullSizeContainStatusBar.size.height-rcTopView.size.width)/2,(ClientFullSizeContainStatusBar.size.width-rcTopView.size.height)/2,rcTopView.size.width,rcTopView.size.height);
                    
                }
                else
                {
                    rcTopView = CGRectMake((ClientFullSizeContainStatusBar.size.width-rcTopView.size.width)/2,(ClientFullSizeContainStatusBar.size.height-rcTopView.size.height)/2,rcTopView.size.width,rcTopView.size.height);
                }
            }
            self.topView.frame = rcTopView;
            
        }
        
        m_topViewRc = rcTopView;
    }
    
    {
        
        int screen_h = MCScreenHeight;
        int screen_w = MCScreenWidth;
        int tip_h = MCScreenHeight;
        int tip_w = MCScreenWidth;
        
        CGRect bounds = CGRectMake(0, 0, tip_w, tip_h);
        CGPoint center = CGPointMake(screen_w/2.0, screen_h/2.0);
        CGAffineTransform trans = CGAffineTransformMakeRotation(0);
        
        UIInterfaceOrientation statusBarOrientation = [[UIApplication sharedApplication] statusBarOrientation];
        switch (statusBarOrientation)
        {
            case UIInterfaceOrientationPortrait:
            {
                //
                bounds = CGRectMake(0, 0, tip_w, tip_h);
                center = CGPointMake(screen_w/2.0, screen_h/2.0);
                trans = [self CGAffineTransformMakeRotationForIOS8:0];
            }
                break;
            case UIInterfaceOrientationLandscapeLeft:
            {
                bounds = CGRectMake(0, 0, tip_h, tip_w);
                if(CURRENT_SYS_VERSION >= 8.0)
                {
                    center = CGPointMake(screen_h/2.0, screen_w/2.0);
                }
                else
                {
                    center = CGPointMake(screen_w/2.0, screen_h/2.0);
                }
                trans = [self CGAffineTransformMakeRotationForIOS8:(M_PI_2*3)];
            }
                break;
            case UIInterfaceOrientationPortraitUpsideDown:
            {
                bounds = CGRectMake(0, 0, tip_w, tip_h);
                center = CGPointMake(screen_w/2.0, screen_h/2.0);
                trans = [self CGAffineTransformMakeRotationForIOS8:(M_PI)];
            }
                break;
            case UIInterfaceOrientationLandscapeRight:
            {
                
                bounds = CGRectMake(0, 0, tip_h, tip_w);
                if(CURRENT_SYS_VERSION >= 8.0)
                {
                    center = CGPointMake(screen_h/2.0, screen_w/2.0);
                }
                else
                {
                    center = CGPointMake(screen_w/2.0, screen_h/2.0);
                }
                
                trans = [self CGAffineTransformMakeRotationForIOS8:M_PI_2];
            }
                break;
                
            default:
                break;
        }
        self.transform = trans;
        self.bounds = bounds;
        self.center = center;
        
    }
}


- (void)hiddenAlertView:(BOOL)bHidden
{
    self.hidden = bHidden;
}

- (void)closeAlertView
{
    if ([m_topView respondsToSelector:@selector(closeView)])
    {
        [m_topView performSelector:@selector(closeView)];
    }

    [self  hideAlertWithCompletion:^{
    }];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint pt = [[touches anyObject] locationInView:self];
    m_topViewRc = self.topView.frame;
    if(!CGRectContainsPoint(m_topViewRc,pt))
    {
        if (m_bCloseByTap)
        {
            [self closeAlertViewWithAnimated];
        }
    }
    [super touchesBegan:touches withEvent:event];
}

- (void)closeAlertViewWithAnimated
{
    if ([m_topView respondsToSelector:@selector(closeViewWithAnimated)])
    {
        [m_topView performSelector:@selector(closeViewWithAnimated)];
    }
    else
    {
        [self closeAlertView];
    }
}

#pragma mark --
#pragma mark -- 6.90
- (void)showAlert{
    
    if (!self.topView) {
        return;
    }
    
    if (_animationType == ShadowAlertViewAnimationNone || _animationType == ShadowAlertViewAnimationOutDefine) {
        return;
    }
    
    self.alpha = 0;
    
    if (_animationType == ShadowAlertViewAnimationFromUp) {
        CGFloat orginY = self.topView.top;
        self.topView.bottom = orginY;
        
        [UIView animateWithDuration:PRShadowAnimationDuration animations:^{
            self.alpha = 1;
            self.topView.top = orginY;
        }];
    } else if (_animationType == ShadowAlertViewAnimationFromDown) {
        CGFloat orginY = self.topView.bottom;
        self.topView.top = orginY;
        [UIView animateWithDuration:PRShadowAnimationDuration animations:^{
            self.alpha = 1;
            self.topView.bottom = orginY;
        }];
    } else if (_animationType == ShadowAlertViewAnimationFromRight) {
        CGFloat right =  self.topView.right;
        self.topView.left = right;
        [UIView animateWithDuration:PRShadowAnimationDuration animations:^{
            self.alpha = 1;
            self.topView.right = right;
        }];
    }
    
}

- (void)hideAlertWithCompletion:(void(^)(void))completion{
    
    if (_animationType == ShadowAlertViewAnimationNone || _animationType == ShadowAlertViewAnimationOutDefine) {
        [self removeFromSuperview];
        return;
    }
    
    if (_animationType == ShadowAlertViewAnimationFromUp) {
        
        [UIView animateWithDuration:PRShadowAnimationDuration animations:^{
            self.topView.bottom = self.topView.top;
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    } else if (_animationType == ShadowAlertViewAnimationFromDown){
        
        [UIView animateWithDuration:PRShadowAnimationDuration animations:^{
            self.topView.top = self.topView.bottom;
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    } else if (_animationType == ShadowAlertViewAnimationFromRight){
        
        [UIView animateWithDuration:PRShadowAnimationDuration animations:^{
            self.topView.left = self.topView.right;
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    } else {
        
        [self removeFromSuperview];
    }
    
}

- (CGAffineTransform)CGAffineTransformMakeRotationForIOS8:(CGFloat)angle
{
    if (CURRENT_SYS_VERSION >= 8.0) {
        return  CGAffineTransformMakeRotation(0);
    } else {
       return CGAffineTransformMakeRotation(angle);
    }
}


@end
