//
//  HYCommentListCell.h
//  HY
//
//  Created by tarena04 on 16/6/18.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYDynamicList.h"
@interface HYCommentListCell : UITableViewCell

@property (nonatomic,strong) HYDynamicList *commentContent;


+ (instancetype) returnCell;
@end
