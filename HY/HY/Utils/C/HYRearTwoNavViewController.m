//
//  HYRearTwoNavViewController.m
//  HY
//
//  Created by tarena04 on 16/6/10.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYRearTwoNavViewController.h"

@interface HYRearTwoNavViewController ()

@end

@implementation HYRearTwoNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+(void)initialize
{
//    设置导航条返回按钮的图片
    
//    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[UIImage imageNamed:@"button_channel_back_landscape_highlighted"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//    [[UIBarButtonItem appearance] setTitle:@""];
      [UINavigationBar appearance].tintColor = [UIColor orangeColor];
    
}


#pragma mark --------- 设置导航栏跳转不带tabBar跳转
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.hidesBottomBarWhenPushed = YES;
    return [super pushViewController:viewController animated:animated];
}







@end
