//
//  MCNotificationCenter.h
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCMultiDelegate.h"


@protocol SSNotificationProtocol <NSObject>

@optional

//注册成功
- (void)registDidFinish;

@end


@interface MCNotificationCenter : MCMultiDelegate

DEF_SINGLETON(MCNotificationCenter)

- (id)defaultCenter;

@end

