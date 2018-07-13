//
//  ToolbarBlurViewController.m
//  ZzzUIViewBlurEffect
//
//  Created by zhouzezhou on 2018/7/13.
//  Copyright © 2018 zzz. All rights reserved.
//

#import "ToolbarBlurViewController.h"

// 屏幕的宽度
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
// 屏幕的高度
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height

// 系统状态栏高度
#define kStatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height

// 设置RGB颜色值
#define COLOR(R,G,B,A)    [UIColor colorWithRed:(CGFloat)R/255.0 green:(CGFloat)G/255.0 blue:(CGFloat)B/255.0 alpha:A]


@interface ToolbarBlurViewController ()

@end

@implementation ToolbarBlurViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"ToolBarBlur";
    
    UIImageView *imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backImgPic"]];
    [imgV setFrame:self.view.bounds];
    [self.view addSubview:imgV];
    
    // 模糊的位置和大小
    CGRect toolbarRect = CGRectMake(0, 0, kScreenWidth, kScreenHeight / 2);
//    CGRect toolbarRect = self.view.bounds;
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:toolbarRect];
    /*
     * UIBarStyleDefault          = 0,
     * UIBarStyleBlack            = 1,
     * UIBarStyleBlackOpaque      = 1, // Deprecated. Use UIBarStyleBlack
     * UIBarStyleBlackTranslucent = 2, // Deprecated. Use UIBarStyleBlack and set the translucent property to YES
     */
    toolbar.barStyle = UIBarStyleBlack;
    
    [imgV addSubview:toolbar];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
