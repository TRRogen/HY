//
//  HYMenPlayViewController.m
//  HY
//
//  Created by tarena04 on 16/6/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYMenPlayViewController.h"
#import "HYStorageUserData.h"
@interface HYMenPlayViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *bakImage;
@property (weak, nonatomic) IBOutlet UIImageView *userIcon;
@property (weak, nonatomic) IBOutlet UILabel *userName;

@end

@implementation HYMenPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUserMessage];
}

- (void) setUserMessage
{
    self.userName.text = [HYStorageUserData acquireUserStorageDataWithKey:@"name"];
    UIImage *userImage = [UIImage imageWithData:[HYStorageUserData acquireUserStorageDataWithKey:@"icon"]];
    self.bakImage.image = userImage;
    self.userIcon.image = userImage;

    self.userIcon.layer.cornerRadius = self.userIcon.frame.size.width * 0.5;
    self.userIcon.layer.masksToBounds = YES;
    self.bakImage.contentMode = UIViewContentModeScaleAspectFit;
    
    self.bakImage.userInteractionEnabled = YES;
    
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    
    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
    
    effectview.frame = self.bakImage.bounds;

    [self.bakImage addSubview:effectview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
