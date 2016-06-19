//
//  HYsearchViewController.m
//  HY
//
//  Created by tarena04 on 16/5/29.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYsearchViewController.h"
@interface HYsearchViewController ()<UISearchBarDelegate>

@property (nonatomic,strong) UISearchBar *searchBar;

@end

@implementation HYsearchViewController

static HYsearchViewController *searchView = nil;
+ (instancetype) singletonSearchView
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        searchView = [[HYsearchViewController alloc] init];
    });
    return searchView;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    UIBarButtonItem *returnVC = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(returnVC)];
    
    self.navigationItem.rightBarButtonItem = returnVC;
   //UISearchBar添加一个假的item(占位)
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.leftBarButtonItem = leftItem;
    //    创建UISearchBar控件 添加到navigationItem上
    self.searchBar = [[UISearchBar alloc] init];
    self.searchBar.backgroundImage = [UIImage imageNamed:@"background_search_bar"];
    self.searchBar.placeholder = @"Miss、直播、户外、星秀";
    self.searchBar.delegate = self;
    self.navigationItem.titleView = self.searchBar;
    self.navigationController.navigationBar.tintColor = [UIColor orangeColor];
    self.view.backgroundColor = [UIColor whiteColor];

}


- (void) viewWillAppear:(BOOL)animated
{
    [self.searchBar becomeFirstResponder];
}

- (void) returnVC
{
    [self.navigationController popViewControllerAnimated:NO];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
\
*/

@end
