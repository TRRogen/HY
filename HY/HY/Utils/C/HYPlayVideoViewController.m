//
//  HYPlayVideoViewController.m
//  HY
//
//  Created by tarena04 on 16/5/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYPlayVideoViewController.h"
#import "UIView+HYCreationTitleUIbutton.h"
#import "HYVideoView.h"
#import "HYGiftView.h"
#import "HYGiftViewLayout.h"
#import "HYGiftViewCell.h"
#import "UIView+Extension.h"
#import "HYPresentTelecastModel.h"
#import "HYUploadJSON.h"
#import "HYChitchatView.h"
#import "HYNavigationView.h"
#import "AsyncUdpSocket.h"
#import "HYTool.h"
#define CHITCHATVIEW_H 245
#define VIDEOVIEW_H 180
#define CHIRCHATVIEW_H (VIEW_W - VIDEOVIEW_H)
#define NAVIGATIONVIEW_W 40
#define MESSAGECONTENTVIEW_H 35
#define MESSAGECONTENTVIEW_INTERVAL 10
#define GIFRVIEW_H 121

@interface HYPlayVideoViewController ()<AsyncUdpSocketDelegate>

@property (nonatomic,strong) HYVideoView *videoView;

@property (nonatomic,strong) HYChitchatView *chitchatView;

@property (nonatomic,strong) HYGiftView *giftView;

@property (nonatomic,strong) HYNavigationView *navigationView;

@property (nonatomic,strong) UIButton *tempButton;

@property (nonatomic,strong) UIScrollView *showMessageContentView;

@property (nonatomic,strong) UIImageView *playVideoImageView;


@property (nonatomic,assign) BOOL isMessage;

@property (nonatomic, strong)AsyncUdpSocket *myUDPSocket;

@property (nonatomic,strong) chatMessageBlock chatMessage;


@end

@implementation HYPlayVideoViewController


#pragma mark -------------- HYPlayVideoViewController 单例
static HYPlayVideoViewController *_playVideoViewController;
+ (instancetype)singletonPlayVideoViewController
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _playVideoViewController = [[HYPlayVideoViewController alloc] init];
    });
    return _playVideoViewController;
}
//隐藏状态栏
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void) viewWillAppear:(BOOL)animated
{
    [self addVideoView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

- (void) viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.navigationView.width = self.view.width;
    [self.navigationView setNeedsDisplay];
    [self setVideoHeight];
}


- (void) setVideoHeight
{
    self.videoView.height = VIDEOVIEW_H;
}

#pragma mark -------------- 获取视图
- (void) addVideoView
{
    CGFloat viewW = [UIScreen mainScreen].bounds.size.width;

    {
        self.chitchatView  = [HYChitchatView returnChitchatXIB];
        self.showMessageContentView = [self.chitchatView viewWithTag:10];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(exitKeyboard)];
        tap.numberOfTapsRequired = 1;
        [self.showMessageContentView addGestureRecognizer:tap];
        self.chitchatView.frame = CGRectMake(0, VIDEOVIEW_H + NAVIGATIONVIEW_W,viewW,[UIScreen mainScreen].bounds.size.height - (VIDEOVIEW_H + NAVIGATIONVIEW_W));
        [self.view addSubview:self.chitchatView];
    }
    
    {
        self.videoView  = [HYVideoView returnPlayVideoView];
        self.videoView.frame = CGRectMake(0, 0,self.view.frame.size.width, VIDEOVIEW_H);
        self.videoView.modelData = _modelData;
        self.playVideoImageView = [self.videoView viewWithTag:100];
        [self.view addSubview:self.videoView];
    }
    
    {
        self.navigationView = [HYNavigationView retutnNavXib];
        self.navigationView.frame = CGRectMake(0, self.videoView.height + self.videoView.y, viewW, NAVIGATIONVIEW_W);
        [self.view addSubview:self.navigationView];
    }
    
    {
        self.giftView = [HYGiftView returnGiftView];
        self.giftView.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, GIFRVIEW_H);
        [self.view addSubview:self.giftView];
    }

}

#pragma mark -------------- 退出键盘
- (void) exitKeyboard
{
    if (self.giftView.y < self.view.frame.size.height) {
        [UIView animateWithDuration:1.0 animations:^{
            self.giftView.y += GIFRVIEW_H;
        }];
    }
    [self.view endEditing:YES];
}
#pragma mark -------------- 点击礼物按钮弹出礼物栏
- (void) giftColumn
{
    [UIView animateWithDuration:0.5 animations:^{
        self.giftView.y -= GIFRVIEW_H;
    }];
}
#pragma mark -------------- 全屏设置
- (void) setFullScreen
{
    [UIView animateWithDuration:1.0 animations:^{
        self.videoView.transform = CGAffineTransformMakeRotation(M_PI_2);
        self.videoView.frame = self.view.frame;
    }];
}
- (void) recover
{
    [UIView animateWithDuration:1.0 animations:^{
        self.videoView.transform = CGAffineTransformMakeRotation(-M_PI*2);
        self.playVideoImageView.transform = CGAffineTransformMakeRotation(-M_PI*2);
        self.videoView.frame = CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, VIDEOVIEW_H);
        self.playVideoImageView.frame =  self.videoView.frame;
    }];
}

#warning ----------------暂时代码
- (void) setUdpSocketWith:(id) deletageObj returnChatMessage:(void(^)(NSString *)) chatMessage
{
    self.myUDPSocket = [[AsyncUdpSocket alloc]initWithDelegate:self];
    [self.myUDPSocket bindToPort:9000 error:nil];
    [self.myUDPSocket enableBroadcast:YES error:nil];
    [self.myUDPSocket receiveWithTimeout:-1 tag:0];
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(checkingOnline) userInfo:nil repeats:YES];
    
    self.chatMessage = chatMessage;
    
    [self checkingOnline];
}

-(void)checkingOnline{
    
    [self.myUDPSocket sendData:[@"求GBM" dataUsingEncoding:NSUTF8StringEncoding] toHost:@"255.255.255.255" port:9000 withTimeout:-1 tag:0];
}



-(BOOL)onUdpSocket:(AsyncUdpSocket *)sock didReceiveData:(NSData *)data withTag:(long)tag fromHost:(NSString *)host port:(UInt16)port{
    if (![host hasPrefix:@":"]) {
        
        NSString *info = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        if ([info isEqualToString:@"0"] || [info isEqualToString:@"1"]) {
             self.chatMessage(info);
        }else
        {
           self.chatMessage(info);
        }
    }
    
    [self.myUDPSocket receiveWithTimeout:-1 tag:0];
    
    return NO;
}

@end
