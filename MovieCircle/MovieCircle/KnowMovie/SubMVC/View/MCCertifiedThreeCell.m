//
//  MCCertifiedThreeCell.m
//  MovieCircle
//
//  Created by zhouyongchao on 15/8/7.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCCertifiedThreeCell.h"

@interface MCCertifiedThreeCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgVPic;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblDes;
@property (weak, nonatomic) IBOutlet UIButton *btnPrice;

@end

@implementation MCCertifiedThreeCell

- (void)awakeFromNib {
    self.btnPrice.backgroundColor = [UIColor redColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - getter and setter
- (void)setThreeData:(MCKnowMovieData *)threeData
{
    
}

@end
