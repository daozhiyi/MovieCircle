//
//  MCMultiDelegate.m
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCMultiDelegate.h"
#import "GCDMulticastDelegate.h"

@implementation MCMultiDelegate

- (id)init
{
    if (self = [super init]) {
        _multicastDelegate = [[GCDMulticastDelegate alloc] init];
    }
    return self;
}

- (void)addDelegate:(id)delegate
{
    if ([self checkDelegate:delegate]) {
        return;
    }
    
    [_multicastDelegate addDelegate:delegate
                      delegateQueue:dispatch_get_main_queue()];
}

- (void)addDelegate:(id)delegate
      delegateQueue:(dispatch_queue_t)delegateQueue;
{
    if ([self checkDelegate:delegate]) {
        return;
    }
    
    [self checkDelegate:delegate];
    [_multicastDelegate addDelegate:delegate
                      delegateQueue:delegateQueue];
}

- (void)removeDelegate:(id)delegate
         delegateQueue:(dispatch_queue_t)delegateQueue
{
    [_multicastDelegate removeDelegate:delegate
                         delegateQueue:delegateQueue];
}

- (void)removeDelegate:(id)delegate
{
    [_multicastDelegate removeDelegate:delegate];
}

- (void)removeAllDelegates
{
    [_multicastDelegate removeAllDelegates];
}

- (BOOL)checkDelegate:(id)delegate
{
    BOOL result = NO;
    
    if ([_multicastDelegate countForObject:delegate] >= 1) {
        result = YES;
    }
    return result;
}


@end
