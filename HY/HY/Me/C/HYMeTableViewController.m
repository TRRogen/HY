//
//  HYMeTableViewController.m
//  HY
//
//  Created by tarena04 on 16/5/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYMeTableViewController.h"
#import "HYMeTableViewCell.h"
#import "HYMeMessageTableViewController.h"
#import "UIViewController+HYCustomBar.h"
#import "HYLoginViewController.h"
#import "HYRegisterViewController.h"
#import "HYStorageUserData.h"
#import "HYMenPlayViewController.h"
#import "HYSetTableViewController.h"
@interface HYMeTableViewController ()

@property (nonatomic,strong) NSArray *cells;

@property (nonatomic,strong) NSDictionary *userMessage;

@end

@implementation HYMeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationitm];
    self.cells = [[NSArray alloc] init];
    self.cells = [HYMeTableViewCell returnCustomCells];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userMessages:) name:@"succeedLogin" object:nil];
}

- (void) userMessages:(NSNotification *) notification
{
    self.userMessage = notification.userInfo[@"useMessage"];
    [self.tableView reloadData];
}


- (void) viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.cells.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSArray *array = self.cells[section];
    return array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *cells = self.cells[indexPath.section];
    HYMeTableViewCell *cell = cells[indexPath.row];
    if (indexPath.section == 0) {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.userMessage = self.userMessage;
    }
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *cells = self.cells[indexPath.section];
    HYMeTableViewCell *cell = cells[indexPath.row];
    return cell.frame.size.height;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if ([[HYStorageUserData acquireUserStorageDataWithKey:@"login"] boolValue] == NO) {
            HYLoginViewController *meMessage = [[HYLoginViewController alloc] init];
            [self.navigationController pushViewController:meMessage animated:YES];
        }else
        {
            HYMeMessageTableViewController *meMessage = [HYMeMessageTableViewController singletonClass];
            meMessage.userMessage = self.userMessage;
            [self.navigationController pushViewController:meMessage animated:YES];
        }
    }else if (indexPath.section == 2)
    {
        if (indexPath.row == 1) {
            HYMenPlayViewController *menPlay = [HYMenPlayViewController new];
            [self.navigationController pushViewController:menPlay animated:YES];
        }
    }
    

    if (indexPath.section == self.cells.count - 1) {
        HYSetTableViewController *setVC = [HYSetTableViewController new];
        [self.navigationController pushViewController:setVC animated:YES];
    }
    
    
}


- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.0001;
    }
    return 18;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
