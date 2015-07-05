//
//  MCImageCache.m
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#import "MCImageCache.h"

@implementation MCImageCache

IMP_SINGLETON(MCImageCache)

- (id)init
{
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleMemoryWarning) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (NSMutableDictionary *)imageCacheDictionary
{
    if (!_imageCacheDictionary) {
        _imageCacheDictionary = [[NSMutableDictionary alloc] init];
    }
    return _imageCacheDictionary;
}

- (UIImage *)imageNamed:(NSString *)imageName
{
    UIImage *image = [_imageCacheDictionary objectForKey:imageName];
    if (!image) {
        NSString *imageFullName = imageName;
        NSString *imagePath = nil;
        if (kDeviceHeight == 568) {
            imageFullName = [imageFullName stringByAppendingString:@"-568h@2x"];
            imagePath = [[NSBundle mainBundle] pathForResource:imageFullName ofType:@"png"];
        }
        
        //        if (!CheckValidString(imagePath)) {
        //            imageFullName = imageName;
        //            if (checkRetina) {
        //                imageFullName = [imageFullName stringByAppendingString:@"@2x"];
        //            }
        //            imagePath = [[NSBundle mainBundle] pathForResource:imageFullName ofType:@"png"];
        //        }
        //
        if (!CheckValidString(imagePath)) {
            imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:@"png"];
        }
        
        
        image = [UIImage imageWithContentsOfFile:imagePath];
        
        [self.imageCacheDictionary safeSetObject:image forKey:imageName];
    }
    return image;
}

- (void)clearCache
{
    [self.imageCacheDictionary removeAllObjects];
    self.imageCacheDictionary = nil;
}

- (void)handleMemoryWarning
{
    [self clearCache];
}

@end
