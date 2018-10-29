//
//  ViewController.m
//  monitor-tableview-navigationDemo
//
//  Created by mac on 2018/10/28.
//  Copyright © 2018 姜凯文. All rights reserved.
//

#import "ViewController.h"
#import "JKWTableViewCell.h"
#define kDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight [UIScreen mainScreen].bounds.size.height

static NSString *cellStr = @"cellStr";

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@end

@implementation ViewController

//设置纯色图片
+ (UIImage *)createImageWithColor:(UIColor *)color {
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

//设置图片透明度

+ (UIImage *)imageByApplyingAlpha:(CGFloat)alpha  image:(UIImage*)image
{
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGRect area = CGRectMake(0, 0, image.size.width, image.size.height);
    
    CGContextScaleCTM(ctx, 1, -1);
    
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    
    CGContextSetAlpha(ctx, alpha);
    
    CGContextDrawImage(ctx, area, image.CGImage);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"导航栏";
//    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.23f green:0.78f blue:0.99f alpha:1.00f];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
   // self.navigationController.navigationBar.clipsToBounds = YES;
    self.navigationController.navigationBar.barStyle = UIBaselineAdjustmentNone;
    

    
//    UIImage *colorImage = [ViewController createImageWithColor:[UIColor yellowColor]];
//    UIImage *colorLastImage = [ViewController imageByApplyingAlpha:0.5 image:colorImage];
//
//    [self.navigationController.navigationBar setBackgroundImage:colorLastImage forBarMetrics:UIBarMetricsDefault];
    
    _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    
    
    [_tableView registerClass:[JKWTableViewCell class] forCellReuseIdentifier:cellStr];
    self.navigationController.navigationBar.hidden = NO;
    
    [self.view addSubview:_tableView];
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return nil;
    } else {
        _testView = [[JKWView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
        NSString *sectionStr = [NSString stringWithFormat:@"%lu", section];
        _testView.testLable.text = sectionStr;
        return _testView;
    }

  
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    } else {
        return 64;
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JKWTableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:cellStr forIndexPath:indexPath];
    return tableViewCell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y < 420) {
        self.navigationController.navigationBar.hidden = NO;
        self.navigationItem.title = @"iOS冲鸭";

        UIImage *colorImage = [ViewController createImageWithColor:[UIColor colorWithRed:0.24f green:0.78f blue:0.99f alpha:1.00f]];
        UIImage *colorLastImage = [ViewController imageByApplyingAlpha:scrollView.contentOffset.y / 200.0 image:colorImage];
        //(1.0 / scrollView.contentOffset.y)
        [self.navigationController.navigationBar setBackgroundImage:colorLastImage forBarMetrics:UIBarMetricsDefault];
        NSLog(@"----NO.1--%f--", scrollView.contentOffset.y);
    } else {
        self.navigationController.navigationBar.hidden = YES;
//        UIImage *colorImage = [ViewController createImageWithColor:[UIColor colorWithRed:0.01f green:0.56f blue:0.84f alpha:1.00f]];
//
//
//        [self.navigationController.navigationBar setBackgroundImage:colorImage forBarMetrics:UIBarMetricsDefault];
//        self.navigationItem.title = @"导航栏";
         NSLog(@"----NO.2--%f--", scrollView.contentOffset.y);
    }
}

@end
