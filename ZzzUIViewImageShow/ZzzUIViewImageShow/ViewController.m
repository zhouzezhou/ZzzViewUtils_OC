//
//  ViewController.m
//  ZzzUIViewImageShow
//
//  Created by zhouzezhou on 2018/7/17.
//  Copyright © 2018 zzz. All rights reserved.
//

#import "ViewController.h"
#import "UIImageVIewShowViewController.h"
#import "SaveUIView2ImageFileViewController.h"

// 屏幕的宽度
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
// 屏幕的高度
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height

// 系统状态栏高度
#define kStatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height

// 设置RGB颜色值
#define COLOR(R,G,B,A)    [UIColor colorWithRed:(CGFloat)R/255.0 green:(CGFloat)G/255.0 blue:(CGFloat)B/255.0 alpha:A]


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *imageVIewShowBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, 400, kScreenWidth - 60.f, 45.f)];
    [imageVIewShowBtn setTitle:@"imageVIewShowBtn" forState:UIControlStateNormal];
    [imageVIewShowBtn setBackgroundColor:[UIColor redColor]];
    imageVIewShowBtn.layer.cornerRadius = 4.f;
    [self.view addSubview:imageVIewShowBtn];
    [imageVIewShowBtn addTarget:self action:@selector(imageVIewShowBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *SaveUIView2ImageFileBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, 500, kScreenWidth - 60.f, 45.f)];
    [SaveUIView2ImageFileBtn setTitle:@"SaveUIView2ImageFileBtn" forState:UIControlStateNormal];
    [SaveUIView2ImageFileBtn setBackgroundColor:[UIColor redColor]];
    SaveUIView2ImageFileBtn.layer.cornerRadius = 4.f;
    [self.view addSubview:SaveUIView2ImageFileBtn];
    [SaveUIView2ImageFileBtn addTarget:self action:@selector(SaveUIView2ImageFileBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}
-(void) imageVIewShowBtnClick
{
    NSLog(@"encourageBtnClick");
    
    UIImageVIewShowViewController *IMGVC = [[UIImageVIewShowViewController alloc] init];
    [self presentViewController:IMGVC animated:YES completion:nil];
}

-(void) SaveUIView2ImageFileBtnClick
{
    SaveUIView2ImageFileViewController *SV2IFVC = [[SaveUIView2ImageFileViewController alloc] init];
    [self presentViewController:SV2IFVC animated:YES completion:nil];
    
}

@end
