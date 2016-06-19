//
//  HYUploadJSON.m
//  HY
//
//  Created by tarena04 on 16/5/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYUploadJSON.h"
#import "HYPresentTelecastModel.h"
#import "AFNetworking.h"
#import "HYWBAccount.h"
#import "HYDynamicList.h"
@implementation HYUploadJSON
+ (void) UploadJSONWithUrls:(NSArray *) urls returnModelBlock:(void(^)(NSMutableArray *)) blockArray
{
    NSMutableArray *temoaArray = [NSMutableArray array];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
    for (NSString *url in urls) {
        NSDate *date = [NSDate date];
        NSDateFormatter *framedate = [[NSDateFormatter alloc] init];
        framedate.dateFormat = @" HH:mm:ss";
        NSString *dateStr = [framedate stringFromDate:date];
        NSMutableString *URLStr = [url mutableCopy];
        [URLStr appendString:dateStr];
        NSString * encodingString = [URLStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        NSURL *URL = [NSURL URLWithString:encodingString];
        NSMutableArray *tempTow = [NSMutableArray array];
        NSData *dataURL = [NSData dataWithContentsOfURL:URL];
        
        NSDictionary *LOLJSONDic = [NSJSONSerialization JSONObjectWithData:dataURL options:NSJSONReadingMutableContainers error:nil];
        NSArray *result = LOLJSONDic[ @"data"][@"list"];
        for (NSDictionary *dic in result) {
            HYPresentTelecastModel *message = [[HYPresentTelecastModel alloc]init];
            [message setValuesForKeysWithDictionary:dic];
            [tempTow addObject:message];
        }
        
        [temoaArray addObject:tempTow];
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        blockArray(temoaArray);
    });
        
    });
   

}




+ (NSDictionary *) getJsonDataWith:(NSString *) jsonURL

{
    NSString * encodingString = [jsonURL stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:encodingString]];
    return  [NSJSONSerialization JSONObjectWithData:dataURL options:NSJSONReadingMutableContainers error:nil];
}



+ (NSDictionary *) getAppRecommendJSONWith:(NSString *) JSONPath
{
    NSString *jsonFilePath = [[NSBundle mainBundle] pathForResource:JSONPath ofType:nil];
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonFilePath];
    NSError *error = nil;
    return [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
}


+ (void)requestTokenWithCode:(NSString *)code andCallback:(void(^)(id))callback
{
    NSString *path = @"https://api.weibo.com/oauth2/access_token";
    NSDictionary *params = @{@"client_id":@"1110968023",@"client_secret":@"949b5fe145fd2c236df79396126b122e",@"grant_type":@"authorization_code",@"code":code,@"redirect_uri":@"http://www.baidu.com"};
    [self requestJsonDataWith:path RequestParameter:params returnDataWih:^(id data) {
        callback(data);
    }];
}

+(void)requestHomeWeibosWithURL:(NSString *) url andParms:(NSDictionary *) params  Callback:(void(^)(id))callback
{

    [self requestJsonDataWith:url RequestParameter:params returnDataWih:^(id responseObject) {

        NSArray *weiboArr = responseObject[@"statuses"];
        NSMutableArray *weibos = [NSMutableArray array];
        for (NSDictionary *weiboDic in weiboArr) {
            HYDynamicList *weiboLiest = [[HYDynamicList alloc] initWithDic:weiboDic];
            [weibos addObject:weiboLiest];
        }
            callback(weibos);
        
    }];
    
}

+ (void) requestJsonDataWith:(NSString *) JsonURLStr RequestParameter:(NSDictionary *) Parameter
 returnDataWih:(void(^)(id)) dicData
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:JsonURLStr parameters:Parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
      NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        dicData(dic);
    
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}







@end
