//
//  UITableView+TRTableView.m
//  LeTao
//
//  Created by Xiao on 16/1/9.
//  Copyright © 2016年 Xiao. All rights reserved.
//

#import "UITableView+TRTableView.h"

@implementation UITableView (TRTableView)

+ (UITableView *)createTableViewWithFrame:(CGRect)frame withDelegate:(id)delegate {

    //创建tableView，并设置两个代理
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    tableView.delegate  = delegate;
    tableView.dataSource = delegate;
    
    //将系统的Separator左边不留间隙
    tableView.separatorInset = UIEdgeInsetsZero;
    return tableView;

}

@end
