//
//  HYFindTableViewCell.m
//  HY
//
//  Created by tarena04 on 16/5/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYFindTableViewCell.h"
#import "UIView+HYCreationTitleUIbutton.h"
#import "HYCustomBtn.h"
#import "HYTool.h"
#import "HYUploadJSON.h"
#import "HYRecommendAppMessage.h"
#import "UIImageView+WebCache.h"
@interface HYFindTableViewCell ()

@property (weak, nonatomic) IBOutlet HYCustomBtn *recommendAppOne;

@property (weak, nonatomic) IBOutlet HYCustomBtn *recommendAppTow;

@property (nonatomic,strong) NSArray *appMessages;

@end

@implementation HYFindTableViewCell

- (IBAction)recommendAppOneClick:(HYCustomBtn *)sender {
    HYRecommendAppMessage *appMessage = [self returnModelWithIndex:sender.tag];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appMessage.url]];
    
}

- (IBAction)recommendAppTowClick:(HYCustomBtn *)sender {
    HYRecommendAppMessage *appMessage = [self returnModelWithIndex:sender.tag];
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appMessage.url]];
}

- (HYRecommendAppMessage *) returnModelWithIndex:(NSInteger) index
{
    return self.appMessages[index];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    NSDictionary *appDic = [HYUploadJSON getAppRecommendJSONWith:@"DiscoveryPanelData.json"];
    self.appMessages  = [HYTool getModelDataWith:appDic[@"data"]];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

+ (NSArray *) returnFindCell
{
   
    return  [[NSBundle mainBundle] loadNibNamed:@"HYFindTableViewCell" owner:nil options:nil];;
}


@end
