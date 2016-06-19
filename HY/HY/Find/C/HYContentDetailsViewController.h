//
//  HYContentDetailsViewController.h
//  HY
//
//  Created by tarena04 on 16/6/18.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYDynamicList.h"
@interface HYContentDetailsViewController : UITableViewController


@property (nonatomic,strong) HYDynamicList *dynamicDetails;

@property (nonatomic,weak) UIView *headerView;


@end
