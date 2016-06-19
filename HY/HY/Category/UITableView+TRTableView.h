//
//  UITableView+TRTableView.h
//  LeTao
//
//  Created by Xiao on 16/1/9.
//  Copyright © 2016年 Xiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (TRTableView)

+ (UITableView *)createTableViewWithFrame:(CGRect)frame withDelegate:(id)delegate;

@end
