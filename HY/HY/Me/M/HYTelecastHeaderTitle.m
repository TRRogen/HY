//
//  HYTelecastHeaderTitle.m
//  HY
//
//  Created by tarena04 on 16/5/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYTelecastHeaderTitle.h"

@implementation HYTelecastHeaderTitle

+ (NSArray *) returnTitles
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"telecast HeaderTitle" ofType:nil];
    return [NSArray arrayWithContentsOfFile:path];

}
@end
