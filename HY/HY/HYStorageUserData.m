//
//  HYStorageUserData.m
//  HY
//
//  Created by tarena04 on 16/5/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYStorageUserData.h"
#import <sqlite3.h>
#import "AppDelegate.h"
#import "HYPresentTelecastModel.h"
#import "FMDB.h"

@interface HYStorageUserData ()

@property (nonatomic,strong) FMDatabase *database;

@end

@implementation HYStorageUserData
#pragma mark ------------ 注册
+ (void) registerIDWith:(NSString *) userID andPwdWith:(NSString *) userPwd andHeadPortrait:(NSData *) userHeadPortrait andUserName:(NSString *) name andUserPhone:(NSString *) phone
{
    [[NSUserDefaults standardUserDefaults] setObject:userID forKey:@"ID"];
    [[NSUserDefaults standardUserDefaults] setObject:userPwd forKey:@"PWD"];
    [[NSUserDefaults standardUserDefaults] setObject:userHeadPortrait forKey:@"icon"];
    [[NSUserDefaults standardUserDefaults] setObject:name forKey:@"name"];
    [[NSUserDefaults standardUserDefaults] setObject:phone forKey:@"Phone"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
#pragma mark ------------ 存储数据
+ (void) storageUserDataSetWith:(id)obj Kye:(NSString *) key
{
    [[NSUserDefaults standardUserDefaults] setObject:obj forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark ------------ 获取数据
+ (id) acquireUserStorageDataWithKey:(NSString *) key
{
   return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}
#pragma mark ------------ 程序退出存储数据

static NSMutableArray *mutabArray = nil;

+ (void) storeSQLiteDataWith:(NSArray *) dataArray
{
    
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        FMDatabase *database = [FMDatabase databaseWithPath:[self getCanchePath]];
   
        mutabArray = [NSMutableArray array];
        for (NSArray *temp in dataArray) {
            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:temp];
            [mutabArray addObject:data];
        }
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:mutabArray];
        
        //打开数据库对象
        if ([database open]) {
            //2.创建表(有主键)
            if([database executeUpdate:@"create table if not exists student (Mydata blob)"]) {
                //3.插入操作
                [database executeUpdate:@"insert into student (Mydata) values (?)",data];
            }
        }
        //关闭打开的数据库
        [database close];
        
    });

}

+ (NSString *) getCanchePath
{
       return [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"test.sqlite"];
}

+ (void) getCacheDataWithBlockReturnData:(void(^)(NSMutableArray *)) dataArray
{
        NSMutableArray *tempArray = [NSMutableArray array];

        FMDatabase *database = [FMDatabase databaseWithPath:[self getCanchePath]];
   
    
        if ([database open]) {
            FMResultSet *resultSet = [database executeQuery:@"select * from student"];
            
                while ([resultSet next]) {
                    
                    NSData *data = [resultSet objectForKeyedSubscript:@"Mydata"];
                    NSMutableArray *dataArray =   [NSKeyedUnarchiver unarchiveObjectWithData:data];
                    for (NSData *data in dataArray) {
                        NSArray *dataArray =   [NSKeyedUnarchiver unarchiveObjectWithData:data];
                        [tempArray addObject:dataArray];
                    }
                    
                }
                    dataArray(tempArray);
 
        }
       [database close];

}






@end
