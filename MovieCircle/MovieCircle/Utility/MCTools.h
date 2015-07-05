//
//  MCTools.h
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCTools : NSObject
DEF_SINGLETON(MCTools)

+ (UIColor *)colorWithHex:(NSInteger)rgbValue;
+ (NSString *)base64forData:(NSData *)theData;
+ (NSString *)urlBase64forData:(NSData *)theData;
+ (BOOL)checkPassword:(NSString *)text;
+ (BOOL)checkMobileNumber:(NSString *)mobileNum;
@end

