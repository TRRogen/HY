//
//  HYShowRecreationViewController.m
//  HY
//
//  Created by tarena04 on 16/5/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYShowRecreationViewController.h"
#import "UIView+HYCreationTitleUIbutton.h"
#import "HYRecreationHeaderView.h"
#import "UIView+Extension.h"
#import "UIViewController+HYCustomBar.h"
@interface HYShowRecreationViewController ()

@property (nonatomic,strong) HYRecreationHeaderView *recreationView;

@property (nonatomic,strong) NSArray *titles;

@end

@implementation HYShowRecreationViewController

-(NSArray *)titles
{
    if (_titles.count < 1) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"recreationTitle.plist" ofType:nil];
        _titles =  [NSArray arrayWithContentsOfFile:path];
    }
    return _titles;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationitm];
    self.showCollectionView.height -= 150;
    self.showCollectionView.y = 40;
    [self setUpHeaderView];
}
- (void) setUpHeaderView
{
    // 实例化xib文件的视图对象
    self.recreationView =   [[[NSBundle mainBundle] loadNibNamed:@"HYRecreationHeaderView" owner:self options:nil] firstObject];
    [self.recreationView creationTitleUIbuttonWithTitles:self.titles addToScrollView:[self.recreationView viewWithTag:10]];
    self.recreationView.frame = CGRectMake(0, 0, self.view.frame.size.width, 40);
    //    添加到View上
    [self.view addSubview:self.recreationView];
}

#pragma  wark --------------- 父类的方法
- (void) acquireHeaderTitleWithSubViewAtTitles:(NSArray *) titles
{
    titles = self.titles;
}

- (NSArray *) acquirePresentTelecastMessages
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"game.plist" ofType:nil];
    return [NSArray arrayWithContentsOfFile:path];
}
- (NSArray *) acquireSubViewAdvertisementPicture
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"advertisementImageView.plist" ofType:nil];
    return [[NSArray arrayWithContentsOfFile:path] copy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
