//
//  MCUserInfo.m
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCUserInfo.h"

@implementation MCUserInfo

- (id)copyWithZone:(NSZone *)zone
{
    MCModel *copy = [[[self class] allocWithZone:zone] init];
    
    return copy;
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super initWithCoder:decoder]) {
        self.mobile = [decoder decodeObjectForKey:kKEYMobile];
        self.password = [decoder decodeObjectForKey:kKEYPassword];
        self.isLogin = [[decoder decodeObjectForKey:kKEYIsLogin] boolValue];
        self.userToken = [decoder decodeObjectForKey:kKEYToken];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [super encodeWithCoder:encoder];
    [encoder encodeObject:self.mobile forKey:kKEYMobile];
    [encoder encodeObject:self.password forKey:kKEYPassword];
    [encoder encodeObject:[NSNumber numberWithBool:self.isLogin] forKey:kKEYIsLogin];
    [encoder encodeObject:self.userToken forKey:kKEYToken];
}

- (NSString *)idStr
{
    return [_mobile md5];
}

- (NSMutableArray *)orderList
{
    if (!_orderList) {
        _orderList = [[NSMutableArray alloc] init];
    }
    return _orderList;
}

-(NSMutableArray *)couponList
{
    if (!_couponList) {
        _couponList = [[NSMutableArray alloc]init];
    }
    return _couponList;
}


@end
