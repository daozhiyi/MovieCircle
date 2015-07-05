//
//  MCImageCache.h
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCImageCache : NSObject

DEF_SINGLETON(MCImageCache)
@property (strong, nonatomic) NSMutableDictionary *imageCacheDictionary;

- (UIImage *)imageNamed:(NSString *)imageName;
- (void)clearCache;

@end
