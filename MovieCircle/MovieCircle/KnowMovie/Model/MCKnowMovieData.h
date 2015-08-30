//
//  MCKnowMovieData.h
//  MovieCircle
//
//  Created by zhouyongchao on 15/8/4.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCKnowMovieData : NSObject
/**
 *  认证信息主键
 */
@property (assign, nonatomic) NSInteger movieId;
/**
 *  认证名称
 */
@property (strong, nonatomic) NSString *name;
/**
 *  发布用户Id
 */
@property (assign, nonatomic) NSInteger userid;
/**
 *  认证类型
 */
@property (strong, nonatomic) NSString *type;
/**
 *  截止时间
 */
@property (strong, nonatomic) NSString *endtime;
/**
 *  奖励人气
 */
@property (assign, nonatomic) NSInteger rewardsentiment;
/**
 *  奖励影币
 */
@property (assign, nonatomic) NSInteger rewardmoviecoin;
/**
 *  认证条件
 */
@property (strong, nonatomic) NSString *condition;
/**
 *  电影Id
 */
@property (assign, nonatomic) NSInteger movieid;
/**
 *  语言
 */
@property (strong, nonatomic) NSString *language;
/**
 *  图片2
 */
@property (strong, nonatomic) NSString *picture2;
/**
 *  大分类
 */
@property (strong, nonatomic) NSString *smallcategory;
/**
 *  小分类
 */
@property (strong, nonatomic) NSString *bigcategory;
/**
 *  商品url
 */
@property (strong, nonatomic) NSString *url;
/**
 *  商品描述
 */
@property (strong, nonatomic) NSString *des;
/**
 *  商品名称
 */
@property (strong, nonatomic) NSString *goodsname;
/**
 *  商品价格
 */
@property (assign, nonatomic) NSInteger price;
/**
 *  是否通过
 */
@property (strong, nonatomic) NSString *status;
/**
 *  图片
 */
@property (strong, nonatomic) NSString *picture;

@end
