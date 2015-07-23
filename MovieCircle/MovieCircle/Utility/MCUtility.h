//
//  MCUtility.h
//  MovieCircle
//
//  Created by 孙宇强 on 15/6/28.
//  Copyright (c) 2015年 dzy. All rights reserved.
//

#ifndef MovieCircle_MCUtility_h
#define MovieCircle_MCUtility_h


//http://182.92.103.164:9000/yingshiquanApp/index.php?g=Portal&m=common&a=goodsSmallCategory
//debug url
#define kDebugURL                               (@"http://api.bingex.com/urest")
#define kReleaseURL                             (@"http://api.ishansong.com")

//width and height
#define kDeviceHeight                           ([UIScreen mainScreen].bounds.size.height)
#define kDeviceWidth                            ([UIScreen mainScreen].bounds.size.width)

#define kRatioHeight(height)                    (kDeviceHeight * (height/568.0))
#define kRatioWidth(width)                      (kDeviceWidth * (width/320.0))
#define kTableViewCellHeight                    (44.0)


#define kYellowColor                            ([UIColor colorWithRed:252.0/255.0 green:172.0/255.0 blue:10.0/255.0 alpha:1])


//develope key   IgTUqTE1NuQbAQfGAHkz1K6A
#define kBaidu_AppKey                           (@"IgTUqTE1NuQbAQfGAHkz1K6A")







//appversion
#define kAppVersion                             ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"])


// log
#ifdef DEBUG
# define DLog(fmt, ...)                         NSLog((@"[文件名:%s]\n" "[函数名:%s]\n" "[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
# define DLog(...);
#endif


// model key
#define kDataKeyId                              (@"idStr")
#define kKEYMobile                              (@"mobile")
#define kKEYPassword                            (@"password")
#define kKEYToken                               (@"userToken")
#define kKEYIsLogin                             (@"isLogin")

// userdefult
#define kDefaultKeyCurrentUser                  (@"currentUser")

//chick version
#define iOS7                                    ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)


// singleton
#undef    DEF_SINGLETON
#define DEF_SINGLETON( __class ) \
+ (__class *)sharedInstance;

#undef    IMP_SINGLETON
#define IMP_SINGLETON( __class ) \
+ (__class *)sharedInstance \
{ \
static dispatch_once_t once; \
static __class * __singleton__; \
dispatch_once( &once, ^{ __singleton__ = [[__class alloc] init]; } ); \
return __singleton__; \
}

// check valid
#define CheckValidString(__OBJ)                 ([(__OBJ) isKindOfClass:[NSString class]] && 0 < [(__OBJ) length])
#define CheckValidData(__OBJ)                   ([(__OBJ) isKindOfClass:[NSData class]] && 0 < [(__OBJ) length])
#define CheckValidDictionary(__OBJ)             ([(__OBJ) isKindOfClass:[NSDictionary class]] && 0 < [(__OBJ) count])
#define CheckValidArray(__OBJ)                  ([(__OBJ) isKindOfClass:[NSArray class]] && 0 < [(__OBJ) count])
#define CheckValidNumber(__OBJ)                 ([(__OBJ) isKindOfClass:[NSNumber class]])


// paths
#define PATH_BUNDLE                             [[NSBundle mainBundle] bundlePath]
#define PATH_CACHES                             [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]
#define PATH_LIBRARY                            [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject]
#define PATH_DOCUMENT                           [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]



#endif
