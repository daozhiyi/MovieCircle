//
//  MCCertifiedTopCell.m
//  MovieCircle
//
//  Created by zhouyongchao on 15/8/7.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCCertifiedTopCell.h"

@interface MCCertifiedTopCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imgVTop;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblRoleName;
@property (weak, nonatomic) IBOutlet UILabel *lblTime;
@property (weak, nonatomic) IBOutlet UILabel *lblRenQi;
@property (weak, nonatomic) IBOutlet UILabel *lblFans;


@end

@implementation MCCertifiedTopCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - getter and setter
- (void)setTopData:(MCKnowMovieData *)topData
{
    
}

@end
