//
//  HYRechargeViewController.m
//  HY
//
//  Created by tarena04 on 16/6/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYRechargeViewController.h"

@interface HYRechargeViewController ()
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *userMoneyNumber;

@end

@implementation HYRechargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"充值";
    self.userName.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"name"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
