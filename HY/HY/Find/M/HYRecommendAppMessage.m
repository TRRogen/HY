//
//  HYRecommendAppMessage.m
//  HY
//
//  Created by tarena04 on 16/6/14.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYRecommendAppMessage.h"

@implementation HYRecommendAppMessage

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        self.ID = value;
    }
}
@end
