//
//  MCMainViewController.m
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCMainViewController.h"

#import "MCKnowMovieViewController.h"
#import "MCRankingListViewController.h"
#import "MCPayViewController.h"
#import "MCNearbyViewController.h"
#import "MCMineViewController.h"
#import "MCNavigationViewController.h"

@interface MCMainViewController ()

@end

@implementation MCMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.tabBar.hidden=YES;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title = @"main";
    [self customTabbarView];
//    [self configViewControllers];

    // Do any additional setup after loading the view.
}


//自定义tabbar
- (void)customTabbarView
{
    //tabbar视图
    self.tabbarView=[[UIImageView alloc]initWithFrame:CGRectMake(0, kDeviceHeight-49, kDeviceWidth, 49)];
    self.tabbarView.userInteractionEnabled=YES;
    self.tabbarView.image=[UIImage imageNamed:@"caidan"];
    [self.view addSubview:self.tabbarView];
    
    MCKnowMovieViewController *knowMovie = [[MCKnowMovieViewController alloc]init];
    MCRankingListViewController *rankingList = [[MCRankingListViewController alloc]init];
    MCPayViewController *pay = [[MCPayViewController alloc]init];
    MCNearbyViewController *nearby = [[MCNearbyViewController alloc]init];
    MCMineViewController *mine = [[MCMineViewController alloc]init];
    
    //识影
    MCNavigationViewController *knowNav = [[MCNavigationViewController alloc]initWithRootViewController:knowMovie];
    //榜单
    MCNavigationViewController *rankingListNav = [[MCNavigationViewController alloc]initWithRootViewController:rankingList];
    //购买
    MCNavigationViewController *payNva = [[MCNavigationViewController alloc]initWithRootViewController:pay];
    //附近
    MCNavigationViewController *nearbyNav = [[MCNavigationViewController alloc]initWithRootViewController:nearby];
    //我
    MCNavigationViewController *mineNav = [[MCNavigationViewController alloc]initWithRootViewController:mine];
    
    self.viewControllers = [NSArray arrayWithObjects:knowNav,rankingListNav,payNva,nearbyNav,mineNav, nil];
    
    
    [self creatButtonWithNormalImage:@"shiying_normal" selectedImage:@"shiying_selected" title:@"识影" index:0];
    [self creatButtonWithNormalImage:@"bangdan_normal" selectedImage:@"bangdan_selected" title:@"榜单" index:1];
    [self creatButtonWithNormalImage:@"neigou_selected" selectedImage:@"neigou_selected" title:@"" index:2];
    [self creatButtonWithNormalImage:@"fujin_normal" selectedImage:@"fujin_selected" title:@"附近" index:3];
    [self creatButtonWithNormalImage:@"wo_normal" selectedImage:@"wo_selected" title:@"我" index:4];
    
    MCTabbarButton *button = _tabbarView.subviews[0];
    [self handleBarButtonItem:button];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)creatButtonWithNormalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage title:(NSString *)title index:(int)index
{
    MCTabbarButton *customButton = [MCTabbarButton buttonWithType:UIButtonTypeCustom];
    customButton.tag = index;
    
    CGFloat buttonW = self.tabbarView.width/5;
    CGFloat buttonH = self.tabbarView.height;
    
    customButton.frame = CGRectMake(buttonW *index, 0, buttonW, buttonH);
    [customButton setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [customButton setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    [customButton addTarget:self action:@selector(handleBarButtonItem:) forControlEvents:UIControlEventTouchUpInside];
    [customButton setTitle:title forState:UIControlStateNormal];
    [customButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [customButton setTitleColor:[MCTools colorWithHex:0xFEB901 ] forState:UIControlStateSelected];
    
    customButton.imageView.contentMode = UIViewContentModeCenter;
    customButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    customButton.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [self.tabbarView addSubview:customButton];
    
    //默认选中第一个
    if (index == 0) {
        self.selectedButton = customButton;
        self.selectedButton.selected = YES;
    }
        

}

//切换tabbar
- (void)handleBarButtonItem:(MCTabbarButton *)button
{
    if (self.selectedIndex != button.tag) {
        self.selectedIndex = button.tag;
        self.selectedButton.selected = !self.selectedButton.selected;
        _selectedButton = button;
        _selectedButton.selected = YES;
    }

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
