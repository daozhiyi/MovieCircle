//
//  MCCertifiedSecCell.m
//  MovieCircle
//
//  Created by zhouyongchao on 15/8/7.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCCertifiedSecCell.h"

@interface MCCertifiedSecCell ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonX2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonX3;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonWidth;
@property (weak, nonatomic) IBOutlet UIView *buttonContainerV;


@property (weak, nonatomic) IBOutlet UIImageView *leftImg;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblDes;
@property (weak, nonatomic) IBOutlet UIButton *btnPrice;

- (IBAction)btnShareClicked:(UIButton *)sender;

@end

@implementation MCCertifiedSecCell

- (void)awakeFromNib
{
    self.leftImg.layer.borderWidth = 1;
    self.leftImg.layer.borderColor = [[UIColor grayColor] CGColor];
    self.btnPrice.backgroundColor = [UIColor redColor];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.buttonContainerV layoutIfNeeded];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
}

- (void)updateConstraints
{
    self.buttonWidth.constant = (self.buttonContainerV.frame.size.width - 60)/3;
    self.buttonX2.constant = self.buttonX3.constant = 20;
//    [self autoArrangeButtonWithConstraints:@[self.buttonX2,self.buttonX3] width:self.buttonWidth.constant];
    [super updateConstraints];
}

- (void)autoArrangeButtonWithConstraints:(NSArray *)constraintArray width:(CGFloat)width
{
    CGFloat step = (self.buttonContainerV.frame.size.width - width - (width * constraintArray.count))/(constraintArray.count + 1);
    for (int i = 0; i < constraintArray.count; i++) {
        NSLayoutConstraint *constraint = constraintArray[i];
        constraint.constant = step;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)btnShareClicked:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(btnShareClick:)]) {
        [self.delegate btnShareClick:sender];
    }
}

#pragma mark - getter and setter
- (void)setSecData:(MCKnowMovieData *)secData
{
    
}


@end
