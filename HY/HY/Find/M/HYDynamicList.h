//
//  HYDynamicList.h
//  HY
//
//  Created by tarena04 on 16/6/17.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HYDynamicListUser.h"

@interface HYDynamicList : NSObject

@property (nonatomic, copy)NSString *created_at;
@property (nonatomic, copy)NSString *text;
@property (nonatomic, copy)NSString *source;
@property (nonatomic, strong)NSNumber *reposts_count;
@property (nonatomic, strong)NSNumber *comments_count;
@property (nonatomic, strong)NSNumber *attitudes_count;
@property (nonatomic, strong)NSArray *pic_urls;
@property (nonatomic, strong)NSNumber *ID;


@property (nonatomic,strong) HYDynamicListUser *user;

@property (nonatomic,strong) HYDynamicList *reWeibo;

-(instancetype)initWithDic:(NSDictionary *)dic;

-(float)getWeiboHeight;

-(float)getTextHeight;

-(float)getImageHeight;


@end
