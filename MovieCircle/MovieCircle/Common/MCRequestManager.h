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
/**
 *  商品大分类（识影）
 *
 */
-(void)goodsBigCategoryWithSuccess:(void (^)(id data))success
                failure:(void (^)(NSError *error))failure;
/**
 *  商品小分类（识影）
 *
 */
- (void)goodsSmallCategoryWithBigCategoryId:(NSString *)bigCategoryId
                                    success:(void (^)(id data))success
                                    failure:(void (^)(NSError *error))failure;
/**
 *  获取商品列表
 *
 *  @param bigCategoryName   大分类名称
 *  @param smallCategoryName 小分类名称
 *  @param success           成功回调
 *  @param failure           失败回调
 */
- (void)achieveGoodListByBigCategoryName:(NSString *)bigCategoryName
                       smallCategoryName:(NSString *)smallCategoryName
                                    page:(NSInteger)page
                               pageCount:(NSInteger)pageCount
                                 success:(void (^)(id data))success
                                 failure:(void (^)(NSError *error))failure;

//查询个人资料
-(void)searchUserInfoWithUserID:(NSString *)userid
                        success:(void (^)(id data))success
                        failure:(void (^)(NSError *error))failure;

//保存个人资料
-(void)saveUserInfoWithUserID:(NSString *)userid
                user_nicename:(NSString *)user_nicename
                    real_name:(NSString *)real_name
                          sex:(NSString *)sex
                     birthday:(NSString *)birthday;
@end

