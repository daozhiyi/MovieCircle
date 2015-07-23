//
//  MCNearbyViewController.h
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCBaseViewController.h"

@interface MCNearbyViewController : MCBaseViewController<BMKMapViewDelegate,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

//地图
@property (nonatomic, retain) BMKMapView *mapView;

@property (nonatomic, retain) UITableView *nearbyTable;//附近表

@property (nonatomic, retain) UITextField *nearbyTextField;//输入框

@property (nonatomic, retain) UIButton *searchButton; //搜索按钮

@property (nonatomic, retain) UIButton *tabbarSelected;//tabbar选中按钮

@property (nonatomic, retain) UIButton *leftButtonSelected;//导航栏左侧按钮选中

@end
