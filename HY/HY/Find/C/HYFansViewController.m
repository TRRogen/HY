//
//  HYFansViewController.m
//  HY
//
//  Created by tarena04 on 16/6/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYFansViewController.h"
#import "HYFansTableViewCell.h"
#import "HYDynamicList.h"
#import "MJRefresh.h"
#import "HYWBAccount.h"
#import "HYContentDetailsViewController.h"
@interface HYFansViewController ()


@end

@implementation HYFansViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.title  = @"动态";
    UIBarButtonItem *bar = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(addPublishDynamic)];
    self.navigationItem.rightBarButtonItem = bar;
    
    [self getDataWith:@"https://api.weibo.com/2/statuses/home_timeline.json"];
    self.weiBoLinst = [NSMutableArray array];
    [self.tableView registerNib:[UINib nibWithNibName:@"HYFansTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(getDataWith:)];
    [self.tableView.mj_header beginRefreshing];
     self.tableView.mj_header = header;
    
}

- (void) addPublishDynamic
{
    
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"新动态" message:@"发表动态" preferredStyle:UIAlertControllerStyleAlert];
    [ac addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
        textField.placeholder = @"动态";
        
    }];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"发送" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
          UITextField *dynamicMessage = ac.textFields[0];
          [HYUploadJSON requestJsonDataWith:@"https://api.weibo.com/2/statuses/update.json" RequestParameter:@{@"access_token":[HYWBAccount shareAccount].access_token,@"status":dynamicMessage.text} returnDataWih:^(id data) {
              HYDynamicList *publish = [[HYDynamicList alloc] initWithDic:data];
              [self.weiBoLinst insertObject:publish atIndex:0];
              [self.tableView reloadData];
          }];

    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [ac addAction:action1];
    [ac addAction:action2];
    [self presentViewController:ac animated:YES completion:nil];
    
}

- (void) getDataWith:(NSString *) url
{

    if ([url isMemberOfClass:[MJRefreshGifHeader class]]) {
        url = @"https://api.weibo.com/2/statuses/public_timeline.json";
    }
    [HYUploadJSON requestHomeWeibosWithURL:url andParms:@{@"access_token":[HYWBAccount shareAccount].access_token}  Callback:^(id weiBoList) {
        NSArray *lists = (NSArray *) weiBoList;
        for (id list in lists) {
            [self.weiBoLinst insertObject:list atIndex:0];
        }
        [self endRefreshing];
        [self addPromptNumber:lists.count];
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

- (void) addPromptNumber:(NSInteger) number
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.y, self.view.width, 25)];
    label.backgroundColor = [UIColor orangeColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [NSString stringWithFormat:@"%ld条新动态",number];
    label.textColor = [UIColor whiteColor];
    [self.view addSubview:label];
    [UIView animateWithDuration:3.0 animations:^{
        label.alpha = 0;
    }completion:^(BOOL finished) {
        [label removeFromSuperview];
    }];
    
}


- (void) endRefreshing
{
    [self.tableView reloadData];
    [self.tableView.mj_header endRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.weiBoLinst.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HYFansTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.dynamicList = self.weiBoLinst[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  HYContentDetailsViewController *contentDetails =  [HYContentDetailsViewController new];

    contentDetails.dynamicDetails = self.weiBoLinst[indexPath.row];
  [self.navigationController pushViewController:contentDetails animated:YES];
}


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HYDynamicList *dynamicList = self.weiBoLinst[indexPath.row];
    return [dynamicList getWeiboHeight] + 100;
}


@end
