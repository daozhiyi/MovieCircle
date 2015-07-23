//
//  MCKnowMovieViewController.h
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCBaseViewController.h"

@interface MCKnowMovieViewController : MCBaseViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, retain) UITableView *knowMovieTable;//识影表

@property (nonatomic, retain) UIButton *peopleSelected;//记录people类别选中的按钮

@property (nonatomic, retain) UIButton *clothSelected;//记录衣服类别选中的按钮

@end
