//
//  HYSetTableViewCell.m
//  HY
//
//  Created by tarena04 on 16/6/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYSetTableViewCell.h"

@implementation HYSetTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


+ (NSArray *) returnCells
{
    return [[self alloc] setCell];
}


- (NSArray *) setCell
{
    
    NSArray *cells = [[NSBundle mainBundle] loadNibNamed:@"HYSetTableViewCell" owner:nil options:nil];
    NSMutableArray *cellArray1 = [NSMutableArray array];
    NSMutableArray *cellArray2 = [NSMutableArray array];
    NSMutableArray *cellArray3 = [NSMutableArray array];
    NSMutableArray *cellArray4 = [NSMutableArray array];
    NSMutableArray *cellArray5 = [NSMutableArray array];
    int i = 0;
    for (HYSetTableViewCell *cell in cells) {
        switch (i) {
            case 0:
            case 1:
                [cellArray1 addObject:cell];
                break;
            case 2:
            case 3:
                  [cellArray2 addObject:cell];
                break;
            case 4:
            case 5:
                 [cellArray3 addObject:cell];
                break;
            case 6:
                 [cellArray4 addObject:cell];
                break;
            case 7:
                 [cellArray5 addObject:cell];
                break;

        }
        i++;

    }

    return @[cellArray1,cellArray2,cellArray3,cellArray4,cellArray5];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
