//
//  HYMoreVdeoViewController.m
//  HY
//
//  Created by tarena04 on 16/5/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYMoreVdeoViewController.h"
#import "HYMoreVdeoViewLayout.h"
#import "HYMoreVdeoViewCell.h"
@interface HYMoreVdeoViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) NSArray *iamgeNames;

@end

@implementation HYMoreVdeoViewController

static NSString *identifier = @"MoreVdeoViewCell";

-(NSArray *)iamgeNames
{
    if (_iamgeNames.count < 1) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"moreVdeoImageVew.plist" ofType:nil];
        _iamgeNames = [NSArray arrayWithContentsOfFile:path];
    }
    return _iamgeNames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.preferredContentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    [self addSubView];
    
}
- (void) addSubView
{
   self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:[[HYMoreVdeoViewLayout alloc] init]];
   [self.collectionView registerNib:[UINib nibWithNibName:@"HYMoreVdeoViewCell" bundle:nil] forCellWithReuseIdentifier:identifier];
    self.collectionView.dataSource = self;
    self.collectionView.delegate   = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-100);
    [self.view addSubview:self.collectionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.iamgeNames.count;
}
- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HYMoreVdeoViewCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.imageName = self.iamgeNames[indexPath.row];
    return cell;
}

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点中视图");
}

@end
