//
//  UIView+HYCreationTitleUIbutton.h
//  HY
//
//  Created by tarena04 on 16/5/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HYCreationTitleUIbutton)
// 设置直播界面的导航按钮
- (void) creationTitleUIbuttonWithTitles:(NSArray *) buttonTitles addToScrollView:(UIScrollView *) ScrollView;

// 给定位置 和按钮的标题和添加到那个视图 设置btn
- (UIButton *) creationButtonSetButtonFrameWith:(CGRect ) rect setButtonTitle:(NSString *) title addAt:(UIView *) view;

+ (UIView *) creationChitchatViewWithContent:(NSString *) content;


////设置圆角
- (void) setViewLayer;

//设置烟花动画
- (void) startAnimation:(NSDictionary *) dic;


@end
