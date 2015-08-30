//
//  MCActivityDetailViewController.h
//  MovieCircle
//
//  Created by yuqiang on 15/8/30.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCBaseViewController.h"

@interface MCActivityDetailViewController : MCBaseViewController<UITableViewDataSource,UITableViewDelegate>


@property (nonatomic, retain) UITableView *activityDetailTable;//活动介绍表

@property (nonatomic) BOOL isPush;//是否是push到下一个界面

@property (nonatomic, retain) UILabel *activityContent;//活动内容
@end
