//
//  HYDynamicListUser.h
//  HY
//
//  Created by tarena04 on 16/6/17.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYDynamicListUser : NSObject

@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *location;
@property (nonatomic, copy)NSString *des;
@property (nonatomic, copy)NSString *avatar_large;
@property (nonatomic, copy)NSString *cover_image_phone;
@property (nonatomic, copy)NSString *gender;
@property (nonatomic, strong)NSNumber *followers_count;
@property (nonatomic, strong)NSNumber *friends_count;
@property (nonatomic, copy)NSString *created_at;

-(instancetype)initWithDic:(NSDictionary *)dic;
@end
