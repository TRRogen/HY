//
//  UIView+HYCreationTitleUIbutton.m
//  HY
//
//  Created by tarena04 on 16/5/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "UIView+HYCreationTitleUIbutton.h"
#import "UIView+Extension.h"
#import "HYRecreationHeaderView.h"
#import "HYTelecastHeaderView.h"
#import "HYShowPresentTelecastViewController.h"

#define CHITCHATVIEW_H 245
#define VIDEOVIEW_H 180
#define CHIRCHATVIEW_H (VIEW_W - VIDEOVIEW_H)
#define NAVIGATIONVIEW_W 40
#define MESSAGECONTENTVIEW_H 35
#define MESSAGECONTENTVIEW_INTERVAL 10
#define GIFRVIEW_H 121

@implementation UIView (HYCreationTitleUIbutton)
static const CGFloat buttonH = 10;
static const CGFloat space = 20;
static UIButton *telecastButton;
static UIButton *recreationButton;
#pragma mark ------------------- 创建标题按钮
- (void) creationTitleUIbuttonWithTitles:(NSArray *) buttonTitles addToScrollView:(UIScrollView *) scrollView
{
    int i = 0;
    CGFloat prevButtonX = 0;
    for (NSString *buttonTitle in buttonTitles) {
    NSDictionary *attributes = @{
                                     NSFontAttributeName:[UIFont systemFontOfSize:16],
                                     };
       CGRect buttonSize = [buttonTitle boundingRectWithSize:CGSizeMake(200, 50) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:attributes context:nil];
        
       CGRect rect = CGRectMake(space + prevButtonX, 0, buttonSize.size.width + buttonH, self.height-3);
        
        UIButton *button =  [self creationButtonSetButtonFrameWith:rect setButtonTitle:buttonTitle addAt:scrollView];
        button.tag = i;
        
        if (button.tag == 0) {
            button.selected = YES;
            if ([self isKindOfClass:[HYTelecastHeaderView class]])
            {
                telecastButton = button;
            }
            if ([self isKindOfClass:[HYRecreationHeaderView class]]) {
                recreationButton = button;
            }
        }
        [button addTarget:self action:@selector(clickButton:) forControlEvents:(UIControlEventTouchUpInside)];
      
        prevButtonX = buttonSize.size.width + button.frame.origin.x;
        scrollView.contentSize = CGSizeMake(space + prevButtonX, 0);
        i++;
    }
    scrollView.showsHorizontalScrollIndicator = NO;
    [self TitleHeaderViewShadow];
}

- (UIButton *) creationButtonSetButtonFrameWith:(CGRect ) rect setButtonTitle:(NSString *) title addAt:(UIView *)  view
{
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button setBackgroundImage:[UIImage imageNamed:@"btnBg"] forState:(UIControlStateSelected)];
    [button setTitle:title forState:(UIControlStateNormal)];
    [button setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [button setTitleColor:[UIColor redColor] forState:(UIControlStateSelected)];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    button.frame = rect;
    [view addSubview:button];
    return  button;
}

- (void) TitleHeaderViewShadow
{
    self.layer.shadowOpacity = 1;
    self.layer.shadowRadius = 5;
}

- (void) clickButton:(UIButton *) sender
{
    UIScrollView *scrollView = [self viewWithTag:10];
    if ([self isKindOfClass:[HYTelecastHeaderView class]])
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"clickTitleBtn" object:self userInfo:@{@"titleNumber":@(sender.tag)}];
        telecastButton.selected = NO;
        sender.selected  = YES;
        telecastButton = sender;
    }
    if ([self isKindOfClass:[HYRecreationHeaderView class]]) {
        recreationButton.selected = NO;
        sender.selected  = YES;
        recreationButton = sender;
    }
    scrollView.scrollsToTop = NO;
    CGFloat viewFrame = [UIScreen mainScreen].bounds.size.width;
    CGFloat ContentOffsetX = sender.center.x - viewFrame*0.5;
    if (ContentOffsetX < 0) {
        ContentOffsetX = 0;
    }
    CGFloat maxContentOffsetX = scrollView.contentSize.width - viewFrame;
    if (ContentOffsetX > maxContentOffsetX) {
        ContentOffsetX = maxContentOffsetX;
    }
    [UIView animateWithDuration:0.5 animations:^{
        scrollView.contentOffset = CGPointMake(ContentOffsetX, 0);
    }];
    
}

- (void) startAnimation:(NSDictionary *) dic
{
    UIImageView *animationView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:dic[@"upView"]]];
    CGFloat windowH = [UIScreen mainScreen].bounds.size.height;
    CGFloat x = arc4random() % 375;
    CGFloat y = arc4random() % (int)(windowH / 3);
    animationView.frame = CGRectMake(x, windowH - 121, 3, 10);
    [self.superview addSubview:animationView];
    [UIView animateWithDuration:1.5 animations:^{
        animationView.y = y;
    }completion:^(BOOL finished) {
        
        UIImageView *animationViewTow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:dic[@"bloomImage"]]];
        animationViewTow.frame = CGRectMake(x, animationView.y, 5, 5);
        [animationView removeFromSuperview];
        [self.superview addSubview:animationViewTow];
        [UIView animateWithDuration:3.0 animations:^{
            animationViewTow.transform = CGAffineTransformMakeScale(20, 20);
             animationViewTow.alpha = 0;
        }completion:^(BOOL finished) {
           [animationViewTow removeFromSuperview];

        }];
    }];
}

#pragma mark ---------------- 设置圆角
- (void) setViewLayer;
{
    self.layer.cornerRadius = self.bounds.size.width * 0.5;
    self.layer.masksToBounds = YES;
}



@end
