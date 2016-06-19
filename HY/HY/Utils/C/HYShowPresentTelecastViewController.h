//
//  HYShowPresentTelecastViewController.h
//  HY
//
//  Created by tarena04 on 16/5/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYShowPresentTelecastViewController : UIViewController

@property (nonatomic,strong) UICollectionView *showCollectionView;

@property (nonatomic,assign) NSNumber *titlePlay;

- (NSArray *) acquirePresentTelecastMessages;

- (void) acquireHeaderTitleWithSubViewAtTitles:(NSArray *) titles;

- (NSArray *) acquireSubViewAdvertisementPicture;

- (void) acquireData;


@end
