//
//  MCMyAssetsViewController.h
//  MovieCircle
//
//  Created by yuqiang on 15/7/26.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCBaseViewController.h"

@interface MCMyAssetsViewController : MCBaseViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, retain) UITableView *myAssetsTable;//我的资产表

@property (nonatomic, retain) UIImageView *goodsImage;//宝贝图片

@end
