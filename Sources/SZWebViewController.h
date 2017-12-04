//
//  SZWebViewController.h
//  SZWebViewController
//
//  Created by starz on 2017/12/4.
//  Copyright © 2017年 starz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SZWebViewController : UIViewController

/// 导航栏标题
@property (nonatomic, copy) NSString *navBarTitle;
/// 页面链接
@property (nonatomic, copy) NSString *htmlUrl;
/// 返回按钮图片
@property (nonatomic, copy) NSString *backItemPic;
/// 进度条的颜色
@property (nonatomic, strong) UIColor *progressColor;



@end
