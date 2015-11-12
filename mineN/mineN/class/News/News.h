//
//  News.h
//  mineN
//
//  Created by 王亚征 on 15/11/8.
//  Copyright © 2015年 yazheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject
@property(nonatomic,copy) NSString *title;
//摘要
@property(nonatomic,copy) NSString *digest;
//跟帖数量
@property(nonatomic,assign) NSInteger posts;
//配图地址
@property(nonatomic,copy) NSString *imgsrc;

+(instancetype)newsWithDict:(NSDictionary *)dict;
+(void)loadNewslistUrlstring:(NSString *)urlstring finished:(void(^)(NSArray *newslist))finished;
@end
