//
//  MCKnowMovieViewController.m
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCKnowMovieViewController.h"
#import "HTHorizontalSelectionList.h"
#import "MCKnowMovieData.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"

@interface MCKnowMovieViewController ()<HTHorizontalSelectionListDataSource,HTHorizontalSelectionListDelegate>

@property (strong, nonatomic) UIView *topContainer;
@property (strong, nonatomic) UITableView *knowMovieTable;//识影表

@property (strong, nonatomic) UIView *statusV;
@property (strong, nonatomic) HTHorizontalSelectionList *topSelectionList;
@property (strong, nonatomic) HTHorizontalSelectionList *secSelectionList;

@property (strong, nonatomic) NSArray *topTitleList;
@property (strong, nonatomic) NSArray *secTitleList;
@property (strong, nonatomic) NSMutableArray *goodInfoList;//商品最终展示列表
@property (strong, nonatomic) NSArray *dataArr;//从服务器获得的商品数据

@property (strong, nonatomic) NSString *selectedBigCategoryId;
@property (strong, nonatomic) NSString *selectedBigCategoryName;
@property (strong, nonatomic) NSString *selectedSmallCategoryName;

@property (assign, nonatomic) NSInteger page;
@property (assign, nonatomic) NSInteger pageCount;
@property (assign, nonatomic) BOOL hasMore;

@property (assign, nonatomic) BOOL didSetupConstraints;

@end

@implementation MCKnowMovieViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    [self setNeedsStatusBarAppearanceUpdate];

    [self.view addSubview:self.statusV];
    [self.view addSubview:self.topSelectionList];
    
    [self.view addSubview:self.secSelectionList];
    [self.view addSubview:self.knowMovieTable];
    
    [self.view setNeedsUpdateConstraints];
    

    [self initRequest];
}


- (void)updateViewConstraints
{
    if (!self.didSetupConstraints) {
        WS(ws);
        
        [self.secSelectionList mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(ws.topSelectionList.mas_bottom);
            make.leading.equalTo(ws.view);
            make.trailing.equalTo(ws.view);
            make.height.equalTo(@40);
        }];
        
        
        
        [self.knowMovieTable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(ws.secSelectionList.mas_bottom);
            make.leading.equalTo(ws.view);
            make.trailing.equalTo(ws.view);
            make.bottom.equalTo(ws.view);
        }];
    }
    [super updateViewConstraints];
}

#pragma mark - 改变状态栏颜色
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - 下拉刷新集成
- (void)setupRefreshView
{
    WS(ws);
    self.knowMovieTable.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        ws.page = 1;
        [ws initTableViewSource];
    }];
    
    [self.knowMovieTable.header beginRefreshing];
    
    self.knowMovieTable.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        if (ws.hasMore) {
            [ws initTableViewSource];
        } else {
            [ws.knowMovieTable.footer noticeNoMoreData];
        }
    }];
}

#pragma mark - 网络请求

- (MBProgressHUD *)hudInit
{
    __block MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"加载中";
    return hud;
}

- (void)initRequest
{
    [self initBigCategory:[self hudInit]];
}

-(void)initBigCategory:(MBProgressHUD *)hud
{
    [[MCRequestManager sharedInstance]goodsBigCategoryWithSuccess:^(id data) {
        self.topTitleList = data;
        [self.topSelectionList reloadData];
        if ([self.topTitleList count]) {
            self.selectedBigCategoryId = [self.topTitleList[0] valueForKey:@"id"];
            self.selectedBigCategoryName = [self.topTitleList[0] valueForKey:@"name"];
        }
        [self initSmallCategory:hud];
    } failure:^(NSError *error) {
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"大分类加载失败，请重试";
        [hud hide:YES afterDelay:1];
    }];
}

- (void)initSmallCategory:(MBProgressHUD *)hud
{
    [[MCRequestManager sharedInstance]goodsSmallCategoryWithBigCategoryId:self.selectedBigCategoryId success:^(id data) {
        self.secTitleList = data;
        [self.secSelectionList reloadData];
        if ([self.secTitleList count]) {
            self.selectedSmallCategoryName = [self.secTitleList[0] valueForKey:@"name"];
        }
        [hud hide:YES afterDelay:.5];
        [self setupRefreshView];
    } failure:^(NSError *error) {
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"小分类加载失败，请重试";
        [hud hide:YES afterDelay:1];
    }];
}

- (void)initTableViewSource
{
    [[MCRequestManager sharedInstance]achieveGoodListByBigCategoryName:self.selectedBigCategoryName smallCategoryName:self.selectedSmallCategoryName page:self.page pageCount:self.pageCount success:^(id data) {
        self.dataArr = [MCKnowMovieData objectArrayWithKeyValuesArray:data];
        
        if (self.page == 1) {
            [self.goodInfoList removeAllObjects];
        }
        
        if ([self.dataArr count]) {
            self.hasMore = true;
            [self.goodInfoList addObjectsFromArray:self.dataArr];
        } else {
            self.hasMore = false;
        }
        [self.knowMovieTable reloadData];
        
        self.page++;
        
        [self.knowMovieTable.header endRefreshing];
        [self.knowMovieTable.footer endRefreshing];
    } failure:^(NSError *error) {
        MBProgressHUD *hud = [self hudInit];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"列表加载失败，请重试";
        [hud hide:YES afterDelay:1];
    }];
}

//http://182.92.222.50/index.php?s=App/get_list&limit=6
//http://182.92.103.164:9000/yingshiquanApp/index.php?g=Portal&m=common&a=goodsSmallCategory

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.goodInfoList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        //大图
        UIImageView *movieGoodsImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth , 180)];
        NSString *bigImageUrl = [IMAGEURL_HOST stringByAppendingString:[((MCKnowMovieData *)self.goodInfoList[indexPath.row]).picture imageUrlencode]];
        [movieGoodsImage sd_setImageWithURL:[NSURL URLWithString:bigImageUrl] placeholderImage:[UIImage imageNamed:@"yingshi1"]];
        [cell.contentView addSubview:movieGoodsImage];
        
        //同款
        UIImageView *similarImage = [[UIImageView alloc]initWithFrame:CGRectMake(30, 250 - 100, 70, 90)];

        NSString *smallImageUrl = [IMAGEURL_HOST stringByAppendingString:[((MCKnowMovieData *)self.goodInfoList[indexPath.row]).picture2 imageUrlencode]];
        [similarImage sd_setImageWithURL:[NSURL URLWithString:smallImageUrl] placeholderImage:[UIImage imageNamed:@"yingshi2"]];
        [cell.contentView addSubview:similarImage];
        
        //电影名字
        UILabel *movieName = [[UILabel alloc]initWithFrame:CGRectMake(kDeviceWidth/2, movieGoodsImage.bottom, kDeviceWidth/2, 30)];
        movieName.text = ((MCKnowMovieData *)self.goodInfoList[indexPath.row]).goodsname;
        [cell.contentView addSubview:movieName];
        
        //同款描述
        UILabel *similarLabel = [[UILabel alloc]initWithFrame:CGRectMake(movieName.left, movieName.bottom, movieName.width, movieName.height)];
        similarLabel.text = ((MCKnowMovieData *)self.goodInfoList[indexPath.row]).des;
        similarLabel.textColor = [UIColor grayColor];
        similarLabel.font = [UIFont systemFontOfSize:15];
        [cell.contentView addSubview:similarLabel];
    }
    return cell;
}

#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 250;
}



#pragma mark - HTHorizontalSelectionListDataSource
- (NSInteger)numberOfItemsInSelectionList:(HTHorizontalSelectionList *)selectionList
{
    if (selectionList.tag == 1) {
        return self.topTitleList.count;
    } else {
        return self.secTitleList.count;
    }
}

- (NSString *)selectionList:(HTHorizontalSelectionList *)selectionList titleForItemWithIndex:(NSInteger)index
{
    if (selectionList.tag == 1) {
        return [self.topTitleList[index] objectForKey:@"name"];
    } else  {
        return [self.secTitleList[index] objectForKey:@"name"];
    }
}

#pragma mark - HTHorizontalSelectionListDelegate
- (void)selectionList:(HTHorizontalSelectionList *)selectionList didSelectButtonWithIndex:(NSInteger)index
{
    self.page = 1;
    [self.goodInfoList removeAllObjects];
    
    if (selectionList.tag == 1) {
        NSLog(@"%@",self.topTitleList[index]);
        self.selectedBigCategoryId = [self.topTitleList[index] valueForKey:@"id"];
        self.selectedBigCategoryName = [self.topTitleList[index] valueForKey:@"name"];
        [self initSmallCategory:[self hudInit]];
    } else {
        NSLog(@"%@",self.secTitleList[index]);
        self.selectedSmallCategoryName = [self.secTitleList[index] valueForKey:@"name"];
        [self setupRefreshView];
    }
    
}

#pragma mark - getter and setter

- (UIView *)topContainer
{
    if (!_topContainer) {
        _topContainer = [[UIView alloc]init];
    }
    return _topContainer;
}

- (UITableView *)knowMovieTable
{
    if (!_knowMovieTable) {
        _knowMovieTable = [[UITableView alloc]init];
        _knowMovieTable.dataSource = self;
        _knowMovieTable.delegate = self;
    }
    return _knowMovieTable;
}

- (UIView *)statusV
{
    if (!_statusV) {
        _statusV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, 20)];
        _statusV.backgroundColor = kNavBarColor;
    }
    return _statusV;
}

- (HTHorizontalSelectionList *)topSelectionList
{
    if (!_topSelectionList) {
        _topSelectionList = [[HTHorizontalSelectionList alloc]initWithFrame:CGRectMake(0, 20, kDeviceWidth, 44)];
        _topSelectionList.delegate = self;
        _topSelectionList.dataSource = self;
        _topSelectionList.backgroundColor = kNavBarColor;
        
        _topSelectionList.selectionIndicatorAnimationMode = HTHorizontalSelectionIndicatorAnimationModeLightBounce;
        _topSelectionList.showsEdgeFadeEffect = NO;
        
        _topSelectionList.selectionIndicatorColor = kYellowColor;
        
        [_topSelectionList setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_topSelectionList setTitleFont:[UIFont systemFontOfSize:16] forState:UIControlStateNormal];
        [_topSelectionList setTitleFont:[UIFont boldSystemFontOfSize:16] forState:UIControlStateSelected];
        [_topSelectionList setTitleFont:[UIFont boldSystemFontOfSize:16] forState:UIControlStateHighlighted];
    }
    _topSelectionList.tag = 1;
    return _topSelectionList;
}

- (HTHorizontalSelectionList *)secSelectionList
{
    if (!_secSelectionList) {
        _secSelectionList = [[HTHorizontalSelectionList alloc]initWithFrame:CGRectMake(0, 64, kDeviceWidth, 40)];
        _secSelectionList.dataSource = self;
        _secSelectionList.delegate = self;
        
        _secSelectionList.selectionIndicatorAnimationMode = HTHorizontalSelectionIndicatorAnimationModeLightBounce;
        _secSelectionList.showsEdgeFadeEffect = NO;
        _secSelectionList.bottomTrimHidden = NO;
        
        _secSelectionList.selectionIndicatorColor = kYellowColor;
        
        [_secSelectionList setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [_secSelectionList setTitleFont:[UIFont systemFontOfSize:15] forState:UIControlStateNormal];
        [_secSelectionList setTitleFont:[UIFont boldSystemFontOfSize:15] forState:UIControlStateSelected];
        [_secSelectionList setTitleFont:[UIFont boldSystemFontOfSize:15] forState:UIControlStateHighlighted];
    }
    _secSelectionList.tag = 2;
    return _secSelectionList;
}

- (NSArray *)topTitleList
{
    if (!_topTitleList) {
        _topTitleList = [NSArray array];
    }
    return _topTitleList;
}

- (NSArray *)secTitleList
{
    if (!_secTitleList) {
        _secTitleList = [NSArray array];
    }
    return _secTitleList;
}

- (NSMutableArray *)goodInfoList
{
    if (!_goodInfoList) {
        _goodInfoList = [NSMutableArray array];
    }
    return _goodInfoList;
}

- (NSInteger)pageCount
{
    if (!_pageCount) {
        _pageCount = 1;
    }
    return _pageCount;
}

@end
