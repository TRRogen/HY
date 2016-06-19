//
//  HYContentDetailsViewController.m
//  HY
//
//  Created by tarena04 on 16/6/18.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYContentDetailsViewController.h"
#import "HYWBAccount.h"
#import "HYDynamicList.h"
#import "HYCommentListCell.h"
#import "HYListConterView.h"
#import "HYFansTableViewCell.h"
#define  kCELL_H 62

@interface HYContentDetailsViewController ()

@property (nonatomic,strong) NSMutableArray *commentLists;

@end

@implementation HYContentDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title  = @"评论";
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.commentLists = [NSMutableArray array];
    [self.tableView registerNib:[UINib nibWithNibName:@"HYCommentListCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];    
    [self addData];

}

- (void) addData
{

    [HYUploadJSON requestJsonDataWith:@"https://api.weibo.com/2/comments/show.json" RequestParameter:@{@"access_token":[HYWBAccount shareAccount].access_token,@"id":self.dynamicDetails.ID} returnDataWih:^(id data) {
        NSArray *comments = data[@"comments"];
        for (NSDictionary *dic in comments) {
            HYDynamicList *details = [[HYDynamicList alloc] initWithDic:dic];
            [self.commentLists addObject:details];
        }
        [self.tableView reloadData];
    }];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
    return self.commentLists.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HYCommentListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.commentContent = self.commentLists[indexPath.row];

    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [HYTool returnCalculateSizeWiht:[self.commentLists[indexPath.row] text]] + kCELL_H;
            
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        HYFansTableViewCell *view = [HYFansTableViewCell returnCell];
        view.dynamicList = self.dynamicDetails;
        return view;
    }
    return nil;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return [self.dynamicDetails getWeiboHeight] + 88;
    }
    return 0.1;
    
}


@end
