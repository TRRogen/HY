//
//  HYThirdPartyLoginViewController.m
//  HY
//
//  Created by tarena04 on 16/6/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HYThirdPartyLoginViewController.h"
#import "HYUploadJSON.h"

#define kAccountPath [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/accountInfo.plist"]
@interface HYThirdPartyLoginViewController ()<UIWebViewDelegate>

@end

@implementation HYThirdPartyLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addWebView];
}

- (void) addWebView
{
    UIWebView *webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    webView.delegate = self;
    webView.scrollView.scrollEnabled = NO;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.WebPath]];
    [webView loadRequest:request];
    [self.view addSubview:webView];
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *path = request.URL.description;
    if ([path containsString:@"code"]) {
        
        NSString *code = [[path componentsSeparatedByString:@"="]lastObject];
        [HYUploadJSON requestTokenWithCode:code andCallback:^(id obj) {
            NSDictionary *dic = obj;
            [dic writeToFile:kAccountPath atomically:YES];
            [self.navigationController popToRootViewControllerAnimated:YES];
        }];
        
        return NO;
    }
    
    
    return YES;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
