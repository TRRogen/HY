//
//  HYFansTableViewCell.m
//  HY
//
//  Created by tarena04 on 16/6/12.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYFansTableViewCell.h"
#import "UIView+HYCreationTitleUIbutton.h"
@interface HYFansTableViewCell ()
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIButton *likeBtn;
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;
@property (weak, nonatomic) IBOutlet UIButton *repostBtn;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headIV;

@end

@implementation HYFansTableViewCell

-(void)setDynamicList:(HYDynamicList *)dynamicList
{
    _dynamicList = dynamicList;
    
    self.nameLabel.text = dynamicList.user.name;
    self.sourceLabel.text = dynamicList.source;
    self.timeLabel.text = dynamicList.created_at;
    [self.headIV setImageWithURL:[NSURL URLWithString:dynamicList.user.avatar_large] placeholderImage:[UIImage imageNamed:@"03b149745741cb9cc5d2a1e040cab7_180_135"]];
    
    [self.repostBtn setTitle:dynamicList.reposts_count.stringValue forState:UIControlStateNormal];
    [self.commentBtn setTitle:dynamicList.comments_count.stringValue forState:UIControlStateNormal];
    [self.likeBtn setTitle:dynamicList.attitudes_count.stringValue forState:UIControlStateNormal];
    self.conterView.dynamicList = dynamicList;

    self.conterView.height = [dynamicList getWeiboHeight];
}

- (void)awakeFromNib {
    [super awakeFromNib];

    self.headIV.layer.cornerRadius = self.headIV.width * 0.5;
    self.headIV.layer.masksToBounds = YES;
    self.conterView = [[HYListConterView alloc] initWithFrame:CGRectMake(0, 62, kScreenWidth, 0)];
    [self addSubview:self.conterView];
    
}


+ (instancetype) returnCell
{
    return [[NSBundle mainBundle] loadNibNamed:@"HYFansTableViewCell" owner:nil options:nil].lastObject;
}


@end
