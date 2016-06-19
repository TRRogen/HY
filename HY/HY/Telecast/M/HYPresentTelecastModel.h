//
//  HYPresentTelecastModel.h
//  HY
//
//  Created by tarena04 on 16/5/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYPresentTelecastModel : NSObject<NSCoding>
/** 直播图片 **/
@property (nonatomic,copy) NSString *icon;
/** 直播游戏名字 **/
@property (nonatomic,copy) NSString *game_name;
/** 直播作者名称 **/
@property (nonatomic,copy) NSString *title;
/** 直播观看人数 **/
@property (nonatomic,copy) NSNumber *view_num;
/** 直播视频URL **/
@property (nonatomic,copy) NSString *url;
/** 作者 **/
@property (nonatomic,copy) NSString *author;
/** 直播平台 **/
@property (nonatomic,copy) NSString *source;
/** 时间 **/
@property (nonatomic,copy) NSString *pub_time;
/** dasou **/
@property (nonatomic,copy) NSString *dasou_icon;


@end
