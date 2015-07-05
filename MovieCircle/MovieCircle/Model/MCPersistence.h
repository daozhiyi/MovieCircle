//
//  MCPersistence.h
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCModel.h"
@interface MCPersistence : NSObject

DEF_SINGLETON(MCPersistence)

- (void)archiveModel:(MCModel *)model;
- (MCModel *)unArchiveModelForKey:(NSString *)key;
- (void)archiveObject:(id)object forKey:(NSString *)key;
- (id)unArchiveObjectForKey:(NSString *)key;

@end
