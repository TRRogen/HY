//
//  HYMeTableViewCell.h
//  HY
//
//  Created by tarena04 on 16/5/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HYMeTableViewCell : UITableViewCell

@property (nonatomic,strong) NSDictionary *userMessage;

+ (NSArray *) returnCustomCells;

@end