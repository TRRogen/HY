//
//  HYMeMessageTableViewCell.m
//  HY
//
//  Created by tarena04 on 16/5/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYMeMessageTableViewCell.h"
#import "HYStorageUserData.h"
#import "UIView+HYCreationTitleUIbutton.h"
@interface HYMeMessageTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UILabel *userSex;
@property (weak, nonatomic) IBOutlet UITextField *userSignature;
@property (weak, nonatomic) IBOutlet HYMeMessageTableViewCell *idCell;
@end
@implementation HYMeMessageTableViewCell


- (void) setUserMessage:(NSDictionary *)userMessage
{
    _userMessage = userMessage;
    self.userName.text = [HYStorageUserData acquireUserStorageDataWithKey:@"name"];
    self.userImageView.image = [UIImage imageWithData:[HYStorageUserData acquireUserStorageDataWithKey:@"icon"]];
    self.idCell.detailTextLabel.text = [HYStorageUserData acquireUserStorageDataWithKey:@"ID"];
    [self.userImageView setViewLayer];
}



- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


- (IBAction)editUserNmae:(UITextField *)sender {
    
    [[NSUserDefaults standardUserDefaults] setObject:sender.text forKey:@"name"];
}



+ (NSArray *) returnMeMessageCells
{
   return [self traversalCells];
}
static NSArray *cells;
+ (NSArray *) traversalCells
{
    if (!cells) {
    int i = 0;
    NSMutableArray *section1 = [NSMutableArray array];
    NSMutableArray *section2 = [NSMutableArray array];
    NSMutableArray *section3 = [NSMutableArray array];
    NSMutableArray *section4 = [NSMutableArray array];
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"HYMeMessageTableViewCell" owner:nil options:nil];
    for (HYMeMessageTableViewCell *cell in array) {
        switch (i) {
            case 0:
                [section1 addObject:cell];
                break;
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
                [section2 addObject:cell];
                break;
            case 6:
            case 7:
            case 8:
                [section3 addObject:cell];
                break;
            case 9:
            case 10:
                [section4 addObject:cell];
                break;
        }
        i++;
    }
        cells = @[section1,section2,section3,section4];
    }
    return cells;
}


@end
