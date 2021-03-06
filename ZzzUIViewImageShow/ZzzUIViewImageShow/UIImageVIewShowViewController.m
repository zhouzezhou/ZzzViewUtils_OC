//
//  UIImageVIewShowViewController.m
//  ZzzUIViewImageShow
//
//  Created by zhouzezhou on 2018/7/17.
//  Copyright © 2018 zzz. All rights reserved.
//

#import "UIImageVIewShowViewController.h"

// 屏幕的宽度
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
// 屏幕的高度
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
// 系统状态栏高度
#define kStatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height


@interface UIImageVIewShowViewController ()

@end

@implementation UIImageVIewShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UITapGestureRecognizer *backviewTapGes = [[UITapGestureRecognizer alloc] init];
    [backviewTapGes addTarget:self action:@selector(backViewShouldTap:)];
    [self.view addGestureRecognizer:backviewTapGes];
    
//    float height_textViewHeight = 80.f;
    
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [img setImage:[UIImage imageNamed:@"backImgPic"]];
//    [img setBackgroundColor:[UIColor redColor]];
    // UIViewContentModeScaleToFill 缩放以显示图片里全部内容，会拉伸或压缩图片的宽高来达到要求（图片会变形）
    // UIViewContentModeScaleAspectFit 缩放以显示图片里全部内容，但图片宽高比不变
    // UIViewContentModeScaleAspectFill 缩放图放以填充满整个布局大小，边框上的有内容可能会显示不出来
    // UIViewContentModeRedraw 按bound大小重新绘制图片，图片会变形但能填充满bound，和UIViewContentModeScaleToFill相似
    // UIViewContentModeCenter 按实际像素比例显示图片的正中心
    [img setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:img];
}


-(BOOL) prefersStatusBarHidden
{
    return YES;
}

-(void) backViewShouldTap:(id) sender
{
    NSLog(@"backViewShouldTap");
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
