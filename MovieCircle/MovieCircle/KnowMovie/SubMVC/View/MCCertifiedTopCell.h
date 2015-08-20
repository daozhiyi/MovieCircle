//
//  MCCertifiedTopCell.h
//  MovieCircle
//
//  Created by zhouyongchao on 15/8/7.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCKnowMovieData.h"

@interface MCCertifiedTopCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgVTop;
@property (strong, nonatomic) MCKnowMovieData *topData;

@end
