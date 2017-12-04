//
//  SZWebViewController.m
//  SZWebViewController
//
//  Created by starz on 2017/12/4.
//  Copyright © 2017年 starz. All rights reserved.
//

#import "SZWebViewController.h"
#import <WebKit/WebKit.h>

@interface SZWebViewController ()<WKNavigationDelegate>
@property (nonatomic, strong) WKWebView       *webView;
@end

@implementation SZWebViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
}

#pragma mark - UI
- (void)setupUI {
    [self setupNaigation];
    [self.view addSubview:self.webView];
    
}
- (void)setupNaigation {
    self.navigationItem.title = self.navBarTitle;
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn sizeToFit];
    UIImage *backImg = [UIImage imageNamed:self.backItemPic];
    [backBtn setImage:backImg forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(onBackItem:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
}

#pragma mark - UI EVENT
- (void)onBackItem:(UIButton *)btn {
    
}

#pragma mark - GETTER
- (WKWebView *)webView{
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
        _webView.navigationDelegate = self;
        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.htmlUrl]]];
    }
    return _webView;
}

@end
