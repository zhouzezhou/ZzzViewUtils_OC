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
    
    float height_textViewHeight = 80.f;
    
    /*
     typedef NS_ENUM(NSInteger, UIViewContentMode) {
     UIViewContentModeScaleToFill,
     UIViewContentModeScaleAspectFit,      // contents scaled to fit with fixed aspect. remainder is transparent
     UIViewContentModeScaleAspectFill,     // contents scaled to fill with fixed aspect. some portion of content may be clipped.
     UIViewContentModeRedraw,              // redraw on bounds change (calls -setNeedsDisplay)
     UIViewContentModeCenter,              // contents remain same size. positioned adjusted.
     UIViewContentModeTop,
     UIViewContentModeBottom,
     UIViewContentModeLeft,
     UIViewContentModeRight,
     UIViewContentModeTopLeft,
     UIViewContentModeTopRight,
     UIViewContentModeBottomLeft,
     UIViewContentModeBottomRight,
     };
     */
    
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - height_textViewHeight)];
    [img setImage:[UIImage imageNamed:@"backImgPic"]];
    [img setBackgroundColor:[UIColor redColor]];
    // UIViewContentModeScaleToFill 缩放以显示图片里全部内容，会拉伸或压缩图片的宽高来达到要求（图片会变形）
    // UIViewContentModeScaleAspectFit 缩放以显示图片里全部内容，但图片宽高比不变
    // UIViewContentModeScaleAspectFill 缩放图放以填充满整个布局大小
    [img setContentMode:UIViewContentModeScaleToFill];
    [self.view addSubview:img];
    
    UIView *textView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight - height_textViewHeight, kScreenWidth, height_textViewHeight)];
    [textView setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:textView];
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
