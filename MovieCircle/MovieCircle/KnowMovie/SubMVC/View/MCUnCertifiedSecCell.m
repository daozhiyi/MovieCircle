//
//  MCUnCertifiedSecCell.m
//  MovieCircle
//
//  Created by zhouyongchao on 15/8/11.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCUnCertifiedSecCell.h"

@interface MCUnCertifiedSecCell ()

@property (weak, nonatomic) IBOutlet UIImageView *leftImg;
@property (weak, nonatomic) IBOutlet UILabel *lblCondition;
@property (weak, nonatomic) IBOutlet UILabel *lblEndTime;
@property (weak, nonatomic) IBOutlet UILabel *lblReward;
@property (weak, nonatomic) IBOutlet UIButton *btnParitcipate;
@end

@implementation MCUnCertifiedSecCell

- (void)awakeFromNib
{
    self.btnParitcipate.backgroundColor = [UIColor orangeColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
