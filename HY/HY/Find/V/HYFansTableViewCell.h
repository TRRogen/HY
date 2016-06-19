//
//  HYFansTableViewCell.h
//  HY
//
//  Created by tarena04 on 16/6/12.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYDynamicList.h"
#import "HYListConterView.h"
@interface HYFansTableViewCell : UITableViewCell

@property (nonatomic,strong) HYDynamicList *dynamicList;

@property (nonatomic,strong) HYListConterView *conterView;

+ (instancetype) returnCell;

@end
