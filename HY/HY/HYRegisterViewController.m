//
//  HYRegisterViewController.m
//  HY
//
//  Created by tarena04 on 16/5/30.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYRegisterViewController.h"
#import "HYStorageUserData.h"

@interface HYRegisterViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UITextField *registerUserID;
@property (weak, nonatomic) IBOutlet UITextField *registerUserPwd;
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *userPhone;
@end

@implementation HYRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)editImageView:(id)sender {

    [self unfoldPhoto:UIImagePickerControllerSourceTypePhotoLibrary];
    
}
- (IBAction)clickRegister:(id)sender {

    NSData *imageData = UIImagePNGRepresentation(self.userImageView.image);
    [HYStorageUserData registerIDWith:self.registerUserID.text andPwdWith:self.registerUserPwd.text andHeadPortrait:imageData andUserName:self.userName.text andUserPhone:self.userPhone.text];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma  mark ------------ 打开相册
- (void) unfoldPhoto:(UIImagePickerControllerSourceType) type
{

    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = type;

    imagePicker.delegate = self;

    imagePicker.allowsEditing = YES;

    [self presentViewController:imagePicker animated:YES completion:nil];
}

#pragma mark -- 图片编译器的代理方法
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    self.userImageView.image = info[UIImagePickerControllerEditedImage];

    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
