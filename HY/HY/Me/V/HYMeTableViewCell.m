//
//  HYMeTableViewCell.m
//  HY
//
//  Created by tarena04 on 16/5/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYMeTableViewCell.h"
#import "HYStorageUserData.h"
#import "UIView+HYCreationTitleUIbutton.h"
@interface HYMeTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UIButton *isLogin;
@property (weak, nonatomic) IBOutlet UIView *showMoneyView;


@end

@implementation HYMeTableViewCell

- (void) setUserMessage:(NSDictionary *)userMessage
{
     _userMessage = userMessage;
    if ([[HYStorageUserData acquireUserStorageDataWithKey:@"login"] boolValue] == YES) {
    self.userName.text = [HYStorageUserData acquireUserStorageDataWithKey:@"name"];
    self.userImageView.image = [UIImage imageWithData:[HYStorageUserData acquireUserStorageDataWithKey:@"icon"]];
    self.userName.hidden = NO;
    self.isLogin.hidden = YES;
    self.showMoneyView.hidden = NO;
    }else
    {
        self.userName.hidden = YES;
        self.isLogin.hidden = NO;
        self.showMoneyView.hidden = YES;
        self.userImageView.image = [UIImage imageNamed:@"gray_logo"];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    //设置圆形
    self.isLogin.layer.cornerRadius = self.isLogin.frame.size.width * 0.05;
    self.isLogin.layer.masksToBounds = YES;
    [self.userImageView setViewLayer];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


+ (NSArray *) returnCustomCells
{

    return [[self alloc] setSectionCell];
}


- (NSArray *) setSectionCell
{
    int i = 0;
    NSArray *cells = [[NSBundle mainBundle] loadNibNamed:@"HYMeTableViewCell" owner:nil options:nil];
    NSMutableArray *oenCell = [NSMutableArray array];
    NSMutableArray *towCell = [NSMutableArray array];
    NSMutableArray *threeCell = [NSMutableArray array];
    NSMutableArray *fourCell = [NSMutableArray array];
    for (HYMeTableViewCell *cell in cells) {
        
        switch (i) {
            case 0:
                [oenCell addObject:cell];
                break;
            case 1:
            case 2:
                 [towCell addObject:cell];
                break;
            case 3:
            case 4:
                 [threeCell addObject:cell];
                break;
            case 5:
                 [fourCell addObject:cell];
                break;
        }
        i++;
    }
    
    
    return @[oenCell,towCell,threeCell,fourCell];
    
}


@end
