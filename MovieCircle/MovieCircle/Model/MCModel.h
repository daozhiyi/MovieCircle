//
//  MCModel.h
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCModel : NSObject<NSCoding>

//@property (strong, nonatomic) NSString *idStr;
//@property (strong, nonatomic) NSString *cityStr;
- (void)parseModelFrom:(id)data;


@end

