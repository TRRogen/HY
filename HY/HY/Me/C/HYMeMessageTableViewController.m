//
//  HYMeMessageTableViewController.m
//  HY
//
//  Created by tarena04 on 16/5/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYMeMessageTableViewController.h"
#import "HYMeMessageTableViewCell.h"
#import "HYStorageUserData.h"
#import "HYRechargeViewController.h"
@interface HYMeMessageTableViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (nonatomic,strong) NSArray *meMessageCells;

@property (nonatomic,strong) UIImageView *userImagView;

@end

@implementation HYMeMessageTableViewController
static HYMeMessageTableViewController *_meMessageVC;
+ (instancetype) singletonClass
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _meMessageVC = [[HYMeMessageTableViewController alloc] init];
    });
    return _meMessageVC;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.meMessageCells = [NSArray array];
    self.meMessageCells = [HYMeMessageTableViewCell returnMeMessageCells];
    self.title = @"个人信息";
    [self addItems];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}
#pragma mark ------------- 界面相关
- (void) addItems
{
    UIBarButtonItem *exitBtr = [[UIBarButtonItem alloc] initWithTitle:@"退出登录" style:UIBarButtonItemStylePlain target:self action:@selector(exitLogin)];
    self.navigationController.navigationBar.tintColor = [UIColor grayColor];
    self.navigationItem.rightBarButtonItem = exitBtr;
}

- (void) exitLogin
{
    BOOL login = NO;
    [[NSUserDefaults standardUserDefaults] setBool:login forKey:@"login"];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void) returnVC
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark ------------- 数据源
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.meMessageCells.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *cells = self.meMessageCells[section];
    return cells.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *cells = self.meMessageCells[indexPath.section];
    HYMeMessageTableViewCell *cell = cells[indexPath.row];
    if (indexPath.section == 0) {
        cell.userMessage = self.userMessage;
    }
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *cells = self.meMessageCells[indexPath.section];
    HYMeMessageTableViewCell *cell = cells[indexPath.row];
    return cell.frame.size.height;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        NSArray *cells = self.meMessageCells[indexPath.section];
        HYMeMessageTableViewCell *cell = cells[indexPath.row];
        self.userImagView = [cell viewWithTag:10];
        [self unfoldPhoto:UIImagePickerControllerSourceTypePhotoLibrary];
    }else if (indexPath.section == 2)
    {
        HYRechargeViewController *rechargeVC = [HYRechargeViewController new];
        [self.navigationController pushViewController:rechargeVC animated:YES];
        
    }
}



#pragma  mark ------------ 打开相册
- (void) unfoldPhoto:(UIImagePickerControllerSourceType) type
{
    //   创建 图片编辑器
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = type;
    //  设置代理 （为了通过代理方法获取编辑完的图片）
    imagePicker.delegate = self;
    //  允许编辑图片
    imagePicker.allowsEditing = YES;
    //  打开图片编译器
    [self presentViewController:imagePicker animated:YES completion:nil];
}

#pragma mark -- 图片编译器的代理方法
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    //  info 是字典 字典存的是 图片编译器给我的相关信息
    //  通过 UIImagePickerController获取 字典中 保存的编辑完的图片
    self.userImagView.image = info[UIImagePickerControllerEditedImage];
    [self.tableView reloadData];
    NSData *imageData = UIImagePNGRepresentation(self.userImagView.image);
    [[NSUserDefaults standardUserDefaults] setObject:imageData forKey:@"icon"];
    
    //  编辑完成返回
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void) scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}


@end
