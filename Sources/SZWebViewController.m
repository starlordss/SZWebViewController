//
//  SZWebViewController.m
//  SZWebViewController
//
//  Created by starz on 2017/12/4.
//  Copyright © 2017年 starz. All rights reserved.
//

#import "SZWebViewController.h"
#import <WebKit/WebKit.h>
#import "SZWebProgress.h"

@interface SZWebViewController ()<WKNavigationDelegate>
@property (nonatomic, strong) WKWebView       *webView;
@property (nonatomic, strong) SZWebProgress   *webProgress;
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
    [self.navigationController.navigationBar.layer addSublayer:self.webProgress];
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

#pragma mark - WKNavigationDelegate
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    [self.webProgress startLoading];
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    [self.webProgress finishedLoadingWithError:nil];
}
- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    [self.webProgress finishedLoadingWithError:error];
}

#pragma mark - UI EVENT
- (void)onBackItem:(UIButton *)btn {
    [self.navigationController popViewControllerAnimated:YES];
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

- (SZWebProgress *)webProgress{
    if (!_webProgress) {
        _webProgress = [SZWebProgress webProgress];
        _webProgress.frame = CGRectMake(0, self.navigationController.view.frame.size.height, SCR_W, 3);
        _webProgress.strokeColor = self.progressColor.CGColor;
        
    }
    return _webProgress;
}
#pragma mark - SETTER
//- (void)setHtmlUrl:(NSString *)htmlUrl
//{
//    _htmlUrl = htmlUrl;
//}
#pragma mark - dealloc
- (void)dealloc
{
    [self.webProgress cancelTimer];
    [self.webProgress removeFromSuperlayer];
}
@end
