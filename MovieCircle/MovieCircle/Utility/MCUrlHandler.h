//
//  MCUrlHandler.h
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCUrlHandler : NSObject

@property (strong, nonatomic) NSString *baseUrl;

- (id)initWithBaseUrl:(NSString *)baseUrl;
- (NSString *)getUrlWithParams:(NSArray *)params;
- (NSString*)urlEncodedString:(NSString *)string;

@end
