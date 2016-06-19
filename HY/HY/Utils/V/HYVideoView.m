//
//  HYVideoView.m
//  HY
//
//  Created by tarena04 on 16/5/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYVideoView.h"
#import "HYPlayVideoViewController.h"
#import "HYPresentTelecastModel.h"
#import "UIView+Extension.h"
#import <AVFoundation/AVFoundation.h>
#import "HYTool.h"
#define personViewY self.personView.y
#define titleAndReturnViewY 20
@interface HYVideoView ()<UIWebViewDelegate,UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *view_numLabel;

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UIView *titleAndReturnView;

@property (weak, nonatomic) IBOutlet UIView *personView;

@property (nonatomic,assign) BOOL isHide;

@property (nonatomic,weak) HYPlayVideoViewController *playVideoViewController;

@property (weak, nonatomic) IBOutlet UILabel *uploadLabel;

@property (nonatomic,strong) IBOutlet UIWebView *webView;

@end

@implementation HYVideoView

-(HYPlayVideoViewController *)playVideoViewController
{
    if (!_playVideoViewController) {
        _playVideoViewController = [HYPlayVideoViewController singletonPlayVideoViewController];;
    }
    return _playVideoViewController;
}
#pragma mark --------- 创建视图的时候会调用这个方法
- (void)awakeFromNib
{
    self.webView.delegate = self;
    self.webView.scrollView.delegate = self;
    self.webView.scrollView.scrollEnabled = NO;
    self.webView.scrollView.bounces = NO;
    UIImage *image = [UIImage animatedImageNamed:@"gif_video_loading@2x－" duration:3.0/4];
    self.imageView.image = image;
}
#pragma mark --------- 给控件赋值
-(void)setModelData:(id)modelData
{
    _modelData = modelData;
    if ([modelData isKindOfClass:[HYPresentTelecastModel class]]) {
        HYPresentTelecastModel *model = (HYPresentTelecastModel *)modelData;
        NSURL *url = [NSURL URLWithString:model.url];
         self.webView.scrollView.contentSize = CGSizeMake(0, 0);
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        self.view_numLabel.text = [NSString stringWithFormat:@"%@",model.view_num];
        self.title.text = model.title;
        

        [self.webView loadRequest:request];
    }
}


//按钮点击返回
- (IBAction)dismissVC:(id)sender {
    [self.webView removeFromSuperview];
    if (self.frame.size.height > 300) {

    }else
    {
        [self.playVideoViewController dismissViewControllerAnimated:NO completion:nil];
        [HYTool setJumpViewAni];
        
    }
}
- (IBAction)clickFullScreen:(id)sender {
    [self.playVideoViewController  setFullScreen];
}

+ (instancetype) returnPlayVideoView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"HYVideoView" owner:self options:nil] firstObject];
}

#pragma mark ------------ 隐藏(暂时不要)
//- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [self hideView];
//}
//- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
//{
//   NSLog(@"失败");
//}

- (void) hideView
{
    CGFloat personViewH = self.height - 40;
    CGFloat titleAndReturnViewH = titleAndReturnViewY;
    if (!self.isHide) {
        titleAndReturnViewH = self.y  -  80;
        personViewH +=  40;
    }else
    {
//         [self TopAndWei];
    }
    [UIView animateWithDuration:0.3 animations:^{
        self.personView.y = personViewH;
        self.titleAndReturnView.y = titleAndReturnViewH;
    }];
    self.isHide = !self.isHide;

}
// 定时隐藏
- (void) TopAndWei
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hideView];
    });
}


#pragma mark --------- webView 的代理
- (void)webViewDidStartLoad:(UIWebView *)webView {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
    [self.iconView removeFromSuperview];
    [self.uploadLabel removeFromSuperview];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}


@end
