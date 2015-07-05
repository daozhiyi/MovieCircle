//
//  MCPersistence.m
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCPersistence.h"

@interface MCPersistence ()
@property (strong, nonatomic) NSString *persistenceDir;

@end

@implementation MCPersistence

IMP_SINGLETON(MCPersistence)

- (id)init
{
    if (self = [super init]) {
        self.persistenceDir = [PATH_DOCUMENT stringByAppendingPathComponent:@"persistence"];
        [self checkPersistenceDir];
    }
    return self;
}

- (void)archiveModel:(MCModel *)model
{
    if (CheckValidString(model.idStr)) {
        NSString *path = [self.persistenceDir stringByAppendingPathComponent:model.idStr];
        [NSKeyedArchiver archiveRootObject:model toFile:path];
    }
}

- (MCModel *)unArchiveModelForKey:(NSString *)key
{
    MCModel *model = nil;
    if (CheckValidString(key)) {
        NSString *path = [self.persistenceDir stringByAppendingPathComponent:key];
        id unArObject = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        if (unArObject && [unArObject isKindOfClass:[MCModel class]]) {
            model = unArObject;
        }
    }
    return model;
}

- (void)archiveObject:(id)object forKey:(NSString *)key
{
    NSString *path = [self.persistenceDir stringByAppendingPathComponent:key];
    [NSKeyedArchiver archiveRootObject:object toFile:path];
}

- (id)unArchiveObjectForKey:(NSString *)key
{
    id object = nil;
    if (CheckValidString(key)) {
        NSString *path = [self.persistenceDir stringByAppendingPathComponent:key];
        object = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    }
    return object;
}

- (void)checkPersistenceDir
{
    if (![[NSFileManager defaultManager] fileExistsAtPath:self.persistenceDir]) {
        NSError *error;
        if (![[NSFileManager defaultManager] createDirectoryAtPath:self.persistenceDir
                                       withIntermediateDirectories:YES
                                                        attributes:nil
                                                             error:&error]) {
            DLog(@"Create directory error: %@", error);
        }
    }
}

@end
