//
//  HYTool.h
//  HY
//
//  Created by tarena04 on 16/6/13.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYRecommendAppMessage.h"
@interface HYTool : NSObject

+ (void) setJumpViewAni;
+ (NSDictionary *) customMessageDicName:(NSString *) dataName andMessage:(NSString *) message andTextColor:(UIColor *) textColor;
+ (CGFloat) returnCalculateSizeWiht:(NSString *) contentString;
+ (NSArray *) getModelDataWith:(NSArray *) array;

@end
