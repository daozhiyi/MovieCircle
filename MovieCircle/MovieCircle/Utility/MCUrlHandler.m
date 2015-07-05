//
//  MCUrlHandler.m
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCUrlHandler.h"

@implementation MCUrlHandler

- (id)initWithBaseUrl:(NSString *)baseUrl
{
    if (self = [super init]) {
        self.baseUrl = baseUrl;
    }
    
    return self;
}

- (NSString *)getUrlWithParams:(NSArray *)params
{
    __block NSString *url = nil;
    if (CheckValidString(_baseUrl) && CheckValidArray(params)) {
        url = _baseUrl;
        [params enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if (CheckValidString(obj)) {
                url = [url stringByAppendingPathComponent:obj];
            }
        }];
    }
    
    return url;
}

- (NSString*)urlEncodedString:(NSString *)string
{
    NSString * encodedString = (__bridge_transfer  NSString*) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (__bridge CFStringRef)string, NULL, (__bridge CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8 );
    
    return encodedString;
}


@end

