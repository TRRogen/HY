//
//  HYMeMessageTableViewController.h
//  HY
//
//  Created by tarena04 on 16/5/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYMeMessageTableViewController : UITableViewController

@property (nonatomic,strong) NSDictionary *userMessage;

+ (instancetype) singletonClass;

@end
