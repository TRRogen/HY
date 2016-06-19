//
//  HYWBAccount.h
//  HY
//
//  Created by tarena04 on 16/6/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYWBAccount : NSObject

@property (nonatomic,copy) NSString *access_token;
@property (nonatomic,copy) NSNumber *uid;

+(HYWBAccount *)shareAccount;

@end
