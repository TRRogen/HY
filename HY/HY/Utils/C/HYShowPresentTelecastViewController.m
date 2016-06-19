//
//  HYShowPresentTelecastViewController.m
//  HY
//
//  Created by tarena04 on 16/5/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYShowPresentTelecastViewController.h"
#import "HYShowPresentLayout.h"
#import "HYPresentTelecastViewCell.h"
#import "HYPresentTelecastModel.h"
#import "HYUploadJSON.h"
#import "HYHeaderView.h"
#import "HYAdvertisementView.h"
#import "HYPlayVideoViewController.h"
#import "MBProgressHUD.h"
#import "HYStorageUserData.h"
#import "HYTool.h"
@interface HYShowPresentTelecastViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) NSArray *PresentTelecastMessages;
@property (nonatomic,strong) NSArray *titles;
@property (nonatomic,strong) NSArray *advertisementPicture;
@property (nonatomic,strong) MBProgressHUD *hud;

@end

@implementation HYShowPresentTelecastViewController
static NSString *showCellIdentifier = @"showCell";
static NSString *headerIIdentifier = @"headerIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.hud.backgroundColor = [UIColor whiteColor];
    self.hud.labelText = @"正在加载...";
    
    [self addSubView];

//    [self getSandboxData];
    [self setTimerWith:@selector(getSandboxData)];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma wark ------------- 显示
- (void) addSubView
{
    self.showCollectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:[[HYShowPresentLayout alloc] init]];
    self.showCollectionView.delegate = self;
    self.showCollectionView.dataSource = self;
    self.showCollectionView.backgroundColor = [UIColor clearColor];
    [self.showCollectionView registerNib:[UINib nibWithNibName:@"HYPresentTelecastViewCell" bundle:nil] forCellWithReuseIdentifier:showCellIdentifier];
    [self.showCollectionView registerNib:[UINib nibWithNibName:@"HYHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIIdentifier];
    [self acquireHeaderTitleWithSubViewAtTitles:self.titles];
    [self.view addSubview:self.showCollectionView];
}
#pragma wark ------------- 数据
- (void) getSandboxData
{
   [HYStorageUserData getCacheDataWithBlockReturnData:^(NSMutableArray *dataArray) {
       if (dataArray.count > 0) {
           self.PresentTelecastMessages = dataArray;
           self.hud.hidden = YES;
           [self.hud removeFromSuperViewOnHide];
           [self.showCollectionView reloadData];
       }
       [self acquireData];
       [self refreshData];
    }];
}

- (void) setTimerWith:(SEL)sel
{
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:sel userInfo:nil repeats:NO];
    NSRunLoop *runlop = [NSRunLoop currentRunLoop];
    [runlop addTimer:timer forMode:NSDefaultRunLoopMode];
}


- (void) acquireData
{
    [HYUploadJSON UploadJSONWithUrls:[self acquirePresentTelecastMessages] returnModelBlock:^(NSMutableArray *messages) {
            self.PresentTelecastMessages = messages;
            [HYStorageUserData storeSQLiteDataWith:self.PresentTelecastMessages];
            self.hud.hidden = YES;
            [self.hud removeFromSuperViewOnHide];
            [self.showCollectionView reloadData];
            [self endRefreshing];
    }];
}
- (void) refreshData
{
    
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(acquireData)];
    [self.showCollectionView.mj_header beginRefreshing];
    [header setRefreshAddAt:self.showCollectionView];

}
- (void) endRefreshing
{

    NSString *path = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).lastObject;
    NSString *defaultPath = [path stringByAppendingPathComponent:@"Caches/default"];
    [[NSFileManager defaultManager] removeItemAtPath:defaultPath error:nil];
    [self.showCollectionView.mj_header endRefreshing];
}

#pragma wark ------------- 数据源
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.PresentTelecastMessages.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.PresentTelecastMessages.count == 1) {
        return [self.PresentTelecastMessages[section] count];
    }
    if (section == 0) {
        return 6;
    }
    return 4;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HYPresentTelecastViewCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:showCellIdentifier forIndexPath:indexPath];
    NSArray *model = self.PresentTelecastMessages[indexPath.section];
    if (model.count>0) {
        HYPresentTelecastModel *TelecastModel = model[indexPath.row];
        cell.telecastModel = TelecastModel;
    }
    return cell;
}

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    HYPlayVideoViewController *playVideoViewController = [HYPlayVideoViewController singletonPlayVideoViewController];
    NSArray *model = self.PresentTelecastMessages[indexPath.section];
    playVideoViewController.modelData =  model[indexPath.row];
    [self presentViewController:playVideoViewController animated:NO completion:nil];
    
    [HYTool setJumpViewAni];
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath

{
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader){
    HYHeaderView *headerView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIIdentifier forIndexPath:indexPath];
        if (self.PresentTelecastMessages.count > 1) {
            if (indexPath.section == 0) {
                HYAdvertisementView *advertisementView = [HYAdvertisementView returnView];
                advertisementView.imageViews = [self acquireSubViewAdvertisementPicture];
                advertisementView.frame = headerView.frame;
                advertisementView.size = CGSizeMake(self.view.frame.size.width, 110);
                [headerView addSubview:advertisementView];
            }else
            {
                UIView *view = [headerView viewWithTag:100];
                [view removeFromSuperview];
            }
        }else
        {
            UIView *view = [headerView viewWithTag:100];
            [view removeFromSuperview];
        }
        headerView.titleName = self.titles[indexPath.section];
        reusableview = headerView;
    }
    return reusableview;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        if (self.PresentTelecastMessages.count > 1) {
             return CGSizeMake(self.view.width, 150);
        }else
        {
           return CGSizeMake(self.view.width, 40);
        }
       
    }else{
        return CGSizeMake(self.view.width, 35);
    }
}




@end
