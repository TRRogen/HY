//
//  HYHeaderView.m
//  HY
//
//  Created by tarena04 on 16/5/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYHeaderView.h"

@interface HYHeaderView ()
@property (weak, nonatomic) IBOutlet UILabel *HeaderTitleLabel;

@end

@implementation HYHeaderView


-(void)setTitleName:(NSString *)titleName
{
    _titleName = titleName;
    self.HeaderTitleLabel.text = titleName;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
