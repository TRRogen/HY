//
//  HYGiftView.m
//  HY
//
//  Created by tarena04 on 16/5/31.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYGiftView.h"
#import "HYGiftViewLayout.h"
#import "HYGiftViewCell.h"
#import "UIView+HYCreationTitleUIbutton.h"
#import "HYPlayVideoViewController.h"
@interface HYGiftView () <UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *giftColumnCollectionView;
@property (nonatomic,strong) NSArray *giftImageView;
@end


@implementation HYGiftView

- (NSArray *)giftImageView
{
    if (!_giftImageView) {
        NSString *path =  [[NSBundle mainBundle] pathForResource:@"gift.plist" ofType:nil];
        _giftImageView = [NSArray arrayWithContentsOfFile:path];
    }
    return _giftImageView;
}

- (void)awakeFromNib
{
    self.giftColumnCollectionView.delegate = self;
    self.giftColumnCollectionView.dataSource  = self;
    [self.giftColumnCollectionView registerNib:[UINib nibWithNibName:@"HYGiftViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"giftCell"];
}
+ (instancetype) returnGiftView
{
    return [[NSBundle mainBundle] loadNibNamed:@"HYGiftView" owner:nil options:nil].lastObject;
  
}



#pragma mark -------------- 礼物栏数据源
- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.giftImageView.count;
}


- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HYGiftViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"giftCell" forIndexPath:indexPath];
    NSDictionary *dic = self.giftImageView[indexPath.row];
    cell.giftImage.image = [UIImage imageNamed:dic[@"image"]];
    
    return cell;
}

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    NSDictionary *dic = self.giftImageView[indexPath.row];
    [self startAnimation:dic];
}

@end
