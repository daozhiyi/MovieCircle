//
//  MCAddition.m
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCAddition.h"
#import <CommonCrypto/CommonDigest.h>

@implementation MCAddition

@end

@implementation NSString (MCString)
- (BOOL)containsString:(NSString *)string
               options:(NSStringCompareOptions)options
{
    NSRange rng = [self rangeOfString:string options:options];
    return rng.location != NSNotFound;
}

- (BOOL)containsString:(NSString *)string
{
    return [self containsString:string options:0];
}

- (NSString *)urldecode
{
    return [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)urlencode
{
    NSString *encUrl = [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSInteger len = [encUrl length];
    const char *c;
    c = [encUrl UTF8String];
    NSString *ret = @"";
    for(int i = 0; i < len; i++) {
        switch (*c) {
            case '/':
                ret = [ret stringByAppendingString:@"%2F"];
                break;
            case '\'':
                ret = [ret stringByAppendingString:@"%27"];
                break;
            case ';':
                ret = [ret stringByAppendingString:@"%3B"];
                break;
            case '?':
                ret = [ret stringByAppendingString:@"%3F"];
                break;
            case ':':
                ret = [ret stringByAppendingString:@"%3A"];
                break;
            case '@':
                ret = [ret stringByAppendingString:@"%40"];
                break;
            case '&':
                ret = [ret stringByAppendingString:@"%26"];
                break;
            case '=':
                ret = [ret stringByAppendingString:@"%3D"];
                break;
            case '+':
                ret = [ret stringByAppendingString:@"%2B"];
                break;
            case '$':
                ret = [ret stringByAppendingString:@"%24"];
                break;
            case ',':
                ret = [ret stringByAppendingString:@"%2C"];
                break;
            case '[':
                ret = [ret stringByAppendingString:@"%5B"];
                break;
            case ']':
                ret = [ret stringByAppendingString:@"%5D"];
                break;
            case '#':
                ret = [ret stringByAppendingString:@"%23"];
                break;
            case '!':
                ret = [ret stringByAppendingString:@"%21"];
                break;
            case '(':
                ret = [ret stringByAppendingString:@"%28"];
                break;
            case ')':
                ret = [ret stringByAppendingString:@"%29"];
                break;
            case '*':
                ret = [ret stringByAppendingString:@"%2A"];
                break;
            default:
                ret = [ret stringByAppendingFormat:@"%c", *c];
        }
        c++;
    }
    
    return ret;
}

- (NSString *)imageUrlencode
{
    NSArray *strArr = [self componentsSeparatedByString:@"/"];
    NSString *lastStr = [strArr objectAtIndex:(strArr.count - 1)];
    NSInteger len = [lastStr length];
    const char *c;
    c = [lastStr UTF8String];
    NSString *result = @"";
    for (int i = 0; i < len; i++) {
        switch (*c) {
            case '{':
                result = [result stringByAppendingString:@"%7B"];
                break;
            case '}':
                result = [result stringByAppendingString:@"%7D"];
                break;
            default:
                result = [result stringByAppendingFormat:@"%c",*c];
                break;
        }
        c++;
    }
    return result;
}

- (NSString *)md5
{
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    if (cStr) {
        CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
        return [[NSString stringWithFormat:
                 @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                 result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7],
                 result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]
                 ] lowercaseString];
    }
    else {
        return nil;
    }
}

@end

@implementation NSURL (MCURL)

- (NSDictionary *)params
{
    NSMutableDictionary* pairs = [NSMutableDictionary dictionary];
    if (NSNotFound != [self.absoluteString rangeOfString:@"?"].location) {
        NSString *paramString = [self.absoluteString substringFromIndex:([self.absoluteString rangeOfString:@"?"].location + 1)];
        NSCharacterSet* delimiterSet = [NSCharacterSet characterSetWithCharactersInString:@"&"];
        NSScanner* scanner = [[NSScanner alloc] initWithString:paramString];
        while (![scanner isAtEnd]) {
            NSString* pairString = nil;
            [scanner scanUpToCharactersFromSet:delimiterSet intoString:&pairString];
            [scanner scanCharactersFromSet:delimiterSet intoString:NULL];
            NSArray* kvPair = [pairString componentsSeparatedByString:@"="];
            if (kvPair.count == 2) {
                NSString* key = [[kvPair objectAtIndex:0] urldecode];
                NSString* value = [[kvPair objectAtIndex:1] urldecode];
                [pairs setValue:value forKey:key];
            }
        }
    }
    
    return [NSDictionary dictionaryWithDictionary:pairs];
}

- (NSString *)protocol
{
    if (NSNotFound != [self.absoluteString rangeOfString:@"://"].location) {
        return [self.absoluteString substringToIndex:([self.absoluteString rangeOfString:@"://"].location)];
    }
    return @"";
}

- (NSURL *)addParams:(NSDictionary *)params
{
    NSMutableString *_add = nil;
    if (NSNotFound != [self.absoluteString rangeOfString:@"?"].location) {
        _add = [NSMutableString stringWithString:@"&"];
    }
    else {
        _add = [NSMutableString stringWithString:@"?"];
    }
    for (NSString* key in [params allKeys]) {
        if ([params objectForKey:key] && 0 < [[params objectForKey:key] length]) {
            [_add appendFormat:@"%@=%@&",key,[[params objectForKey:key] urlencode]];
        }
    }
    
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",self.absoluteString,[_add substringToIndex:[_add length] - 1]]];
}

@end

@implementation NSArray (SafeUtil)
- (id)safeObjectAtIndex:(NSUInteger)index
{
    if (index < self.count) {
        return [self objectAtIndex:index];
    }
    else {
#if DEBUG_ASSERT
        NSAssert(NO, @"数组越界");
#endif
    }
    
    return nil;
}

- (NSArray *)uniqueArray
{
    NSMutableArray *uniqeArr = [NSMutableArray array];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
     {
         if (![uniqeArr containsObject:obj]) {
             [uniqeArr safeAddObject:obj];
         }
     }];
    return uniqeArr;
}

- (NSArray *)randomArray
{
    NSMutableArray *array = [NSMutableArray arrayWithArray:self];
    NSInteger i = array.count;
    while (--i > 0) {
        int j = arc4random() % (i + 1);
        [array exchangeObjectAtIndex:i withObjectAtIndex:j];
    }
    return [NSArray arrayWithArray:array];
}

@end

@implementation NSMutableArray (SafeUtil)
- (void)uniqueAddObject:(id)objcet
{
    if (objcet && ![self containsObject:objcet]) {
        [self safeAddObject:objcet];
    }
}

- (void)safeAddObject:(id)object
{
    if (object) {
        
        [self addObject:object];
    }
    else {
#if DEBUG_ASSERT
        NSAssert(NO, @"不能添加nil Object");
#endif
    }
}

- (void)safeAddNilObject
{
    [self addObject:[NSNull null]];
}

- (void)safeInsertObject:(id)anObject atIndex:(NSUInteger)index
{
    if (anObject) {
        [self insertObject:anObject atIndex:index];
    }
    else {
#if DEBUG_ASSERT
        NSAssert(NO, @"不能添加nil Object");
#endif
    }
}

@end

@implementation NSMutableDictionary (SafeUtil)
- (void)safeSetObject:(id)anObject forKey:(id)aKey
{
    if (anObject && aKey) {
        [self setObject:anObject forKey:aKey];
    }
    else {
#if DEBUG_ASSERT
        if (anObject == nil) {
            NSAssert(NO, @"不能添加nil Object");
        }
        else if (aKey == nil) {
            NSAssert(NO, @"key不能为nil");
        }
#endif
    }
}

- (void)safeSetValue:(id)value forKey:(NSString *)key
{
    if (value && key) {
        [self setValue:value forKey:key];
    }
    else {
#if DEBUG_ASSERT
        if (value == nil) {
            NSAssert(NO, @"不能添加nil value");
        }
        else if (key == nil) {
            NSAssert(NO, @"key不能为nil");
        }
#endif
    }
}

- (void)safesetNilObject:(id)anObject forKey:(id)aKey
{
    [self setObject:[NSNull null] forKey:aKey];
}

- (void)safeSetNilValue:(id)value forKey:(NSString *)key
{
    [self setValue:[NSNull null] forKey:key];
}

- (void)safeRemoveObjectForKey:(id)aKey
{
    if (aKey) {
        [self removeObjectForKey:aKey];
    }
    else {
#if DEBUG_ASSERT
        NSAssert(NO, @"aKey不能为nil");
#endif
    }
}
@end


@implementation UIView (Geometry)
- (void)setSize:(CGSize)size;
{
    CGPoint origin = [self frame].origin;
    
    [self setFrame:CGRectMake(origin.x, origin.y, size.width, size.height)];
}

- (CGSize)size;
{
    return [self frame].size;
}

- (CGFloat)left;
{
    return CGRectGetMinX([self frame]);
}

- (void)setLeft:(CGFloat)x;
{
    CGRect frame = [self frame];
    frame.origin.x = x;
    [self setFrame:frame];
}

- (CGFloat)top;
{
    return CGRectGetMinY([self frame]);
}

- (void)setTop:(CGFloat)y;
{
    CGRect frame = [self frame];
    frame.origin.y = y;
    [self setFrame:frame];
}

- (CGFloat)right;
{
    return CGRectGetMaxX([self frame]);
}

- (void)setRight:(CGFloat)right;
{
    CGRect frame = [self frame];
    frame.origin.x = right - frame.size.width;
    
    [self setFrame:frame];
}

- (CGFloat)bottom;
{
    return CGRectGetMaxY([self frame]);
}

- (void)setBottom:(CGFloat)bottom;
{
    CGRect frame = [self frame];
    frame.origin.y = bottom - frame.size.height;
    
    [self setFrame:frame];
}

- (CGFloat)centerX;
{
    return [self center].x;
}

- (void)setCenterX:(CGFloat)centerX;
{
    [self setCenter:CGPointMake(centerX, self.center.y)];
}

- (CGFloat)centerY;
{
    return [self center].y;
}

- (void)setCenterY:(CGFloat)centerY;
{
    [self setCenter:CGPointMake(self.center.x, centerY)];
}

- (CGFloat)width;
{
    return CGRectGetWidth([self frame]);
}

- (void)setWidth:(CGFloat)width;
{
    CGRect frame = [self frame];
    frame.size.width = width;
    
    [self setFrame:CGRectStandardize(frame)];
}

- (CGFloat)height;
{
    return CGRectGetHeight([self frame]);
}

- (void)setHeight:(CGFloat)height;
{
    CGRect frame = [self frame];
    frame.size.height = height;
    
    [self setFrame:CGRectStandardize(frame)];
}

@end
