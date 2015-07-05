//
//  MCTabbarButton.m
//  MovieCircle
//
//  Created by 孙宇强 on 15/7/5.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCTabbarButton.h"

@implementation MCTabbarButton

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    
//}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark 设置button内部的image的范围

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    if (self.tag == 2) {
        CGFloat imageW = contentRect.size.width;
        CGFloat imageH = contentRect.size.height * 0.8;
        
        return CGRectMake(0, 5, imageW, imageH);
    }else{
        CGFloat imageW = contentRect.size.width;
        CGFloat imageH = contentRect.size.height * 0.6;
        
        return CGRectMake(0, 5, imageW, imageH);
    }
        
    
}

#pragma mark 设置button内部的title的范围

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleY = contentRect.size.height * 0.6;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    
    return CGRectMake(0, titleY, titleW, titleH);
    
}

@end
