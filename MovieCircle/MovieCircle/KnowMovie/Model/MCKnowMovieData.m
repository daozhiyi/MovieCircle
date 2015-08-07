//
//  MCKnowMovieData.m
//  MovieCircle
//
//  Created by zhouyongchao on 15/8/4.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCKnowMovieData.h"

@implementation MCKnowMovieData
+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"movieId":@"id",
             @"des":@"description"};
}

@end
