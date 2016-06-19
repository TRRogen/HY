//
//  UIViewController+HYCustomBar.m
//  HY
//
//  Created by tarena04 on 16/5/29.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "UIViewController+HYCustomBar.h"
#import "HYMoreVdeoViewController.h"
#import "HYsearchViewController.h"
@implementation UIViewController (HYCustomBar)

- (void) setNavigationitm
{
    
    UIButton *leftSearchButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [leftSearchButton setBackgroundImage:[UIImage imageNamed:@"title_btn_search_p"] forState:(UIControlStateNormal)];
    leftSearchButton.frame = CGRectMake(0, 0, 35, 35);
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc] initWithCustomView:leftSearchButton];
    self.navigationItem.leftBarButtonItem = leftBtn;
    [leftSearchButton addTarget:self action:@selector(clickLeftButton) forControlEvents:(UIControlEventTouchUpInside)];
    
    UIButton *righMoreButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [righMoreButton setBackgroundImage:[UIImage imageNamed:@"cat_btn_selected"] forState:(UIControlStateNormal)];
    righMoreButton.frame = CGRectMake(0, 0, 35, 35);
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithCustomView:righMoreButton];
    self.navigationItem.rightBarButtonItem = rightBtn;
    [righMoreButton addTarget:self action:@selector(clickRighButton) forControlEvents:(UIControlEventTouchUpInside)];

}
- (void) clickLeftButton
{
    HYsearchViewController *moreVdeoView = [HYsearchViewController singletonSearchView];
    [self.navigationController pushViewController:moreVdeoView animated:NO];
}

- (void) clickRighButton
{
    HYMoreVdeoViewController *moreVdeoView = [[HYMoreVdeoViewController alloc] init];
    moreVdeoView.modalPresentationStyle = UIModalPresentationPopover;
    moreVdeoView.popoverPresentationController.sourceView = self.navigationController.navigationBar;
    moreVdeoView.popoverPresentationController.sourceRect =  self.navigationController.navigationBar.bounds;
    moreVdeoView.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    moreVdeoView.popoverPresentationController.delegate  = self;
    [self presentViewController:moreVdeoView animated:YES completion:nil];
}

- (UIModalPresentationStyle) adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
    return UIModalPresentationNone;
}




@end
