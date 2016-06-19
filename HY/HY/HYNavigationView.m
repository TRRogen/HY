//
//  HYNavigationView.m
//  HY
//
//  Created by tarena04 on 16/5/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYNavigationView.h"
#import "UIView+HYCreationTitleUIbutton.h"

#define WindowW [UIScreen mainScreen].bounds.size.width
#define BTNW WindowW / (self.navigationButtons.count + 1)

@interface HYNavigationView ()
@property (nonatomic,strong) UIButton *tempButton;
@property (nonatomic,strong) NSArray *navigationButtons;
@end

@implementation HYNavigationView
-(NSArray *)navigationButtons
{
    if (!_navigationButtons) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"NAV.plist" ofType:nil];
        _navigationButtons = [NSArray arrayWithContentsOfFile:path];
    }
    return _navigationButtons;
}

-(void)awakeFromNib
{

    CGFloat interval =  (WindowW - (self.navigationButtons.count + 1) * BTNW) / self.navigationButtons.count + 2;
    for (int i = 0; i < self.navigationButtons.count; i ++) {
        NSString *title = self.navigationButtons[i];
        CGFloat buttonX = i * (interval + BTNW);
        CGRect rect = CGRectMake(buttonX, 0, BTNW, self.frame.size.height);
        UIButton *button  = [self creationButtonSetButtonFrameWith:rect setButtonTitle:title addAt:self];
        [button addTarget:self action:@selector(clickButtonSwitchoverShow:) forControlEvents:(UIControlEventTouchUpInside)];
        if (i == 0) {
            button.selected = YES;
            self.tempButton = button;
        }
    }
}

- (void) clickButtonSwitchoverShow:(UIButton *) sender
{
    self.tempButton.selected = NO;
    sender.selected = YES;
    self.tempButton = sender;
}

+ (instancetype) retutnNavXib
{
    return [[NSBundle mainBundle] loadNibNamed:@"HYNavigationView" owner:nil options:nil].lastObject;
    
}

@end
