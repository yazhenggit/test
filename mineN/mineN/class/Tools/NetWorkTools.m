//
//  NetWorkTools.m
//  mineN
//
//  Created by 王亚征 on 15/11/6.
//  Copyright © 2015年 yazheng. All rights reserved.
//

#import "NetWorkTools.h"

@implementation NetWorkTools
+(instancetype)sharedManger{
    static NetWorkTools *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *baseURL = [[NSURL alloc]initWithString:@"http://c.m.163.com/nc/article/headline/"];
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        instance = [[self alloc]initWithBaseURL:baseURL sessionConfiguration:config];
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    });
    return instance;
}
@end
