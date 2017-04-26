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
//    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *lab = [[UILabel alloc] init];
    lab.frame = CGRectMake(100, 100, 100, 50);
    [self.view addSubview:lab];
    lab.backgroundColor = MCColor(@"#aaaaaa", 1.0);
    lab.text = @"斜体字体测试";
    
    CGAffineTransform matrix =CGAffineTransformMake(1, 0, tanf(25 * (CGFloat)M_PI / 180), 1, 0, 0);//设置反射。倾斜角度。
    
    UIFontDescriptor *desc = [ UIFontDescriptor fontDescriptorWithName :[UIFont systemFontOfSize:14].fontName matrix:matrix];//取得系统字符并设置反射。
    lab.font = [UIFont fontWithDescriptor:desc size :14];
    
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
