//
//  HYRecommendAppMessage.h
//  HY
//
//  Created by tarena04 on 16/6/14.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYRecommendAppMessage : NSObject
/** 应用名称 **/
@property (nonatomic,copy) NSString *title;

/** 应用图片 **/
@property (nonatomic,copy) NSString *iconUrl;

/** 应用地址 **/
@property (nonatomic,copy) NSString *url;

/** 应用 **/
@property (nonatomic,copy) NSNumber *groupIndex;

/** 应用 **/
@property (nonatomic,copy) NSNumber *orderIndex;

/** 应用 **/
@property (nonatomic,copy) NSNumber *type;

/** 应用 **/
@property (nonatomic,copy) NSString *ID;


@end
