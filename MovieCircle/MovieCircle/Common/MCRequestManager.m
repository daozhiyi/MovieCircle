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


//商品大分类接口
-(void)goodsBigCategoryWithSuccess:(void (^)(id data))success
                           failure:(void (^)(NSError *error))failure
{
    NSString *url = [[MCConfiguration sharedInstance] bigCategory];
    
    [self requestWithUrl:url
                  method:@"POST"
                  params:nil
                 success:success
                 failure:failure];
}

//查询个人资料
-(void)searchUserInfoWithUserID:(NSString *)userid
                        success:(void (^)(id data))success
                        failure:(void (^)(NSError *error))failure
{
    NSString *url = [[MCConfiguration sharedInstance] searchUserInfo];
        NSDictionary *params = @{@"userid":userid,
                                 };
    [self requestWithUrl:url
                  method:@"POST"
                  params:params
                 success:success
                 failure:failure];

}

//保存个人资料
-(void)saveUserInfoWithUserID:(NSString *)userid
                user_nicename:(NSString *)user_nicename
                    real_name:(NSString *)real_name
                          sex:(NSString *)sex
                     birthday:(NSString *)birthday
{

}



#pragma mark - private
- (void)requestWithUrl:(NSString *)url
                method:(NSString *)method
                params:(NSDictionary *)params
               success:(void (^)(id data))success
//             exception:(void (^)(NSString *message))exception
               failure:(void (^)(NSError *error))failure
{
    
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
