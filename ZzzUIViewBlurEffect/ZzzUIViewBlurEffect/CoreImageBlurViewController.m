//
//  CoreImageBlurViewController.m
//  ZzzUIViewBlurEffect
//
//  Created by zhouzezhou on 2018/7/18.
//  Copyright © 2018 zzz. All rights reserved.
//

#import "CoreImageBlurViewController.h"

// 屏幕的宽度
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
// 屏幕的高度
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height

// 系统状态栏高度
#define kStatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height

// 设置RGB颜色值
#define COLOR(R,G,B,A)    [UIColor colorWithRed:(CGFloat)R/255.0 green:(CGFloat)G/255.0 blue:(CGFloat)B/255.0 alpha:A]


// 此方法比较占内存和CPU
@interface CoreImageBlurViewController ()

@end

@implementation CoreImageBlurViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"VisualEffect";
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIImage *blueImg = [self coreBlurImage:[UIImage imageNamed:@"backImgPic"] withBlurNumber:1];
    
    UIImageView *imgV = [[UIImageView alloc] initWithImage:blueImg];
    [imgV setFrame:self.view.bounds];
    [self.view addSubview:imgV];
    
    
}

/* iOS5.0之后就出现了Core Image的API,Core Image的API被放在CoreImage.framework库中, 在iOS和OS X平台上，Core Image都提供了大量的滤镜（Filter），在OS X上有120多种Filter，而在iOS上也有90多，Core Image设置模糊之后会在周围产生白边:
*/
// blur的值大于1图片会被缩小
- (UIImage *)coreBlurImage:(UIImage *) image withBlurNumber:(CGFloat) blur
{
    
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage = [CIImage imageWithCGImage:image.CGImage];
    //设置filter
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:@(blur) forKey:@"inputRadius"];
    //模糊图片
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    CGImageRef outImage = [context createCGImage:result fromRect:[result extent]];
    UIImage *blurImage = [UIImage imageWithCGImage:outImage];
    CGImageRelease(outImage);
    return blurImage;
    
}

@end
