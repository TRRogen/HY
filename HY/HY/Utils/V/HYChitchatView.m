//
//  HYChitchatView.m
//  HY
//
//  Created by tarena04 on 16/5/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYChitchatView.h"
#import "HYPlayVideoViewController.h"
#import "UIView+Extension.h"
#import "UIView+HYCreationTitleUIbutton.h"
#import "HYUploadJSON.h"
#import "HYMessageTableViewCell.h"
#import "HYStorageUserData.h"
#import "HYTool.h"

#define NAVIGATIONVIEW_W 40
#define MESSAGECONTENTVIEW_H 35
#define MESSAGECONTENTVIEW_INTERVAL 10


@interface HYChitchatView ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *chitchatNAView;

@property (weak, nonatomic) IBOutlet UITableView *chitchatContentView;

@property (nonatomic,weak) HYPlayVideoViewController *playVideoViewController;

@property (nonatomic,assign) CGFloat tempH;

@property (nonatomic,assign) int messageNumber;

@property (nonatomic,strong) NSMutableArray *messageContent;

@property (nonatomic,assign) CGFloat rowH;

@end

@implementation HYChitchatView

-(HYPlayVideoViewController *)playVideoViewController
{
    if (!_playVideoViewController) {
        _playVideoViewController = [HYPlayVideoViewController singletonPlayVideoViewController];
    }
    return _playVideoViewController;
}

- (void)awakeFromNib
{
    
    [self.playVideoViewController setUdpSocketWith:nil returnChatMessage:^(NSString *message) {
        NSDictionary *messageDic = [HYTool customMessageDicName:@"路人..." andMessage:message andTextColor:[UIColor grayColor]];
        [self.messageContent addObject:messageDic];
        [self refreshTable];
        
    }];
    self.messageContent = [NSMutableArray array];
    
    self.chitchatContentView.delegate = self;
    self.chitchatContentView.dataSource = self;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}
+ (instancetype) returnChitchatXIB
{
    return [[NSBundle mainBundle] loadNibNamed:@"HYChitchatView" owner:nil options:nil].lastObject;
}

#pragma  wark ---------------- 发送聊天信息
- (IBAction)sendInformationTextFile:(UITextField *)sender {
    
    self.chitchatContentView.rowHeight  = [HYTool returnCalculateSizeWiht:sender.text] + 30;
    NSDictionary *messageDic = [HYTool customMessageDicName:[[NSUserDefaults standardUserDefaults] objectForKey:@"name"] andMessage:sender.text andTextColor:[UIColor orangeColor]];
    [self.messageContent addObject:messageDic];
    [self refreshTable];
    sender.text = @"";
}


- (void) refreshTable
{
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.messageContent.count - 1 inSection:0];
    [self.chitchatContentView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    [self.chitchatContentView scrollToRowAtIndexPath:indexPath atScrollPosition:(UITableViewScrollPositionTop) animated:YES];
}

#pragma  wark ---------------- 键盘通知
- (void)keyboardWillChangeFrame:(NSNotification *)noti
{
    CGFloat duration = [noti.userInfo[@"UIKeyboardAnimationDurationUserInfoKey"] floatValue];
    CGRect frame = [noti.userInfo[@"UIKeyboardFrameEndUserInfoKey"] CGRectValue];
    CGFloat offsetY = frame.origin.y - [UIScreen mainScreen].bounds.size.height;
    [UIView animateWithDuration:duration animations:^{
        self.chitchatNAView.transform = CGAffineTransformMakeTranslation(0, offsetY);
    }];
}
- (void) scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self endEditing:YES];
}
- (IBAction)giftBtn:(id)sender {

    [self.playVideoViewController  giftColumn];
}


#pragma  wark ---------------- tableView 数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messageContent.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HYMessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"messageCell"];
    if (!cell) {
        cell = [HYMessageTableViewCell returnMessageCell];
        
    }
    
    cell.backgroundColor = [UIColor clearColor];
    cell.messageContent = [self.messageContent[indexPath.row] copy];
    return cell;
}

@end
