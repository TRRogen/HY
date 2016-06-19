//
//  HYStorageUserData.h
//  HY
//
//  Created by tarena04 on 16/5/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HYStorageUserData : NSObject

#pragma mark ------------ 注册
+ (void) registerIDWith:(NSString *) userID andPwdWith:(NSString *) userPwd andHeadPortrait:(NSData *) userHeadPortrait andUserName:(NSString *) name andUserPhone:(NSString *) phone;
#pragma mark ------------ 存储数据
+ (void) storageUserDataSetWith:(id)obj Kye:(NSString *) key;
#pragma mark ------------ 获取数据
+ (id) acquireUserStorageDataWithKey:(NSString *) key;



#pragma mark ------------ 把数据存进沙盒
+ (void) storeSQLiteDataWith:(NSArray *) dataArray;
#pragma mark ------------ 把数据存进从沙盒中获取数据
+ (void) getCacheDataWithBlockReturnData:(void(^)(NSMutableArray *)) dataArray;

@end
