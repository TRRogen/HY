//
//  HYCommentListCell.m
//  HY
//
//  Created by tarena04 on 16/6/18.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYCommentListCell.h"

@interface HYCommentListCell ()

@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UILabel *content;

@property (weak, nonatomic) IBOutlet UILabel *time;

@end


@implementation HYCommentListCell



-(void)setCommentContent:(HYDynamicList *)commentContent
{
    _commentContent = commentContent;
    self.name.text = commentContent.user.name;
    self.time.text = commentContent.created_at;
    self.content.text = commentContent.text;
    [self.icon setImageWithURL:[NSURL URLWithString:commentContent.user.avatar_large] placeholderImage:[UIImage imageNamed:@"03b149745741cb9cc5d2a1e040cab7_180_135"]];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    //设置圆形
    self.icon.layer.cornerRadius = self.icon.width * 0.5;
    self.icon.layer.masksToBounds = YES;
}


+ (instancetype) returnCell
{
    return [[NSBundle mainBundle] loadNibNamed:@"HYCommentListCell" owner:nil options:nil].lastObject;
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
