//
//  HYListConterView.m
//  HY
//
//  Created by tarena04 on 16/6/17.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYListConterView.h"

@implementation HYListConterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
    self.textLabel = [[UILabel alloc]initWithFrame:CGRectMake(kMargen, kMargen, kScreenWidth-2*kMargen, 0)];
    self.textLabel.font = [UIFont systemFontOfSize:kTextSize];
    self.textLabel.numberOfLines = 0;
    [self addSubview:self.textLabel];
      
    self.images = [[HYListConterImageView alloc]initWithFrame:CGRectZero];
    [self addSubview:self.images];

    }
    return self;
}

-(void)setDynamicList:(HYDynamicList *)dynamicList
{
    _dynamicList = dynamicList;
    //显示文本
    self.textLabel.text = dynamicList.text;
    self.textLabel.height = [dynamicList getTextHeight];
    //显示图片   CGRectGetMaxY 获取某个控件的下边的y值
    self.images.images = dynamicList.pic_urls;
    //更新图片的高度
    self.images.frame = CGRectMake(0, CGRectGetMaxY(self.textLabel.frame)+kMargen, kScreenWidth, [dynamicList getImageHeight]);
    
    //判断是否有转发
    if (dynamicList.reWeibo) {
        //如果没创建过 创建一次
        if (!self.reDynamicList) {
            self.reDynamicList = [[HYListConterView alloc]initWithFrame:CGRectZero];
            self.reDynamicList.backgroundColor = [UIColor whiteColor];
            [self addSubview:self.reDynamicList];
        }
        
        //为了复用的时候 之前可能隐藏过
        self.reDynamicList.hidden = NO;
        //告诉转发weiboView显示的内容
        self.reDynamicList.dynamicList = dynamicList.reWeibo;
        
        self.reDynamicList.frame = CGRectMake(0, CGRectGetMaxY(self.textLabel.frame), kScreenWidth, [dynamicList.reWeibo getWeiboHeight]);
        
    }else{//没有转发
        self.reDynamicList.hidden = YES;
        
    }
 
}
@end
