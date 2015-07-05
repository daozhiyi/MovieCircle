//
//  MCRequestManager.h
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFHTTPRequestOperationManager.h>
#import "MCUrlHandler.h"

@interface MCRequestManager : NSObject

DEF_SINGLETON(MCRequestManager)
@property (strong, nonatomic) AFHTTPRequestOperationManager *operationManager;


//========================= POST =========================

//城市列表
- (void)getOpenCitiesSucess:(void (^)(NSString *data))success
//                  exception:(void (^)(NSString *message))exception
                    failure:(void (^)(NSError *error))failure;
@end

