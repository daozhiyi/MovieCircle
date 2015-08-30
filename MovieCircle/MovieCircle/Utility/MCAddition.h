//
//  MCAddition.h
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface MCAddition : NSObject

@end

@interface NSString (MCString)
- (BOOL)containsString:(NSString *)string options:(NSStringCompareOptions)options;
- (BOOL)containsString:(NSString *)string;
- (NSString *)urlencode;
- (NSString *)urldecode;
- (NSString *)imageUrlencode;
- (NSString *)md5;
@end

@interface NSURL (MCURL)
- (NSDictionary *)params;
- (NSString *)protocol;
- (NSURL *)addParams:(NSDictionary*)params;

@end

@interface NSArray (SafeUtil)
- (id)safeObjectAtIndex:(NSUInteger)index;

- (NSArray *)uniqueArray;

- (NSArray *)randomArray;
@end

@interface NSMutableArray (SafeUtil)
- (void)safeAddObject:(id)object;

- (void)uniqueAddObject:(id)objcet;

- (void)safeInsertObject:(id)anObject atIndex:(NSUInteger)index;

- (void)safeAddNilObject;

@end

@interface NSMutableDictionary (SafeUtil)
- (void)safeSetObject:(id)anObject forKey:(id)aKey;

- (void)safeSetValue:(id)value forKey:(NSString *)key;

- (void)safesetNilObject:(id)anObject forKey:(id)aKey;

- (void)safeSetNilValue:(id)value forKey:(NSString *)key;

//Important Raises an NSInvalidArgumentException if aKey is nil.
- (void)safeRemoveObjectForKey:(id)aKey;
@end


@interface UIView (Geometry)
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@end
