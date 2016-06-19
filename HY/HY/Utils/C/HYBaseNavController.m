//
//  HYBaseNavController.m
//  HY
//
//  Created by tarena04 on 16/5/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYBaseNavController.h"
@interface HYBaseNavController ()

@end

@implementation HYBaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarStyle];
}
//隐藏状态栏
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (void) setNavigationBarStyle
{
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    self.navigationBar.barStyle = UIBarStyleBlackOpaque;
    UIColor * color = [UIColor blackColor];
    NSDictionary * dict=[NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    self.navigationBar.titleTextAttributes = dict;
    self.navigationBar.translucent = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
