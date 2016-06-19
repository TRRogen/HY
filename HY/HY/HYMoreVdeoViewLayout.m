//
//  HYMoreVdeoViewLayout.m
//  HY
//
//  Created by tarena04 on 16/5/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYMoreVdeoViewLayout.h"

@implementation HYMoreVdeoViewLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        //        项的大小
        CGRect frame = [UIScreen mainScreen].bounds;
        CGFloat cellW = frame.size.width / 3 - 5;
        self.itemSize = CGSizeMake(cellW, 200);
        self.minimumLineSpacing = 0;
        self.minimumInteritemSpacing = 5;
        self.sectionInset = UIEdgeInsetsMake(0, 0, 2, 0);
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
   
    }
    return self;
}

@end
