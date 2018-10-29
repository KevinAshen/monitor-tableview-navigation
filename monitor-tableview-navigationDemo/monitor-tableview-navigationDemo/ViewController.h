//
//  ViewController.h
//  monitor-tableview-navigationDemo
//
//  Created by mac on 2018/10/28.
//  Copyright © 2018 姜凯文. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKWView.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) JKWView *testView;

+ (UIImage *)createImageWithColor:(UIColor *)color;

@end

