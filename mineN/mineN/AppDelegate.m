//
//  AppDelegate.m
//  mineN
//
//  Created by 王亚征 on 15/11/5.
//  Copyright © 2015年 yazheng. All rights reserved.
//

#import "AppDelegate.h"
#import <AFNetworkActivityIndicatorManager.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSURLCache *cacheUrl =[[NSURLCache alloc]initWithMemoryCapacity:4*1024*1024 diskCapacity:4*1024*1024 diskPath:nil];
    [NSURLCache setSharedURLCache:cacheUrl];
    //    网络指示标志
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    return YES;
}

@end
