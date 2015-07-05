//
//  MCRequestManager.m
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#define kReturnStatus                           (@"status")
#define kReturnOK                               (@"OK")
#define kReturnERR                              (@"ER")
#define kReturnMsg                              (@"errMsg")
#define kReturnData                             (@"data")

#import "MCRequestManager.h"

@implementation MCRequestManager

IMP_SINGLETON(MCRequestManager)

- (id)init
{
    NSString *httpHost = [MCConfiguration sharedInstance].httpHost;
    NSURL *baseURL = [NSURL URLWithString:httpHost];
    if (self = [super init]) {
        _operationManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
    }
    return self;
}

/**
 *  注册例子
 *
 *  @param success   成功
 *  @param failure   请求失败
 */

- (void)getOpenCitiesSucess:(void (^)(NSString *data))success
//                  exception:(void (^)(NSString *message))exception
                    failure:(void (^)(NSError *error))failure
{
    NSString *url = [[MCConfiguration sharedInstance] openCitiesHost];
//    NSDictionary *params = @{@"apiVersion":@"v2",
//                             @"version":@"2.1",
//                             };
    [self requestWithUrl:url
                  method:@"POST"
                  params:nil
                 success:success
//               exception:exception
                 failure:failure];
}



#pragma mark - private
- (void)requestWithUrl:(NSString *)url
                method:(NSString *)method
                params:(NSDictionary *)params
               success:(void (^)(NSString * data))success
//             exception:(void (^)(NSString *message))exception
               failure:(void (^)(NSError *error))failure
{
    //    __block NSMutableDictionary *paramDic = [[NSMutableDictionary alloc] init];
    //    [paramDic safeSetObject:url forKey:kUMeng_networkUrl];
    //    [paramDic safeSetObject:params forKey:kUMeng_networkParams];
    
    /**
     *  请求header
     */
//    if (CheckValidString([MCConfiguration sharedInstance].userInfo.userToken)) {
//        [_operationManager.requestSerializer setValue:[NSString stringWithFormat:@"Basic %@",[MCConfiguration sharedInstance].userInfo.userToken] forHTTPHeaderField:@"Authorization"];
//    }
//    else{
//        [_operationManager.requestSerializer setValue:nil forHTTPHeaderField:@"Authorization"];
//    }
    
    //post和get请求
    if ([method isEqualToString:@"GET"]) {
        [_operationManager GET:url
                    parameters:nil
                       success:^(AFHTTPRequestOperation *operation, id responseObject) {
                           success(responseObject);
//                           if ([[responseObject objectForKey:kReturnStatus] isEqualToString:kReturnOK]) {
//                               if (success) {
//                                   success([responseObject objectForKey:kReturnData]);
//                               }
//                               //                               [MobClick event:kUMeng_networkSucess attributes:paramDic];
//                           }
//                           else {
//                               if (exception) {
//                                   exception([responseObject objectForKey:kReturnMsg]);
//                               }
//                               //                               [paramDic safeSetObject:[responseObject objectForKey:kReturnMsg] forKey:kUMeng_networkErrMsg];
//                               //                               [MobClick event:kUMeng_networkFail attributes:paramDic];
//                           }
                       }                       failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                           if (failure) {
                               failure(error);
                           }
                           //                           [paramDic safeSetObject:[error description] forKey:kUMeng_networkErrMsg];
                           //                           [MobClick event:kUMeng_networkFail attributes:paramDic];
                       }];
    }
    else {
        
        
        [_operationManager POST:url
                     parameters:params
                        success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                            DLog(@"%@",responseObject);
                            success(responseObject);
//                            if ([[responseObject objectForKey:kReturnStatus] isEqualToString:kReturnOK]) {
//                                if (success) {
//                                    success([responseObject objectForKey:kReturnData]);
//                                }
//                                
//                                //                                [MobClick event:kUMeng_networkSucess attributes:paramDic];
//                            }
//                            else {
//                                if (exception) {
//                                    exception([responseObject objectForKey:kReturnMsg]);
//                                }
//                                //                                [paramDic safeSetObject:[responseObject objectForKey:kReturnMsg] forKey:kUMeng_networkErrMsg];
//                                //                                [MobClick event:kUMeng_networkFail attributes:paramDic];
//                            }
                        }
                        failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                            if (failure) {
                                failure(error);
                            }
                            //                            [paramDic safeSetObject:[error description] forKey:kUMeng_networkErrMsg];
                            //                            [MobClick event:kUMeng_networkFail attributes:paramDic];
                        }];
    }
    
}

@end
