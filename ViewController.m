//
//  ViewController.m
//  SZWebViewController
//
//  Created by starz on 2017/12/4.
//  Copyright © 2017年 starz. All rights reserved.
//

#import "ViewController.h"
#import "SZWebViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)go:(id)sender {
    
    SZWebViewController *vc = [SZWebViewController new];
    vc.htmlUrl = @"https://www.baidu.com";
    vc.backItemPic = @"arrow_left";
    vc.navBarTitle = @"WEB";
    vc.progressColor = [UIColor redColor];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
