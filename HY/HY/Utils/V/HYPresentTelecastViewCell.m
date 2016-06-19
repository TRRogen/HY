//
//  HYPresentTelecastViewCell.m
//  HY
//
//  Created by tarena04 on 16/5/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYPresentTelecastViewCell.h"
#import "HYPresentTelecastModel.h"
#import "UIImageView+AFNetworking.h"
@interface HYPresentTelecastViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *gameName;
@property (weak, nonatomic) IBOutlet UILabel *lookPersons;
@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation HYPresentTelecastViewCell


-(void)setTelecastModel:(HYPresentTelecastModel *)telecastModel

{
    _telecastModel = telecastModel;

    [self.imageView setImageWithURL:[NSURL URLWithString:telecastModel.icon] placeholderImage:[UIImage imageNamed:@"background_live_show_default"]];
    self.gameName.text = telecastModel.game_name;
    self.lookPersons.text = [NSString stringWithFormat:@"%@",telecastModel.view_num];
    self.author.text = telecastModel.title;
}


- (void)awakeFromNib {
    [super awakeFromNib];
}


@end
