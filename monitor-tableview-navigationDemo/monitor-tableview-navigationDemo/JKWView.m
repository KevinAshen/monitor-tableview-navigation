//
//  JKWView.m
//  monitor-tableview-navigationDemo
//
//  Created by mac on 2018/10/29.
//  Copyright © 2018 姜凯文. All rights reserved.
//

#import "JKWView.h"

@implementation JKWView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.24f green:0.78f blue:0.99f alpha:1.00f];
        _testLable = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width / 2.0, 0, frame.size.width / 3.0, frame.size.height)];
//        _testLable.backgroundColor = [UIColor colorWithRed:0.24f green:0.78f blue:0.99f alpha:1.00f];
        _testLable.textColor = [UIColor whiteColor];
        [self addSubview:_testLable];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
