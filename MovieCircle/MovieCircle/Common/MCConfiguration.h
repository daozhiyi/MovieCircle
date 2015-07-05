//
//  MCConfiguration.h
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCConfiguration : NSObject
DEF_SINGLETON(MCConfiguration)

@property (nonatomic, copy) NSString *user;
@property (strong, nonatomic) MCUserInfo *userInfo;



// host url
@property (nonatomic, copy) NSString *httpHost;  //请求地址
@property (strong, nonatomic) NSString *registHost; //post   注册
@property (strong, nonatomic) NSString *openCitiesHost;

@end
