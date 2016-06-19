//
//  HYSetTableViewController.m
//  HY
//
//  Created by tarena04 on 16/6/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYSetTableViewController.h"
#import "HYSetTableViewCell.h"
#import "FMDB.h"
@interface HYSetTableViewController ()

@property (nonatomic,strong) NSArray *arrayCells;


@end

@implementation HYSetTableViewController


-(NSArray *)arrayCells
{
    if (!_arrayCells) {
        _arrayCells  = [HYSetTableViewCell returnCells];
    }
    return _arrayCells;
}


- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.arrayCells.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *array = self.arrayCells[section];
    return array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *array = self.arrayCells[indexPath.section];
    HYSetTableViewCell *cell = array[indexPath.row];
    if (indexPath.section == 1) {
        if (indexPath.row == 1) {

        }
    }
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.0001;
    }
    return 10;
}

@end
