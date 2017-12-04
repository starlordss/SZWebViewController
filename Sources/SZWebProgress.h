//
//  SZWebProgress.h
//  SZWebViewController
//
//  Created by starz on 2017/12/4.
//  Copyright © 2017年 starz. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#define SCR_W [UIScreen mainScreen].bounds.size.width
#define Progress_H 3
//#define Progress_ 

@interface SZWebProgress : CAShapeLayer
+ (instancetype)webProgress;
- (void)startLoading;
- (void)finishedLoadingWithError:(NSError *)err;
- (void)cancelTimer;
- (void)webViewPathChanged:(CGFloat)estmatedDuration;

@end
