//
//  ViewController.m
//  ZzzUIViewColorGradient
//
//  Created by zhouzezhou on 2018/7/1.
//  Copyright © 2018 zhouzezhou. All rights reserved.
//

#import "ViewController.h"
#import "MutableColorGradientViewController.h"
#import "GradientLineSeparateViewController.h"
#import "ShapeForPathGradientViewController.h"

// 屏幕的宽度
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
// 屏幕的高度
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height

// 系统状态栏高度
#define kStatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height

// 设置RGB颜色值
#define COLOR(R,G,B,A)    [UIColor colorWithRed:(CGFloat)R/255.0 green:(CGFloat)G/255.0 blue:(CGFloat)B/255.0 alpha:A]

#define Padding 10.f
#define HeightBtn 45.f

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *mutableColorGradientBtn = [[UIButton alloc] initWithFrame:CGRectMake(Padding, kStatusBarHeight + Padding, kScreenWidth - (Padding * 2), HeightBtn)];
    [mutableColorGradientBtn setTitle:@"彩色渐变 - 全屏幕" forState:UIControlStateNormal];
    mutableColorGradientBtn.layer.cornerRadius = 4.f;
    [mutableColorGradientBtn setBackgroundColor:[UIColor redColor]];
    [mutableColorGradientBtn addTarget:self action:@selector(mutableColorGradientBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mutableColorGradientBtn];
    
    
    UIButton *gradientLineSeparateBtn = [[UIButton alloc] initWithFrame:CGRectMake(Padding, kStatusBarHeight + Padding * 2 + HeightBtn * 1, kScreenWidth - (Padding * 2), HeightBtn)];
    [gradientLineSeparateBtn setTitle:@"渐变线条分隔 - 线条" forState:UIControlStateNormal];
    gradientLineSeparateBtn.layer.cornerRadius = 4.f;
    [gradientLineSeparateBtn setBackgroundColor:[UIColor redColor]];
    [gradientLineSeparateBtn addTarget:self action:@selector(gradientLineSeparateBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:gradientLineSeparateBtn];
    
    UIButton *ShapeForPathGradientBtn = [[UIButton alloc] initWithFrame:CGRectMake(Padding, kStatusBarHeight + Padding * 3 + HeightBtn * 2, kScreenWidth - (Padding * 2), HeightBtn)];
    [ShapeForPathGradientBtn setTitle:@"不规则图形渐变" forState:UIControlStateNormal];
    ShapeForPathGradientBtn.layer.cornerRadius = 4.f;
    [ShapeForPathGradientBtn setBackgroundColor:[UIColor redColor]];
    [ShapeForPathGradientBtn addTarget:self action:@selector(ShapeForPathGradientBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ShapeForPathGradientBtn];
}

#pragma mark - Event

-(void) mutableColorGradientBtnClick
{
    MutableColorGradientViewController *MCGVC = [[MutableColorGradientViewController alloc] init];
    [self presentViewController:MCGVC animated:YES completion:nil];
}

-(void) gradientLineSeparateBtnClick
{
    GradientLineSeparateViewController *GLSVC = [[GradientLineSeparateViewController alloc] init];
    [self presentViewController:GLSVC animated:YES completion:nil];
}

-(void) ShapeForPathGradientBtnClick
{
    ShapeForPathGradientViewController *SFPGVC = [[ShapeForPathGradientViewController alloc] init];
    [self presentViewController:SFPGVC animated:YES completion:nil];
}



@end
