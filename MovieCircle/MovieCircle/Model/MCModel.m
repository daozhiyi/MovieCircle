//
//  MCModel.m
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCModel.h"

@implementation MCModel

- (id)copyWithZone:(NSZone *)zone
{
    MCModel *copy = [[[self class] allocWithZone:zone] init];
    
    return copy;
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        self.idStr = [decoder decodeObjectForKey:kDataKeyId];
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.idStr forKey:kDataKeyId];
}

- (void)parseModelFrom:(id)data
{
    
}

@end

