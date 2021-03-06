//
//  ViewController.m
//  ZzzUIViewBlurEffect
//
//  Created by zhouzezhou on 2018/7/13.
//  Copyright © 2018 zzz. All rights reserved.
//

#import "ViewController.h"
#import "ToolbarBlurViewController.h"
#import "VisualEffectViewController.h"
#import "CoreImageBlurViewController.h"
#import "VImageViewController.h"

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
    self.title = @"Home";
    
    float navHeight = self.navigationController.navigationBar.bounds.size.height;
    
    UIButton *toolbarBlurBtn = [[UIButton alloc] initWithFrame:CGRectMake(Padding, navHeight + kStatusBarHeight + Padding, kScreenWidth - (Padding * 2), HeightBtn)];
    [toolbarBlurBtn setTitle:@"使用UIToolbar达到模糊效果" forState:UIControlStateNormal];
    toolbarBlurBtn.layer.cornerRadius = 4.f;
    [toolbarBlurBtn setBackgroundColor:[UIColor redColor]];
    [toolbarBlurBtn addTarget:self action:@selector(toolbarBlurBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:toolbarBlurBtn];
    
    
    UIButton *visualEffectBtn = [[UIButton alloc] initWithFrame:CGRectMake(Padding, navHeight + kStatusBarHeight + Padding * 2 + HeightBtn * 1, kScreenWidth - (Padding * 2), HeightBtn)];
    [visualEffectBtn setTitle:@"使用VisualEffect达到模糊效果" forState:UIControlStateNormal];
    visualEffectBtn.layer.cornerRadius = 4.f;
    [visualEffectBtn setBackgroundColor:[UIColor redColor]];
    [visualEffectBtn addTarget:self action:@selector(visualEffectBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:visualEffectBtn];
    
    UIButton *CoreImageBlurBtn = [[UIButton alloc] initWithFrame:CGRectMake(Padding, navHeight + kStatusBarHeight + Padding * 3 + HeightBtn * 2, kScreenWidth - (Padding * 2), HeightBtn)];
    [CoreImageBlurBtn setTitle:@"使用CoreImage达到模糊效果" forState:UIControlStateNormal];
    CoreImageBlurBtn.layer.cornerRadius = 4.f;
    [CoreImageBlurBtn setBackgroundColor:[UIColor redColor]];
    [CoreImageBlurBtn addTarget:self action:@selector(CoreImageBlurBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:CoreImageBlurBtn];
    
    UIButton *CVImageBtn = [[UIButton alloc] initWithFrame:CGRectMake(Padding, navHeight + kStatusBarHeight + Padding * 4 + HeightBtn * 3, kScreenWidth - (Padding * 2), HeightBtn)];
    [CVImageBtn setTitle:@"使用CVImage达到模糊效果" forState:UIControlStateNormal];
    CVImageBtn.layer.cornerRadius = 4.f;
    [CVImageBtn setBackgroundColor:[UIColor redColor]];
    [CVImageBtn addTarget:self action:@selector(CVImageBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:CVImageBtn];
    
}

#pragma mark - Event

-(void) toolbarBlurBtnClick
{
    ToolbarBlurViewController *TBVC = [[ToolbarBlurViewController alloc] init];
//    [self presentViewController:TBVC animated:YES completion:nil];
    [self.navigationController pushViewController:TBVC animated:YES];
}

-(void) visualEffectBtnClick
{
    VisualEffectViewController *VEVC = [[VisualEffectViewController alloc] init];
    [self.navigationController pushViewController:VEVC animated:YES];
}

-(void) CoreImageBlurBtnClick
{
    CoreImageBlurViewController *CIBVC = [[CoreImageBlurViewController alloc] init];
    [self.navigationController pushViewController:CIBVC animated:YES];
}

-(void) CVImageBtnClick
{
    VImageViewController *VIVC = [[VImageViewController alloc] init];
    [self.navigationController pushViewController:VIVC animated:YES];
}


@end
