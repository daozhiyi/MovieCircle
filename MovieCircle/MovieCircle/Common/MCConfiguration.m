//
//  MCConfiguration.m
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCConfiguration.h"

@implementation MCConfiguration
IMP_SINGLETON(MCConfiguration)

- (id)init
{
    if (self = [super init]) {
#if 1
        
        //测试版
        _httpHost = kDebugURL;
        
#else
        //正式版
        _httpHost = kReleaseURL;
        
#endif
        _user = [[NSUserDefaults standardUserDefaults] objectForKey:kDefaultKeyCurrentUser];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleMemoryWarning:) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
    }
    
    //_httpHost保存在本地
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:_httpHost forKey:@"httpHost"];
    
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)handleMemoryWarning:(id)sender
{
    [self saveCurrentUserData];
}


- (MCUserInfo *)userInfo
{
    if (!_userInfo) {
        _userInfo = (MCUserInfo *)[[MCPersistence sharedInstance] unArchiveModelForKey:self.user];
    }
    return _userInfo;
}

- (void)setUser:(NSString *)user
{
    if (CheckValidString(user) && ![user isEqualToString:_user]) {
        _user = user;
        [[NSUserDefaults standardUserDefaults] setObject:_user forKey:kDefaultKeyCurrentUser];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (void)saveCurrentUserData
{
    if (_userInfo) {
        [[MCPersistence sharedInstance] archiveModel:_userInfo];
    }
    
}


#pragma mark - url host

//登录
- (NSString *)registHost
{
    return [_httpHost stringByAppendingString:@"/app/security/regist"];
}

-(NSString *)openCitiesHost
{
    return @"http://182.92.103.164:9000/yingshiquanApp/index.php?g=Portal&m=common&a=goodsSmallCategory";
//    return [_httpHost stringByAppendingString:@"/app/task/open-cities"];
}

@end