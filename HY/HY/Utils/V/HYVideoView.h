//
//  HYVideoView.h
//  HY
//
//  Created by tarena04 on 16/5/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYVideoView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (nonatomic,strong) id modelData;
+ (instancetype) returnPlayVideoView;

@end
