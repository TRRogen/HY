//
//  HYUploadJSON.h
//  HY
//
//  Created by tarena04 on 16/5/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYUploadJSON : NSObject

// 视频的数据解析
+ (void) UploadJSONWithUrls:(NSArray *) urls returnModelBlock:(void(^)(NSMutableArray *)) blockArray;
// 获取应用推荐的JSON数据
+ (NSDictionary *) getAppRecommendJSONWith:(NSString *) JSONPath;

+(void)requestTokenWithCode:(NSString *)code andCallback:(void(^)(id))callback;

+(void)requestHomeWeibosWithURL:(NSString *) url andParms:(NSDictionary *) params  Callback:(void(^)(id))callback;

+ (void) requestJsonDataWith:(NSString *) JsonURLStr RequestParameter:(NSDictionary *) Parameter
               returnDataWih:(void(^)(id)) dicData;
@end
