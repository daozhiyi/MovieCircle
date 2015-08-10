//
//  MCCertifiedViewController.m
//  MovieCircle
//
//  Created by zhouyongchao on 15/8/7.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCCertifiedViewController.h"

#import "MCCertifiedTopCell.h"
#import "MCCertifiedSecCell.h"
#import "MCCertifiedThreeCell.h"

#import <ShareSDK/ShareSDK.h>

#define CERTIFIED_TOP_CELLIDENTIFY @"MCCertifiedTopCell"
#define CERTIFIED_SEC_CELLIDENTIFY @"MCCertifiedSecCell"
#define CERTIFIED_THREE_CELLIDENTIFY @"MCCertifiedThreeCell"

@interface MCCertifiedViewController ()<UITableViewDataSource,UITableViewDelegate,MCCertifiedSecCellDelegate>

@property (strong, nonatomic) UITableView *cusTableView;
@property (assign, nonatomic) BOOL didSetupConstraints;

@end

@implementation MCCertifiedViewController

#pragma mark - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    self.title = @"详情";
    self.view.backgroundColor = [UIColor whiteColor];
    
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0 || section == 1) {
        return 1;
    } else {
        return 5;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    switch (indexPath.section) {
        case 0:
        {
            UINib *registerNib = [UINib nibWithNibName:CERTIFIED_TOP_CELLIDENTIFY bundle:nil];
            [_cusTableView registerNib:registerNib forCellReuseIdentifier:CERTIFIED_TOP_CELLIDENTIFY];
            cell = [tableView dequeueReusableCellWithIdentifier:CERTIFIED_TOP_CELLIDENTIFY forIndexPath:indexPath];
        }
            break;
        case 1:
        {
            UINib *registerNib = [UINib nibWithNibName:CERTIFIED_SEC_CELLIDENTIFY bundle:nil];
            [_cusTableView registerNib:registerNib forCellReuseIdentifier:CERTIFIED_SEC_CELLIDENTIFY];
            MCCertifiedSecCell *secCell = [tableView dequeueReusableCellWithIdentifier:CERTIFIED_SEC_CELLIDENTIFY forIndexPath:indexPath];
            secCell.delegate = self;
            cell = secCell;
        }
            break;
        case 2:
        {
            UINib *registerNib = [UINib nibWithNibName:CERTIFIED_THREE_CELLIDENTIFY bundle:nil];
            [_cusTableView registerNib:registerNib forCellReuseIdentifier:CERTIFIED_THREE_CELLIDENTIFY];
            cell = [tableView dequeueReusableCellWithIdentifier:CERTIFIED_THREE_CELLIDENTIFY forIndexPath:indexPath];
        }
            break;
        default:
            break;
    }
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            return 215;
            break;
        case 1:
            return 125;
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
    UIView *cusFootV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, 10)];
    cusFootV.backgroundColor = [UIColor lightGrayColor];
    return cusFootV;
}

#pragma mark - MCCertifiedSecCellDelegate
- (void)btnShareClick:(UIButton *)sender
{
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"ShareSDK" ofType:@"png"];
    //构造分享内容
    id<ISSContent> publishContent = [ShareSDK content:@"分享内容"
                                       defaultContent:@"测试一下"
                                                image:[ShareSDK imageWithPath:imagePath]
                                                title:@"ShareSDK"
                                                  url:@"http://www.mob.com"
                                          description:@"这是一条测试信息"
                                            mediaType:SSPublishContentMediaTypeNews];
    //创建弹出菜单容器
    id<ISSContainer> container = [ShareSDK container];
    [container setIPadContainerWithView:sender arrowDirect:UIPopoverArrowDirectionUp];
    
    //弹出分享菜单
    [ShareSDK showShareActionSheet:container
                         shareList:nil
                           content:publishContent
                     statusBarTips:YES
                       authOptions:nil
                      shareOptions:nil
                            result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                
                                if (state == SSResponseStateSuccess)
                                {
                                    NSLog(NSLocalizedString(@"TEXT_ShARE_SUC", @"分享成功"));
                                }
                                else if (state == SSResponseStateFail)
                                {
                                    NSLog(NSLocalizedString(@"TEXT_ShARE_FAI", @"分享失败,错误码:%d,错误描述:%@"), [error errorCode], [error errorDescription]);
                                }
                            }];
}

#pragma mark - getter and setter
- (UITableView *)cusTableView
{
    if (!_cusTableView) {
        _cusTableView = [[UITableView alloc]init];
        _cusTableView.delegate = self;
        _cusTableView.dataSource = self;
        _cusTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _cusTableView;
}

@end
