//
//  SaveUIView2ImageFileViewController.m
//  ZzzUIViewImageShow
//
//  Created by zhouzezhou on 2018/7/31.
//  Copyright © 2018 zzz. All rights reserved.
//

#import "SaveUIView2ImageFileViewController.h"

// 屏幕的宽度
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
// 屏幕的高度
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height

// 系统状态栏高度
#define kStatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height

// 设置RGB颜色值
#define COLOR(R,G,B,A)    [UIColor colorWithRed:(CGFloat)R/255.0 green:(CGFloat)G/255.0 blue:(CGFloat)B/255.0 alpha:A]


@interface SaveUIView2ImageFileViewController () <UITableViewDataSource, UITableViewDelegate, UIDocumentInteractionControllerDelegate>

// 文档查看和分享
@property (nonatomic, strong) UIDocumentInteractionController *documentController;

@end

@implementation SaveUIView2ImageFileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 60.f)];
    [topView setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:topView];
    
    
    UITableView *dataShowTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 60 + 10.f, kScreenWidth, kScreenHeight - 60 - 50) style:UITableViewStyleGrouped];
    [dataShowTableView setBackgroundColor:[UIColor brownColor]];
    [dataShowTableView setEstimatedSectionHeaderHeight:0];
    [dataShowTableView setEstimatedSectionFooterHeight:0];
    [self.view addSubview:dataShowTableView];
    [dataShowTableView setDelegate:self];
    [dataShowTableView setDataSource:self];
    
    
}

#pragma mark - Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 24;
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1f;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"dsfjklasjflCellID"];
    
    [cell setBackgroundColor:[UIColor redColor]];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //
    NSLog(@"didSelectRowAtIndexPath");
    
    
    // 保存为 图片
    // 保存当前屏幕的图片
    //    CGSize imgSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height + 100.f);
    //    UIImage *tempImg = [self makeImageWithView:self.view withSize:imgSize];
    
    // 保存长图(UIScrollView里的所有内容)
    UIImage *tempImg = [self snapshotWithScrollView:tableView];
    NSString *path = [self getImagePath:tempImg];
    
    NSLog(@"path is %@", path);
    
   // 打开系统的分享界面
    // quick look
    //    NSString * finalLocation = [docDir stringByAppendingPathComponent:[fileOriPath lastPathComponent]];
    _documentController = [UIDocumentInteractionController interactionControllerWithURL:[NSURL fileURLWithPath:path]];
    _documentController.delegate = self;
    
    // 直接使用Quick look快速查看
    //        [documentController presentPreviewAnimated:YES];
    
    // 打开 可打开此类型的App列表 和 可选操作列表（复制、快速查看、打印等）
    [_documentController presentOptionsMenuFromRect:self.view.bounds inView:self.view animated:YES];
    
    // 直接保存到系统相册
    
    
    
}

#pragma mark - Save Img

- (UIImage *)makeImageWithView:(UIView *)view withSize:(CGSize)size
{
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了，关键就是第三个参数 [UIScreen mainScreen].scale。
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
    
}

- (UIImage *) snapshotWithScrollView:(UIScrollView *)scrollView
{
    UIImage* image = nil;
    //    UIGraphicsBeginImageContext(scrollView.contentSize);
    UIGraphicsBeginImageContextWithOptions(scrollView.contentSize, NO, 0.0);
    {
        CGPoint savedContentOffset = scrollView.contentOffset;
        CGRect savedFrame = scrollView.frame;
        scrollView.contentOffset = CGPointZero;
        scrollView.frame = CGRectMake(0, 0, scrollView.contentSize.width + savedFrame.origin.x
                                      , scrollView.contentSize.height + savedFrame.origin.y);
        
        [scrollView.layer renderInContext: UIGraphicsGetCurrentContext()];
        image = UIGraphicsGetImageFromCurrentImageContext();
        
        scrollView.contentOffset = savedContentOffset;
        scrollView.frame = savedFrame;
    }
    UIGraphicsEndImageContext();
    
    if (image != nil) {
        return image;
    }
    return nil;
}

//照片获取本地路径转换
-(NSString *)getImagePath:(UIImage *)Image {
    
    NSString * filePath = nil;
    NSData * data = nil;
    
    if (UIImagePNGRepresentation(Image) == nil) {
        data = UIImageJPEGRepresentation(Image, 1);
    } else {
        data = UIImagePNGRepresentation(Image);
    }
    
    //图片保存的路径
    //这里将图片放在沙盒的documents文件夹中
    NSString * DocumentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    
    //文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //把刚刚图片转换的data对象拷贝至沙盒中
    [fileManager createDirectoryAtPath:DocumentsPath withIntermediateDirectories:YES attributes:nil error:nil];
    NSString * ImagePath = [[NSString alloc]initWithFormat:@"/theFirstImage.png"];
    [fileManager createFileAtPath:[DocumentsPath stringByAppendingString:ImagePath] contents:data attributes:nil];
    
    //得到选择后沙盒中图片的完整路径
    filePath = [[NSString alloc]initWithFormat:@"%@%@",DocumentsPath,ImagePath];
    
    return filePath;
}


#pragma mark - UIDocumentInteractionController Delegate

- (UIViewController *)documentInteractionControllerViewControllerForPreview:(UIDocumentInteractionController *)controller {
    //    DLog(@"documentInteractionControllerViewControllerForPreview");
    return self;
}

- (void)documentInteractionControllerWillBeginPreview:(UIDocumentInteractionController *)controller
{
    //    DLog(@"documentInteractionControllerWillBeginPreview");
    
    //    self.loadingHud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    //    self.loadingHud.label.text = @"加载中...";
    //    [self.loadingHud hideAnimated:YES afterDelay:2];
    
}

- (void)documentInteractionControllerDidEndPreview:(UIDocumentInteractionController *)controller;
{
    //    [self.loadingHud hideAnimated:NO];
}


@end


