//
//  JKWTableViewCell.m
//  monitor-tableview-navigationDemo
//
//  Created by mac on 2018/10/28.
//  Copyright © 2018 姜凯文. All rights reserved.
//

#import "JKWTableViewCell.h"

@implementation JKWTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _testLabel = [[UILabel alloc] init];
        _testLabel.textColor = [UIColor blackColor];
        _testLabel.text = @"iOS冲鸭";
        [self.contentView addSubview:_testLabel];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _testLabel = [[UILabel alloc] init];
        _testLabel.textColor = [UIColor blackColor];
        _testLabel.text = @"iOS冲鸭";
        [self.contentView addSubview:_testLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _testLabel.frame = CGRectMake(0, 0, 80, 30);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
