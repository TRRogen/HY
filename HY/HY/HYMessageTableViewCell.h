//
//  HYMessageTableViewCell.h
//  HY
//
//  Created by tarena04 on 16/6/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYMessageTableViewCell : UITableViewCell
@property (nonatomic,strong) NSDictionary *messageContent;
@property (weak, nonatomic) IBOutlet UILabel *name;

+ (instancetype) returnMessageCell;
@end
