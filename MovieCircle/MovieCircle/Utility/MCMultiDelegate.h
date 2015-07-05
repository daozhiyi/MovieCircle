//
//  MCMultiDelegate.h
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCMultiDelegate : NSObject

@property (strong, nonatomic) id multicastDelegate;

- (void)addDelegate:(id)delegate;

- (void)addDelegate:(id)delegate
      delegateQueue:(dispatch_queue_t)delegateQueue;

- (void)removeDelegate:(id)delegate
         delegateQueue:(dispatch_queue_t)delegateQueue;

- (void)removeDelegate:(id)delegate;

- (void)removeAllDelegates;

@end
