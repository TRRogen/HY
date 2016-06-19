//
//  HYWBAccount.m
//  HY
//
//  Created by tarena04 on 16/6/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYWBAccount.h"
#define kAccountPath [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/accountInfo.plist"]

@implementation HYWBAccount

static HYWBAccount *_account = nil;
+(HYWBAccount *)shareAccount
{
    @synchronized (self) {
        NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:kAccountPath];
        if (dic) {
            _account = [[HYWBAccount alloc]init];
            _account.access_token = dic[@"access_token"];
            _account.uid = dic[@"uid"];
        }
    }
    
    return _account;
}

@end
