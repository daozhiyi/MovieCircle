//
//  MCMineViewController.h
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCBaseViewController.h"

@interface MCMineViewController : MCBaseViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, retain) UITableView *mineTable;//我的表

@end
