//
//  UIFont+Design.m
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "UIFont+Design.h"

@implementation UIFont (Design)

+ (UIFont *)fontForLeftMenuItem
{
    return [UIFont fontWithName:@"Helvetica-Bold" size:20.f];
}

+ (UIFont *)fontForSectionTitle
{
    return [UIFont systemFontOfSize:13.f];
}

+ (UIFont *)fontForCellTitle
{
    return [UIFont systemFontOfSize:17.f];
}

+ (UIFont *)fontForCellSubTitle
{
    return [UIFont systemFontOfSize:14.f];
}

+ (UIFont *)fontForConfirmButtonTitle
{
    return [UIFont systemFontOfSize:18.f];
}

+ (UIFont *)fontForCalInfo
{
    return [UIFont systemFontOfSize:20.f];
}

+ (UIFont *)fontForCalInfoAddress
{
    return [UIFont systemFontOfSize:15.f];
}

@end

