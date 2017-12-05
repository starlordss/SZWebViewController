//
//  SZWebProgress.h
//  SZWebViewController
//
//  Created by starz on 2017/12/4.
//  Copyright © 2017年 starz. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#define SCR_W [UIScreen mainScreen].bounds.size.width
#define Progress_H 2
//#define Progress_ 

@interface SZWebProgress : CAShapeLayer
+ (instancetype)webProgress;
//
// 开始加载
//
- (void)startLoading;
//
// 完成加载
//
- (void)finishedLoadingWithError:(NSError *)err;
//
// 取消定时器
//
- (void)cancelTimer;
//
// 网页路径变化
//
- (void)webViewPathChanged:(CGFloat)estmatedDuration;

@end
