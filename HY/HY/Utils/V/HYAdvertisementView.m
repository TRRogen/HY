//
//  HYAdvertisementView.m
//  HY
//
//  Created by tarena04 on 16/5/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYAdvertisementView.h"

@interface HYAdvertisementView ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *advertisemenView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (nonnull,strong) NSTimer *timer;
@end

@implementation HYAdvertisementView

- (void)drawRect:(CGRect)rect {
  
    //    动态创建ImageView
    NSInteger count = self.imageViews.count;
    for (int i = 0; i < self.imageViews.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [self.advertisemenView addSubview:imageView];
        
        NSString *imageName = self.imageViews[i];
        imageView.image = [UIImage imageNamed:imageName];
        CGFloat x = i * self.advertisemenView.bounds.size.width;
        imageView.frame = CGRectMake(x, 0, self.advertisemenView.bounds.size.width, self.advertisemenView.bounds.size.height);
    }
    //    设置代理
    self.advertisemenView.delegate = self;
    //    设置滚动返回
    self.advertisemenView.contentSize  = CGSizeMake(count * self.advertisemenView.bounds.size.width, 0);
    self.advertisemenView.pagingEnabled = YES;
    self.advertisemenView.showsHorizontalScrollIndicator = NO;
    self.pageControl.numberOfPages = count;
    [self addTimerO];

}
- (void) addTimerO
{
    
    //        定时器
    NSTimer *timer = [NSTimer timerWithTimeInterval:3.0 target:self selector:@selector(nexImage) userInfo:nil repeats:YES];
    //        消息循环
    self.timer = timer;
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    [runloop addTimer:timer forMode:NSDefaultRunLoopMode];
}
- (void) nexImage
{
    //    当前页码
    NSInteger page = self.pageControl.currentPage;
    if (page == self.pageControl.numberOfPages - 1) {
        page = 0;
    }else
    {
        page++;
    }
    CGFloat offsetX = page * self.advertisemenView.frame.size.width;
    [UIView animateWithDuration:1.0 animations:^{
        self.advertisemenView.contentOffset = CGPointMake(offsetX, 0);
    }];
    
}
//scrollView 在滚动的时候调用
- (void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = (scrollView.contentOffset.x + scrollView.frame.size.width / 2)/ scrollView.frame.size.width;
    self.pageControl.currentPage = page;
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //停止定时器
    [self.timer invalidate];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self addTimerO];
    
}

+ (instancetype) returnView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"HYAdvertisementView" owner:nil options:nil] lastObject];
}


@end
