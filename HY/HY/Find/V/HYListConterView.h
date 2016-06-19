//
//  HYListConterView.h
//  HY
//
//  Created by tarena04 on 16/6/17.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYDynamicList.h"
#import "HYListConterImageView.h"

@interface HYListConterView : UIView

@property (nonatomic,strong) HYDynamicList *dynamicList;

@property (nonatomic,strong) HYListConterImageView *images;

@property (nonatomic,strong) HYListConterView *reDynamicList;


@property (nonatomic, strong)UILabel *textLabel;



@end
