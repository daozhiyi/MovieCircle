//
//  MCPayItemButton.m
//  MovieCircle
//
//  Created by yuqiang on 15/7/23.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCPayItemButton.h"

@implementation MCPayItemButton


- (void)drawRect:(CGRect)rect {
    
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat x = self.width *0.15;
    CGFloat y = self.width *0.1;
    CGFloat w = self.width * 0.7;
    CGFloat h = self.width * 0.7;
    return CGRectMake(x, y, w, h);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat x = 0;
    CGFloat y = self.imageView.bottom;
    CGFloat w = self.width ;
    CGFloat h = self.height - self.imageView.bottom;
    return CGRectMake(x, y, w, h);
}


@end
