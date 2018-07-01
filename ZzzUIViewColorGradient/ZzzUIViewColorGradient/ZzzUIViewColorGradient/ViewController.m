//
//  ViewController.m
//  ZzzUIViewColorGradient
//
//  Created by zhouzezhou on 2018/7/1.
//  Copyright © 2018 zhouzezhou. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor redColor]];
    
    UIView *alphaView  = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:alphaView];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    // 红黄蓝渐变
    //    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor yellowColor].CGColor, (__bridge id)[UIColor blueColor].CGColor];
    // 白色 -> 透明
    gradientLayer.colors = @[(__bridge id)[UIColor colorWithWhite:1 alpha:0].CGColor, (__bridge id)[UIColor colorWithWhite:1 alpha:0.5].CGColor, (__bridge id)[UIColor colorWithWhite:1 alpha:1].CGColor];
    
    gradientLayer.locations = @[@0.0, @0.5, @1.0];
    // 从下到上的渐变：[0，0] -> [0, 1]    从左到右的渐变:[0,0] -> [1,0]
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1.0);
    // 部分区域渐变
    //    gradientLayer.frame = CGRectMake(0, 100, 300, 100);
    // 整个视图渐变
    gradientLayer.frame = self.view.bounds;
    [alphaView.layer addSublayer:gradientLayer];
    
}


@end
