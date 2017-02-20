//
//  ViewController.m
//  MCCategory
//
//  Created by mcc on 2017/2/16.
//  Copyright © 2017年 mcc. All rights reserved.
//

#import "ViewController.h"
#import "MCCommonMacroDefine.h"
#import "MCShadowAlertView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc] init];
    btn.backgroundColor = MCColor(@"#aaaaaa", 1.0);
    btn.frame = CGRectMake(KSCALE*100, KSCALE*100, MCWidthScale(100), MCHeightScale(50));
    [btn setTitle:@"dianji" forState:UIControlStateNormal];
    [btn mc_setBackgroundColor:MCColor(@"#00bf99", 1.0) forState:UIControlStateHighlighted];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnClick
{
//    MCShadowAlertView *alert = [[MCShadowAlertView alloc] initWithFrame:CGRectMake(0, 0, MCScreenWidth, MCScreenHeight) backgroundColor:nil animationType:ShadowAlertViewAnimationFromUp];
//
//    [alert setTheTopView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
