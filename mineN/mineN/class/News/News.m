//
//  News.m
//  mineN
//
//  Created by 王亚征 on 15/11/8.
//  Copyright © 2015年 yazheng. All rights reserved.
//

#import "News.h"
#import "NetWorkTools.h"
#import <objc/runtime.h>

@implementation News
+(instancetype)newsWithDict:(NSDictionary *)dict
{
    id obj = [[self alloc]init];
    NSArray *properties = [self loadProperties];
    for (NSString *key in properties) {
        if (dict[key]!=nil) {
            [obj setValue:dict[key] forKey:key];
        }
    }
    return obj;
}
//动态加载类的属性
//关联对象键值

+(NSArray *)loadProperties{
    const char* propertiesKey = "Kproperties";
    NSMutableArray *Plist = objc_getAssociatedObject(self, propertiesKey);
    if (Plist != nil) {
        return Plist;
    }
    unsigned int count = 0;
    objc_property_t *list = class_copyPropertyList([self class], &count);
    NSLog(@"%u",count);
    
    NSMutableArray *arrayM =[NSMutableArray arrayWithCapacity:count];
    for (unsigned int i = 0; i < count; i++) {
        objc_property_t pty = list[i];
    //  属性数组
     const char *cname = property_getName(pty);
        [arrayM addObject:[NSString stringWithUTF8String:cname]];
    }
    
    free(list);
    //  设置关联对象
    objc_setAssociatedObject(self, propertiesKey, arrayM, OBJC_ASSOCIATION_COPY_NONATOMIC);
    NSLog(@"%@",arrayM);

    return arrayM.copy;
}

- (NSString *)description {
    NSDictionary *dict = [self dictionaryWithValuesForKeys:[News loadProperties]];
    return [NSString stringWithFormat:@"<%@: %p> %@", self.class, self, dict];
}

+(void)loadNewslistUrlstring:(NSString *)urlstring finished:(void (^)(NSArray *newslist))finished{
    NSAssert(finished != nil, @"必须传入回调！");
    [[NetWorkTools sharedManger] GET:urlstring parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
        
        NSLog(@"%@",responseObject.keyEnumerator.nextObject);
        NSArray *array = responseObject[responseObject.keyEnumerator.nextObject];
    // 字典转模型
    // Capacity：容量  一次性分配的内存 空间
        NSMutableArray *arrayM =[NSMutableArray arrayWithCapacity:array.count];
        
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [arrayM addObject:[self newsWithDict:obj]];
        }];
    //  传入回调
        finished(arrayM.copy);
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}
@end
