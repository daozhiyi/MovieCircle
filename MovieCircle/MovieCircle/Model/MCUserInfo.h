//
//  MCUserInfo.h
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCModel.h"

@interface MCUserInfo : MCModel

@property (strong, nonatomic) NSString *mobile;
@property (strong, nonatomic) NSString *password;
@property (strong, nonatomic) NSString *captcha;
@property (nonatomic) BOOL isLogin;
@property (strong, nonatomic) NSMutableArray *orderList;
@property (strong, nonatomic) NSMutableArray *couponList;

@property (nonatomic, retain) NSString *userToken;

@end
