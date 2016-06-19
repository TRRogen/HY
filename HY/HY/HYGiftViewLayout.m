//
//  HYGiftViewLayout.m
//  HY
//
//  Created by tarena04 on 16/5/31.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYGiftViewLayout.h"

@implementation HYGiftViewLayout
- (instancetype)init
{
    self = [super init];
    if (self) {
        //        项的大小
        CGRect frame = [UIScreen mainScreen].bounds;
        CGFloat cellW = frame.size.width / 5;
        self.itemSize = CGSizeMake(cellW, 70);
        self.minimumLineSpacing = 0;
        self.minimumInteritemSpacing = 0;
        self.sectionInset = UIEdgeInsetsMake(0, 0, 2, 0);
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
    }
    return self;
}

@end
