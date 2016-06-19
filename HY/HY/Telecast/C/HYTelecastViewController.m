//
//  HYTelecastViewController.m
//  HY
//
//  Created by tarena04 on 16/5/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYTelecastViewController.h"
#import "HYTelecastHeaderTitle.h"
#import "HYTelecastHeaderView.h"
#import "UIView+Extension.h"
#import "UIView+HYCreationTitleUIbutton.h"
#import "HYMoreVdeoViewController.h"
#import "UIViewController+HYCustomBar.h"
@interface HYTelecastViewController ()<UIPopoverPresentationControllerDelegate>
//表头视图
@property (nonatomic,strong) HYTelecastHeaderView *headerView;
// 标题数据
@property (nonatomic,strong) NSArray *titles;

@property (nonatomic,strong) UIButton *questionsRobotBut;

@property (nonatomic,strong) NSArray *plays;

@property (nonatomic,strong) NSArray *titleName;
@end

@implementation HYTelecastViewController

static NSArray *dataArray;
static NSArray *titleData;

-(NSArray *)titles
{
    if (!_titles) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"telecast HeaderTitle.plist" ofType:nil];
        titleData =  [NSArray arrayWithContentsOfFile:path];
         _titles  =  [NSArray arrayWithContentsOfFile:path];
    }
    return _titles;
}

- (NSArray *)plays
{
    if (!_plays) {
           NSString *path = [[NSBundle mainBundle] pathForResource:@"game.plist" ofType:nil];
        dataArray = [[NSArray arrayWithContentsOfFile:path] copy];
        _plays = [[NSArray arrayWithContentsOfFile:path] copy];
    }
    return _plays;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpHeaderView];
    [self setNavigationitm];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clickTitleBtn:) name:@"clickTitleBtn" object:nil];
    [self.questionsRobotBut setViewLayer];
    self.showCollectionView.y = 40;
    self.showCollectionView.height -= 150;
}

- (void) clickTitleBtn:(NSNotification *) titleNumber
{
    NSNumber *number =  titleNumber.userInfo[@"titleNumber"];
    NSString *url    = dataArray[number.intValue];
    NSString *title  = titleData[number.intValue];
    self.plays =  @[url];
    self.titles = @[title];
    if ([number isEqual:@0]) {
        self.plays = dataArray;
        self.titles = titleData;
    }
   
    [self acquireData];
}


#pragma wark ---------- 和界面相关的方法
- (void) setUpHeaderView
{
    // 实例化xib文件的视图对象 获取广告标题
    self.headerView = [[NSBundle mainBundle] loadNibNamed:@"HYTelecastHeaderView" owner:nil options:nil].lastObject;
    
    [self.headerView creationTitleUIbuttonWithTitles:self.titles addToScrollView:[self.headerView viewWithTag:10]];
    self.headerView.frame = CGRectMake(0, 0, self.view.frame.size.width, 40);
    //    添加到View上
    [self.view addSubview:self.headerView];
}
#pragma  wark --------------- 父类的方法

- (NSArray *) acquirePresentTelecastMessages
{
   return  self.plays;
}

- (void) acquireHeaderTitleWithSubViewAtTitles:(NSArray *) titles
{
    titles = self.titles;
}


- (NSArray *) acquireSubViewAdvertisementPicture
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"advertisementTelecast.plist" ofType:nil];
    return [[NSArray arrayWithContentsOfFile:path] copy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
