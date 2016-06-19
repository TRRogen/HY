//
//  HYFindTableViewController.m
//  HY
//
//  Created by tarena04 on 16/5/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYFindTableViewController.h"
#import "UIViewController+HYCustomBar.h"
#import "HYFindTableViewCell.h"
#import "HYFansViewController.h"
#import "HYUploadJSON.h"
@interface HYFindTableViewController ()

@property (nonatomic,strong) NSArray *findCells;

@end

@implementation HYFindTableViewController

-(NSArray *)findCells
{
    if (!_findCells) {
       _findCells = [HYFindTableViewCell returnFindCell];
    }
    return _findCells;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationitm];

    self.tableView.scrollEnabled = NO;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.findCells.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = self.findCells[indexPath.section];
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = self.findCells[indexPath.section];
  
    return cell.frame.size.height;
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
       
        [self.navigationController pushViewController:[HYFansViewController new] animated:YES];

    }
}



@end
