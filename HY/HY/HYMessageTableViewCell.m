//
//  HYMessageTableViewCell.m
//  HY
//
//  Created by tarena04 on 16/6/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYMessageTableViewCell.h"
#import "HYStorageUserData.h"
@interface HYMessageTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *message;


@end

@implementation HYMessageTableViewCell

-(void)setMessageContent:(NSDictionary *)messageContent
{
    self.name.text = messageContent[@"name"];
    self.name.textColor = messageContent[@"color"];
    self.message.text = messageContent[@"UserMessage"];
}
- (void)awakeFromNib
{
   
}


+ (instancetype) returnMessageCell
{
    return [[NSBundle mainBundle] loadNibNamed:@"HYMessageTableViewCell" owner:nil options:nil].lastObject;
}

@end
