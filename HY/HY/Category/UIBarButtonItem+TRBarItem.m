//
//  UIBarButtonItem+TRBarItem.m
//  TRFindDeals
//
//  Created by tarena on 15/12/18.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "UIBarButtonItem+TRBarItem.h"

@implementation UIBarButtonItem (TRBarItem)

+ (UIBarButtonItem *)itemWithImage:(NSString *)imageName withHighLightedImage:(NSString *)hlImageName withTarget:(id)target withAction:(SEL)action {
    //UIButton
    UIButton *button = [UIButton new];
    //设置button属性
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:hlImageName] forState:UIControlStateHighlighted];
    button.frame = CGRectMake(0, 0, 70, 40);
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    //返回已经创建好的item
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}








@end
