//
//  UIViewController+HYCustomBar.h
//  HY
//
//  Created by tarena04 on 16/5/29.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (HYCustomBar) <UIPopoverPresentationControllerDelegate>

- (void) setNavigationitm;
// 调用此方法，给定代理对象，给UdpSocket设置代理
- (void) sereturnChatMessage:(void(^)(NSString *)) chatMessage;


@end
