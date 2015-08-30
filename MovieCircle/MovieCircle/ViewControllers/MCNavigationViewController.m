//
//  MCNavigationViewController.m
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCNavigationViewController.h"

@interface MCNavigationViewController ()

@end

@implementation MCNavigationViewController
+ (void)initialize
{
    UINavigationBar *navBarAppearance = [UINavigationBar appearance];
    navBarAppearance.tintColor = kYellowColor;
    navBarAppearance.barTintColor = [UIColor blackColor];
    [navBarAppearance setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       NSForegroundColorAttributeName:kYellowColor}];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

//push的时候判断到子控制器的数量。当大于零时隐藏BottomBar 也就是UITabBarController 的tababar
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //    if(self.viewControllers.count>0){
    //        viewController.hidesBottomBarWhenPushed = YES;
    //    }
    [super pushViewController:viewController animated:animated];
}

@end
