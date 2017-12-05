//
//  SZWebProgress.m
//  SZWebViewController
//
//  Created by starz on 2017/12/4.
//  Copyright © 2017年 starz. All rights reserved.
//

#import "SZWebProgress.h"
#import <UIKit/UIKit.h>
#import "NSTimer+SZAddition.h"

static NSTimeInterval const ProgressTimeInterval = 0.03;

@interface SZWebProgress ()
@property (nonatomic, strong) CAShapeLayer *layer;
@property (nonatomic, strong) NSTimer *timer;
/// 进度增量
@property (nonatomic, assign) CGFloat augmenter;
@end

@implementation SZWebProgress

+ (instancetype)webProgress
{
    return [[self alloc] init];
}
#pragma mark - private
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupBerizerPath];
        [self setupTimer];
    }
    return self;
}

- (void)setupBerizerPath
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, Progress_H)];
    [path addLineToPoint:CGPointMake(SCR_W, Progress_H)];
    self.path = path.CGPath;
    self.strokeEnd = 0;
    self.augmenter = 0.005;
    self.lineWidth = Progress_H;
    // default color
    self.strokeColor = [UIColor redColor].CGColor;
}

- (void)setupTimer {
    _timer = [NSTimer scheduledTimerWithTimeInterval:ProgressTimeInterval target:self selector:@selector(rateOfProgress:) userInfo:nil repeats:YES];
    [_timer sz_pause];
}


- (void)rateOfProgress:(NSTimer *)timer {
    self.strokeEnd += _augmenter;
    if (self.strokeEnd > 0.60) {
        _augmenter = 0.002;
    }
    
    if (self.strokeEnd > 0.85) {
        _augmenter = 0.0007;
    }
    if (self.strokeEnd > 0.93) {
        _augmenter = 0;
    }
}
#pragma mark - Public
- (void)startLoading {
    [_timer sz_webPageTimeWithInterval:ProgressTimeInterval];
}
- (void)finishedLoadingWithError:(NSError *)err {
    CGFloat timer;
    if (err == nil) {
        [self cancelTimer];
        timer = 0.5;
        self.strokeEnd = 1.0;
    } else {
        timer = 45.0;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timer * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (timer == 45.0) {
            [self cancelTimer];
        }
        self.hidden = YES;
        [self removeFromSuperlayer];
    });
}
- (void)cancelTimer {
    [_timer invalidate];
    _timer = nil;
}
- (void)webViewPathChanged:(CGFloat)estmatedDuration {
    self.strokeEnd = estmatedDuration;
}
@end
