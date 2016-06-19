//
//  HYPlayVideoViewController.h
//  HY
//
//  Created by tarena04 on 16/5/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^chatMessageBlock)(NSString *);

@interface HYPlayVideoViewController : UIViewController

@property (nonatomic,strong) id modelData;
@property (nonatomic,strong) NSString *playVideoPath;

+ (instancetype)singletonPlayVideoViewController;
- (void) setFullScreen;
- (void) giftColumn;
- (void) setUdpSocketWith:(id) deletageObj returnChatMessage:(void(^)(NSString *)) chatMessage;
@end
