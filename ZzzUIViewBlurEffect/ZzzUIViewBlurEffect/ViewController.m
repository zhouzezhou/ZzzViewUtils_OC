//
//  ViewController.m
//  ZzzUIViewBlurEffect
//
//  Created by zhouzezhou on 2018/7/13.
//  Copyright © 2018 zzz. All rights reserved.
//

#import "ViewController.h"


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
    
    
    UIButton *toolbarBlurBtn = [[UIButton alloc] initWithFrame:CGRectMake(Padding, kStatusBarHeight + Padding, kScreenWidth - (Padding * 2), HeightBtn)];
    [toolbarBlurBtn setTitle:@"使用UIToolbar达到模糊效果" forState:UIControlStateNormal];
    toolbarBlurBtn.layer.cornerRadius = 4.f;
    [toolbarBlurBtn setBackgroundColor:[UIColor redColor]];
    [toolbarBlurBtn addTarget:self action:@selector(toolbarBlurBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:toolbarBlurBtn];
    
    
    UIButton *gradientLineSeparateBtn = [[UIButton alloc] initWithFrame:CGRectMake(Padding, kStatusBarHeight + Padding * 2 + HeightBtn * 1, kScreenWidth - (Padding * 2), HeightBtn)];
    [gradientLineSeparateBtn setTitle:@"占位Btn2" forState:UIControlStateNormal];
    gradientLineSeparateBtn.layer.cornerRadius = 4.f;
    [gradientLineSeparateBtn setBackgroundColor:[UIColor redColor]];
    [gradientLineSeparateBtn addTarget:self action:@selector(gradientLineSeparateBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:gradientLineSeparateBtn];
    
    UIButton *ShapeForPathGradientBtn = [[UIButton alloc] initWithFrame:CGRectMake(Padding, kStatusBarHeight + Padding * 3 + HeightBtn * 2, kScreenWidth - (Padding * 2), HeightBtn)];
    [ShapeForPathGradientBtn setTitle:@"占位Btn3" forState:UIControlStateNormal];
    ShapeForPathGradientBtn.layer.cornerRadius = 4.f;
    [ShapeForPathGradientBtn setBackgroundColor:[UIColor redColor]];
    [ShapeForPathGradientBtn addTarget:self action:@selector(ShapeForPathGradientBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ShapeForPathGradientBtn];
    
    UIButton *CAShapeLayerMaskBtn = [[UIButton alloc] initWithFrame:CGRectMake(Padding, kStatusBarHeight + Padding * 4 + HeightBtn * 3, kScreenWidth - (Padding * 2), HeightBtn)];
    [CAShapeLayerMaskBtn setTitle:@"占位Btn4" forState:UIControlStateNormal];
    CAShapeLayerMaskBtn.layer.cornerRadius = 4.f;
    [CAShapeLayerMaskBtn setBackgroundColor:[UIColor redColor]];
    [CAShapeLayerMaskBtn addTarget:self action:@selector(CAShapeLayerMaskBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:CAShapeLayerMaskBtn];
    
    
    UIButton *btn5 = [[UIButton alloc] initWithFrame:CGRectMake(Padding, kStatusBarHeight + Padding * 5 + HeightBtn * 4, kScreenWidth - (Padding * 2), HeightBtn)];
    [btn5 setTitle:@"占位Btn4" forState:UIControlStateNormal];
    btn5.layer.cornerRadius = 4.f;
    [btn5 setBackgroundColor:[UIColor redColor]];
    [btn5 addTarget:self action:@selector(btn5Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn5];
    
}

#pragma mark - Event

-(void) toolbarBlurBtnClick
{
    
    
}

-(void) gradientLineSeparateBtnClick
{
    
}

-(void) ShapeForPathGradientBtnClick
{
    
}

-(void) CAShapeLayerMaskBtnClick
{
    
}


-(void) btn5Click
{
    
}

@end