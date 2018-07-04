//
//  GradientLineSeparateViewController.m
//  ZzzUIViewColorGradient
//
//  Created by zhouzezhou on 2018/7/4.
//  Copyright © 2018 zhouzezhou. All rights reserved.
//

// 渐变线条分隔
#import "GradientLineSeparateViewController.h"

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

@interface GradientLineSeparateViewController ()

@end

@implementation GradientLineSeparateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    // 添加渐变线做为分隔线
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    // 黑色 -> 透明
    gradientLayer.colors = @[(__bridge id)[UIColor colorWithWhite:0 alpha:0].CGColor, (__bridge id)[UIColor colorWithWhite:0 alpha:0.08].CGColor, (__bridge id)[UIColor colorWithWhite:0 alpha:0.16].CGColor];
    gradientLayer.locations = @[@0.0, @0.5, @1.0];
    // 从上到下的渐变：[0，1] -> [0, 0]    从左到右的渐变:[0,0] -> [1,0]
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1.0);
    float heightGradientLine = 8.f;
    gradientLayer.frame = CGRectMake(0, 100, self.view.bounds.size.width, heightGradientLine);
    [self.view.layer addSublayer:gradientLayer];
    
    
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(Padding, kScreenHeight - HeightBtn -  Padding, kScreenWidth - (Padding * 2), HeightBtn)];
    [backBtn setTitle:@"返  回" forState:UIControlStateNormal];
    backBtn.layer.cornerRadius = 4.f;
    [backBtn setBackgroundColor:[UIColor redColor]];
    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];

}

-(void) backBtnClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
