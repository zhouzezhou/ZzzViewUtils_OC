//
//  MutableColorGradientViewController.m
//  ZzzUIViewColorGradient
//
//  Created by zhouzezhou on 2018/7/3.
//  Copyright © 2018 zhouzezhou. All rights reserved.
//

// 彩色的颜色渐变 - 全屏幕
#import "MutableColorGradientViewController.h"

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

@interface MutableColorGradientViewController ()

@end

@implementation MutableColorGradientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
//    [self.view setBackgroundColor:[UIColor redColor]];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    

    UIView *alphaView  = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:alphaView];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    // 红黄蓝渐变
    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor yellowColor].CGColor, (__bridge id)[UIColor blueColor].CGColor];
    // 白色 -> 透明
//    gradientLayer.colors = @[(__bridge id)[UIColor colorWithWhite:1 alpha:0].CGColor, (__bridge id)[UIColor colorWithWhite:1 alpha:0.5].CGColor, (__bridge id)[UIColor colorWithWhite:1 alpha:1].CGColor];
    
    // 颜色对应的位置,范围[0,1]
    gradientLayer.locations = @[@0.0, @0.5, @1.0];
    
    // 从下到上的渐变：[0，0] -> [0, 1]    从左到右的渐变:[0,0] -> [1,0]
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    // 部分区域渐变
    //    gradientLayer.frame = CGRectMake(0, 100, 300, 100);
    // 整个视图渐变
    gradientLayer.frame = self.view.bounds;
    [alphaView.layer addSublayer:gradientLayer];
    
    
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(Padding, kScreenHeight - HeightBtn -  Padding, kScreenWidth - (Padding * 2), HeightBtn)];
    [backBtn setTitle:@"返  回" forState:UIControlStateNormal];
    backBtn.layer.cornerRadius = 4.f;
    [backBtn setBackgroundColor:[UIColor redColor]];
    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
}

#pragma mark - Event

-(void) backBtnClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
