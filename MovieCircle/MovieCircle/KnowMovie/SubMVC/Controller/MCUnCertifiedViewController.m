//
//  MCUnCertifiedViewController.m
//  MovieCircle
//
//  Created by zhouyongchao on 15/8/11.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCUnCertifiedViewController.h"

#import "MCCertifiedTopCell.h"
#import "MCUnCertifiedSecCell.h"

#define UNCERTIFIED_TOP_CELL @"MCCertifiedTopCell"
#define UNCERTIFIED_SEC_CELL @"MCUnCertifiedSecCell"

@interface MCUnCertifiedViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *cusTableView;
@property (assign, nonatomic) BOOL didSetupConstraints;

@property (strong, nonatomic) MCCertifiedTopCell *topCell;

@end

@implementation MCUnCertifiedViewController

#pragma mark - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"详情";
    [self.view addSubview:self.cusTableView];
    
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
    if (!self.didSetupConstraints) {
        WS(ws);
        [self.cusTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(ws.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }
    [super updateViewConstraints];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    switch (indexPath.section) {
        case 0:
        {
            UINib *registerNib = [UINib nibWithNibName:UNCERTIFIED_TOP_CELL bundle:nil];
            [tableView registerNib:registerNib forCellReuseIdentifier:UNCERTIFIED_TOP_CELL];
            self.topCell = [tableView dequeueReusableCellWithIdentifier:UNCERTIFIED_TOP_CELL forIndexPath:indexPath];
            cell = self.topCell;
        }
            break;
        case 1:
        {
            UINib *registerNib = [UINib nibWithNibName:UNCERTIFIED_SEC_CELL bundle:nil];
            [tableView registerNib:registerNib forCellReuseIdentifier:UNCERTIFIED_SEC_CELL];
            cell = [tableView dequeueReusableCellWithIdentifier:UNCERTIFIED_SEC_CELL forIndexPath:indexPath];
        }
            break;
        case 2:
        {
            
        }
            break;
            
        default:
            break;
    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            return kDeviceWidth * 0.5 +  55;
        }
            break;
        case 1:
            return 130;
            break;
        case 2:
            return 90;
            break;
        default:
            break;
    }
    return 0;

}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 2) {
        return 0;
    }
    return 8;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *cusFootV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, 8)];
    cusFootV.backgroundColor = [UIColor lightGrayColor];
    return cusFootV;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat navHeight = self.navigationController.navigationBar.height;
    CGFloat statusHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    
    CGFloat originX = navHeight + statusHeight;
    
    if (scrollView.contentOffset.y <= -originX) {
        self.topCell.imgVTop.frame = CGRectMake((originX + scrollView.contentOffset.y) * 0.5, originX + scrollView.contentOffset.y, kDeviceWidth - (originX + scrollView.contentOffset.y), kDeviceWidth * 0.5 - (originX + scrollView.contentOffset.y));
    }
}

#pragma mark - getters and setters
- (UITableView *)cusTableView
{
    if (!_cusTableView) {
        _cusTableView = [[UITableView alloc]init];
        _cusTableView.delegate = self;
        _cusTableView.dataSource = self;
    }
    return _cusTableView;
}

@end
