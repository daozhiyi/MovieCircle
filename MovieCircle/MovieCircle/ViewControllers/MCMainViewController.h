//
//  MCMainViewController.h
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCBaseViewController.h"

#import "MCTabbarButton.h"

@interface MCMainViewController : UITabBarController

@property (nonatomic, retain) UIImageView *tabbarView;//分栏视图
@property (nonatomic, retain) MCTabbarButton *selectedButton;//记录上一次选中的按钮
//@property (nonatomic, retain) UIImageView *selectTabbar;//选中tabbar

@end
