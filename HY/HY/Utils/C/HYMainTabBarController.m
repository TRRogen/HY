//
//  HYMainTabBarController.m
//  HY
//
//  Created by tarena04 on 16/5/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYMainTabBarController.h"

@interface HYMainTabBarController ()

@property (nonatomic,strong) NSArray *tabBarItemImage;

@end

@implementation HYMainTabBarController

- (NSArray *)tabBarItemImage
{
    if (!_tabBarItemImage) {
        NSString *path  =[[NSBundle mainBundle] pathForResource:@"tabBarItem.plist" ofType:nil];
        _tabBarItemImage  =[NSArray arrayWithContentsOfFile:path];
    }
    return _tabBarItemImage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    for (int i = 0; i < self.childViewControllers.count; i++) {
        UIViewController *vc = self.childViewControllers[i];
        NSDictionary *dic = self.tabBarItemImage[i];
        NSDictionary *attributesDic = @{
                              NSForegroundColorAttributeName:[UIColor orangeColor]
                              };
        [vc.tabBarItem setTitleTextAttributes:attributesDic forState:UIControlStateHighlighted];
        vc.tabBarItem.title = dic[@"title"];
        vc.tabBarItem.image = [self setImageOriginalWithImageName:dic[@"image"]];
        vc.tabBarItem.selectedImage = [self setImageOriginalWithImageName:dic[@"selectedImage"]];
    }
}

- (UIImage *) setImageOriginalWithImageName:(NSString *) imageName
{
    return  [[UIImage imageNamed:imageName] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
