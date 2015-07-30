//
//  MCMyWorksViewController.h
//  MovieCircle
//
//  Created by yuqiang on 15/7/23.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCBaseViewController.h"

@interface MCMyWorksViewController : MCBaseViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, retain) UITableView *myWorksTable;//我的作品表

@end
