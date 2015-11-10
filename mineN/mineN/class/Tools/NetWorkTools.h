//
//  NetWorkTools.h
//  mineN
//
//  Created by 王亚征 on 15/11/6.
//  Copyright © 2015年 yazheng. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface NetWorkTools : AFHTTPSessionManager
+(instancetype)sharedManger;
@end
