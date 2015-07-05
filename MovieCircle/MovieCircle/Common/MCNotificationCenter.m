//
//  MCNotificationCenter.m
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCNotificationCenter.h"

@implementation MCNotificationCenter

IMP_SINGLETON(MCNotificationCenter)

- (id)defaultCenter
{
    return self.multicastDelegate;
}

@end
