//
//  MCCertifiedSecCell.h
//  MovieCircle
//
//  Created by zhouyongchao on 15/8/7.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCKnowMovieData.h"

@protocol MCCertifiedSecCellDelegate <NSObject>

@optional
- (void)btnShareClick:(UIButton *)sender;

@end

@interface MCCertifiedSecCell : UITableViewCell

@property (weak, nonatomic) id<MCCertifiedSecCellDelegate> delegate;
@property (strong, nonatomic) MCKnowMovieData *secData;

@end
