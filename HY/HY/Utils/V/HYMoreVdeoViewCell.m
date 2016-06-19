//
//  HYMoreVdeoViewCell.m
//  HY
//
//  Created by tarena04 on 16/5/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYMoreVdeoViewCell.h"
@interface HYMoreVdeoViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *gameImageView;
@property (weak, nonatomic) IBOutlet UILabel *gameName;

@end

@implementation HYMoreVdeoViewCell


- (void)setImageName:(NSString *)imageName
{
    _imageName  = imageName;
    self.gameImageView.image = [UIImage imageNamed:imageName];
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
}

@end
