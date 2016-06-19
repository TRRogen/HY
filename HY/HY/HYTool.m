//
//  HYTool.m
//  HY
//
//  Created by tarena04 on 16/6/13.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYTool.h"


#define ViewW [UIScreen mainScreen].bounds.size.width * 0.5
#define kAccountPath [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/accountInfo.plist"]



@implementation HYTool
#pragma mark --------------- 视图
+ (void) setJumpViewAni
{
    static BOOL JumpAniSubtyoe = YES;
    CATransition *animation = [CATransition new];
    animation.duration = 1;
    animation.type = @"rippleEffect";
    animation.subtype = JumpAniSubtyoe ? kCATransitionFromRight : kCATransitionFromLeft;
    [[UIApplication sharedApplication].keyWindow.layer addAnimation:animation forKey:nil];
    JumpAniSubtyoe = !JumpAniSubtyoe;
}

+ (CGFloat) returnCalculateSizeWiht:(NSString *) contentString
{
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:12],
                                 };
    return [contentString boundingRectWithSize:CGSizeMake(ViewW, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:attributes context:nil].size.height;
}
+ (NSDictionary *) customMessageDicName:(NSString *) dataName andMessage:(NSString *) message andTextColor:(UIColor *) textColor
{
    NSMutableDictionary *messageDic = [NSMutableDictionary dictionary];
    [messageDic setValue:message forKey:@"UserMessage"];
    [messageDic setValue:dataName forKey:@"name"];
    [messageDic setValue:textColor forKey:@"color"];
    return messageDic;
}



#pragma mark --------------- 数据

+ (NSArray *) getModelDataWith:(NSArray *) array
{
    return [[self alloc] dataTransformation:array obj:[HYRecommendAppMessage class]];
}


- (NSArray *) dataTransformation:(NSArray *) array obj:(Class)obj
{

    NSMutableArray *mutableArray = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        id model = [obj new];
        [model setValuesForKeysWithDictionary:dic];
        [mutableArray addObject:model];
    }
    
    return [mutableArray copy];
}


@end
