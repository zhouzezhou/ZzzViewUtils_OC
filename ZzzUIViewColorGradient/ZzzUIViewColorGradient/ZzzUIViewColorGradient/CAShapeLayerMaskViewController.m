//
//  CAShapeLayerMaskViewController.m
//  ZzzUIViewColorGradient
//
//  Created by zhouzezhou on 2018/7/9.
//  Copyright © 2018 zhouzezhou. All rights reserved.
//

#import "CAShapeLayerMaskViewController.h"

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


@interface CAShapeLayerMaskViewController ()

@property (nonatomic, strong) UIImageView *firstCircle;
@property (nonatomic, strong) CAShapeLayer *firstCircleShapeLayer;

@end

@implementation CAShapeLayerMaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    // 颜色渐变的图像
    self.firstCircle = [[UIImageView alloc] init];
    self.firstCircle.frame = CGRectMake(0, 0, 200, 200);
    [self.firstCircle setBackgroundColor:[UIColor redColor]];
    
    
    _firstCircle.layer.masksToBounds = YES;
    _firstCircle.alpha = 1.0;
    
    // 给imgview加上彩色渐变
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    // 红黄蓝渐变
    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor yellowColor].CGColor, (__bridge id)[UIColor blueColor].CGColor];
    // 颜色对应的位置,范围[0,1]
    gradientLayer.locations = @[@0.0, @0.5, @1.0];

    // 从下到上的渐变：[0，0] -> [0, 1]    从左到右的渐变:[0,0] -> [1,0]
    gradientLayer.startPoint = CGPointMake(0, 1.0);
    gradientLayer.endPoint = CGPointMake(0, 0);
    // 部分区域渐变
    //    gradientLayer.frame = CGRectMake(0, 100, 300, 100);
    // 整个视图渐变
    gradientLayer.frame = _firstCircle.bounds;
    [_firstCircle.layer addSublayer:gradientLayer];
    
    _firstCircle.center = CGPointMake(CGRectGetWidth(self.view.bounds) / 2.0, CGRectGetHeight(self.view.bounds) / 2.0);
    [self.view addSubview:self.firstCircle];
    
    // 加上遮罩
    // 圆形环的粗细
    CGFloat firsCircleWidth = 3;
    self.firstCircleShapeLayer = [self generateShapeLayerWithLineWidth:firsCircleWidth];
    // 圆形环的位置
    _firstCircleShapeLayer.path = [self generateBezierPathWithCenter:CGPointMake(100, 100) radius:90].CGPath;
    _firstCircle.layer.mask = _firstCircleShapeLayer;
    
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(Padding, kScreenHeight - HeightBtn -  Padding, kScreenWidth - (Padding * 2), HeightBtn)];
    [backBtn setTitle:@"返  回" forState:UIControlStateNormal];
    backBtn.layer.cornerRadius = 4.f;
    [backBtn setBackgroundColor:[UIColor redColor]];
    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
}

- (CAShapeLayer *)generateShapeLayerWithLineWidth:(CGFloat)lineWidth
{
    CAShapeLayer *waveline = [CAShapeLayer layer];
    waveline.lineCap = kCALineCapButt;
    waveline.lineJoin = kCALineJoinRound;
    waveline.strokeColor = [UIColor redColor].CGColor;
    waveline.fillColor = [[UIColor clearColor] CGColor];
    waveline.lineWidth = lineWidth;
    waveline.backgroundColor = [UIColor clearColor].CGColor;
    
    return waveline;
}

- (UIBezierPath *)generateBezierPathWithCenter:(CGPoint)center radius:(CGFloat)radius
{
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:2*M_PI clockwise:NO];
    
    return circlePath;
}

//- (UIImageView *)firstCircle
//{
//    if (!_firstCircle) {
//        self.firstCircle = [[UIImageView alloc] init];
//        [_firstCircle setBackgroundColor:[UIColor redColor]];
//
////        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
////        // 红黄蓝渐变
////        gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor yellowColor].CGColor, (__bridge id)[UIColor blueColor].CGColor];
////        // 颜色对应的位置,范围[0,1]
////        gradientLayer.locations = @[@0.0, @0.5, @1.0];
////
////        // 从下到上的渐变：[0，0] -> [0, 1]    从左到右的渐变:[0,0] -> [1,0]
////        gradientLayer.startPoint = CGPointMake(0, 1.0);
////        gradientLayer.endPoint = CGPointMake(0, 0);
////        // 部分区域渐变
////        //    gradientLayer.frame = CGRectMake(0, 100, 300, 100);
////        // 整个视图渐变
////        gradientLayer.frame = _firstCircle.bounds;
////        [_firstCircle.layer addSublayer:gradientLayer];
//
//
//        _firstCircle.layer.masksToBounds = YES;
//        _firstCircle.alpha = 1.0;
//    }
//
//    return _firstCircle;
//}

-(void) backBtnClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
