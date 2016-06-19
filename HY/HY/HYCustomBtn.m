//
//  HYCustomBtn.m
//  HY
//
//  Created by tarena04 on 16/6/14.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYCustomBtn.h"
#define ImageW 40

@implementation HYCustomBtn



-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        //设置图片的显示样式
        self.imageView.contentMode = UIViewContentModeScaleToFill;
    }
    return self;
}

//设置标题的位置
-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    
    CGFloat titleW = contentRect.size.width - ImageW;
    CGFloat titleH = contentRect.size.height;
    return CGRectMake(ImageW + 20, 0, titleW, titleH);
}

//设置图片的位置
-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imageW = ImageW;
    CGFloat imageH = ImageW;
#warning 在此方法，UIButton的子控件都是空，不能在此地设置图片的显示样式
    CGFloat imageY = (contentRect.size.height - imageH) * 0.5;
    return CGRectMake(10, imageY, imageW, imageH);
}


@end
