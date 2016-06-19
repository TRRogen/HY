//
//  HYLoginViewController.m
//  HY
//
//  Created by tarena04 on 16/5/30.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYLoginViewController.h"
#import "HYRegisterViewController.h"
#import "HYStorageUserData.h"
#import "HYThirdPartyLoginViewController.h"
#import "HYWBAccount.h"
@interface HYLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *loginUserNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *loginUserPwdTextField;
@property (weak, nonatomic) IBOutlet UIButton *login;

@end

@implementation HYLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置圆形
    self.login.layer.cornerRadius = self.login.frame.size.width * 0.01;
    self.login.layer.masksToBounds = YES;
    self.title = @"登陆";
}

- (IBAction)userEditing:(UITextField *)sender {
    if (self.loginUserNameTextField.text && self.loginUserPwdTextField.text) {
        self.login.enabled = YES;
    }
    
}

//登录
- (IBAction)clickLogin:(id)sender {
    
    NSString *ID = [HYStorageUserData acquireUserStorageDataWithKey:@"ID"];
    NSString *pwd = [HYStorageUserData acquireUserStorageDataWithKey:@"PWD"];
    if ([self.loginUserNameTextField.text isEqualToString:ID] && [self.loginUserPwdTextField.text isEqualToString:pwd]) {
        NSData *name = [HYStorageUserData acquireUserStorageDataWithKey:@"name"];
        NSString *phone = [HYStorageUserData acquireUserStorageDataWithKey:@"Phone"];
        NSDictionary *dic = @{@"name":name,@"phone":phone,@"ID":ID};
        [[NSNotificationCenter defaultCenter] postNotificationName:@"succeedLogin" object:self userInfo:@{@"useMessage":dic}];
        [HYStorageUserData storageUserDataSetWith:@(YES) Kye:@"login"];
        [self.navigationController popViewControllerAnimated:YES];
    }else
    {

        UILabel *wrongLabel = [[UILabel alloc] init];
        wrongLabel.bounds = CGRectMake(0, 0, 150, 50);
        wrongLabel.text = @"账号或密码错误";
        wrongLabel.center = self.view.center;
        wrongLabel.backgroundColor = [UIColor blackColor];
        wrongLabel.textColor = [UIColor whiteColor];
        wrongLabel.textAlignment = NSTextAlignmentCenter;
        //设置圆形
        wrongLabel.layer.cornerRadius = wrongLabel.frame.size.width * 0.1;
        wrongLabel.layer.masksToBounds = YES;
        [self.view addSubview:wrongLabel];
        
        [UIView animateWithDuration:3.0 animations:^{
            wrongLabel.alpha = 0;
        }completion:^(BOOL finished) {
            [wrongLabel removeFromSuperview];
        }];

    }
    
    self.loginUserNameTextField.text = @"";
    self.loginUserPwdTextField.text = @"";
    self.login.enabled = NO;

}

- (IBAction)weiBoLogin:(UIButton *)sender {
    
    
    if (![HYWBAccount shareAccount]) {
        HYThirdPartyLoginViewController *thirdPartyLogin = [HYThirdPartyLoginViewController new];
        thirdPartyLogin.WebPath = @"https://api.weibo.com/oauth2/authorize?client_id=1110968023&redirect_uri=http://www.baidu.com";
        [self.navigationController pushViewController:thirdPartyLogin animated:YES];
    }else
    {
        
    }

}

//注册
- (IBAction)clickRegister:(id)sender {
    HYRegisterViewController *registervc = [HYRegisterViewController new];
    [self.navigationController pushViewController:registervc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
